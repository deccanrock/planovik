package com.deccanrock.planovik.service.dao;
 
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.TenantEntityMapper;
 
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
 	public TenantEntity GetTenant(String domainname) {
 		
        String SQL = "Call sp_gettenantfordomain(" + "'" + domainname + "'" + ");";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
 		List<TenantEntity> tenantList = jdbcTemplate.query(SQL, new TenantEntityMapper());
 		
 		if (tenantList.size() == 0)
 			return null;
 		else
 			return tenantList.get(0);
 	}

}