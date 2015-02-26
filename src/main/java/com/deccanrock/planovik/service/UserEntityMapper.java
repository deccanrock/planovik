package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.deccanrock.planovik.entity.UserEntity;

public class UserEntityMapper implements RowMapper<UserEntity> {
   public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   UserEntity user = new UserEntity();
	   user.setId(rs.getInt("id"));
	   user.setEmail(rs.getString("email"));	   
	   user.setRole(rs.getString("role"));	   
	   user.setFullname(rs.getString("fullname"));
	   user.setUsername(rs.getString("username"));
	   user.setPhone(rs.getString("phone"));	   
	   user.setDesignation(rs.getString("designation"));
	   user.setLevel(rs.getInt("level"));
	   if (rs.getInt("enabled") == 0)
		   user.setEnabled(false);
	   else
		   user.setEnabled(false);
	   if (rs.getInt("accountNonExpired") == 0)
		   user.setAccountNonExpired(false);
	   else
		   user.setAccountNonExpired(true);
	   if (rs.getInt("accountNonLocked") == 0)
		   user.setAccountNonLocked(false);
	   else
		   user.setAccountNonLocked(true);
	   if (rs.getInt("credentialsNonExpired") == 0)
		   user.setCredentialsNonExpired(false);
	   else
		   user.setCredentialsNonExpired(true);
	   user.setTzoffset(rs.getShort("tzoffset"));
	   user.setDatecreated(rs.getTimestamp("date_created"));
	   user.setDateupdated(rs.getTimestamp("date_updated"));		   
	   
	   return user;
   }
}