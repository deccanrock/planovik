package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.TasksEntity;



public interface IUserEntityDAO {
	
	boolean Login ( String username, String pass) throws IOException, SQLException;
	List<TasksEntity> GetAllTasks() throws IOException, SQLException;
	List<String> GetOrgList(String query) throws IOException, SQLException;
}