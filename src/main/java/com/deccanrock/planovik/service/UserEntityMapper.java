package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.constants.AdminTasksConsts.Code;
import com.deccanrock.planovik.constants.AdminTasksConsts.Status;
import com.deccanrock.planovik.entity.TasksEntity;

public class UserEntityMapper implements RowMapper<TasksEntity> {
   public TasksEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   TasksEntity task = new TasksEntity();
	   task.setId(rs.getInt("id"));
	   task.setSubid(rs.getInt("subid"));
	   task.setLastupdate(rs.getDate("lastupdate"));
	   task.setOrgidname(rs.getString("orgidname"));	   
	   task.setStatus(Status.values()[rs.getInt("status")].toString());
	   task.setCode(Code.values()[rs.getInt("code")].toString());
	   task.setAssigned(rs.getInt("assigned"));
	   task.setRemarks(rs.getString("remarks"));

	   
	   return task;
   }
}