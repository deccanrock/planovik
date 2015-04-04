package com.deccanrock.planovik.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;


@Entity

public class ActivityMasterEntity
{
	// Columns
	@Column(name="itinnum")    
    private int itinnum;
  
	@Column(name="day")    
    private int day;
	
	@Column(name="version")    
	private int version;
        
	@Column(name="pax")    
	private int pax;
	
	@Column(name="groupnnum")    
	private int groupnum;
	
	private int numtourdays;
    
    private ArrayList<Integer> daywiseactivitycntlist;
    
    @Column(name="countactivityhotel")    
	private int countactivityhotel;
    
    @Column(name="countactivityother")    
	private int countactivityother;

    @Column(name="countactivityvisit")    
	private int countactivityvisit;

    @Column(name="countactivitytravel")    
	private int countactivitytravel;
   
    @Column(name="countactivityrental")    
	private int countactivityrental;

    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
        
    private String lastupdatedby;
    
    private String createdby;
    
    private short tzoffset;
    
    private String arrdatetimepicker;

    private String depdatetimepicker;
    
    ArrayList<ActivityMasterActEntity> masteractentities;
        
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
			
	public int getPax() {
		return pax;
	}

	public void setPax(int pax) {
		this.pax = pax;
	}

	public Integer getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(Integer groupnum) {
		this.groupnum = groupnum;
	}

	public ArrayList <Integer> getDaywiseactivitylistcnt() {
		return daywiseactivitycntlist;
	}

	public void setDaywiseactivitycnt(ArrayList<Integer> daywiseactivitycntlist) {
		this.daywiseactivitycntlist = daywiseactivitycntlist;
	}
	
	public int getCountactivityhotel() {
		return countactivityhotel;
	}

	public void setCountactivityhotel(int countactivityhotel) {
		this.countactivityhotel = countactivityhotel;
	}
		
	public int getCountactivityvisit() {
		return countactivityvisit;
	}

	public void setCountactivityvisit(int countactivityvisit) {
		this.countactivityvisit = countactivityvisit;
	}
	
	public int getCountactivitytravel() {
		return countactivitytravel;
	}

	public void setCountactivitytravel(int countactivitytravel) {
		this.countactivitytravel = countactivitytravel;
	}
	
	public int getCountactivityother() {
		return countactivityother;
	}

	public void setCountactivityother(int countactivityother) {
		this.countactivityother = countactivityother;
	}	
	
	public int getCountactivityrental() {
		return countactivityrental;
	}

	public void setCountactivityrental(int countactivityrental) {
		this.countactivityrental = countactivityrental;
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
	
    public void setLastupdatedby(String emailid) {
    	lastupdatedby = emailid;
    }

    public String getLastupdatedby() {
    	return lastupdatedby;
    }

    public void setCreatedby(String emailid) {
    	createdby = emailid;
    }

    public String getCreatedby() {
    	return createdby;
    }

    public void setTzoffset(short tzoffset) {
		this.tzoffset = tzoffset;
	}
		
	public short getTzoffset() {
		return tzoffset;
	}
	
	public String getArrdatetimepicker() {
		return this.arrdatetimepicker;		
	}
	
	public void setArrdatetimepicker(String arrdatetimepicker) {
		this.arrdatetimepicker = arrdatetimepicker;		
	}

	public String getDepdatetimepicker() {
		return this.depdatetimepicker;		
	}
	
	public void setStartdatetimepicker(String depdatetimepicker) {
		this.depdatetimepicker = depdatetimepicker;		
	}
	
	public void setMsteractentities (ArrayList<ActivityMasterActEntity> masteractentities) {
		this.masteractentities = masteractentities;
	}
		
	public ArrayList<ActivityMasterActEntity> getMasteractentities() {
		return masteractentities;
	}	

}
