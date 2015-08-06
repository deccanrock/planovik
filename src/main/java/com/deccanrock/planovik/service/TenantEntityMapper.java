package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class TenantEntityMapper implements RowMapper<TenantEntity> {
   public TenantEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   TenantEntity tenant = new TenantEntity();
	   
	   tenant.setTenantid(rs.getInt("tenantid"));	   	   
	   tenant.setAccountid(rs.getInt("accountid"));	   	   
	   tenant.setTenantdesc(rs.getString("tenantdesc"));
	   tenant.setTenantname(rs.getString("tenantname"));
	   tenant.setJndiname(rs.getString("jndiname"));
	   tenant.setRegip(rs.getString("regip"));
	   tenant.setZoneid(rs.getShort("zoneid"));	   	   
	   tenant.setRegip(rs.getString("regip"));
	   tenant.setTenanttype(rs.getShort("tenanttype"));
	   tenant.setStatus(rs.getShort("status"));
	   tenant.setAlrtpendingcnt(rs.getShort("alrtpendingcnt"));
	   tenant.setMsgunrdcnt(rs.getShort("msgsunrdcnt"));
	   tenant.setStatus(rs.getShort("status"));	   
	   tenant.setTzoffset(rs.getShort("tzoffset"));	   
	   tenant.setSecurekey(rs.getString("securekey"));	   
	   tenant.setPin(rs.getShort("pin"));	   
	   tenant.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("datecreated").getTime(), tenant.getTzoffset()));
	   tenant.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("dateupdated").getTime(), tenant.getTzoffset()));
	   tenant.setDatecreatedsettings(TimeFormatter.FormatTimeMS(tenant.getDatecreatedlong(), "SettingsDisplay", false, (short)0));
	   
	   tenant.setCreatedby(rs.getShort("createdby"));
	   tenant.setUpdatedby(rs.getShort("updatedby"));
	   
	   return tenant;
   }
   
   
   
}