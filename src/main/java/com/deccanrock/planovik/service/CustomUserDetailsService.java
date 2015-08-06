package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.service.dao.TenantDS;


/**
 * Reference org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl
 * 
 * @author Srini
 * 
 */

public class CustomUserDetailsService extends JdbcDaoImpl {


    public static final String USERS_BY_USERNAMETENANTID_QUERY =
            "select username, password, enabled, accountNonExpired, credentialsNonExpired,  accountNonLocked" +
            " from users " +
            "where username = ? and tenantid = ?";
    
    public static final String groupAuthoritiesByUsernameQuery = 
    "select role from user_roles_map where username =? and tenantid=?";
	
	@Override
	public void setUsersByUsernameQuery(String usersByUsernameQueryString) {
		super.setUsersByUsernameQuery(usersByUsernameQueryString);
	}

	@Override
	public void setAuthoritiesByUsernameQuery(String queryString) {
		super.setAuthoritiesByUsernameQuery(queryString);
	}

	//override to pass get accountNonLocked  
	@Override
	public List<UserDetails> loadUsersByUsername(String username) {
		// Tenant DS hook
		DataSource  dataSource = TenantDS.setTenantDataSource(null);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		int tenantid = TenantContextHolder.getTenant().getTenantid();

		// Hook to get User data for the given username, pick tenantid from session
		return jdbcTemplate.query(USERS_BY_USERNAMETENANTID_QUERY, new String[] { username, Integer.toString(tenantid) },
				new RowMapper<UserDetails>() {
					public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
						String username = rs.getString("username");
						String password = rs.getString("password");
						boolean enabled = rs.getBoolean("enabled");
						boolean accountNonExpired = rs.getBoolean("accountNonExpired");
						boolean credentialsNonExpired = rs.getBoolean("credentialsNonExpired");
						boolean accountNonLocked = rs.getBoolean("accountNonLocked");
				
						return new User(username, password, enabled, accountNonExpired, credentialsNonExpired,
								accountNonLocked, AuthorityUtils.NO_AUTHORITIES);
					}

				}); 
	}

	@Override
    protected List<GrantedAuthority> loadUserAuthorities(String username) {
		int tenantid = TenantContextHolder.getTenant().getTenantid();
		DataSource dataSource=null;
		dataSource = TenantDS.setTenantDataSource(dataSource);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		
		return jdbcTemplate.query(groupAuthoritiesByUsernameQuery, new Object [] {username, tenantid}, new RowMapper<GrantedAuthority>() {
            public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
                 String roleName = rs.getString("role");

                return new SimpleGrantedAuthority(roleName);
            }
        });
		
	}
	
	//override to pass accountNonLocked
	@Override
	public UserDetails createUserDetails(String username, UserDetails userFromUserQuery,
			List<GrantedAuthority> combinedAuthorities) {
		String returnUsername = userFromUserQuery.getUsername();

		if (super.isUsernameBasedPrimaryKey()) {
			returnUsername = username;
		}

		return new User(returnUsername, userFromUserQuery.getPassword(), userFromUserQuery.isEnabled(),
				userFromUserQuery.isAccountNonExpired(), userFromUserQuery.isCredentialsNonExpired(),
				userFromUserQuery.isAccountNonLocked(), combinedAuthorities);
	}

}