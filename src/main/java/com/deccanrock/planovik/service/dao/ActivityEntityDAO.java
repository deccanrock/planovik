package com.deccanrock.planovik.service.dao;
 

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.TravelActivityMapper;
import com.deccanrock.planovik.service.utils.TimeFormatter;

 
@Component
@Transactional
public class ActivityEntityDAO implements IActivityEntityDAO {

	@Autowired
	@Qualifier("mainDataSource")
	private DataSource dataSource;
    public ActivityEntityDAO(DataSource dataSource) {
    	super();
	    this.dataSource = dataSource;
    }
    
    ActivityEntityDAO () {}

    
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
	public TravelActivityEntity saveTravelActivity(TravelActivityEntity travelactivity) {

    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    	
   	 	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);	    	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_save_travelactivity");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("initinnum", travelactivity.getItinnum());		
		inParamMap.put("inactname", travelactivity.getActname());
		
		// 0 = travel activity
		inParamMap.put("type", 0);

		inParamMap.put("incode", travelactivity.getCode());		
		inParamMap.put("inversion", travelactivity.getVersion());		
		inParamMap.put("lastupdatedbyemail", travelactivity.getLastupdatedby());
		// Should be 0 for new activity
		inParamMap.put("inactivityid", travelactivity.getActivityid().intValue());
		if (travelactivity.getPax() == null)
			inParamMap.put("inpax", 0);
		else
			inParamMap.put("inpax", travelactivity.getPax().intValue());
		
		if (travelactivity.getMode() == null)
			inParamMap.put("inmode", 0);
		else
			inParamMap.put("inmode", Integer.toString(travelactivity.getMode()));
		
		
		//if (travelactivity.getGroupnum() == null)
		//	inParamMap.put("ingroupnum", 1); // default			
		//else
		//	inParamMap.put("ingroupnum", travelactivity.getGroupnum().intValue());

		inParamMap.put("invesselconame", "");
		inParamMap.put("inbookingno", "");
		inParamMap.put("inbookingclass", "");		
		inParamMap.put("invesselnoon", "");
		inParamMap.put("indepdatetimeon", new java.sql.Timestamp(0));
		inParamMap.put("inarrdatetimeon", new java.sql.Timestamp(0));
		inParamMap.put("invesselnoret", "");
		inParamMap.put("inarrstation", "");
		inParamMap.put("indepstation", "");
		inParamMap.put("invesselnoret", "");
		inParamMap.put("indepdatetimeret", new java.sql.Timestamp(0));
		inParamMap.put("inarrdatetimeret", new java.sql.Timestamp(0));

		inParamMap.put("incost", 0.0);
		inParamMap.put("incostmarkup", 0);
		inParamMap.put("invesselnoon", "");
		inParamMap.put("inasstcost", 0.0);			
		inParamMap.put("inasstcostmarkup", 0);			
		inParamMap.put("inpikupdroplocfrom", "");
		inParamMap.put("inpikupdroplocto", "");
		inParamMap.put("invehdetails", "");
		inParamMap.put("inpikupdropdatetime", new java.sql.Timestamp(0));
		inParamMap.put("inpikupdropcost", 0.0);
		inParamMap.put("inpikupdropcostmarkup", 0);

		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());
		
		if (travelactivity.getCode().matches("T_BOOK_ONEWAY") || travelactivity.getCode().matches("T_BOOK_RETURN")) {

			inParamMap.put("invesselconame", travelactivity.getVesselconame());
			inParamMap.put("inbookingno", travelactivity.getBookingno());
			inParamMap.put("inbookingclass", travelactivity.getBookingclass());
			
			inParamMap.put("invesselnoon", travelactivity.getVesselnoon());
			// Convert UTC time strings to Date
			long utcstimeon = TimeFormatter.LocalToUTC(travelactivity.getDepdatetimeonlong(), travelactivity.getTzoffset());
			java.sql.Timestamp stimestampon = new java.sql.Timestamp(utcstimeon);			
			inParamMap.put("indepdatetimeon", stimestampon);
			travelactivity.setActivitystarttimelong(travelactivity.getDepdatetimeonlong());								
			long utcetimeon = TimeFormatter.LocalToUTC(travelactivity.getArrdatetimeonlong(), travelactivity.getTzoffset());
			java.sql.Timestamp etimestampon = new java.sql.Timestamp(utcetimeon);									
			inParamMap.put("inarrdatetimeon", etimestampon);
			travelactivity.setActivityendtimelong(travelactivity.getArrdatetimeonlong());
			inParamMap.put("inarrstation", travelactivity.getArrstation());
			inParamMap.put("indepstation", travelactivity.getDepstation());

			if (travelactivity.getCost() == null)		
				inParamMap.put("incost", 0.0);
			else
				inParamMap.put("incost", travelactivity.getCost().floatValue());			
			
			if (travelactivity.getCostmarkup() == null)
				inParamMap.put("incostmarkup", 0);
			else
				inParamMap.put("incostmarkup", travelactivity.getCostmarkup().intValue());		
			
			if (travelactivity.getCode().matches("T_BOOK_RETURN")) {
				inParamMap.put("invesselnoret", travelactivity.getVesselnoret());
				long utcstimeret = TimeFormatter.LocalToUTC(travelactivity.getDepdatetimeretlong(), travelactivity.getTzoffset());
				java.sql.Timestamp stimestampret = new java.sql.Timestamp(utcstimeret);			
				inParamMap.put("indepdatetimeret", stimestampret);
				travelactivity.setActivitystarttimelongpair(travelactivity.getDepdatetimeretlong());								
				long utcetimeret = TimeFormatter.LocalToUTC(travelactivity.getArrdatetimeretlong(), travelactivity.getTzoffset());
				java.sql.Timestamp etimestampret = new java.sql.Timestamp(utcetimeret);									
				inParamMap.put("inarrdatetimeret", etimestampret);
				travelactivity.setActivityendtimelongpair(travelactivity.getArrdatetimeretlong());
			}	
						
		}
		

		if (travelactivity.getCode().matches("T_PIKUPDRP")) {

			inParamMap.put("invesselnoon", travelactivity.getVesselnopikupdrp());
			inParamMap.put("invesselconame", travelactivity.getVesselconame());
			
			if (travelactivity.getAsstcost() == null)			
				inParamMap.put("inasstcost", 0.0);
			else
				inParamMap.put("inasstcost", travelactivity.getAsstcost().floatValue());			
	
			if (travelactivity.getAsstcostmarkup() == null)					
				inParamMap.put("inasstcostmarkup", 0);
			else
				inParamMap.put("inasstcostmarkup", travelactivity.getAsstcostmarkup().intValue());
			
			inParamMap.put("inpikupdroplocfrom", travelactivity.getPikupdroplocfrom());
			
			inParamMap.put("inpikupdroplocto", travelactivity.getPikupdroplocto());
	
			inParamMap.put("invehdetails", travelactivity.getVehdetails());
	
			long utcpdtime = TimeFormatter.LocalToUTC(travelactivity.getPikupdropdatetimelong(), travelactivity.getTzoffset());
			java.sql.Timestamp pdtimestamp = new java.sql.Timestamp(utcpdtime);									
			inParamMap.put("inpikupdropdatetime", pdtimestamp);
			if (travelactivity.getCode().matches("T_PIKUPDRP"))
				travelactivity.setActivitystarttimelong(travelactivity.getPikupdropdatetimelong());
			
			if (travelactivity.getPikupdropcost() == null)					
				inParamMap.put("inpikupdropcost", 0.0);
			else
				inParamMap.put("inpikupdropcost", travelactivity.getPikupdropcost().floatValue());
				
			if (travelactivity.getPikupdropcostmarkup() == null)							
				inParamMap.put("inpikupdropcostmarkup", 0);
			else
				inParamMap.put("inpikupdropcostmarkup", travelactivity.getPikupdropcostmarkup().intValue());
			
		}
		
		inParamMap.put("incommentsinternal", travelactivity.getCommentsinternal());
		inParamMap.put("incommentsexternal", travelactivity.getCommentsexternal());
		
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		Map<String, Object> simpleJdbcCallResult=null;
    	try {    	
    		simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
    		travelactivity.setError("Success");
    		if (travelactivity.getActivityid().intValue() == 0) {
	    		String idStr = simpleJdbcCallResult.get("outactivityid").toString();
	    		travelactivity.setActivityid(Integer.parseInt(idStr)); 	    		
	    		if (travelactivity.getCode().contentEquals("T_BOOK_RETURN")) {
		    		String idStrpair = simpleJdbcCallResult.get("outactivityidpair").toString();
		    		travelactivity.setActivityidpair(Integer.parseInt(idStrpair)); 	    			    			
	    		}

    		}
    	} catch (Exception ex) {
    		travelactivity.setError(ex.getMessage());
		} 					
							
		return travelactivity;				
	}


	@Override
	public List<TravelActivityEntity> getTravelActivities(int itinnum, int version, short tzoffset) 
				throws IOException, SQLException {
    
		String SQL = "Call sp_get_travel_activities(" + itinnum + ',' + version +  ',' + TenantContextHolder.getTenant().getTenantid() + ");";    	

    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
		JdbcTemplate dbtemplate = new JdbcTemplate(tenantdataSource);  	

		TravelActivityMapper tam = new TravelActivityMapper();
		tam.setTzoffset(tzoffset);
		tam.setReqfulldetails(true);

		List <TravelActivityEntity> travelentities = null;
    	try {    	
    		travelentities = dbtemplate.query(SQL, tam);
    	} catch (Exception ex) {
    		travelentities = null;
    	} 					
 		
 		return travelentities; 		
 	}

	@Override
	public List<TravelActivityEntity> getActivitiesDetForType(int itinnum, int version, short tzoffset, short i, int tenantid, DataSource tenantdataSource)
				throws IOException, SQLException {
    
		String SQL = "Call sp_get_activities_for_type(" + itinnum + ',' + version + ',' + i + ',' + tenantid + ");";    	
				
    	// DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
		JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);  	

		TravelActivityMapper tam = new TravelActivityMapper();
		tam.setTzoffset(tzoffset);
		tam.setReqfulldetails(true);
		List <TravelActivityEntity> travelentities;
    	try {    			
    		travelentities = jdbcTemplate.query(SQL, tam);
    	} catch (Exception ex) {
    		travelentities = null;
		} 					

    	return travelentities; 		
 	}

	@Override
	public Object GetActivityDetails(int activityid, int type, short tzoffset) throws IOException, SQLException {
		// TODO Auto-generated method stub
		String SQL = "Call sp_get_activity_details(" + activityid + ',' + type + ',' + TenantContextHolder.getTenant().getTenantid() + ");";    	
		
    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
		JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);  	

		if (type == 0) {
			TravelActivityMapper tam = new TravelActivityMapper();
			tam.setTzoffset(tzoffset);
			tam.setReqfulldetails(true);
			List <TravelActivityEntity> travelentities = jdbcTemplate.query(SQL, tam);
			if (travelentities.get(0).getCode().equals("T_BOOK_RETURN")) {
				// Get start and end pair values
				SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName("sp_get_activitypairdet");
				Map<String, Object> inParamMap = new HashMap<String, Object>();
				inParamMap.put("inactivityid", travelentities.get(0).getActivityidpair());		
				inParamMap.put("type", type);
				inParamMap.put("tenantid", TenantContextHolder.getTenant().getTenantid());
				
				SqlParameterSource in = new MapSqlParameterSource(inParamMap);
				Map<String, Object> rs=null;
		    	try {    	
		    		rs = simpleJdbcCall.execute(in);
		    		// Check what field and process accordingly
		    		if (rs.get("outdepdatetimeon") != null) {
		    			
		    			long depdatetimeonlongutc = Long.parseLong((String) rs.get("outdepdatetimeon"));
						long depdatetimeonlong = TimeFormatter.UTCToLocal(depdatetimeonlongutc, 
								travelentities.get(0).getTzoffset());
						
		    			long arrdatetimeonlongutc = Long.parseLong((String) rs.get("outarrdatetimeon"));
						long arrdattimeeonlong = TimeFormatter.UTCToLocal(arrdatetimeonlongutc, 
								travelentities.get(0).getTzoffset());
						
			    		travelentities.get(0).setActivitystarttimelongpair(depdatetimeonlong);    			    			
			    		travelentities.get(0).setActivityendtimelongpair(arrdattimeeonlong); 
		    		}
		    		else {
		    			long depdatetimeretlongutc = Long.parseLong((String) rs.get("outdepdatetimeret"));
						long depdattimeretlong = TimeFormatter.UTCToLocal(depdatetimeretlongutc, 
								travelentities.get(0).getTzoffset());
						
		    			long arrdatetimeretlongutc = Long.parseLong((String) rs.get("outarrdatetimeret"));
						long arrdatetimeretlong = TimeFormatter.UTCToLocal(arrdatetimeretlongutc, 
								travelentities.get(0).getTzoffset());
		    		
			    		travelentities.get(0).setActivitystarttimelongpair(depdattimeretlong);    			    			
			    		travelentities.get(0).setActivityendtimelongpair(arrdatetimeretlong); 
		    		}
		    	} catch (Exception ex) {
		    		travelentities.get(0).setError(ex.getMessage());
				} 					
			}
	 		
			return travelentities.get(0); 		
		}
 		
		// This should never really happen
		return null;
	}

	@Override
	// public String DeleteActivity(int activityid, int activityidpair, int itinnum, int type, int version, int groupnum) throws IOException, SQLException {
	public String DeleteActivity(int activityid, int activityidpair, int itinnum, int type, int version) throws IOException, SQLException {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_delete_activity");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inactivityid", activityid);
		inParamMap.put("inactivityidpair", activityidpair);
		inParamMap.put("initinnum", itinnum);		
		inParamMap.put("intype", type);
		inParamMap.put("inversion", version);
		//inParamMap.put("ingroupnum", groupnum);

		String result;
		
		try {    	
    		simpleJdbcCall.execute(inParamMap);
    		result = "{\"result\": \"success\"}";
    	}
    	catch (Exception ex) {
    		result = ex.getMessage();
    		result = "{\"result\":" + "\"" + result + "\"}"; 
		} 					
				
		// This should never really happen
		return result;
	}
	
}