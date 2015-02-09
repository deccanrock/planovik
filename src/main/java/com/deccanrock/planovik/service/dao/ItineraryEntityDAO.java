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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.service.ItineraryEntityMapper;
import com.deccanrock.planovik.service.OrgDetailsMapper;

 
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
		inParamMap.put("version", 1);		
		inParamMap.put("status", "Draft");
		inParamMap.put("touroperator", "Fill");
		inParamMap.put("grouphead", "Fill");
		inParamMap.put("numtravellers", 0);
		Date date = new Date();
		inParamMap.put("startdate", date);
		inParamMap.put("enddate", date);
		inParamMap.put("arrivalcity", "fill");
		inParamMap.put("depcity", "fill");
		inParamMap.put("quotecurrency", "INR");
		inParamMap.put("convcode", "fill");		
		inParamMap.put("mode", itinerary.getMode());
		inParamMap.put("lastupdatedbyemail", itinerary.getLastupdatedbyemail());
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		Map<String, Object> simpleJdbcCallResult=null;
    	try {    	
    		simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
    		itinerary.setStatus("Draft");
    		itinerary.setVersion(1);
    		itinerary.setCurrency("INR");
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
 		
 		// For now only return one but can be used to retrieve multiple org details
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
			
			if (itinerary.getMode().equals("Edit"))
				itinerary.setVersion(itinerary.getVersion()+1);
			inParamMap.put("version", itinerary.getVersion());
			
			inParamMap.put("touroperator", itinerary.getTouroperator());
			inParamMap.put("grouphead", itinerary.getGrouphead());
			inParamMap.put("numtravellers", itinerary.getNumtravellers());
			inParamMap.put("startdate", itinerary.getStartdate());
			inParamMap.put("enddate", itinerary.getEnddate());
			inParamMap.put("arrivalcity", itinerary.getArrivalcity());
			inParamMap.put("depcity", itinerary.getDepcity());
			inParamMap.put("quotecurrency", itinerary.getQuotecurrency());
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
 	
}