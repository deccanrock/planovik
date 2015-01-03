package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class OrgDetailsMapper implements RowMapper<OrgEntity> {
   public OrgEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   OrgEntity org = new OrgEntity();
	   
	   org.setOrgid(rs.getString("orgid"));
	   org.setName(rs.getString("name"));
	   org.setShortname(rs.getString("shortname"));
	   org.setIp(rs.getString("ip"));
	   org.setRegcode(rs.getString("regcode"));
	   org.setRegcodeissuingauthority(rs.getString("regcodeissuingauthority"));
	   org.setIsocountrycode(rs.getString("isocountrycode"));
	   org.setLogosealloc(rs.getString("isocountrycode"));
	   org.setAddrstreet1(rs.getString("addrstreet1"));
	   org.setAddrstreet2(rs.getString("addrstreet2"));
	   org.setAddrcitytown(rs.getString("addrcitytown"));
	   org.setAddrDistrict(rs.getString("addrdistrict"));
	   org.setAddrStateprovrgn(rs.getString("addrstateprovrgn"));
	   org.setAddrPostalcode(rs.getString("addrpostalcode"));
	   org.setAddrhomeurl(rs.getString("addrhomeurl"));
	   org.setContacttitle(rs.getString("contacttitle"));
	   org.setContactname(rs.getString("contactname"));
	   org.setContactphoneoffice(rs.getString("contactphoneoffice"));
	   org.setContactphonemobile(rs.getString("contactphonemobile"));
	   org.setContactemail(rs.getString("contactemail"));
	   org.setContactdesignation(rs.getString("contactdesignation"));
	   org.setContactip(rs.getString("contactip"));
	   org.setType(rs.getString("type"));
	   org.setSubtype(rs.getString("subtype"));
	   org.setStatus(rs.getString("status"));
	   org.setVrfreqcnt(rs.getInt("vrfreqcnt"));
	   org.setVrfproccnt(rs.getInt("vrfproccnt"));
	   org.setAlrtpendingcnt(rs.getInt("alrtpendingcnt"));
	   org.setMsgsunrdcnt(rs.getInt("msgsunrdcnt"));
	   org.setAccntbal(rs.getFloat("accntbal"));
	   org.setPayoutbal(rs.getFloat("payoutbal"));
	   org.setPayoutdate(rs.getTimestamp("payoutdate"));	   
	   org.setTzoffset(rs.getShort("tzoffset"));
	   org.setDatecreated(rs.getTimestamp("datecreated"));
	   org.setDateupdated(rs.getTimestamp("dateupdated"));
	   
	   // Not from DB
	   org.setCountryname("India"); // default for now
	   org.setLocaltoutcoff(TimeFormatter.Format(org.getTzoffset(), "hh:mm"));
	   org.setDatecreatedlocal(TimeFormatter.TimeUTCToLocal(org.getDatecreated(), org.getTzoffset()));
	   org.setDateupdatedlocal(TimeFormatter.TimeUTCToLocal(org.getDateupdated(), org.getTzoffset()));
	   if (TimeFormatter.IsNullDate(org.getPayoutdate()))
	   	org.setPayoutdatelocal(TimeFormatter.TimeUTCToLocal(org.getPayoutdate(), org.getTzoffset()));

	   return org;
   }
   
   
   
}