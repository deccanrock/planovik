package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.TravelActivityEntity;

public interface IActivityEntityDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;
	public boolean saveTravelActivity(TravelActivityEntity travelactivity) throws IOException, SQLException;

}