package com.deccanrock.planovik.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;

@Entity

public class ActivityCodesEntity
{
	// Columns    
    @Column(name="code")    
	private String code;
  
    @Column(name="description")    
	private String description;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
        

    // Getter-Setters
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

}
