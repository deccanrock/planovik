package com.deccanrock.planovik.service.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Repository;

import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.entity.UserLoginAttempts;

@Repository
public class UserDetailsDao implements IUserDetailsDao {

	private static final String SQL_USERS_UPDATE_LOCKED = "UPDATE users SET accountNonLocked = ? WHERE username = ? and tenantid = ?";
	private static final String SQL_USERS_COUNT = "SELECT count(*) FROM users WHERE username = ? and tenantid = ?";

	private static final String SQL_USER_ATTEMPTS_GET = "SELECT * FROM user_login_attempts WHERE username = ? and tenantid = ?";
	private static final String SQL_USER_ATTEMPTS_INSERT = "INSERT INTO user_login_attempts (USERNAME, TENANTID, ATTEMPTS, LASTMODIFIED) VALUES(?,?,?,?)";

	private static final String SQL_USER_ATTEMPTS_UPDATE_ATTEMPTS = "UPDATE user_login_attempts SET attempts = attempts + 1, lastmodified = ? WHERE username = ? and tenantid = ?";
	private static final String SQL_USER_ATTEMPTS_RESET_ATTEMPTS = "UPDATE user_login_attempts SET attempts = 0 WHERE username = ? and tenantid = ?";

	private static final int MAX_ATTEMPTS = 5;

	
	@Autowired
	@Qualifier("mainDataSource")
	private DataSource dataSource;
	
	public UserDetailsDao(DataSource dataSource) {
    	super();
    	this.dataSource = TenantDS.setTenantDataSource(dataSource);
	    // this.dataSource = dataSource;
    }
    
    public void setDataSource(DataSource dataSource) {
       	this.dataSource = TenantDS.setTenantDataSource(dataSource);
    }    

	UserDetailsDao () {}
	
	private DataSource GetDataSource () {
		DataSource dataSource=null;
		dataSource = TenantDS.setTenantDataSource(dataSource);
		return dataSource;
	}


	@Override
	public void updateFailAttempts(String username) {

		UserLoginAttempts user = getUserAttempts(username);
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(GetDataSource());	    	

    	int tenantid = TenantContextHolder.getTenant().getTenantid();
		if (user == null) {
			if (isUserExists(username)) {
				// if no record, insert a new
				jdbcTemplate.update(SQL_USER_ATTEMPTS_INSERT, new Object[] { username, tenantid, 1, new Date() });
			}
		} else {

			if (isUserExists(username)) {
				// update attempts count, +1
				jdbcTemplate.update(SQL_USER_ATTEMPTS_UPDATE_ATTEMPTS, new Object[] { new Date(), username, tenantid });
			}

			if (user.getAttempts() + 1 >= MAX_ATTEMPTS) {
				// locked user
				jdbcTemplate.update(SQL_USERS_UPDATE_LOCKED, new Object[] { false, username, tenantid });
				// throw exception
				throw new LockedException("User Account is locked!");
			}

		}

	}

	@Override
	public UserLoginAttempts getUserAttempts(String username) {

		try {
	    	JdbcTemplate jdbcTemplate = new JdbcTemplate(GetDataSource());	  
	    	int tenantid = TenantContextHolder.getTenant().getTenantid();
			UserLoginAttempts userAttempts = jdbcTemplate.queryForObject(SQL_USER_ATTEMPTS_GET,
					new Object[] { username, tenantid }, new RowMapper<UserLoginAttempts>() {
						public UserLoginAttempts mapRow(ResultSet rs, int rowNum) throws SQLException {

							UserLoginAttempts user = new UserLoginAttempts();
							user.setId(rs.getInt("id"));
							user.setUsername(rs.getString("username"));
							user.setAttempts(rs.getInt("attempts"));
							user.setLastModified(rs.getDate("lastModified"));

							return user;
						}

					});
			return userAttempts;

		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public void resetFailAttempts(String username) {
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(GetDataSource());	 
    	int tenantid = TenantContextHolder.getTenant().getTenantid();
		jdbcTemplate.update(SQL_USER_ATTEMPTS_RESET_ATTEMPTS, new Object[] { username, tenantid });
	}

	private boolean isUserExists(String username) {

		boolean result = false;
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(GetDataSource());	    	
    	int tenantid = TenantContextHolder.getTenant().getTenantid();    			
		int count = jdbcTemplate.queryForObject(SQL_USERS_COUNT, new Object[] { username, tenantid }, Integer.class);
		if (count > 0) {
			result = true;
		}

		return result;
	}

}