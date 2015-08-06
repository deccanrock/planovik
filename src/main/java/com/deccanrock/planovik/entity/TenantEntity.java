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
	
	@Column(name="accountid")
	@GeneratedValue
	private int accountid;
	
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

	@Column(name="tenanttype")
	private  short tenanttype;
	
	@Column(name="billingplan")
	private  short billingplan;
	
	@Column(name="status")
	private short status;
	
	@Column(name="msgunrdcnt")
	private short msgunrdcnt;
	
	@Column(name="alrtpendingcnt")
	private short alrtpendingcnt;
		
	@Column(name="accountbal")
	private float accountbal;

	@Column(name="tzoffset")
	private short tzoffset;

	@Column(name="securekey")	
	public String securekey;
	
	@Column(name="pin")
	private short pin;

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
	private String datecreatedsettings;
	private String createdbyemail;
	private String updatedbyemail;

	
	// Getter-Setters
	public int getTenantid() {
		return tenantid;
	}
	
	public void setTenantid(int tenantid) {
		this.tenantid = tenantid;
	}
	
	public int getAccountid() {
		return accountid;
	}
	
	public void setAccountid(int accountid) {
		this.accountid = accountid;
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

	public short getTenanttype() {
		return tenanttype;
	}
	
	public void setTenanttype(short tenanttype) {
		this.tenanttype = tenanttype;
	}
	
	public short getBillingplan() {
		return billingplan;
	}
	
	public void setBillingplan(short billingplan) {
		this.billingplan = billingplan;
	}

	public short getStatus() {
		return status;
	}
	
	public void setStatus(short status) {
		this.status = status;
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
	
	public String getDatecreatedsettings() {
		return datecreatedsettings;
	}

	public void setDatecreatedsettings(String datecreatedsettings) {
		this.datecreatedsettings = datecreatedsettings;
		
	}	

}
