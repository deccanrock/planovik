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
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.entity.TasksEntity;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.OrgDetailsMapper;
import com.deccanrock.planovik.service.UserEntityMapper;
 
@Component
@Transactional
public class UserEntityDAO extends JdbcDaoSupport implements
		IUserEntityDAO {

	@Autowired
	@Qualifier("mainDataSource")
	private DataSource dataSource;
	@PostConstruct
	private void initialize() {
	setDataSource(dataSource);
	}

    @Override
    public boolean Login(String username, String inpass) {

    	 SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
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

        // dbtemplate = new JdbcTemplate(dataSource);    	

    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
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

    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
    	.withProcedureName("sp_manageuser");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("fullname", user.getFullname());
		inParamMap.put("level", user.getLevel());
		inParamMap.put("designation", user.getDesignation());
		inParamMap.put("inusername", user.getUsername());
		inParamMap.put("mode", user.getMode());
		inParamMap.put("reportstoemail", user.getReportstoemail());
		inParamMap.put("createdbyemail", user.getCreatedbyemail());		
		// Apply bcrypt encryption, salt is built in, using strength 10
		if (user.getMode().equals("Create"))
			inParamMap.put("password", HashCode.getHashPassword(user.getPass()));
		else // this is only for setting IN parameter for SQL stored procedure, no DB change will be made
			inParamMap.put("password", "no change");
		
		inParamMap.put("phone", user.getPhone());
		inParamMap.put("tzoffset", user.getTzoffset());		  	 		
		
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
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);   	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
		.withProcedureName("sp_user_exists");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inusername", userName);
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
	
        String SQL = "Call sp_getuserdetails(" + "'" + username + "'" + ");";
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

 		List<UserEntity> user = getJdbcTemplate().query(SQL, new UserEntityMapper());
 		
 		if (user.isEmpty())
 			return null;
 		
 		// This should be combined to one statement in future
 		SQL = "Call sp_getreportingmanagers("  + user.get(0).getId() + ");";
 		List<Map<String, Object>> managers = getJdbcTemplate().queryForList(SQL);
 		
 		// Set reporting manager and created by information, should always get 2 strings in that order
 		int i = 0;
 		for (Map<String, Object> map : managers) {
 		    for (Map.Entry<String, Object> entry : map.entrySet()) {
 		    	if (i == 0)
 		    		user.get(0).setReportstoemail(entry.getValue().toString());
 		    	if (i == 1)
 		    		user.get(0).setCreatedbyemail(entry.getValue().toString());
 		    	i++;
 		    }
 		} 		
 		
 		// For now only return one but can be used to retrieve multiple org details
 		return user.get(0);     	
    	
	}

	public void DeleteUser(String username) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
		.withProcedureName("sp_delete_user");
		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inusername", username);
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
	}    
    
}