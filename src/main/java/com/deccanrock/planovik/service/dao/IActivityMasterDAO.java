package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public interface IActivityMasterDAO {
	
	public List<String> GetActivityCodes(String query) throws IOException, SQLException;
	String CreateMasterActivityAct(int itinnum, int version, String actname, long actstarttime, long actendtime, 
			short tzoffset, int masteractid)  throws IOException, SQLException;
}