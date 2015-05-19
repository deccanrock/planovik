package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.ServiceProviderEntity;
import com.deccanrock.planovik.entity.UserEntity;

public class ServiceProviderMapper implements RowMapper<ServiceProviderEntity> {

	private short type;
	
	public void setType (short type) {
		this.type = type;
	}

	public short getType () {
		return this.type;
	}
	
	public ServiceProviderEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   ServiceProviderEntity service = new ServiceProviderEntity();
	   service.setId(rs.getInt("id"));
	   service.setServicename(rs.getString("servicename"));
	   service.setType(this.type);
	   
	   if (this.type == 0) {
		   service.setDomesticonly(rs.getInt("domesticonly"));
		   service.setFullservice(rs.getInt("fullservice"));
		   service.setIatacode(rs.getString("iatacode"));		   
	   }
	   
	   if (this.type == 2)
		   service.setCoverage(rs.getInt("coverage"));		

	   if (this.type == 3)
		   service.setDescription(rs.getString("description"));		
		   
	   service.setCity(rs.getString("city"));	   
	   service.setCountry(rs.getString("country"));	   
	   service.setContactname(rs.getString("contactname"));
	   service.setContactphone(rs.getString("contactphone"));
	   service.setContactemail(rs.getString("contactemail"));
	   service.setContactwebsite(rs.getString("contactwebsite"));
	   service.setAddlinfo(rs.getString("addlinfo"));
	   
	   return service;
   }
}