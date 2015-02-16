package com.deccanrock.planovik.service.dao;
 

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.service.ItineraryEntityMapper;
import com.deccanrock.planovik.service.utils.TimeFormatter;
import com.deccanrock.planovik.constants.Constants;
 
@Component
@Transactional
public class ItineraryEntityDAO extends JdbcDaoSupport implements IItneraryEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}

    
    @Override	
	public List<String> GetItinList(String query) {

    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_getitinidnamelist");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		// Check for number search
		String regex = "[1-9]+";
		if (query.matches(regex))
			inParamMap.put("isnumber", 1);
		else
			inParamMap.put("isnumber", 0);
			
		inParamMap.put("query", query);
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> dbitinnames = simpleJdbcCall.execute(in);
		if (dbitinnames.isEmpty())
			return null;

		// Safe to assume result is in result set 1
		ArrayList <HashMap<String, Object>> itinValues = (ArrayList<HashMap<String, Object>>) dbitinnames.get("#result-set-1");
		
		// Set<Entry<String, Object>> iterator = orgValues.entrySet();
		
    	ArrayList<String> itinnames = new ArrayList<String>(itinValues.size());
    	    	
    	for (HashMap<String, Object> map : itinValues) {
    	     for (Entry<String, Object> mapEntry : map.entrySet())
    	    	 itinnames.add(mapEntry.getValue().toString());
    	}
				
    	
 		return itinnames; 	
 
	}

    @Override
	public ItineraryEntity CreateItinerary(ItineraryEntity itinerary) {
		
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
		.withProcedureName("sp_create_itinerary");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("name", itinerary.getName());		
		inParamMap.put("tzoffset", itinerary.getTzoffset());
		inParamMap.put("createdbyemail", itinerary.getCreatedbyemail());
		inParamMap.put("version", 0);		
		inParamMap.put("status", Constants.Itinstatus.valueOf("Initial").getValue());
		inParamMap.put("currency", "INR");
		inParamMap.put("quotecurrency", "INR");
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		Map<String, Object> simpleJdbcCallResult=null;
    	try {    	
    		simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
    		itinerary.setStatus(Constants.Itinstatus.valueOf("Initial").getValue());
    		itinerary.setVersion(0);
    		itinerary.setCurrency("INR - Indian Rupee"); // Change to company locale
		    itinerary.setError("Success");
    	} catch (Exception ex) {
    		// Check duplicate error and ignore
    		if (ex.getMessage().contains("Duplicate entry") == false)
    			itinerary.setError(ex.getMessage());
    		else
    			itinerary.setError("Duplicate");
		} 					
				
		
		if (itinerary.getError().equals("Success")) {
			String idStr = simpleJdbcCallResult.get("itinnum").toString();
			itinerary.setId(Integer.parseInt(idStr)); 		
		}
		
		return itinerary;
		
	}

    @Override
	public ItineraryEntity GetItinerary(int itinnum) {
    	    			
        String SQL = "Call sp_get_itinerary(" + "'" + itinnum + "'" + ");";

 		List<ItineraryEntity> dbitinerary = getJdbcTemplate().query(SQL, new ItineraryEntityMapper());
		// INR should be changed to company locale currency
		// For INR no conversion or anything extra is required
 		if (dbitinerary.get(0).getQuotecurrency() == null || dbitinerary.get(0).getQuotecurrency().equals("INR"))
 				dbitinerary.get(0).setQuotecurrencystr(""); // should be locale currency
 		else {  	
 			 SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
 	    	 .withProcedureName("sp_getisocurrencydetails");
 	    	 Map<String, Object> inParamMap = new HashMap<String, Object>();
 	    	 inParamMap.put("inisocode", dbitinerary.get(0).getQuotecurrency());
 	    	 SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 	    	 Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
 	    	 String currdesc = (String) simpleJdbcCallResult.get("outcurrdesc");
 	    	 String qcurr = dbitinerary.get(0).getQuotecurrency() + " - " + currdesc;
 	    	 dbitinerary.get(0).setQuotecurrencystr(qcurr); 	 	    	 
 		}
 		
 		// Set Currency Conversion code
 		if (dbitinerary.get(0).getConvcode() == 1)
				dbitinerary.get(0).setConvcodestr("");
 		else {
	    	 SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
	    	 .withProcedureName("sp_getconvcodedetails");
	    	 Map<String, Object> inParamMap = new HashMap<String, Object>();
	    	 inParamMap.put("currconvcode", dbitinerary.get(0).getConvcode());
	    	 SqlParameterSource in = new MapSqlParameterSource(inParamMap);
	    	 Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
	    	 String fromcurr = (String) simpleJdbcCallResult.get("outfromcurr");
	    	 String tocurr = (String) simpleJdbcCallResult.get("outtocurr");
	    	 String unitrate = String.valueOf(simpleJdbcCallResult.get("outunitrate"));
	    	 String convcode = dbitinerary.get(0).getConvcode() + " - " + fromcurr + " to " + tocurr + " Rate: " + unitrate;
	    	 dbitinerary.get(0).setConvcodestr(convcode);			
 		}
 		
 		if (dbitinerary.get(0).getGrouphead().equals("Fill"))
 			dbitinerary.get(0).setGrouphead("");
 		if (dbitinerary.get(0).getArrivalcity().equals("Fill"))
 			dbitinerary.get(0).setArrivalcity("");
 		if (dbitinerary.get(0).getDepcity().equals("Fill"))
 			dbitinerary.get(0).setDepcity("");
 		
 		
 		return dbitinerary.get(0);
 			
    }
 		

	@Override
	public ItineraryEntity SaveItinerary(ItineraryEntity itinerary) {
	   	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	
			SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
			.withProcedureName("sp_save_itinerary");

			Map<String, Object> inParamMap = new HashMap<String, Object>();

			inParamMap.put("itinnum", itinerary.getId());		
			inParamMap.put("name", itinerary.getName());		
			
			if (itinerary.getVersion() == 0) {// safe to assume if version = 0 then status will be initial
				itinerary.setStatus(Constants.Itinstatus.valueOf("Draft").getValue());
				itinerary.setVersion(itinerary.getVersion()+1);
			}
			
			inParamMap.put("touroperator", itinerary.getTouroperator());
			inParamMap.put("grouphead", itinerary.getGrouphead());
			inParamMap.put("numtravellers", itinerary.getNumtravellers());
			
			// Convert UTC time strings to Date
			long utcstime = TimeFormatter.LocalToUTC(itinerary.getStartdatelong(), itinerary.getTzoffset());
			java.sql.Timestamp stimestamp = new java.sql.Timestamp(utcstime);			
			inParamMap.put("startdate", stimestamp);
			
			long utcetime = TimeFormatter.LocalToUTC(itinerary.getEnddatelong(), itinerary.getTzoffset());
			java.sql.Timestamp etimestamp = new java.sql.Timestamp(utcetime);									
			inParamMap.put("enddate", etimestamp);

			inParamMap.put("arrivalcity", itinerary.getArrivalcity());
			inParamMap.put("depcity", itinerary.getDepcity());
			
			if (itinerary.getQuotecurrencystr().isEmpty())
				itinerary.setQuotecurrency("INR"); // this should be changed to company's default locale currency
			inParamMap.put("quotecurrency", itinerary.getQuotecurrency()); 
			if (itinerary.getConvcodestr().isEmpty())
				itinerary.setConvcode(1); // INR - INR, should be changed to company's default locale currency conversion
			
			inParamMap.put("status", itinerary.getStatus());							
			inParamMap.put("version", itinerary.getVersion());
			inParamMap.put("convcode", itinerary.getConvcode());		
			inParamMap.put("mode", itinerary.getMode());
			inParamMap.put("lastupdatedbyemail", itinerary.getLastupdatedbyemail());
			
			SqlParameterSource in = new MapSqlParameterSource(inParamMap);
			
			Map<String, Object> simpleJdbcCallResult=null;
	    	try {    	
	    		simpleJdbcCallResult = simpleJdbcCall.execute(in);
				// No exception means insert/update/delete happened
			    itinerary.setError("Success");
	    	} catch (Exception ex) {
	    			itinerary.setError(ex.getMessage());
			} 					
								
			return itinerary;
	}

	@Override
	public List<String> GetISOCurrList(String query) {
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_getisocurrlist");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("query", query);
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> dbisocurrnames = simpleJdbcCall.execute(in);
		if (dbisocurrnames.isEmpty())
			return null;

		// Safe to assume result is in result set 1
		ArrayList <HashMap<String, Object>> isocurrValues = (ArrayList<HashMap<String, Object>>) dbisocurrnames.get("#result-set-1");
		
		// Set<Entry<String, Object>> iterator = orgValues.entrySet();
		
    	ArrayList<String> isocurrnames = new ArrayList<String>(isocurrValues.size());
    	    	
    	for (HashMap<String, Object> map : isocurrValues) {
    	     for (Entry<String, Object> mapEntry : map.entrySet())
    	    	 isocurrnames.add(mapEntry.getValue().toString());
    	}
				
    	
 		return isocurrnames;
	}


	@Override	
	public List<String> GetCurrConvCodes(String query) {
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_getcurrconvcodes");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("query", query);
		// for now only Active, can be changed for any codes
		inParamMap.put("instatus", Constants.Itincurrconv.valueOf("Active").getValue());
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> dbconvcodes = simpleJdbcCall.execute(in);
		if (dbconvcodes.isEmpty())
			return null;

		// Safe to assume result is in result set 1
		ArrayList <HashMap<String, Object>> currconvcodes = (ArrayList<HashMap<String, Object>>) dbconvcodes.get("#result-set-1");
		
		// Set<Entry<String, Object>> iterator = orgValues.entrySet();
		
    	ArrayList<String> convcodenames = new ArrayList<String>(currconvcodes.size());
    	    	
    	for (HashMap<String, Object> map : currconvcodes) {
    	     for (Entry<String, Object> mapEntry : map.entrySet())
    	    	 convcodenames.add(mapEntry.getValue().toString());
    	}
				
    	
 		return convcodenames;
	}


	@Override		
	public String CreateCurrConvCode(String fromcurr, String tocurr, float unitrate) {
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_createcurrconvcode");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("intocurr", tocurr);
		inParamMap.put("infromcurr", fromcurr);
		inParamMap.put("inunitrate", unitrate);
		inParamMap.put("instatus", Constants.Itincurrconv.valueOf("Active").getValue());
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
    	String result = (String) simpleJdbcCallResult.get("result");	
    	
 		return result;
	}    
 	
}