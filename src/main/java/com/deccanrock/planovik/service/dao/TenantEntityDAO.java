package com.deccanrock.planovik.service.dao;
 
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.TenantDetailsMapper;
 
@Component
@Transactional
public class TenantEntityDAO extends JdbcDaoSupport {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}
	
	public void TenantEntity() {
		setDataSource(dataSource);		
	}
 	
 	public TenantEntity GetTenant(String tenantName) {
    	// Use either org name or id to get details, orgid is PK
    	// format of orgidname is "<name> <id>"
    	    			
        String SQL = "Call sp_gettenantdetails(" + "'" + tenantName + "'" + ");";
    	// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
 		List<TenantEntity> tenantList = getJdbcTemplate().query(SQL, new TenantDetailsMapper());
 		
 		// For now only return one but can be used to retrieve multiple org details
 		return tenantList.get(0); 		
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