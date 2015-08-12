package com.deccanrock.planovik.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;

public class AccountEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9045905279942674913L;

	// Columns

	@Column(name="id")
	@GeneratedValue
	private int id;
	
	@Column(name="orgname")
	private String orgname;
	
	@Column(name="contactname")
	private String contactname;

	@Column(name="contactemail")	
	public String contactemail;

	@Column(name="contactpswd")	
	public String contactpswd;

	@Column(name="contactphoneoffice")	
	public String contactphoneoffice;

	@Column(name="contactphonemobile")	
	public String contactphonemobile;
	
	@Column(name="contactdesignation")	
	public String contactdesignation;
	
	@Column(name="accountbal")
	private float accountbal;

	@Column(name="accountstatus")
	private short accountstatus;

	@Column(name="tzoffset")
	private short tzoffset;
	
	@Column(name="regip")	
	public String regip;

	@Column(name="numtenants")	
	public short numtenants;

	@Column(name="securekey")	
	public String securekey;
	
	@Column(name="pin")
	private short pin;

	@Column(name="addrstreet1")	
	public String addrstreet1;

	@Column(name="addrstreet2")	
	public String addrstreet2;
	
	@Column(name="addrcitytown")	
	public String addrcitytown;
	
	@Column(name="addrdistrict")	
	public String addrdistrict;
	
	@Column(name="addrstateprovrgn")	
	public String addrstateprovrgn;
	
	@Column(name="addrpostalcode")	
	public String addrpostalcode;
	
	@Column(name="addrcountrycode")	
	public String addrcountrycode;

	@Column(name="addrhomeurl")	
	public String addrhomeurl;
			
	@Column(name="msgunrdcnt")
	private short msgunrdcnt;
	
	@Column(name="alrtpendingcnt")
	private short alrtpendingcnt;
		
	@Column(name="datecreated")
	private Date datecreated;
	
	@Column(name="dateupdated")
	private Date dateupdated;

	@Column(name="createdby")
	private short createdby;
	
	@Column(name="updatedby")
	private short updatedby;
	
	private long datecreatedlong;
	private long dateupdatedlong;
	private String createdbyemail;
	private String updatedbyemail;
	
	private List<TenantEntity> tenants;

	public short zoneid;

	
	// Getter-Setters
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public short getZoneid() {
		return zoneid;
	}
	
	public void setZoneid(short zoneid) {
		this.zoneid = zoneid;
	}

	public String getOrgname() {
		return orgname;
	}
	
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	
	public String getRegip() {
		return regip;
	}
	
	public void setRegip(String regip) {
		this.regip = regip;
	}
		
	public short getNumtenants() {
		return numtenants;
	}
	
	public void setNumtenants(short numtenants) {
		this.numtenants = numtenants;
	}
	
	public String getAddrstreet1() {
		return addrstreet1;
	}
	
	public void setAddrstreet1(String addrstreet1) {
		this.addrstreet1 = addrstreet1;
	}

	public String getAddrstreet2() {
		return addrstreet2;
	}
	
	public void setAddrstreet2(String addrstreet2) {
		this.addrstreet2 = addrstreet2;
	}

	public String getAddrcitytown() {
		return addrcitytown;
	}
	
	public void setAddrcitytown(String addrcitytown) {
		this.addrcitytown = addrcitytown;
	}

	public String getAddrdistrict() {
		return addrdistrict;
	}
	
	public void setAddrdistrict(String addrdistrict) {
		this.addrdistrict = addrdistrict;
	}

	public String getAddrstateprovrgn() {
		return addrstateprovrgn;
	}
	
	public void setAddrstateprovrgn(String addrstateprovrgn) {
		this.addrstateprovrgn = addrstateprovrgn;
	}

	public String getAddrpostalcode() {
		return addrpostalcode;
	}
	
	public void setAddrpostalcode(String addrpostalcode) {
		this.addrpostalcode = addrpostalcode;
	}
	
	public String getAddrcountrycode() {
		return addrcountrycode;
	}
	
	public void setAddrcountrycode(String addrcountrycode) {
		this.addrcountrycode = addrcountrycode;
	}
	
	public String getAddrhomeurl() {
		return addrhomeurl;
	}
	
	public void setAddrhomeurl(String addrhomeurl) {
		this.addrhomeurl = addrhomeurl;
	}

	public String getContactname() {
		return contactname;
	}
	
	public void setContactname(String contactname) {
		this.contactname = contactname;
	}

	public String getContactdesignation() {
		return contactdesignation;
	}
	
	public void setContactdesignation(String contactdesignation) {
		this.contactdesignation = contactdesignation;
	}

	public short getAlrtpendingcnt() {
		return alrtpendingcnt;
	}
	
	public void setAlrtpendingcnt(short alrtpendingcnt) {
		this.alrtpendingcnt = alrtpendingcnt;
	}

	public short getMsgunrdcnt() {
		return msgunrdcnt;
	}
	
	public void setMsgunrdcnt(short msgunrdcnt) {
		this.msgunrdcnt = msgunrdcnt;
	}

	public float getAccountbal() {
		return accountbal;
	}
	
	public void setAccountbal(float accountbal) {
		this.accountbal = accountbal;
	}

	public short getTzoffset() {
		return tzoffset;
	}
	
	public void setTzoffset(short tzoffset) {
		this.tzoffset = tzoffset;
	}

	public Date getDatecreated() {
		return datecreated;
	}
	
	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	
	public Date getDateupdated() {
		return dateupdated;
	}
	
	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}
	
	public short getUpdatedby() {
		return updatedby;
	}
	
	public void setUpdatedby(short updatedby) {
		this.updatedby = updatedby;
	}	
		
	public short getCreatedby() {
		return createdby;
	}
	
	public void setCreatedby(short createdby) {
		this.createdby = createdby;
	}

	public String getContactphoneoffice() {
		return contactphoneoffice;
	}

	public void setContactphoneoffice(String contactphoneoffice) {
		this.contactphoneoffice = contactphoneoffice;
		
	}

	public String getContactphonemobile() {
		return contactphonemobile;
	}

	public void setContactphonemobile(String contactphonemobile) {
		this.contactphonemobile = contactphonemobile;
		
	}

	public String getContactemail() {
		return contactemail;
	}

	public void setContactemail(String contactemail) {
		this.contactemail = contactemail;
		
	}

	public String getContactpswd() {
		return contactpswd;
	}

	public void setContactpswd(String contactpswd) {
		this.contactpswd = contactpswd;
		
	}

	public long getDatecreatedlong() {
		return datecreatedlong;
	}

	public void setDatecreatedlong(long datecreatedlong) {
		this.datecreatedlong = datecreatedlong;
		
	}

	public long getDateupdatedlong() {
		return dateupdatedlong;
	}

	public void setDateupdatedlong(long dateupdatedlong) {
		this.dateupdatedlong = dateupdatedlong;
		
	}

	public String getCreatedbyemail() {
		return createdbyemail;
	}

	public void setCreatedbyemail(String createdbyemail) {
		this.createdbyemail = createdbyemail;
		
	}

	public String getUpdatedbyemail() {
		return updatedbyemail;
	}

	public void setUpdatedbyemail(String updatedbyemail) {
		this.updatedbyemail = updatedbyemail;
		
	}

	public String getSecurekey() {
		return securekey;
	}

	public void setSecurekey(String securekey) {
		this.securekey = securekey;
		
	}

	public short getPin() {
		return pin;
	}

	public void setPin(short pin) {
		this.pin = pin;
		
	}

	public short getAccountstatus() {
		return accountstatus;
	}

	public void setAccountstatus(short accountstatus) {
		this.accountstatus = accountstatus;
		
	}

	public List<TenantEntity> getTenants() {
		return tenants;
	}

	public void setTenants(List<TenantEntity> tenants) {
		this.tenants = tenants;
		
	}
	
}
