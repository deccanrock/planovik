package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class RentalActivityEntity
{
	// Columns
    @Column(name="activityid")    
    @GeneratedValue
    private int activityid;
  
    @Column(name="code")    
	private String code;

    @Column(name="day")    
	private int day;
    
    @Column(name="vehrentco")        
    private String vehrentco;
    
    @Column(name="vehrentcontact")        
    private String vehrentcontact;
    
    @Column(name="vehrenttype")    
	private String vehrenttype;
    
    @Column(name="vehrentbookingno")    
	private String vehrentbookingno;

    @Column(name="vehrentfromdatetime")    
	private  Date vehrentfromdatetime;
    private String vehrentfromdatetimestr;
    private long vehrentfromdatetimelong;
    
    @Column(name="vehrenttodatetime")    
	private  Date vehrenttodatetime;
    private String vehrenttodatetimestr;
    private long vehrenttodatetimelong;

    @Column(name="vehrentloc")    
	private String vehrentloc;

    @Column(name="vehrentcost")    
	private float vehrentcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="vehrentcostmarkup")    
	private int vehrentcostmarkup;

    @Column(name="comment")    
	private String comment;

    @Column(name="status")    
	private int status;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
    
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
			
	public String getVehrentco() {
		return vehrentco;
	}

	public void setVesselconame(String vehrentco) {
		this.vehrentco = vehrentco;
	}
	
	public String getVehrentcontact() {
		return vehrentcontact;
	}

	public void setVehrentcontact(String vehrentcontact) {
		this.vehrentcontact = vehrentcontact;
	}
	
	public String getVehrenttype() {
		return vehrenttype;
	}

	public void setVehrenttype(String vehrenttype) {
		this.vehrenttype = vehrenttype;
	}
	
	public String getVehrentbookingno() {
		return vehrentbookingno;
	}

	public void setVehrentbookingno(String vehrentbookingno) {
		this.vehrentbookingno = vehrentbookingno;
	}

	public Date getVehrentfromdatetime() {
		return vehrentfromdatetime;
	}

	public void setVehrentfromdatetime(Date vehrentfromdatetime) {
		this.vehrentfromdatetime = vehrentfromdatetime;
	}

	public String getVehrentfromdatetimestr() {
		return vehrentfromdatetimestr;
	}

	public void setDepdatetimestr(String vehrentfromdatetimestr) {
		this.vehrentfromdatetimestr = vehrentfromdatetimestr;
	}

	public long getVehrentfromdatetimelong() {
		return vehrentfromdatetimelong;
	}

	public void setVehrentfromdatetimelong(long vehrentfromdatetimelong) {
		this.vehrentfromdatetimelong = vehrentfromdatetimelong;
	}
	
	public Date getVehrenttodatetime() {
		return vehrenttodatetime;
	}

	public void setVehrenttodatetime(Date vehrenttodatetime) {
		this.vehrenttodatetime = vehrenttodatetime;
	}

	public String getVehrenttodatetimestr() {
		return vehrenttodatetimestr;
	}

	public void getVehrenttodatetimestr(String vehrenttodatetimestr) {
		this.vehrenttodatetimestr = vehrenttodatetimestr;
	}

	public long getVehrenttodatetimelong() {
		return vehrenttodatetimelong;
	}

	public void setVehrenttodatetimelong(long vehrenttodatetimelong) {
		this.vehrenttodatetimelong = vehrenttodatetimelong;
	}
	
	public String getVehrentloc() {
		return vehrentloc;
	}

	public void setVehrentloc(String vehrentloc) {
		this.vehrentloc = vehrentloc;
	}

	public float getVehrentcost() {
		return vehrentcost;
	}

	public void setVehrentcost(float vehrentcost) {
		this.vehrentcost = vehrentcost;
	}

	public int getVehrentcostmarkup() {
		return vehrentcostmarkup;
	}

	public void setVehrentcostmarkup(int vehrentcostmarkup) {
		this.vehrentcostmarkup = vehrentcostmarkup;
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
	
	public String [] getCodes() {
		return codes;
	}

	public void setCodes(String [] codes) {
		this.codes = codes;
	}	
	

}
