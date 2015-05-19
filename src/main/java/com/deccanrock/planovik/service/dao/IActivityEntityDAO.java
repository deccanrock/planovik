package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.TravelActivityEntity;

public interface IActivityEntityDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;
	public TravelActivityEntity saveTravelActivity(TravelActivityEntity travelactivity) throws IOException, SQLException;
	public List<TravelActivityEntity> getTravelActivities (int itinnum, int version, short tzoffset) throws IOException, SQLException;
	public List<TravelActivityEntity> getActivitiesDetForType(int itinnum, int version, short tzoffset, short type) throws IOException, SQLException;
	Object GetActivityDetails(int activityid, int type, short tzoffset) throws IOException, SQLException;
	// String DeleteActivity(int activityid, int activityidpair, int itinnum, int type, int version, int groupnum) throws IOException, SQLException;
	String DeleteActivity(int activityid, int activityidpair, int itinnum, int type, int version) throws IOException, SQLException;
}