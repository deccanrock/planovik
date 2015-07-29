package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.ActivityMasterActEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class ActivityMasterActMapper implements RowMapper<ActivityMasterActEntity> {
	
	private short tzoffset;	
	public void setTzoffset (short tzoffset) {
		this.tzoffset = tzoffset;
	}

	public short getTzoffset () {
		return this.tzoffset;
	}	
	
	public ActivityMasterActEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   ActivityMasterActEntity masteract = new ActivityMasterActEntity();
	   
	   masteract.setItinnum(rs.getInt("itinnum"));
	   masteract.setMasteractid(rs.getInt("masteractid"));
	   masteract.setMasteractname(rs.getString("masteractname"));
	   masteract.setVersion(rs.getInt("version"));
	   
	   masteract.setMasteractstartdate(rs.getTimestamp("masteractstartdate"));
	   masteract.setMasteractenddate(rs.getTimestamp("masteractenddate"));
	   
	   // Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset
	   if (masteract.getMasteractstartdate() != null) {
		   long sdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("masteractstartdate").getTime(), this.getTzoffset());
		   masteract.setMasteractstartdatestr(TimeFormatter.FormatTimeMS(sdatelong, "", false, (short)0));
		   masteract.setMasteractstartdatelong(sdatelong);
	   }
	   
	   if (masteract.getMasteractenddate() != null) {
		   long edatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("masteractenddate").getTime(), this.getTzoffset());
		   masteract.setMasteractenddatestr(TimeFormatter.FormatTimeMS(edatelong, "", false, (short)0));	   
		   masteract.setMasteractenddatelong(edatelong);
	   }
	   
	   masteract.setDatecreated(rs.getTimestamp("datecreated"));
	   masteract.setDateupdated(rs.getTimestamp("dateupdated"));
	   
	   return masteract;
   }
}