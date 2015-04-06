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
import com.deccanrock.planovik.service.utils.TimeFormatter;


 
@Component
@Transactional
public class ActivityMasterDAO extends JdbcDaoSupport implements IActivityMasterDAO {

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
    
	@Override		
	public String CreateMasterActivityAct(int itinnum, int version, String actname, long actstarttime, long actendtime, 
											short tzoffset, int masteractid) {
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_createeditmasteractnamedet");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("initinnum", itinnum);
		inParamMap.put("inversion", version);
		inParamMap.put("inmasteractname", actname);
		inParamMap.put("inmasteractid", masteractid);
		
		// Convert UTC time strings to Date
		long utcstime = TimeFormatter.LocalToUTC(actstarttime, tzoffset);
		java.sql.Timestamp stimestamp = new java.sql.Timestamp(utcstime);			
		inParamMap.put("inmasteractstartdate", stimestamp);
		
		long utcetime = TimeFormatter.LocalToUTC(actendtime, tzoffset);
		java.sql.Timestamp etimestamp = new java.sql.Timestamp(utcetime);									
		inParamMap.put("inmasteractenddate", etimestamp);		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
    	String result = (String) simpleJdbcCallResult.get("outmasteractid");	
    	
 		return result;
	}


	public String DeleteMasterActivityAct(int itinnum, int version, int masteractid) {
		// TODO Auto-generated method stub
    	JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);    	

		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_deletemasteract");

		Map<String, Object> inParamMap = new HashMap<String, Object>();
			
		inParamMap.put("initinnum", itinnum);
		inParamMap.put("inversion", version);
		inParamMap.put("inmasteractid", masteractid);
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		String result = null;
		
    	try {    	
    		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
        	result = "OK";	
    	} catch (Exception ex) {
    		result = ex.getMessage();
		} 					
    	
 		return result;	
 	}
    
}