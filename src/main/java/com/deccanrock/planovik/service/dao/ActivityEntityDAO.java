package com.deccanrock.planovik.service.dao;
 

import java.util.ArrayList;
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

import com.deccanrock.planovik.constants.Constants;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;


 
@Component
@Transactional
public class ActivityEntityDAO extends JdbcDaoSupport implements IActivityMasterDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}

    
    @Override	
	public List<String> GetActivityCodes(String query) {
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_getactivitycodes");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("codetype", query);
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> dbactivitycodes = simpleJdbcCall.execute(in);
		if (dbactivitycodes.isEmpty())
			return null;

		// Safe to assume result is in result set 1
		ArrayList <HashMap<String, Object>> activitycodes = (ArrayList<HashMap<String, Object>>) dbactivitycodes.get("#result-set-1");
		
    	ArrayList<String> activitycodeslist = new ArrayList<String>(activitycodes.size());
    	    	
    	for (HashMap<String, Object> map : activitycodes) {
    	     for (Entry<String, Object> mapEntry : map.entrySet())
    	    	 activitycodeslist.add(mapEntry.getValue().toString());
    	}
				
    	
 		return activitycodeslist;
	}


	public TravelActivityEntity saveTravelActivity(TravelActivityEntity travelactivity) {

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
		.withProcedureName("sp_save_travelactivity");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inday", travelactivity.getDay().intValue());				
		inParamMap.put("savemode", travelactivity.getSavemode());				
		inParamMap.put("initinnum", travelactivity.getItinnum());		
		inParamMap.put("inname", travelactivity.getName());
		
		if (travelactivity.getSavemode().equals("Save Final"))
			inParamMap.put("instatus", Constants.Itinactivitystatus.valueOf("Final").getValue());		
		else
			inParamMap.put("instatus", travelactivity.getStatus().intValue());		
		
		inParamMap.put("incode", travelactivity.getCode());		
		inParamMap.put("inversion", travelactivity.getVersion());		
		inParamMap.put("lastupdatedbyemail", travelactivity.getLastupdatedby());
		inParamMap.put("createdbyemail", travelactivity.getCreatedby());
		// Should be 0 for new activity
		inParamMap.put("inactivityid", travelactivity.getActivityid().intValue());							
		inParamMap.put("inpax", travelactivity.getPax().intValue());
		inParamMap.put("ingroupnum", travelactivity.getGroupnum().intValue());
		inParamMap.put("invesselno", travelactivity.getVesselno());
		inParamMap.put("invesselconame", travelactivity.getVesselconame());
		inParamMap.put("inbookingno", travelactivity.getBookingno());
		inParamMap.put("inbookingclass", travelactivity.getBookingclass());
		
		// Convert UTC time strings to Date
		long utcstime = TimeFormatter.LocalToUTC(travelactivity.getDepdatetimelong(), travelactivity.getTzoffset());
		java.sql.Timestamp stimestamp = new java.sql.Timestamp(utcstime);			
		inParamMap.put("indepdatetime", stimestamp);
		
		long utcetime = TimeFormatter.LocalToUTC(travelactivity.getArrdatetimelong(), travelactivity.getTzoffset());
		java.sql.Timestamp etimestamp = new java.sql.Timestamp(utcetime);									
		inParamMap.put("inarrdatetime", etimestamp);

		inParamMap.put("inarrstation", travelactivity.getArrstation());
		inParamMap.put("indepstation", travelactivity.getDepstation());
		inParamMap.put("incost", travelactivity.getCost().floatValue());
		inParamMap.put("incostmarkup", travelactivity.getCostmarkup().intValue());
		inParamMap.put("inasstcost", travelactivity.getAsstcost().floatValue());
		inParamMap.put("inasstcostmarkup", travelactivity.getAsstcostmarkup().intValue());
		inParamMap.put("inpikupveh", travelactivity.getPikupveh());
		inParamMap.put("inpikupcost", travelactivity.getPikupcost().floatValue());
		inParamMap.put("inpikcostmarkup", travelactivity.getPikupcostmarkup().intValue());
		inParamMap.put("incomments", travelactivity.getComments());
		
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		Map<String, Object> simpleJdbcCallResult=null;
    	try {    	
    		simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
    		travelactivity.setError("Success");
    		String idStr = simpleJdbcCallResult.get("activityid").toString();
    		travelactivity.setActivityid(Integer.parseInt(idStr)); 	    		
    	} catch (Exception ex) {
    		travelactivity.setError(ex.getMessage());
		} 					
							
		return travelactivity;				
	}


}