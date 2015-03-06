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
	   if (rs.getInt("enabled") == 0) {
		   user.setEnabled(false);
		   user.setIsenabled(0);
	   }
	   else {
		   user.setEnabled(true);
		   user.setIsenabled(1);		   
	   }
	   if (rs.getInt("accountNonExpired") == 0) {
		   user.setAccountNonExpired(false);
		   user.setIscredentialsexpired(1);
	   }
	   else {
		   user.setAccountNonExpired(true);
		   user.setIscredentialsexpired(0);
	   }
	   if (rs.getInt("accountNonLocked") == 0) {
		   user.setAccountNonLocked(false);
		   user.setIslocked(1);
	   }
	   else {
		   user.setAccountNonLocked(true);
		   user.setIslocked(0);
	   }
	   if (rs.getInt("credentialsNonExpired") == 0) {
		   user.setCredentialsNonExpired(false);
		   user.setIscredentialsexpired(1);
	   }
	   else {
		   user.setCredentialsNonExpired(true);
		   user.setIscredentialsexpired(0);
	   }
	   
	   user.setTzoffset(rs.getShort("tzoffset"));
	   user.setDatecreated(rs.getTimestamp("date_created"));
	   user.setDateupdated(rs.getTimestamp("date_updated"));		   
	   
	   return user;
   }
}