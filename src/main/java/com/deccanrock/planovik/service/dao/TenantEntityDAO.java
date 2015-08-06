 package com.deccanrock.planovik.service.dao;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;






import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.Tenant.TenantTargetRegistry;
import com.deccanrock.planovik.constants.PlnvkConstants;
import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.TenantEntityMapper;
import com.deccanrock.planovik.service.utils.MiscHelper;

@Component
@Transactional
public class TenantEntityDAO implements ITenantEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;
	
    public TenantEntityDAO(DataSource dataSource) {
    	super();
	    this.dataSource = dataSource;
    }
		
	TenantEntityDAO () {}
	
 	
	@Override
 	public TenantEntity GetTenant(String info, int infotype) {
 		
		// set infotype=0 to getTenant using tenant id
		// set infotype=1 to getTenant using tenant name
		// set infotype=2 to getTenant using contact email
		
        String SQL = "Call sp_gettenantfordomain(" + "'" + info + "'," + infotype + ");";
        
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
 		List<TenantEntity> tenantList = jdbcTemplate.query(SQL, new TenantEntityMapper());
 		
 		if (tenantList.size() == 0)
 			return null;
 		else
 			return tenantList.get(0);
 	}

	@Override
	public String CreateTenant(String tenantdesc, AccountEntity account, String regIPAddress, 
			short tenanttype, short billingplan, AccountEntity ae) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_createtenant");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();

    	inParamMap.put("inaccountid", account.getId());    	
    	inParamMap.put("intenantdesc", tenantdesc);
		inParamMap.put("intzoffset", account.getTzoffset());
		inParamMap.put("incountrycode", account.getAddrcountrycode());
		inParamMap.put("intenanttype", tenanttype);
		inParamMap.put("inbillingplan", billingplan);
		inParamMap.put("inregip", regIPAddress);

		TenantEntity tenant = new TenantEntity();
		// Generate tenant name from tenant desc, at this point a default name if reserved
		// for and pro and enterprise customers which they can change at a later time
		tenant.setTenantname((MiscHelper.ComputeTenantName(tenantdesc)));
    	inParamMap.put("intenantname", tenant.getTenantname());
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result;
		int tenantid=0;
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		try {    	
			result = simpleJdbcCallResult.get("result").toString();
			if (result.contentEquals("tenantexists")) { // try until unique tenant set
				String tenantName = tenant.getTenantname();
				short i = 1;
				while (result.contentEquals("tenantexists")) {
					tenantName = tenant.getTenantname();
					tenantName = tenantName + String.valueOf(i);
			    	inParamMap.put("intenantname", tenantName);
			    	in = new MapSqlParameterSource(inParamMap);
					simpleJdbcCallResult = simpleJdbcCall.execute(in);
					result = simpleJdbcCallResult.get("result").toString();
					i++;
				} 
			}			
		} catch (Exception ex) {
		    result = ex.getMessage();
		}
    	
    	// Setup an entry in users own tenant instance
		if (result.contentEquals("Success")) {
			tenantid = (Integer)simpleJdbcCallResult.get("outtenantid");
			// Get Tenant Entity
			TenantEntity te = GetTenant(Integer.toString(tenantid), 0);
			if (te != null) {
				TenantTargetRegistry TTR = new TenantTargetRegistry();
				DataSource tenantds = TTR.getDataSource(te.getJndiname());
				jdbcTemplate = new JdbcTemplate(tenantds);	    	    	
		    	simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("sp_updatetenantinuser");
		    	inParamMap.put("intenantid", te.getTenantid());    	
		    	inParamMap.put("inusername", ae.getContactemail());    	
		    	inParamMap.put("infullname", ae.getContactname());    	
		    	inParamMap.put("inpassword", ae.getContactpswd());    	
		    	inParamMap.put("inphone", ae.getContactphonemobile());    	
		    	inParamMap.put("indesignation", "Founder and Site Admin");
		    	inParamMap.put("increatedyby", 1); // 1 = www site    	
		    	inParamMap.put("inlevel", 0); // 0 is top admin level   	
		    	inParamMap.put("inenabled", 1);    	
		    	inParamMap.put("inrole", "ROLE_ADMIN");    	
		    	inParamMap.put("inaccountnonexpired", 1);    	
		    	inParamMap.put("inaccountnonlocked", 1);    	
		    	inParamMap.put("incredentialsnonexpired", 1);    	
		    	inParamMap.put("intzoffset", te.getTzoffset());    	
		    	in = new MapSqlParameterSource(inParamMap);
		    	simpleJdbcCallResult = simpleJdbcCall.execute(in);

			}
		}
			
    	return result;		
	}


	@Override
	public String TenantExists(String tenantInfo, boolean isDesc) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_checktenantexists");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("intenantinfo", tenantInfo);
    	if (isDesc)
        	inParamMap.put("indesc", 1);
    	else
        	inParamMap.put("indesc", 0);
    		

    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 		
    	String result = "";
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = simpleJdbcCallResult.get("result").toString();
    	} catch (Exception ex) {
			result = "fail";
		} 
    	
    	return result;
	}


	@Override
	public String UpdateTenant(TenantEntity tenant) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_updatetenant");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("intenantid", tenant.getTenantid());    	
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result = "Success";
    	try {    	
    		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);			
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
		
    	return result;				
	}

	@Override
	public void SetStatus(int tenantid, int value) {
        String SQL = "Call sp_updateregstatus(" +  tenantid + "," + value + ");";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   			
 		jdbcTemplate.execute(SQL);
 		// Assume success though result should be tracked
	}

	@Override
	public String VerifyPin(Short pin, int tenantid) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_verifypin");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("inpin", pin);		
    	inParamMap.put("intenantid", tenantid);		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 		
    	String result = "Fail";
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = simpleJdbcCallResult.get("result").toString();
    	} catch (Exception ex) {
		}
    	
    	if (result.contentEquals("Success")) {
    		SetStatus(tenantid, PlnvkConstants.RegStatus.Registered.getValue());
    		// Setup tenant instance along with credentials and inform user
    		
    	}
    	
    	return result;
	}

	public boolean TenantContactEmailExists(String contactEmail) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_checktenantcontactemailexists");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("incontactemail", contactEmail);		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 		
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			String result = simpleJdbcCallResult.get("result").toString();
			if (result.contentEquals("exists"))
					return true;
			else
					return false;
    	} catch (Exception ex) {
			return false;
		} 	
	}

	@Override
	public String GetTenantName(String tenantdesc) {
		// Generate tenant name from tenant desc, at this point a default name if reserved
		// for and pro and enterprise customers which they can change at a later time
		String tenantname = MiscHelper.ComputeTenantName(tenantdesc);
		
		while (TenantExists(tenantname, false).contentEquals("exists") == true)	
			tenantname = MiscHelper.ComputeTenantName(tenantdesc);

		return tenantname;
			
	}
}