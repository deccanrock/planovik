package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.entity.HotelInfoEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class HotelInfoEntityMapper implements RowMapper<HotelInfoEntity> {
   public HotelInfoEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   HotelInfoEntity hotelinfo = new HotelInfoEntity();
	   
	   hotelinfo.setId(rs.getInt("id"));	   	   
	   hotelinfo.setCitycode(rs.getString("citycode"));
	   hotelinfo.setCityname(rs.getString("cityname"));
	   hotelinfo.setHotel(rs.getString("hotel"));
	   hotelinfo.setHotelstar(rs.getString("hotelstar"));
	   hotelinfo.setOurrating(rs.getString("ourrating"));	   	   
	   hotelinfo.setRoom(rs.getString("room"));
	   hotelinfo.setFromdate(rs.getString("fromdate"));	   
	   hotelinfo.setTodate(rs.getString("todate"));	   
	   hotelinfo.setOperdays(rs.getString("operdays"));
	   hotelinfo.setConvcode(rs.getString("convcode"));
	   hotelinfo.setGrp(rs.getString("grp"));
	   hotelinfo.setEpsngl(rs.getString("epsngl"));
	   hotelinfo.setEpdbl(rs.getString("epdbl"));	   	   
	   hotelinfo.setCpsngl(rs.getString("cpsngl"));
	   hotelinfo.setCpdbl(rs.getString("cpdbl"));	   
	   hotelinfo.setMapsngl(rs.getString("mapsngl"));
	   hotelinfo.setMapdbl(rs.getString("mapdbl"));	   	   
	   hotelinfo.setApsngl(rs.getString("apsngl"));
	   hotelinfo.setApdbl(rs.getString("apdbl"));	   
	   hotelinfo.setEb(rs.getString("eb"));
	   hotelinfo.setMealbf(rs.getString("mealbf"));	   	   
	   hotelinfo.setMealln(rs.getString("mealln"));
	   hotelinfo.setMealdn(rs.getString("mealdn"));
	   hotelinfo.setJpsngl(rs.getString("jpsngl"));	   
	   hotelinfo.setJpdbl(rs.getString("jpdbl"));	   
	   hotelinfo.setMjpsngl(rs.getString("mjpsngl"));	   
	   hotelinfo.setMjpdbl(rs.getString("mjpdbl"));	   
	   hotelinfo.setSpnoting(rs.getString("spnoting"));	   
	   hotelinfo.setCurrcode(rs.getString("currcode"));	   
	   hotelinfo.setRate(rs.getString("rate"));	   
	   hotelinfo.setMisc(rs.getString("misc"));	   
	   hotelinfo.setAisngl(rs.getString("aisngl"));	   
	   hotelinfo.setAidbl(rs.getString("aidbl"));	   
	   hotelinfo.setNotitle1(rs.getString("notitle1"));	   
	   hotelinfo.setNotitle2(rs.getString("notitle2"));	   
	   hotelinfo.setNotitle3(rs.getString("notitle3"));	   

	   hotelinfo.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("datecreated").getTime(), TenantContextHolder.getTenant().getTzoffset()));
	   
	   return hotelinfo;
   }
   
   
}