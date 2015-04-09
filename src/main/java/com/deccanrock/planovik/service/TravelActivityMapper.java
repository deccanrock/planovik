package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class TravelActivityMapper implements RowMapper<TravelActivityEntity> {
	
	private short tzoffset;
	private boolean reqfulldetails;
	
	public void setTzoffset (short tzoffset) {
		this.tzoffset = tzoffset;
	}

	public short getTzoffset () {
		return this.tzoffset;
	}
	
	public void setReqfulldetails(boolean reqfulldetails) {
		this.reqfulldetails = reqfulldetails;
	}
	
	public boolean getReqfulldetails() {
		return this.reqfulldetails;
	}

	public TravelActivityEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		   
	   	TravelActivityEntity travel = new TravelActivityEntity(); 
	   	
	   	// Separate out details for light pack without all details
		travel.setActivityid(rs.getInt("activityid"));
		travel.setItinnum(rs.getInt("itinnum"));

		travel.setMasteractid(rs.getShort("masteractid"));

		if (rs.getString("actname") != null)
			travel.setActname(rs.getString("actname"));
		else
			travel.setActname("");

		
		if (rs.getString("code") != null)
			travel.setCode(rs.getString("code"));
		else
			travel.setCode("");
		
		if (travel.getCode().contentEquals("T_PIKUPDRP")) {	
			long pikupdropdatetimelong = TimeFormatter.UTCToLocal(rs.getTimestamp("pikupdropdatetime").getTime(), this.getTzoffset());
			travel.setPikupdropdatetimestr(TimeFormatter.FormatTimeMS(pikupdropdatetimelong));
			travel.setPikupdropdatetimelong(pikupdropdatetimelong);
			travel.setActivitystarttimelong(travel.getPikupdropdatetimelong());
		}
		
		if (travel.getCode().contentEquals("T_BOOK")) {	
			// Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset
			long depdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("depdatetime").getTime(), this.getTzoffset());
			travel.setDepdatetimestr(TimeFormatter.FormatTimeMS(depdatelong));
			travel.setDepdatetimelong(depdatelong);
			travel.setActivitystarttimelong(travel.getDepdatetimelong());
			
			long arrdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetime").getTime(), this.getTzoffset());
			travel.setArrdatetimestr(TimeFormatter.FormatTimeMS(arrdatelong));
			travel.setActivityendtimelong(travel.getArrdatetimelong());			
		}
		
		// Dump all other details
		if (this.getReqfulldetails()) {
			
			travel.setPax(rs.getInt("pax"));
			travel.setMode(rs.getInt("mode"));
			travel.setGroupnum(rs.getInt("groupnum"));
			
			travel.setVersion(rs.getInt("version"));

			if (rs.getString("vesselno") != null)
				travel.setVesselno(rs.getString("vesselno"));
			else
				travel.setVesselno("");
			
			if (rs.getString("vesselconame") != null)
				travel.setVesselconame(rs.getString("vesselconame"));
			else
				travel.setVesselconame("");
	
			if (rs.getString("bookingclass") != null)
				travel.setBookingclass(rs.getString("bookingclass"));
			else
				travel.setBookingclass("");
			
			if (rs.getString("bookingno") != null)
				travel.setBookingno(rs.getString("bookingno"));
			else
				travel.setBookingno("");
	
			
			if (travel.getArrdatetime() != null) {
				long arrdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetime").getTime(), this.getTzoffset());
				travel.setArrdatetimestr(TimeFormatter.FormatTimeMS(arrdatelong));
			}
	
			if (rs.getString("depstation") != null)
				travel.setDepstation(rs.getString("depstation"));
			else
				travel.setDepstation("");
	
			if (rs.getString("arrstation") != null)
				travel.setArrstation(rs.getString("arrstation"));
			else
				travel.setArrstation("");
	
			travel.setCost(rs.getFloat("cost"));	   
			travel.setCostmarkup(rs.getInt("costmarkup"));
	
			if (rs.getString("pikupdroplocfrom") != null)
				travel.setPikupdroplocfrom(rs.getString("pikupdroplocfrom"));
			else
				travel.setPikupdroplocfrom("");
	
			if (rs.getString("pikupdroplocto") != null)
				travel.setPikupdroplocto(rs.getString("pikupdroplocto"));
			else
				travel.setPikupdroplocto("");
			
			
			travel.setPikupdropcost(rs.getFloat("pikupdropcost"));	   
			travel.setPikupdropcostmarkup(rs.getInt("pikupdropcostmarkup"));
	
			if (rs.getString("vehdetails") != null)
				travel.setVehdetails(rs.getString("vehdetails"));
			else
				travel.setVehdetails("");
			
			travel.setAsstcost(rs.getFloat("asstcost"));	   
			travel.setAsstcostmarkup(rs.getInt("asstcostmarkup"));
			
			if (rs.getString("comments") != null)
				travel.setComments(rs.getString("comments"));
			else
				travel.setComments("");
		
		}
				
		return travel;
	}


}