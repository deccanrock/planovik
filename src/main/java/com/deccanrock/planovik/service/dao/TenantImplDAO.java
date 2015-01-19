package com.deccanrock.planovik.service.dao;
 

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
 
@Component
@Transactional
public class TenantImplDAO extends JdbcDaoSupport {


	@Autowired
    @Qualifier("proxyDataSource")
	
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}
	
	public void TenantEntity() {
		setDataSource(dataSource);		
	}
	 
 	public String GetTagline(String tenantName) {
    	// Use either org name or id to get details, orgid is PK
    	// format of orgidname is "<name> <id>"
    	    			
        String SQL = "Call sp_gettenantinfo(" + "'" + tenantName + "'" + ");";
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
        String tagline = (String) getJdbcTemplate().queryForObject(SQL, String.class);
         		
 		// For now only return one but can be used to retrieve multiple org details
 		return tagline; 		
 	}


}