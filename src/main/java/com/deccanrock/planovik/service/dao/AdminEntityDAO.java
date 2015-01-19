package com.deccanrock.planovik.service.dao;
 

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.AdminEntity;
import com.deccanrock.planovik.entity.AdminTasksEntity;
import com.deccanrock.planovik.service.AdminEntityMapper;
 
@Component
@Transactional
public class AdminEntityDAO extends JdbcDaoSupport implements
		IAdminEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}


    @Override
    public boolean Login(String username, String inpass) {

    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(getJdbcTemplate())
 		.withProcedureName("sp_admin_getpasssalt");

		Map<String, Object> inParamMap = new HashMap<String, Object>();		
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		String  salt = (String) simpleJdbcCallResult.get("salt");
		String  pass = (String) simpleJdbcCallResult.get("pass");
		
		// Encrypt user provided pass with salt and check
				
		if (salt != null)
			return true;
		else
			return false;
    }

	public AdminEntity loadUserByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

    @Override	
	public List<AdminTasksEntity> GetAllTasks() {
    	
    	
    	
        String SQL = "Call sp_get_admin_tasks;";
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	 	
    	        
 		List <AdminTasksEntity> admintasks = getJdbcTemplate().query(SQL, 
                  new AdminEntityMapper());
 		
 		return admintasks; 	
 
	}
    
    @Override	
	public List<String> GetOrgList(String query) {

    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);    	
    	    	
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
 	
}