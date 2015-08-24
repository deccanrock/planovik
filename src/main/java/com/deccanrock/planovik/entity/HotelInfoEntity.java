package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class HotelInfoEntity {
	// Columns
    @Column(name="id")    
    @GeneratedValue
    private Integer id;
        
    @Column(name="citycode")    
	private String citycode;

    @Column(name="cityname")    
	private String cityname;

    @Column(name="hotel")    
    private String hotel;    

    @Column(name="hotelstar")    
    private String hotelstar;    

    @Column(name="ourrating")    
    private String ourrating;    
    
    @Column(name="room")    
	private String room;
    
    @Column(name="fromdate")    
	private String fromdate;
    
    @Column(name="todate")
    private String todate;
    
    @Column(name="operdays")
    private String operdays;

    @Column(name="convcode")
    private String convcode;
    
    @Column(name="grp")
    private String grp;
    
    @Column(name="epsngl")
    private String epsngl;    
    
    @Column(name="epdbl")    
    private String epdbl;    

    @Column(name="cpsngl")
    private String cpsngl;    
    
    @Column(name="cpdbl")    
    private String cpdbl;    

    @Column(name="mapsngl")
    private String mapsngl;    
    
    @Column(name="mapdbl")    
    private String mapdbl;    

    @Column(name="apsngl")
    private String apsngl;    
    
    @Column(name="apdbl")    
    private String apdbl;    

    @Column(name="eb")    
    private String eb;    

    @Column(name="mealbf")    
    private String mealbf;    
    
    @Column(name="mealln")    
    private String mealln;    

    @Column(name="mealdn")    
    private String mealdn;    

    @Column(name="jpsngl")
    private String jpsngl;    
    
    @Column(name="jpdbl")    
    private String jpdbl;    

    @Column(name="mjpsngl")
    private String mjpsngl;    
    
    @Column(name="mjpdbl")    
    private String mjpdbl;    
    
    @Column(name="spnoting")    
    private String spnoting;    

    @Column(name="currcode")    
    private String currcode;    

    @Column(name="rate")    
    private String rate;    

    @Column(name="misc")    
    private String misc;    

    @Column(name="aisngl")
    private String aisngl;    
    
    @Column(name="aidbl")    
    private String aidbl;    

    @Column(name="notitle1")    
    private String notitle1;    

    @Column(name="notitle2")    
    private String notitle2;    

    @Column(name="notitle3")    
    private String notitle3;    

    @Column(name="datecreated")    
	private  Date datecreated;

	private  long datecreatedlong;
    
    // Getter-Setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
				
	public String getCitycode() {
		return citycode;
	}

	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}
		
	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}
	
	public String getHotelstar() {
		return hotelstar;
	}

	public void setHotelstar(String hotelstar) {
		this.hotelstar = hotelstar;
	}
	
	public String getOurrating() {
		return ourrating;
	}

	public void setOurrating(String ourrating) {
		this.ourrating = ourrating;
	}
	
	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}
	
	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	
	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}
	
	public String getOperdays() {
		return this.operdays;
	}
	
	public void setOperdays(String operdays) {
		this.operdays = operdays;
	}
	
	public String getConvcode() {
		return this.convcode;
	}
	
	public void setConvcode(String convcode) {
		this.convcode = convcode;
	}
		
	public String getGrp() {
		return grp;
	}
	
	public void setGrp(String grp) {
		this.grp = grp;
	}

	public String getEpsngl() {
		return epsngl;
	}
	
	public void setEpsngl(String epsngl) {
		this.epsngl = epsngl;
	}

	public String getEpdbl() {
		return epdbl;
	}
	
	public void setEpdbl(String epdbl) {
		this.epdbl = epdbl;
	}

	public String getCpsngl() {
		return cpsngl;
	}
	
	public void setCpsngl(String cpsngl) {
		this.cpsngl = cpsngl;
	}

	public String getCpdbl() {
		return cpdbl;
	}
	
	public void setCpdbl(String cpdbl) {
		this.cpdbl = cpdbl;
	}

	public String getMapsngl() {
		return mapsngl;
	}
	
	public void setMapsngl(String mapsngl) {
		this.mapsngl = mapsngl;
	}

	public String getMapdbl() {
		return mapdbl;
	}
	
	public void setMapdbl(String mapdbl) {
		this.mapdbl = mapdbl;
	}
	
	public String getApsngl() {
		return apsngl;
	}
	
	public void setApsngl(String apsngl) {
		this.apsngl = apsngl;
	}

	public String getApdbl() {
		return apdbl;
	}
	
	public void setApdbl(String apdbl) {
		this.apdbl = apdbl;
	}

	public String getEb() {
		return eb;
	}
	
	public void setEb(String eb) {
		this.eb = eb;
	}

	public String getMealbf() {
		return mealbf;
	}
	
	public void setMealbf(String mealbf) {
		this.mealbf = mealbf;
	}

	public String getMealln() {
		return mealln;
	}
	
	public void setMealln(String mealln) {
		this.mealln = mealln;
	}

	public String getMealdn() {
		return mealdn;
	}
	
	public void setMealdn(String mealdn) {
		this.mealdn = mealdn;
	}

	public void setJpsngl(String jpsngl) {
		this.jpsngl = jpsngl;
	}

	public String getJpsngl() {
		return jpsngl;
	}
	
	public void setJpdbl(String jpdbl) {
		this.jpdbl = jpdbl;
	}

	public String getJpdbl() {
		return jpdbl;
	}

	public void setMjpsngl(String mjpsngl) {
		this.mjpsngl = mjpsngl;
	}

	public String getMjpsngl() {
		return mjpsngl;
	}

	public void setMjpdbl(String mjpdbl) {
		this.mjpdbl = mjpdbl;
	}

	public String getMjpdbl() {
		return mjpdbl;
	}

	public void setSpnoting(String spnoting) {
		this.spnoting = spnoting;
	}

	public String getSpnoting() {
		return spnoting;
	}

	public void setCurrcode(String currcode) {
		this.currcode = currcode;
	}

	public String getCurrcode() {
		return currcode;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getRate() {
		return rate;
	}

	public void setMisc(String misc) {
		this.misc = misc;
	}

	public String getMisc() {
		return misc;
	}
	
	public void setAisngl(String aisngl) {
		this.aisngl = aisngl;
	}

	public String getAisngl() {
		return aisngl;
	}

	public void setAidbl(String aidbl) {
		this.aidbl = aidbl;
	}

	public String getAidbl() {
		return aidbl;
	}
	
	public void setNotitle1(String notitle1) {
		this.notitle1 = notitle1;
	}

	public String getNotitle1() {
		return notitle1;
	}

	public void setNotitle2(String notitle2) {
		this.notitle2 = notitle2;
	}

	public String getNotitle2() {
		return notitle2;
	}

	public void setNotitle3(String notitle3) {
		this.notitle3 = notitle3;
	}

	public String getNotitle3() {
		return notitle3;
	}

	public Date getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	public long getDatecreatedlong() {
		return datecreatedlong;
	}

	public void setDatecreatedlong(long datecreatedlong) {
		this.datecreatedlong = datecreatedlong;
	}
	
}
