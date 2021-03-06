package com.deccanrock.planovik.service.dao;
 
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
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.UserEntityMapper;
 
@Component
@Transactional
public class UserEntityDAO implements
		IUserEntityDAO {

	@Autowired
	@Qualifier("mainDataSource")
	private DataSource dataSource;
    public UserEntityDAO(DataSource dataSource) {
    	super();
	    this.dataSource = dataSource;
    }

    UserEntityDAO () {}
    
    @Override
    public boolean Login(String username, String inpass) {

    	 JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	
    	 SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	 .withProcedureName("sp_admin_getpasssalt");
    	 Map<String, Object> inParamMap = new HashMap<String, Object>();
    	 SqlParameterSource in = new MapSqlParameterSource(inParamMap);
    	 Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
    	 String salt = (String) simpleJdbcCallResult.get("salt");
    	 String pass = (String) simpleJdbcCallResult.get("pass");
    	 // Encrypt user provided pass with salt and check
    	 if (salt != null)
    	 return true;
    	 else
    	 return false;
    }

	public UserEntity loadUserByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

    
    @Override	
	public List<String> GetOrgList(String query) {

    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	

    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_getidnamelist");
    	Map<String, Object> inParamMap = new HashMap<String, Object>();
    	inParamMap.put("query", query);
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
    	Map<String, Object> dborgnames = simpleJdbcCall.execute(in);
    	if (dborgnames.isEmpty())
    	return null;
    	// Safe to assume result is in result set 1
    	ArrayList <HashMap<String, Object>> orgValues = (ArrayList<HashMap<String, Object>>) dborgnames.get("#result-set-1");
    	// Set<Entry<String, Object>> iterator = orgValues.entrySet();
    	ArrayList<String> orgnames = new ArrayList<String>(orgValues.size());
    	for (HashMap<String, Object> map : orgValues) {
    	for (Entry<String, Object> mapEntry : map.entrySet())
    	orgnames.add(mapEntry.getValue().toString());
    	}
    	return orgnames; 
 
	}    
 
    @Override
    public String ManageUser(UserEntity user) {

    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_manageuser");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());    	
    	inParamMap.put("inemail", user.getEmail());
		inParamMap.put("infullname", user.getFullname());
		inParamMap.put("inrole", user.getRole());
		inParamMap.put("indesignation", user.getDesignation());
		inParamMap.put("inusername", user.getUsername());
		inParamMap.put("mode", user.getMode());
		inParamMap.put("reportstousername", user.getReportstousername());
		inParamMap.put("createdbyusername", user.getCreatedbyusername());		
		// Apply bcrypt encryption, salt is built in, using strength 10
		if (user.getMode().equals("Create"))
			inParamMap.put("inpassword", HashCode.getHashPassword(user.getPass()));
		else // this is only for setting IN parameter for SQL stored procedure, no DB change will be made
			inParamMap.put("inpassword", "no change");
		
		inParamMap.put("inphone", user.getPhonecode() + '-' + user.getPhone());
		inParamMap.put("intzoffset", user.getTzoffset());
		
		
		// Check flags and alter
		if (user.getTogglelock() == 1) { // lock was set to yes, determine if account is locked/unlocked and set flag
			if (user.getIslocked() == 1) // account is locked, unlock it
				inParamMap.put("inaccountNonLocked", 1);
			else
				inParamMap.put("inaccountNonLocked", 0); // account in unlocked, lock it
		}
		else
			inParamMap.put("inaccountNonLocked", user.isAccountNonLocked()); // retain same value
			
		
		if (user.getIscredentialsexpired() == 1) // expire password
			inParamMap.put("incredentialsNonExpired", 0);
		else
			inParamMap.put("incredentialsNonExpired", user.isCredentialsNonExpired()); // retain same value
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result;
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
			result = "Success";
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
		
    	return result;
    }

    @Override
	public boolean UserExists(String userName) {
    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_user_exists");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inusername", userName);
		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());
		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		
		String returneduser = (String) simpleJdbcCallResult.get("userid").toString();
		
		if (returneduser.matches("0"))
			return false;
		else
			return true;
	}

    @Override
	public UserEntity GetUser(String username) {
	
    	String SQL = "Call sp_getuserdetails(" + "'" + username + "'" + "," + TenantContextHolder.getTenant().getTenantid() + ");";
    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);

 		List<UserEntity> user = jdbcTemplate.query(SQL, new UserEntityMapper());
 		
 		if (user.isEmpty())
 			return null;
 		
 		// This should be combined to one statement in future
 		SQL = "Call sp_getreportingmanagers("  + user.get(0).getId() + "," + TenantContextHolder.getTenant().getTenantid() + ");";
 		List<Map<String, Object>> managers = jdbcTemplate.queryForList(SQL);
 		
 		// Set reporting manager and created by information, should always get 2 strings in that order
 		int i = 0;
 		for (Map<String, Object> map : managers) {
 		    for (Map.Entry<String, Object> entry : map.entrySet()) {
 		    	if (i == 0)
 		    		user.get(0).setReportstousername(entry.getValue().toString());
 		    	if (i == 1)
 		    		user.get(0).setCreatedbyusername(entry.getValue().toString());
 		    	i++;
 		    }
 		} 		
 		
 		// For now only return one but can be used to retrieve multiple org details
 		return user.get(0);     	
    	
	}

	public void DeleteUser(String username) {

    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_delete_user");
		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inusername", username);
		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
	}

	// This method will be extended to allow users to edit more settings on their profile, for now password
    @Override
	public String UpdateUserPassword(int id, String pass) {
    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);

    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_updateuserpassword");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inid", id);
		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());		
		// Secure pass
		inParamMap.put("inpass", HashCode.getHashPassword(pass));

		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		
		String result="";
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = "Success";
			// No exception means insert/update/delete happened
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
						
		return result;
	}

    @Override
	public String UpdateUserProfile(int id, String pass) {
    	DataSource  tenantdataSource = TenantDS.setTenantDataSource(null);    	    			
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(tenantdataSource);

    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
		.withProcedureName("sp_updateuserprofile");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inid", id);
		inParamMap.put("intenantid", TenantContextHolder.getTenant().getTenantid());		
		// Secure pass
		inParamMap.put("inpass", HashCode.getHashPassword(pass));

		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		
		
		String result;
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			// No exception means insert/update/delete happened
			result = "Success";
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
						
		return result;
	}

}