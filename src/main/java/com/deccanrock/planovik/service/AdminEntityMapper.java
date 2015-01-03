package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.constants.AdminTasksConsts.Code;
import com.deccanrock.planovik.constants.AdminTasksConsts.Status;
import com.deccanrock.planovik.entity.AdminTasksEntity;

public class AdminEntityMapper implements RowMapper<AdminTasksEntity> {
   public AdminTasksEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   AdminTasksEntity admintask = new AdminTasksEntity();
	   admintask.setId(rs.getInt("id"));
	   admintask.setSubid(rs.getInt("subid"));
	   admintask.setLastupdate(rs.getDate("lastupdate"));
	   admintask.setOrgidname(rs.getString("orgidname"));	   
	   admintask.setStatus(Status.values()[rs.getInt("status")].toString());
	   admintask.setCode(Code.values()[rs.getInt("code")].toString());
	   admintask.setAssigned(rs.getInt("assigned"));
	   admintask.setRemarks(rs.getString("remarks"));

	   
	   return admintask;
   }
}