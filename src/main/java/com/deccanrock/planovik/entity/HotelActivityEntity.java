package com.deccanrock.planovik.entity;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class HotelActivityEntity extends Object implements Comparable<HotelActivityEntity>  {
	// Columns
    @Column(name="activityid")    
    @GeneratedValue
    private Integer activityid;
        
    @Column(name="itinnum")    
    private int itinnum;
    
    @Column(name="masteractid")    
    private short masteractid;    
    
    @Column(name="actname")    
	private String actname;

    @Column(name="pax")    
    private Integer pax;
      
    @Column(name="groupnum")    
    private Integer groupnum;
    
    @Column(name="code")    
	private String code;

    @Column(name="version")        
    private int version;
    
    @Column(name="propertyname")    
	private String propertyname;
    
    @Column(name="day")    
	private Integer day;
    
    @Column(name="vesselconame")        
    private String vesselconame;
    
    @Column(name="vesselnoon")        
    private String vesselnoon;
    
    @Column(name="vesselnoret")        
    private String vesselnoret;

    @Column(name="bookingclass")    
	private String bookingclass;
    
    @Column(name="bookingno")    
	private String bookingno;

    @Column(name="depdatetimeon")    
	private  Date depdatetimeon;
    private String depdatetimeonstr;
    private long depdatetimeonlong;
    
    @Column(name="arrdatetimeon")    
	private  Date arrdatetimeon;
    private String arrdatetimeonstr;
    private long arrdatetimeonlong;

    @Column(name="depstation")    
	private String depstation;
    
    @Column(name="arrstation")    
	private String arrstation;

    @Column(name="depdatetimeret")    
	private  Date depdatetimeret;
    private String depdatetimeretstr;
    private long depdatetimeretlong;
    
    @Column(name="arrdatetimeret")    
	private  Date arrdatetimeret;
    private String arrdatetimeretstr;
    private long arrdatetimeretlong;
     
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

    @Column(name="commentsinternal")    
	private String commentsinternal;
    
    @Column(name="commentsexternal")    
	private String commentsexternal;

    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
            
    private String [] codes;
    
            
    private short eventdrop;
    
    private String lastupdatedby;

    private String createdby;

    private short tzoffset;
    
    private String error;
    
    private long activitystarttimelong;

    private long activitystarttimelongpair;
    
    private long activityendtimelong;    
    
    private long activityendtimelongpair;    

    // To be included in all activity entities to allow client side identification of activity type
    private int type;
    
    private String masterorindradio;
    
    private List<String>travelmodelist;

	private String vesselnopikupdrp;
    
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
	
	public String getVesselnoon() {
		return vesselnoon;
	}

	public void setVesselnoon(String vesselnoon) {
		this.vesselnoon = vesselnoon;
	}
	
	public String getVesselnoret() {
		return vesselnoret;
	}

	public void setVesselnoret(String vesselnoret) {
		this.vesselnoret = vesselnoret;
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

	public Date getDepdatetimeret() {
		return depdatetimeret;
	}

	public void setDepdatetimeret(Date depdatetimeret) {
		this.depdatetimeon = depdatetimeret;
	}

	public String getDepdatetimeretstr() {
		return depdatetimeretstr;
	}

	public void setDepdatetimeretstr(String depdatetimeretstr) {
		this.depdatetimeretstr = depdatetimeretstr;
	}

	public long getDepdatetimeretlong() {
		return depdatetimeretlong;
	}

	public void setDepdatetimeretlong(long depdatetimeretlong) {
		this.depdatetimeretlong = depdatetimeretlong;
	}
	
	public Date getArrdatetimeret() {
		return arrdatetimeret;
	}

	public void setArrdatetimeret(Date arrdatetimeret) {
		this.arrdatetimeret = arrdatetimeret;
	}
	
	public String getArrdatetimeretstr() {
		return arrdatetimeretstr;
	}

	public void setArrdatetimeretstr(String arrdatetimeretstr) {
		this.arrdatetimeretstr = arrdatetimeretstr;
	}

	public long getArrdatetimeretlong() {
		return arrdatetimeretlong;
	}

	public void setArrdatetimeretlong(long arrdatetimeretlong) {
		this.arrdatetimeretlong = arrdatetimeretlong;
	}


	public Date getDepdatetimeon() {
		return depdatetimeret;
	}

	public void setDepdatetimeon(Date depdatetimeon) {
		this.depdatetimeon = depdatetimeon;
	}

	public String getDepdatetimeonstr() {
		return depdatetimeonstr;
	}

	public void setDepdatetimeonstr(String depdatetimeonstr) {
		this.depdatetimeonstr = depdatetimeonstr;
	}

	public long getDepdatetimeonlong() {
		return depdatetimeonlong;
	}

	public void setDepdatetimeonlong(long depdatetimeonlong) {
		this.depdatetimeonlong = depdatetimeonlong;
	}
	
	public Date getArrdatetimeon() {
		return arrdatetimeon;
	}

	public void setArrdatetimeon(Date arrdatetimeon) {
		this.arrdatetimeon = arrdatetimeon;
	}
	
	public String getArrdatetimeonstr() {
		return arrdatetimeonstr;
	}

	public void setArrdatetimeonstr(String arrdatetimeonstr) {
		this.arrdatetimeonstr = arrdatetimeonstr;
	}

	public long getArrdatetimeonlong() {
		return arrdatetimeonlong;
	}

	public void setArrdatetimeonlong(long arrdatetimeonlong) {
		this.arrdatetimeonlong = arrdatetimeonlong;
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
	
	public String getCommentsinternal() {
		return commentsinternal;
	}
	
	public void setCommentsinternal(String commentsinternal) {
		this.commentsinternal = commentsinternal;
	}
	
	public String getCommentsexternal() {
		return commentsexternal;
	}
	
	public void setCommentsexternal(String commentsexternal) {
		this.commentsexternal = commentsexternal;
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
	
	public long getActivityendtimelong() {
		return activityendtimelong;
	}

	public void setActivityendtimelong(long activityendtimelong) {
		this.activityendtimelong = activityendtimelong;
	}
	
	public long getActivityendtimelongpair() {
		return activityendtimelongpair;
	}

	public void setActivityendtimelongpair(long activityendtimelongpair) {
		this.activityendtimelongpair = activityendtimelongpair;
	}

	public long getActivitystarttimelongpair() {
		return activitystarttimelongpair;
	}
	
	public void setActivitystarttimelongpair(long activitystartimelongpair) {
		this.activitystarttimelongpair = activitystartimelongpair;		
	}	
	
	public void setType(int type) {
		this.type = type;
	}
		
	public int getType() {
		return type=0; // always the case
	}		

	public void setMasterorindradio(String masterorindradio) {
		this.masterorindradio = masterorindradio;
	}
		
	public String getMasterorindradio() {
		return masterorindradio;
	}		
	
	public void setEventdrop(short eventdrop) {
		this.eventdrop = eventdrop;
	}
		
	public short getEventdrop() {
		return eventdrop;
	}		

	
	public List<String> getTravelmodelist () {
		return this.travelmodelist;
	}
		
	public void setTravelmodelist (List<String> travelmodelist) {
		this.travelmodelist = travelmodelist;
	}

	public void setVesselnopikupdrp(String vesselnopikupdrp) {
		this.vesselnopikupdrp = vesselnopikupdrp;
		
	}
	
	public String getVesselnopikupdrp() {
		return vesselnopikupdrp;
		
	}	
	
	// Comparator methods
	public static Comparator<HotelActivityEntity> ActivityByIdComparator 
                          = new Comparator<HotelActivityEntity>() {
 
		@Override
		public int compare(HotelActivityEntity tae1, HotelActivityEntity tae2) {
  
			//ascending order
			return tae1.compareToActivityid(tae2.getActivityid());
 	    }
 
	};	

	public int compareToActivityid(int compareActivityid) { 
		//ascending order
		return this.activityid - compareActivityid; 
	}
	
	public static Comparator<HotelActivityEntity> ActivityByTimeLongComparator 
	    = new Comparator<HotelActivityEntity>() {
	
		@Override
		public int compare(HotelActivityEntity tae1, HotelActivityEntity tae2) {
		
			//ascending order
			return tae1.compareToTimeLong(tae2.getActivitystarttimelong());
		}

	};

	protected int compareToTimeLong(long activitystarttimelong) {
		// TODO Auto-generated method stub
		return (int) (this.getActivitystarttimelong() - activitystarttimelong); 
	}

	@Override
	public int compareTo(HotelActivityEntity o) {
		// TODO Auto-generated method stub
		return 0;
	}


}
