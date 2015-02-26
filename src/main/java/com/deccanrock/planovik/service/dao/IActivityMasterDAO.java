package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public interface IActivityMasterDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;

}