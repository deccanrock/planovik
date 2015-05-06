package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

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

		// This always defaults to 0
		travel.setActivityidpair(rs.getInt("activityidpair"));

		travel.setItinnum(rs.getInt("itinnum"));

		travel.setMasteractid(rs.getShort("masteractid"));

		travel.setTzoffset(this.getTzoffset());
		
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
		
		if (travel.getCode().contentEquals("T_BOOK_ONEWAY") || travel.getCode().contentEquals("T_BOOK_RETURN")) {	
			// Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset

			if (travel.getCode().contentEquals("T_BOOK_ONEWAY")) {	
				long depdateonlong = TimeFormatter.UTCToLocal(rs.getTimestamp("depdatetimeon").getTime(), this.getTzoffset());
				travel.setDepdatetimeonstr(TimeFormatter.FormatTimeMS(depdateonlong));
				travel.setDepdatetimeonlong(depdateonlong);
				travel.setActivitystarttimelong(travel.getDepdatetimeonlong());
				
				long arrdateonlong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetimeon").getTime(), this.getTzoffset());
				travel.setArrdatetimeonstr(TimeFormatter.FormatTimeMS(arrdateonlong));
				travel.setArrdatetimeonlong(arrdateonlong);
				travel.setActivityendtimelong(travel.getArrdatetimeonlong());
			}

			if (travel.getCode().contentEquals("T_BOOK_RETURN")) {
				
				// Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset
				if (rs.getTimestamp("depdatetimeon") != null) {
					long depdateonlong = TimeFormatter.UTCToLocal(rs.getTimestamp("depdatetimeon").getTime(), this.getTzoffset());
					travel.setDepdatetimeonstr(TimeFormatter.FormatTimeMS(depdateonlong));
					travel.setDepdatetimeonlong(depdateonlong);
					travel.setActivitystarttimelong(travel.getDepdatetimeonlong());
				}

				if (rs.getTimestamp("arrdatetimeon") != null) {
					long arrdateonlong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetimeon").getTime(), this.getTzoffset());
					travel.setArrdatetimeonstr(TimeFormatter.FormatTimeMS(arrdateonlong));
					travel.setArrdatetimeonlong(arrdateonlong);
					travel.setActivityendtimelong(travel.getArrdatetimeonlong());
				}
				
				if (rs.getTimestamp("depdatetimeret") != null) {
					long depdateretlong = TimeFormatter.UTCToLocal(rs.getTimestamp("depdatetimeret").getTime(), this.getTzoffset());
					travel.setDepdatetimeretstr(TimeFormatter.FormatTimeMS(depdateretlong));
					travel.setDepdatetimeretlong(depdateretlong);
					travel.setActivitystarttimelong(travel.getDepdatetimeretlong());
				}
				
				if (rs.getTimestamp("arrdatetimeret") != null) {
					long arrdateretlong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetimeret").getTime(), this.getTzoffset());
					travel.setArrdatetimeretstr(TimeFormatter.FormatTimeMS(arrdateretlong));
					travel.setArrdatetimeretlong(arrdateretlong);
					travel.setActivityendtimelong(travel.getArrdatetimeretlong());			
				}
			}		
		}
		

		// Dump all other details
		if (this.getReqfulldetails()) {
			
			travel.setPax(rs.getInt("pax"));
			travel.setMode(rs.getInt("mode"));
			travel.setGroupnum(rs.getInt("groupnum"));
			
			travel.setVersion(rs.getInt("version"));
			
			if (rs.getString("vesselconame") != null)
				travel.setVesselconame(rs.getString("vesselconame"));
			else
				travel.setVesselconame("");
	
	
			if (travel.getCode().contentEquals("T_BOOK_ONEWAY") || travel.getCode().contentEquals("T_BOOK_RETURN")) {	

				if (rs.getString("vesselnoon") != null)
					travel.setVesselnoon(rs.getString("vesselnoon"));
				else
					travel.setVesselnoon("");

				if (rs.getString("bookingclass") != null)
					travel.setBookingclass(rs.getString("bookingclass"));
				else
					travel.setBookingclass("");
				
				if (rs.getString("bookingno") != null)
					travel.setBookingno(rs.getString("bookingno"));
				else
					travel.setBookingno("");
				
				if (rs.getTimestamp("arrdatetimeon") != null) {
					long arrdateonlong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetimeon").getTime(), this.getTzoffset());
					travel.setArrdatetimeonstr(TimeFormatter.FormatTimeMS(arrdateonlong));
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

				if (rs.getTimestamp("arrdatetimeret") != null) {
					long arrdateretlong = TimeFormatter.UTCToLocal(rs.getTimestamp("arrdatetimeret").getTime(), this.getTzoffset());
					travel.setArrdatetimeretstr(TimeFormatter.FormatTimeMS(arrdateretlong));
				}
				
				if (rs.getString("vesselnoret") != null)
					travel.setVesselnoret(rs.getString("vesselnoret"));
				else
					travel.setVesselnoret("");
			}
			

			if (travel.getCode().contentEquals("T_PIKUPDRP")) {	
			
				if (rs.getString("vesselnoon") != null)
					travel.setVesselnopikupdrp(rs.getString("vesselnoon"));
				else
					travel.setVesselnopikupdrp("");
				
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
			}
			
			if (rs.getString("commentsinternal") != null)
				travel.setCommentsinternal(rs.getString("commentsinternal"));
			else
				travel.setCommentsinternal("");
		
			if (rs.getString("commentsexternal") != null)
				travel.setCommentsexternal(rs.getString("commentsexternal"));
			else
				travel.setCommentsexternal("");

		}
				
		return travel;
	}


}