package com.deccanrock.planovik.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;


@Entity

public class ActivityMasterActEntity
{
	// Columns
	@Column(name="itinnum")    
    private int itinnum;
  
	@Column(name="masteractid")    
    private int masteractid;
	
	@Column(name="version")    
    private int version;
	
	@Column(name="masteractname")    
    private String masteractname;	
	  
    @Column(name="masteractstartdate")    
	private  Date masteractstartdate;
    
    private String masteractstartdatestr;
    private long masteractstartdatelong;

    @Column(name="masteractsenddate")    
	private  Date masteractenddate;
    
    private String masteractenddatestr;
    private long masteractenddatelong;
    
    @Column(name="dateupdated")    
	private Date dateupdated;
        
    @Column(name="datecreated")    
	private Date datecreated;
    
    short tzoffset;
        
    // Getter-Setters
    
    public int getItinnum() {
		return itinnum;
	}

	public void setItinnum(int itinnum) {
		this.itinnum = itinnum;
	}
	
	public int getMasteractid() {
		return masteractid;
	}

	public void setMasteractid(int masteractid) {
		this.masteractid = masteractid;
	}
			
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
	
	public String getMasteractname() {
		return masteractname;
	}

	public void setMasteractname(String masteractname) {
		this.masteractname = masteractname;
	}
	
	public Date getMasteractstartdate() {
		return masteractstartdate;
	}

	public void setMasteractstartdate(Date masteractstartdate) {
		this.masteractstartdate = masteractstartdate;
	}
	
	public String getMasteractstartdatestr() {
		return masteractstartdatestr;
	}

	public void setMasteractstartdate(String masteractstartdatestr) {
		this.masteractstartdatestr = masteractstartdatestr;
	}
    
	public long getMasteractstartdatelong() {
		return masteractstartdatelong;
	}

	public void setMasteractstartdatelong(long masteractstartdatelong) {
		this.masteractstartdatelong = masteractstartdatelong;
	}
    
	public Date getMasteractenddate() {
		return masteractenddate;
	}

	public void setMasteractenddate(Date masteractenddate) {
		this.masteractenddate = masteractenddate;
	}
	
	public String getMasteractenddatestr() {
		return masteractenddatestr;
	}

	public void setMasteractenddate(String masteractenddatestr) {
		this.masteractenddatestr = masteractenddatestr;
	}
    
	public long getMasteractenddatelong() {
		return masteractenddatelong;
	}

	public void setMasteractenddatelong(long masteractenddatelong) {
		this.masteractenddatelong = masteractenddatelong;
	}	
	
	public Date getDateupdated() {
		return dateupdated;
	}

	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}
	
	public Date getDatecreated() {
		return datecreated;
	}

	public void getDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	public void setTzoffset(short tzoffset) {
		this.tzoffset = tzoffset;
	}
		
	public short getTzoffset() {
		return tzoffset;
	}			
	
}
