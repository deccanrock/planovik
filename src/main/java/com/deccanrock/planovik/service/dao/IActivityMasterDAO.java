package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;



public interface IActivityMasterDAO {
	
	String CreateMasterActivityAct(int itinnum, int version, String actname, long actstarttime, long actendtime, 
			short tzoffset, int masteractid)  throws IOException, SQLException;
}