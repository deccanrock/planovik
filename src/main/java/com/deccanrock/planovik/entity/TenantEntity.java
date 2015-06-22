package com.deccanrock.planovik.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;

public class TenantEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9045905279942674913L;

	// Columns
	@Column(name="tenantid")
	@GeneratedValue
	private int tenantid;
	
	@Column(name="tenantdesc")
	private String tenantdesc;
	
	@Column(name="tenantname")
	private String tenantname;

	@Column(name="jndiname")	
	public String jndiname;

	@Column(name="regip")	
	public String regip;

	@Column(name="zoneid")	
	public short zoneid;

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
	
	@Column(name="addrhomeurl")	
	public String addrhomeurl;
	
	@Column(name="contacttitle")	
	public String contacttitle;

	@Column(name="contactname")	
	public String contactname;

	@Column(name="contactphoneoffice")	
	public String contactphoneoffice;

	@Column(name="contactphonemobile")	
	public String contactphonemobile;

	@Column(name="contactemail")
	private String contactemail;

	@Column(name="contactdesignation")	
	public String contactdesignation;
	
	@Column(name="tenanttype")
	private  short tenanttype;
	
	@Column(name="regstatus")
	private short regstatus;
	
	@Column(name="msgunrdcnt")
	private short msgunrdcnt;
	
	@Column(name="alrtpendingcnt")
	private short alrtpendingcnt;
		
	@Column(name="accntbal")
	private float accntbal;

	@Column(name="tzoffset")
	private short tzoffset;

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

	
	// Getter-Setters
	public int getTenantid() {
		return tenantid;
	}
	
	public void setTenantid(int tenantid) {
		this.tenantid = tenantid;
	}
	
	public String getTenantname() {
		return tenantname;
	}
	
	public void setTenantname(String tenantname) {
		this.tenantname = tenantname;
	}
	

	public String getTenantdesc() {
		return tenantdesc;
	}
	
	public void setTenantdesc(String tenantdesc) {
		this.tenantdesc = tenantdesc;
	}

	public String getJndiname() {
		return jndiname;
	}
	
	public void setJndiname(String jndiname) {
		this.jndiname = jndiname;
	}

	public String getRegip() {
		return regip;
	}
	
	public void setRegip(String regip) {
		this.regip = regip;
	}
		
	public int getZoneid() {
		return zoneid;
	}
	
	public void setZoneid(short zoneid) {
		this.zoneid = zoneid;
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

	public String getAddrhomeurl() {
		return addrhomeurl;
	}
	
	public void setAddrhomeurl(String addrhomeurl) {
		this.addrhomeurl = addrhomeurl;
	}

	public String getContacttitle() {
		return contacttitle;
	}
	
	public void setContacttitle(String contacttitle) {
		this.contacttitle = contacttitle;
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

	public short getTenanttype() {
		return tenanttype;
	}
	
	public void setTenanttype(short tenanttype) {
		this.tenanttype = tenanttype;
	}
	
	public short getRegstatus() {
		return regstatus;
	}
	
	public void setRegstatus(short regstatus) {
		this.regstatus = regstatus;
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

	public float getAcctnbal() {
		return accntbal;
	}
	
	public void setAccntbal(float accntbal) {
		this.accntbal = accntbal;
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

}
