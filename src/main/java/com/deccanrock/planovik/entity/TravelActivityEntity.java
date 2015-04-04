package com.deccanrock.planovik.entity;

import java.util.Comparator;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class TravelActivityEntity extends Object implements Comparable<TravelActivityEntity>  {
	// Columns
    @Column(name="activityid")    
    @GeneratedValue
    private Integer activityid;
    
    @Column(name="itinnum")    
    private int itinnum;
    
    @Column(name="masteractid")    
    private short masteractid;    
    
    @Column(name="pax")    
    private Integer pax;
      
    @Column(name="mode")    
    private Integer mode;

    @Column(name="groupnum")    
    private Integer groupnum;
    
    @Column(name="code")    
	private String code;

    @Column(name="actname")    
	private String actname;
    
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
    
    @Column(name="pikupdroplocfrom")
    private String pikupdroplocfrom;
    
    @Column(name="pikupdroplocto")
    private String pikupdroplocto;

    @Column(name="pikupdropdatetime")    
	private  Date pikupdropdatetime;
    private String pikupdropdatetimestr;
    private long pikupdropdatetimelong;
    
    @Column(name="pikupdropcost")    
	private Float pikupdropcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="pikupdropcostmarkup")    
	private Integer pikupdropcostmarkup;

    @Column(name="vehdetails")    
	private String vehdetails; 
    
    @Column(name="asstcost")    
	private Float asstcost;

    // Example 25 (25%), 125 (125%)...
    @Column(name="asstcostmarkup")    
	private Integer asstcostmarkup;

    @Column(name="comments")    
	private String comments;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
            
    private String [] codes;
    
    private int version;
            
    private String lastupdatedby;

    private String createdby;

    private short tzoffset;
    
    private String error;
    
    private long activitystarttimelong;
    
    // To be included in all activity entities to allow client side identification of activity type
    private int type;
    
    // Getter-Setters
	public Integer getActivityid() {
		return activityid;
	}

	public void setActivityid(Integer activityid) {
		this.activityid = activityid;
	}
	
	public int getItinnum() {
		return itinnum;
	}

	public void setItinnum(int itinnum) {
		this.itinnum = itinnum;
	}
	
	public short getMasteractid() {
		return masteractid;
	}

	public void setMasteractid(short masteractid) {
		this.masteractid = masteractid;
	}

	
	public Integer getPax() {
		return pax;
	}

	public void setPax(Integer pax) {
		this.pax = pax;
	}

	public Integer getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(Integer groupnum) {
		this.groupnum = groupnum;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
		
	public String getActname() {
		return actname;
	}

	public void setActname(String actname) {
		this.actname = actname;
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

	public String getPikupdroplocfrom() {
		return pikupdroplocfrom;
	}

	public void setPikupdroplocfrom(String pikupdroplocfrom) {
		this.pikupdroplocfrom = pikupdroplocfrom;
	}
	
	public String getPikupdroplocto() {
		return pikupdroplocto;
	}

	public void setPikupdroplocto(String pikupdroplocto) {
		this.pikupdroplocto = pikupdroplocto;
	}
	
	public Date getPikupdropdatetime() {
		return pikupdropdatetime;
	}

	public void setPikupdropdatetime(Date pikupdropdatetime) {
		this.pikupdropdatetime = pikupdropdatetime;
	}

	public String getPikupdropdatetimestr() {
		return pikupdropdatetimestr;
	}

	public void setPikupdropdatetimestr(String pikupdropdatetimestr) {
		this.pikupdropdatetimestr = pikupdropdatetimestr;
	}

	public long getPikupdropdatetimelong() {
		return pikupdropdatetimelong;
	}

	public void setPikupdropdatetimelong(long pikupdropdatetimelong) {
		this.pikupdropdatetimelong = pikupdropdatetimelong;
	}
		
	public Float getPikupdropcost() {
		return pikupdropcost;
	}

	public void setPikupdropcost(Float pikupdropcost) {
		this.pikupdropcost = pikupdropcost;
	}

	public Integer getPikupdropcostmarkup() {
		return pikupdropcostmarkup;
	}

	public void setPikupdropcostmarkup(Integer pikupdropcostmarkup) {
		this.pikupdropcostmarkup = pikupdropcostmarkup;
	}
	
	public String getVehdetails() {
		return vehdetails;
	}

	public void setVehdetails(String vehdetails) {
		this.vehdetails = vehdetails;
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
	
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
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

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}
	
	public String [] getCodes() {
		return codes;
	}

	public void setCodes(String [] codes) {
		this.codes = codes;
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

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
	
	public void setTzoffset(short tzoffset) {
		this.tzoffset = tzoffset;
	}
		
	public short getTzoffset() {
		return tzoffset;
	}		

	public void setError(String error) {
		this.error = error;
	}
		
	public String getError() {
		return error;
	}		

	public long getActivitystarttimelong() {
		return activitystarttimelong;
	}

	public void setActivitystarttimelong(long activitystarttimelong) {
		this.activitystarttimelong = activitystarttimelong;
	}
	
	public void setType(int type) {
		this.type = type;
	}
		
	public int getType() {
		return type=0; // always the case
	}		

	
	// Comparator methods
	public static Comparator<TravelActivityEntity> ActivityByIdComparator 
                          = new Comparator<TravelActivityEntity>() {
 
		@Override
		public int compare(TravelActivityEntity tae1, TravelActivityEntity tae2) {
  
			//ascending order
			return tae1.compareToActivityid(tae2.getActivityid());
 	    }
 
	};	

	public int compareToActivityid(int compareActivityid) { 
		//ascending order
		return this.activityid - compareActivityid; 
	}
	
	public static Comparator<TravelActivityEntity> ActivityByTimeLongComparator 
	    = new Comparator<TravelActivityEntity>() {
	
		@Override
		public int compare(TravelActivityEntity tae1, TravelActivityEntity tae2) {
		
			//ascending order
			return tae1.compareToTimeLong(tae2.getActivitystarttimelong());
		}

	};

	protected int compareToTimeLong(long activitystarttimelong) {
		// TODO Auto-generated method stub
		return (int) (this.getActivitystarttimelong() - activitystarttimelong); 
	}

	@Override
	public int compareTo(TravelActivityEntity o) {
		// TODO Auto-generated method stub
		return 0;
	}	

}
