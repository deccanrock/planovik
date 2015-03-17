package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class TravelActivityMapper implements RowMapper<TravelActivityEntity> {
	
	private short tzoffset;

	public void setTzoffset (short tzoffset) {
		this.tzoffset = tzoffset;
	}

	public short getTzoffset () {
		return this.tzoffset;
	}
	
	public TravelActivityEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		   
	   	TravelActivityEntity travel = new TravelActivityEntity(); 
	   
		travel.setActivityid(rs.getInt("activityid"));
		travel.setItinnum(rs.getInt("itinnum"));
		travel.setName(rs.getString("name"));
		travel.setPax(rs.getInt("pax"));
		travel.setMode(rs.getInt("mode"));
		travel.setGroupnum(rs.getInt("groupnum"));
		travel.setCode(rs.getString("code"));
		travel.setVersion(rs.getInt("version"));
		travel.setDay(rs.getInt("day"));
		travel.setVesselconame(rs.getString("vesselconame"));
		travel.setBookingclass(rs.getString("bookingclass"));
		travel.setBookingno(rs.getString("bookingno"));
		
		// Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset
		if (travel.getDepdatetime() != null) {
			long depdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("depdatetime").getTime(), this.getTzoffset());
			travel.setDepdatetimestr(TimeFormatter.FormatTimeMS(depdatelong));
		}
		
		if (travel.getArrdatetime() != null) {
			long arrdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetime").getTime(), this.getTzoffset());
			travel.setArrdatetimestr(TimeFormatter.FormatTimeMS(arrdatelong));
		}

		travel.setDepstation(rs.getString("depstation"));	   
		travel.setArrstation(rs.getString("arrstation"));	   
		travel.setCost(rs.getFloat("cost"));	   
		travel.setCostmarkup(rs.getInt("costmarkup"));
		travel.setPikupdroplocfrom(rs.getString("pikupdroplocfrom"));	   
		travel.setPikupdroplocto(rs.getString("pikupdroplocto"));

		if (travel.getPikupdropdatetime() != null) {
			long pikupdropdatetimelong = TimeFormatter.UTCToLocal(rs.getTimestamp("pikupdropdatetime").getTime(), this.getTzoffset());
			travel.setArrdatetimestr(TimeFormatter.FormatTimeMS(pikupdropdatetimelong));
		}
		
		travel.setPikupdropcost(rs.getFloat("pikupdropcost"));	   
		travel.setPikupdropcostmarkup(rs.getInt("pikupdropcostmarkup"));
		travel.setVehdetails(rs.getString("vehdetails"));	   
		travel.setAsstcost(rs.getFloat("asstcost"));	   
		travel.setAsstcostmarkup(rs.getInt("asstcostmarkup"));
		travel.setComments(rs.getString("comments"));
		
		// Setup Activity start time based on travel code, this field's consistency will determine performance of building
		// activities list
		if (travel.getCode().contentEquals("T_BOOK"))
			travel.setActivitystarttimelong(travel.getDepdatetimelong());
	   
		if (travel.getCode().contentEquals("T_PIKUPDRP"))
			travel.setActivitystarttimelong(travel.getPikupdropdatetimelong());
		
		return travel;
	}
}