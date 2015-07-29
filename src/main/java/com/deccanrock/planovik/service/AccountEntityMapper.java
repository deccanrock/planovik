package com.deccanrock.planovik.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.service.utils.TimeFormatter;

public class AccountEntityMapper implements RowMapper<AccountEntity> {
   public AccountEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	   
	   AccountEntity account = new AccountEntity();
		
	   account.setId(rs.getInt("id"));	   	   
	   account.setOrgname(rs.getString("orgname"));
	   account.setRegip(rs.getString("regip"));
	   account.setNumtenants(rs.getShort("numtenants"));	   
	   account.setAddrstreet1(rs.getString("addrstreet1"));
	   account.setAddrstreet2(rs.getString("addrstreet2"));
	   account.setAddrcitytown(rs.getString("addrcitytown"));
	   account.setAddrdistrict(rs.getString("addrdistrict"));
	   account.setAddrstateprovrgn(rs.getString("addrstateprovrgn"));
	   account.setAddrpostalcode(rs.getString("addrpostalcode"));
	   account.setAddrcountrycode(rs.getString("addrcountrycode"));
	   account.setAddrhomeurl(rs.getString("addrhomeurl"));
	   account.setContactname(rs.getString("contactname"));
	   account.setContactphoneoffice(rs.getString("contactphoneoffice"));
	   account.setContactphonemobile(rs.getString("contactphonemobile"));
	   account.setContactemail(rs.getString("contactemail"));
	   account.setContactpswd(rs.getString("contactpswd"));
	   account.setContactdesignation(rs.getString("contactdesignation"));
	   account.setAccountstatus(rs.getShort("accountstatus"));
	   account.setTzoffset(rs.getShort("tzoffset"));	   
	   account.setSecurekey(rs.getString("securekey"));	   
	   account.setPin(rs.getShort("pin"));	   
	   account.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("datecreated").getTime(), account.getTzoffset()));
	   account.setDatecreatedlong(TimeFormatter.UTCToLocal(rs.getTimestamp("dateupdated").getTime(), account.getTzoffset()));
	   account.setCreatedby(rs.getShort("createdby"));
	   account.setUpdatedby(rs.getShort("updatedby"));
	   
	   return account;
   }
   
   
   
}