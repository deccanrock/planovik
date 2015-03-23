package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.deccanrock.planovik.entity.TravelActivityEntity;

public interface IActivityEntityDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;
	public TravelActivityEntity saveTravelActivity(TravelActivityEntity travelactivity) throws IOException, SQLException;
	public List<TravelActivityEntity> getTravelActivities (int itinnum, int version, short tzoffset, long startdatelong) throws IOException, SQLException;
}