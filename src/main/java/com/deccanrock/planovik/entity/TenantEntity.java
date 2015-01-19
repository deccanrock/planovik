package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;

public class TenantEntity {
	// Columns
	@Column(name="id")
	@GeneratedValue
	private int id;
	
	@Column(name="type")
	private short type;
	
	@Column(name="status")
	private short status;
	
	@Column(name="subscription")
	private String subscription;
	
	@Column(name="domainname")
	private String domainname;
	
	@Column(name="dsurl")
	private String dsurl;
	
	@Column(name="dsusername")
	private String dsusername;
	
	@Column(name="dspassword")
	private String dspassword;
	
	@Column(name="bkdsurl")
	private String bkdsurl;
	
	@Column(name="bkdsusername")
	private String bkdsusername;
	
	@Column(name="bkdspassword")
	private String bkdspassword;
	
	@Column(name="datecreated")
	private Date datecreated;
	
	@Column(name="dateupdated")
	private Date dateupdated;

	
	// Getter-Setters
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public short getStatus() {
		return status;
	}
	
	public void setStatus(short status) {
		this.status = status;
	}
	
	public short getType() {
		return type;
	}
	
	public void setType(short type) {
		this.type = type;
	}

	public String getSubscription() {
		return subscription;
	}
	
	public void setSubscription(String subscription) {
		this.subscription = subscription;
	}
	
	public String getDomainname() {
		return domainname;
	}
	
	public void setDomainname(String domainname) {
		this.domainname = domainname;
	}

	public String getDsurl() {
		return dsurl;
	}
	
	public void setDsurl(String dsurl) {
		this.dsurl = dsurl;
	}
		
	public String getDsusername() {
		return dsusername;
	}
	
	public void setDsusername(String dsusername) {
		this.dsusername = dsusername;
	}
			
	public String getDspassword() {
		return dspassword;
	}
	
	public void setDspassword(String dspassword) {
		this.dspassword = dspassword;
	}
	
	public String getBkdsurl() {
		return bkdsurl;
	}
	
	public void setBkdsurl(String bkdsurl) {
		this.bkdsurl = bkdsurl;
	}
		
	public String getBkdsusername() {
		return bkdsusername;
	}
	
	public void setBkdsusername(String bkdsusername) {
		this.bkdsusername = bkdsusername;
	}
			
	public String getBkdspassword() {
		return bkdspassword;
	}
	
	public void setBkdspassword(String bkdspassword) {
		this.bkdspassword = bkdspassword;
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
		
}
