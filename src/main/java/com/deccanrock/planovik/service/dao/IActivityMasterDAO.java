package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.ActivityMasterEntity;;

public interface IActivityMasterDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;

}