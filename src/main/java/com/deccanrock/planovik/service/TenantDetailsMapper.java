package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.deccanrock.planovik.entity.TenantEntity;

public class TenantDetailsMapper implements RowMapper<TenantEntity> {
   public TenantEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   TenantEntity tenant = new TenantEntity();
	   
	   tenant.setId(rs.getInt("id"));
	   tenant.setStatus(rs.getShort("status"));
	   tenant.setType(rs.getShort("type"));
	   tenant.setSubscription(rs.getString("subscription"));
	   tenant.setDomainname(rs.getString("domainname"));
	   tenant.setDsurl(rs.getString("dsurl"));
	   tenant.setDsusername(rs.getString("dsusername"));
	   tenant.setDspassword(rs.getString("dspassword"));
	   tenant.setBkdsurl(rs.getString("bkdsurl"));
	   tenant.setBkdsusername(rs.getString("bkdsusername"));
	   tenant.setBkdspassword(rs.getString("bkdspassword"));
	   tenant.setDatecreated(rs.getTimestamp("datecreated"));
	   tenant.setDateupdated(rs.getTimestamp("dateupdated"));
	   
	   return tenant;
   }
   
   
   
}