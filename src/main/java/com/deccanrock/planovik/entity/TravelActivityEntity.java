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
    private Integer activityid;
    
    @Column(name="pax")    
    private Integer pax;
      
    @Column(name="group")    
    private Integer group;
    
    @Column(name="code")    
	private String code;

    @Column(name="day")    
	private Integer day;
    
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
	private Float cost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="costmarkup")    
	private Integer costmarkup;

    @Column(name="arrvlpikup")    
	private boolean arrvlpikup;
   
    @Column(name="pikupcost")    
	private Float pikupcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="pikupcostmarkup")    
	private Integer pikupcostmarkup;

    @Column(name="pikupveh")    
	private String pikupveh;
    
    @Column(name="asstreq")    
	private boolean asstreq;    
    
    @Column(name="asstcost")    
	private Float asstcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="asstcostmarkup")    
	private Integer asstcostmarkup;

    @Column(name="comment")    
	private String comment;

    @Column(name="status")    
	private Integer status;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
    
    // Air/Train/Road/Ship based on travel code
    private String mode;
    
    private String [] codes;
    
    private int itineraryid;
        
    // Getter-Setters
	public Integer getActivityid() {
		return activityid;
	}

	public void setActivityid(Integer activityid) {
		this.activityid = activityid;
	}
	
	public Integer getPax() {
		return pax;
	}

	public void setPax(Integer pax) {
		this.pax = pax;
	}

	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
		
	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
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

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public Integer getCostmarkup() {
		return costmarkup;
	}

	public void setCostmarkup(Integer costmarkup) {
		this.costmarkup = costmarkup;
	}
	
	public boolean getArrvlpikup() {
		return arrvlpikup;
	}

	public void setArrvlpikup(boolean arrvlpikup) {
		this.arrvlpikup = arrvlpikup;
	}

	public Float getPikupcost() {
		return pikupcost;
	}

	public void setPikupcost(Float pikupcost) {
		this.pikupcost = pikupcost;
	}

	public Integer getPikupcostmarkup() {
		return pikupcostmarkup;
	}

	public void setPikupcostmarkup(Integer pikupcostmarkup) {
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

	public Float getAsstcost() {
		return asstcost;
	}

	public void setAsstcost(Float asstcost) {
		this.asstcost = asstcost;
	}

	public Integer getAsstcostmarkup() {
		return asstcostmarkup;
	}

	public void setAsstcostmarkup(Integer asstcostmarkup) {
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
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
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

	public int getItineraryid() {
		return itineraryid;
	}

	public void setItineraryid(int itineraryid) {
		this.itineraryid = itineraryid;
	}
}
