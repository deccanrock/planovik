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
	   tenant.setTenantdesc(rs.getString("tenantdesc"));
	   tenant.setTenantname(rs.getString("tenantname"));
	   tenant.setDatastore(rs.getString("datastore"));
	   tenant.setRegip(rs.getString("regip"));
	   tenant.setZoneid(rs.getShort("zoneid"));	   	   
	   tenant.setRegip(rs.getString("regip"));
	   tenant.setAddrstreet1(rs.getString("addrstreet1"));
	   tenant.setAddrstreet2(rs.getString("addrstreet2"));
	   tenant.setAddrcitytown(rs.getString("addrcitytown"));
	   tenant.setAddrdistrict(rs.getString("addrdistrict"));
	   tenant.setAddrstateprovrgn(rs.getString("addrstateprovrgn"));
	   tenant.setAddrpostalcode(rs.getString("addrpostalcode"));
	   tenant.setAddrhomeurl(rs.getString("addrhomeurl"));
	   tenant.setContacttitle(rs.getString("contacttitle"));
	   tenant.setContactname(rs.getString("contactname"));
	   tenant.setContactphoneoffice(rs.getString("contactphoneoffice"));
	   tenant.setContactphonemobile(rs.getString("contactphonemobile"));
	   tenant.setContactemail(rs.getString("contactemail"));
	   tenant.setContactdesignation(rs.getString("contactdesignation"));
	   tenant.setRegtype(rs.getShort("regtype"));
	   tenant.setRegstatus(rs.getShort("regstatus"));
	   tenant.setTzoffset(rs.getShort("tzoffset"));	   
	   tenant.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("datecreated").getTime(), tenant.getTzoffset()));
	   tenant.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("dateupdated").getTime(), tenant.getTzoffset()));
	   tenant.setUpdatedby(rs.getShort("updatedby"));
	   
	   return tenant;
   }
   
   
   
}