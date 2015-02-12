package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

@Entity

public class ItineraryEntity
{
	// Columns
    @Column(name="id")    
    @GeneratedValue
    private int id;
    
    @Column(name="name")    
	private String name;
  
    @Column(name="version")    
	private int version;

    // '0=draft', '1=final'
    @Column(name="status")    
	private String status;
    
    @Column(name="touroperator")    
	private String touroperator;

    @Column(name="grouphead")    
	private String grouphead;
    
    @Column(name="numtravellers")    
	private int numtravellers;
    
    @Column(name="startdate")    
	private  Date startdate;
    
    @Column(name="enddate")    
	private  Date enddate;

    // engineer, manager, supervisor, team lead...
    @Column(name="arrivalcity")    
	private String arrivalcity;
    
    @Column(name="depcity")    
	private String depcity;
    
    @Column(name="currency")    
	private String currency;

    @Column(name="quotecurrency")    
	private String quotecurrency;
    
    @Column(name="convcode")    
	private int convcode;
    
    @Column(name="tzoffset")    
	private Short tzoffset;

    @Column(name="createdby")    
	private  int createdby;
    
    private String createdbyemail;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="lastupdatedby")    
	private  int lastupdatedby;

    private String lastupdatedbyemail;

    @Column(name="dateupdated")    
	private Date dateupdated;
    
    private String mode;
    
    private String error;
    
    private String startdatestr;
    private String enddatestr;
    private String fromcurr;
    private String tocurr;
    private String convcodestr;
    private String quotecurrencystr;
    private long startdatelong;
    private long enddatelong;
    
    // Getter-Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
	
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getTouroperator() {
		return touroperator;
	}

	public void setTouroperator(String touroperator) {
		this.touroperator = touroperator;
	}
		
	public String getGrouphead() {
		return grouphead;
	}

	public void setGrouphead(String grouphead) {
		this.grouphead = grouphead;
	}
	
	public int getNumtravellers() {
		return numtravellers;
	}

	public void setNumtravellers(int numtravellers) {
		this.numtravellers = numtravellers;
	}
		
	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	
	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
		
	public String getArrivalcity() {
		return arrivalcity;
	}

	public void setArrivalcity(String arrivalcity) {
		this.arrivalcity = arrivalcity;
	}
	
	public String getDepcity() {
		return depcity;
	}

	public void setDepcity(String depcity) {
		this.depcity = depcity;
	}	
	
	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public String getQuotecurrency() {
		return quotecurrency;
	}

	public void setQuotecurrency(String quotecurrency) {
		this.quotecurrency = quotecurrency;
	}

	public int getCreatedby() {
		return createdby;
	}
	
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}

	public int getLastupdatedby() {
		return lastupdatedby;
	}
	
	public void setLastupdatedby(int lastupdatedby) {
		this.lastupdatedby = lastupdatedby;
	}
	
	public Short getTzoffset() {
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
	
	public String getMode() {
		return this.mode;
	}
	
	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getCreatedbyemail() {
		return this.createdbyemail;
	}
	
	public void setCreatedbyemail(String createdbyemail) {
		this.createdbyemail = createdbyemail;
	}

	public String getLastupdatedbyemail() {
		return this.lastupdatedbyemail;
	}
	
	public void setLastupdatedbyemail(String lastupdatedbyemail) {
		this.lastupdatedbyemail = lastupdatedbyemail;
	}
	
	public int getConvcode() {
		return this.convcode;
	}
	
	public void setConvcode(int convcode) {
		this.convcode = convcode;
	}

	public String getError() {
		return this.error;		
	}
	
	public void setError(String message) {
		this.error = message;		
	}
	
	public String getStartdatestr() {
		return this.startdatestr;		
	}
	
	public void setStartdatestr(String datestr) {
		this.startdatestr = datestr;		
	}

	public String getEnddatestr() {
		return this.enddatestr;		
	}
	
	public void setEnddatestr(String datestr) {
		this.enddatestr = datestr;		
	}

	public String getFromcurr() {
		return this.fromcurr;		
	}
	
	public void setFromcurr(String currency) {
		this.fromcurr = currency;		
	}

	public String getTocurr() {
		return this.tocurr;		
	}
	
	public void setTocurr(String currency) {
		this.tocurr = currency;		
	}
	
	public String getQuotecurrencystr() {
		return this.quotecurrencystr;		
	}
	
	public void setQuotecurrencystr(String currencystr) {
		this.quotecurrencystr = currencystr;		
	}
	
	public String getConvcodestr() {
		return this.convcodestr;		
	}
	
	public void setConvcodestr(String convcodestr) {
		this.convcodestr = convcodestr;		
	}
		
	public long getStartdatelong() {
		return this.startdatelong;		
	}
	
	public void setStartdatelong(long timelong) {
		this.startdatelong = timelong;		
	}

	public long getEnddatelong() {
		return this.enddatelong;		
	}
	
	public void setEnddatelong(long timelong) {
		this.enddatelong = timelong;		
	}
	
}
