package com.deccanrock.planovik.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


@Entity

public class ServiceProviderEntity {
	// Columns
    @Column(name="id")    
    @GeneratedValue
    private Integer id;
        
    @Column(name="name")    
	private String name;

    // For Airlines only
    @Column(name="iatacode")    
	private String iatacode;

    // For Hotels (this is star rating)
    // For Others this is a measure of performance
    @Column(name="rating")    
    private Integer rating;    

    @Column(name="city")    
	private String city;
    
    @Column(name="country")    
	private String country;
    
    @Column(name="contactname")
    private String contactname;
    
    @Column(name="contactemail")
    private String contactemail;

    @Column(name="contactphone")
    private String contactphone;
    
    @Column(name="contactwebsite")
    private String contactwebsite;

    // For Airlines only
    @Column(name="fullservice")    
    private Integer fullservice;    
    
    @Column(name="domesticonly")    
    private Integer domesticonly;    
    
    // For transport, intercity, city transfers only
    // 0=city transfers, 1=intercity
    @Column(name="coverage")    
    private Integer coverage;
    
    // For Other services only
    @Column(name="desc")
    private String desc;    
    
    @Column(name="addlinfo")    
    private String addlinfo;    

    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
            
    @Column(name="createdby")    
    private String createdby;

    @Column(name="updatedby")    
    private String updatedby;
    
    // 0=Airlines, 1=Hotels, 2=Transport, 3=Other
    private short type;
    
    private String typestr;
    
    private List<String> types;
    
    private String mode;
        
    // Getter-Setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
		
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
		
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getContactname() {
		return contactname;
	}

	public void setContactname(String contactname) {
		this.contactname = contactname;
	}
	
	public String getContactphone() {
		return contactphone;
	}

	public void setContactphone(String contactphone) {
		this.contactphone = contactphone;
	}
	
	public String getContactemail() {
		return contactemail;
	}

	public void setContactemail(String contactemail) {
		this.contactemail = contactemail;
	}
	
	public String getContactwebsite() {
		return contactwebsite;
	}

	public void setContactwebsite(String contactwebsite) {
		this.contactwebsite = contactwebsite;
	}
	
	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	public String getMode() {
		return this.mode;
	}
	
	public void setMode(String mode) {
		this.mode = mode;
	}
	

	public Integer getFullservice() {
		return fullservice;
	}

	public void setFullservice(Integer fullservice) {
		this.fullservice = fullservice;
	}
	
	public Integer getDomesticonly() {
		return domesticonly;
	}

	public void setDomesticonly(Integer domesticonly) {
		this.domesticonly = domesticonly;
	}
	
	public short getType() {
		return type;
	}

	public void setType(short type) {
		this.type = type;
	}

	public Integer getCoverage() {
		return coverage;
	}

	public void setCoverage(Integer coverage) {
		this.coverage = coverage;
	}
		
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getAddlinfo() {
		return addlinfo;
	}
	
	public void setAddlinfo(String addlinfo) {
		this.addlinfo = addlinfo;
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
	
    public void setUpdatedby(String username) {
    	this.updatedby = username;
    }

    public String getUpdatedby() {
    	return updatedby;
    }	
    
    public void setCreatedby(String username) {
    	this.createdby = username;
    }

    public String getCreatedby() {
    	return createdby;
    }
    
	public List<String> getTypes() {
		return types;
	}

	public void setTypes(List<String> list) {
		this.types = list;
	}	
	
	public String getTypestr() {
		return typestr;
	}
	
	public void setTypestr(String typestr) {
		this.typestr = typestr;
	}

}
