package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.deccanrock.planovik.entity.ActivityCodesEntity;

public interface IActivityCodesEntityDAO {
	
	List<ActivityCodesEntity> GetActivityCodes(String query) throws IOException, SQLException;

}