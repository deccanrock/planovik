package com.deccanrock.planovik.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class ActivityMasterEntity
{
	// Columns
    @Column(name="itinnum")    
    @GeneratedValue
    private int itinnum;
  
    @Column(name="version")    
	private int version;

    @Column(name="status")    
	private int status;
    
    private int activitycnt;
    
    private int numtourdays;
    
    private ArrayList<Integer> daywiseactivitycntlist;
    
    @Column(name="isactivityhotel")    
	private boolean isactivityhotel;
    
    @Column(name="isactivityother")    
	private boolean isactivityother;

    @Column(name="isactivitysightseeing")    
	private boolean isactivitysightseeing;

    @Column(name="isactivitytravel")    
	private boolean isactivitytravel;
   
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
        
    // Getter-Setters
	public int getItinnum() {
		return itinnum;
	}

	public void setItinnum(int itinnum) {
		this.itinnum = itinnum;
	}
	
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getActivitycnt() {
		return activitycnt;
	}

	public void setActivitycnt(int activitycnt) {
		this.activitycnt = activitycnt;
	}
		
	public ArrayList <Integer> getDaywiseactivitylistcnt() {
		return daywiseactivitycntlist;
	}

	public void setDaywiseactivitycnt(ArrayList<Integer> daywiseactivitycntlist) {
		this.daywiseactivitycntlist = daywiseactivitycntlist;
	}
	
	public boolean getIsactivityhotel() {
		return isactivityhotel;
	}

	public void setIsactivityhotel(boolean isactivityhotel) {
		this.isactivityhotel = isactivityhotel;
	}
		
	public boolean getIsactivitysightseeing() {
		return isactivitysightseeing;
	}

	public void setIsactivitysightseeing(boolean isactivitysightseeing) {
		this.isactivitysightseeing = isactivitysightseeing;
	}
	
	public boolean getIsactivitytravel() {
		return isactivitytravel;
	}

	public void setIsactivitytravel(boolean isactivitytravel) {
		this.isactivitytravel = isactivitytravel;
	}
	
	public boolean getIsactivityother() {
		return isactivityother;
	}

	public void setIsActivityother(boolean isactivityother) {
		this.isactivityother = isactivityother;
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
	
	public void setNumtourdays(int numtourdays) {
		this.numtourdays = numtourdays;
	}
		
	public int getNumtourdays() {
		return numtourdays;
	}	
	
}
