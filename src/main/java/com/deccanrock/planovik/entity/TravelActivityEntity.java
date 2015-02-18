package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class TravelActivityEntity
{
	// Columns
    @Column(name="activityid")    
    @GeneratedValue
    private int activityid;
  
    @Column(name="code")    
	private String code;

    @Column(name="day")    
	private int day;
    
    @Column(name="vesselconame")        
    private String vesselconame;
    
    @Column(name="vesselno")        
    private String vesselno;
    
    @Column(name="bookingclass")    
	private String bookingclass;
    
    @Column(name="bookingno")    
	private String bookingno;

    @Column(name="depdatetime")    
	private  Date depdatetime;
    private String depdatetimestr;
    private long depdatetimelong;
    
    @Column(name="arrdatetime")    
	private  Date arrdatetime;
    private String arrdatetimestr;
    private long arrdatetimelong;


    @Column(name="depstation")    
	private String depstation;
    
    @Column(name="depstation")    
	private String arrstation;

    @Column(name="cost")    
	private float cost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="costmarkup")    
	private int costmarkup;

    @Column(name="arrvlpikup")    
	private boolean arrvlpikup;
   
    @Column(name="pikupcost")    
	private float pikupcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="pikupcostmarkup")    
	private int pikupcostmarkup;

    @Column(name="pikupveh")    
	private String pikupveh;
    
    @Column(name="asstreq")    
	private boolean asstreq;    
    
    @Column(name="asstcost")    
	private float asstcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="asstcostmarkup")    
	private int asstcostmarkup;

    @Column(name="comment")    
	private String comment;

    @Column(name="status")    
	private int status;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
    
    // Air/Train/Road/Ship based on travel code
    private String mode;
    
    private String [] codes;
        
    // Getter-Setters
	public int getActivityid() {
		return activityid;
	}

	public void setActivityid(int activityid) {
		this.activityid = activityid;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
		
	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
			
	public String getVesselconame() {
		return vesselconame;
	}

	public void setVesselconame(String vesselconame) {
		this.vesselconame = vesselconame;
	}
	
	public String getVesselno() {
		return vesselno;
	}

	public void setVesselno(String vesselno) {
		this.vesselno = vesselno;
	}
	
	public String getBookingclass() {
		return bookingclass;
	}

	public void setBookingclass(String bookingclass) {
		this.bookingclass = bookingclass;
	}
	
	public String getBookingno() {
		return bookingno;
	}

	public void setBookingno(String bookingno) {
		this.bookingno = bookingno;
	}

	public Date getDepdatetime() {
		return depdatetime;
	}

	public void setDepdatetime(Date depdatetime) {
		this.depdatetime = depdatetime;
	}

	public String getDepdatetimestr() {
		return depdatetimestr;
	}

	public void setDepdatetimestr(String depdatetimestr) {
		this.depdatetimestr = depdatetimestr;
	}

	public long getDepdatetimelong() {
		return depdatetimelong;
	}

	public void setDepdatetimelong(long depdatetimelong) {
		this.depdatetimelong = depdatetimelong;
	}
	
	public Date getArrdatetime() {
		return arrdatetime;
	}

	public void setArrdatetime(Date arrdatetime) {
		this.arrdatetime = arrdatetime;
	}
	
	public String getArrdatetimestr() {
		return arrdatetimestr;
	}

	public void setArrdatetimestr(String arrdatetimestr) {
		this.arrdatetimestr = arrdatetimestr;
	}

	public long getArrdatetimelong() {
		return arrdatetimelong;
	}

	public void setArrdatetimelong(long arrdatetimelong) {
		this.arrdatetimelong = arrdatetimelong;
	}

	public String getDepstation() {
		return depstation;
	}

	public void setDepstation(String depstation) {
		this.depstation = depstation;
	}

	public String getArrstation() {
		return arrstation;
	}

	public void setArrstation(String arrstation) {
		this.arrstation = arrstation;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public int getCostmarkup() {
		return costmarkup;
	}

	public void setCostmarkup(int costmarkup) {
		this.costmarkup = costmarkup;
	}
	
	public boolean getArrvlpikup() {
		return arrvlpikup;
	}

	public void setArrvlpikup(boolean arrvlpikup) {
		this.arrvlpikup = arrvlpikup;
	}

	public float getPikupcost() {
		return pikupcost;
	}

	public void setPikupcost(float pikupcost) {
		this.pikupcost = pikupcost;
	}

	public int getPikupcostmarkup() {
		return pikupcostmarkup;
	}

	public void setPikupcostmarkup(int pikupcostmarkup) {
		this.pikupcostmarkup = pikupcostmarkup;
	}
	
	public String getPikupveh() {
		return pikupveh;
	}

	public void setPikupveh(String pikupveh) {
		this.pikupveh = pikupveh;
	}

	public boolean getAsstreq() {
		return asstreq;
	}

	public void setAsstreq(boolean asstreq) {
		this.asstreq = asstreq;
	}

	public float getAsstcost() {
		return asstcost;
	}

	public void setAsstcost(float asstcost) {
		this.asstcost = asstcost;
	}

	public int getAsstcostmarkup() {
		return asstcostmarkup;
	}

	public void setAsstcostmarkup(int asstcostmarkup) {
		this.asstcostmarkup = asstcostmarkup;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
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
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String [] getCodes() {
		return codes;
	}

	public void setCodes(String [] codes) {
		this.codes = codes;
	}	

}
