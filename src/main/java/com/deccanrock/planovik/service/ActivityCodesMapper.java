package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.deccanrock.planovik.entity.ActivityCodesEntity;

public class ActivityCodesMapper implements RowMapper<ActivityCodesEntity> {
   public ActivityCodesEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   ActivityCodesEntity activitycode = new ActivityCodesEntity();
	   
	   activitycode.setCode(rs.getString("code"));
	   activitycode.setDescription(rs.getString("description"));
	   activitycode.setDatecreated(rs.getTimestamp("datecreated"));
	   activitycode.setDateupdated(rs.getTimestamp("dateupdated"));
	   
	   return activitycode;
   }
 
}