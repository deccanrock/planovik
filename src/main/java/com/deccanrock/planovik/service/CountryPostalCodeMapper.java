package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.location.CountryPostalCode;


public class CountryPostalCodeMapper implements RowMapper<CountryPostalCode> {
	
	private String countrycode;
	private String postalcode;
	
	public void setCountrycode (String countrycode) {
		this.countrycode = countrycode;
	}

	public String getCountrycode () {
		return this.countrycode;
	}
	   
	public void setPostalcode (String postalcode) {
		this.postalcode = postalcode;
	}

	public String getPostalcode () {
		return this.postalcode;
	}

	public CountryPostalCode mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   CountryPostalCode countrypc = new CountryPostalCode();
		
	   if (this.countrycode.contentEquals("IN")) {
		   countrypc.setCountrycode("IN");
		   countrypc.setPostalcode(this.getPostalcode());
		   countrypc.setCityarea(rs.getString("officename"));		   
		   countrypc.setCity(rs.getString("regionname"));
		   countrypc.setDistrict(rs.getString("districtname"));
		   countrypc.setStateregion(rs.getString("statename"));		   
	   }
	   
	   return countrypc;
   }
   
}