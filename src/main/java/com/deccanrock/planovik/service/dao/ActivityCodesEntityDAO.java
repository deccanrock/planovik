package com.deccanrock.planovik.service.dao;
 

import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.ActivityCodesEntity;
import com.deccanrock.planovik.service.ActivityCodesMapper;

 
@Component
@Transactional
public class ActivityCodesEntityDAO extends JdbcDaoSupport implements IActivityCodesEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}

    
    @Override	
	public List<ActivityCodesEntity> GetActivityCodes(String query) {
		
		String SQL = "Call sp_getactivitycodes(" + "'" + query + "'" + ");";
		 
	 	List<ActivityCodesEntity> listactivitycode = getJdbcTemplate().query(SQL, new ActivityCodesMapper());
             		
		if (listactivitycode.isEmpty())
			return null;
				
 		return listactivitycode; 	
	}
	
}