package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class ItineraryEntityMapper implements RowMapper<ItineraryEntity> {
   public ItineraryEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   ItineraryEntity itinerary = new ItineraryEntity();
	   
	   itinerary.setId(rs.getInt("id"));
	   itinerary.setName(rs.getString("name"));
	   itinerary.setStatus(rs.getString("status"));
	   itinerary.setVersion(rs.getInt("version"));
	   itinerary.setTouroperator(rs.getString("touroperator"));	   
	   itinerary.setGrouphead(rs.getString("grouphead"));
	   itinerary.setNumtravellers(rs.getInt("numtravellers"));
	   itinerary.setStartdate(rs.getTimestamp("startdate"));
	   itinerary.setEnddate(rs.getTimestamp("enddate"));
	   itinerary.setTzoffset((short) rs.getInt("tzoffset"));
	   // Convert to MM/DD/YYYY hh:mm AM|PM format after adjusting for UTC timezone offset
	   if (itinerary.getStartdate() != null) {
		   long sdatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("startdate").getTime(), itinerary.getTzoffset());
		   itinerary.setStartdatestr(TimeFormatter.FormatTimeMS(sdatelong));
	   }
	   
	   if (itinerary.getEnddate() != null) {
		   long edatelong = TimeFormatter.UTCToLocal(rs.getTimestamp("enddate").getTime(), itinerary.getTzoffset());
		   itinerary.setEnddatestr(TimeFormatter.FormatTimeMS(edatelong));	   
	   }
	   
	   itinerary.setArrivalcity(rs.getString("arrivalcity"));
	   itinerary.setDepcity(rs.getString("depcity"));
	   itinerary.setCurrency(rs.getString("currency"));
	   itinerary.setQuotecurrency(rs.getString("quotecurrency"));
	   itinerary.setConvcode(rs.getInt("convcode"));
	   itinerary.setDatecreated(rs.getTimestamp("datecreated"));
	   itinerary.setDateupdated(rs.getTimestamp("dateupdated"));
	   itinerary.setCreatedby(rs.getInt("createdby"));
	   itinerary.setLastupdatedby(rs.getInt("lastupdatedby"));	   
	   
	   return itinerary;
   }
}