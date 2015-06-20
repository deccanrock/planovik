package com.deccanrock.planovik.location;
 
import javax.persistence.Column;
 
public class ISOCountryPhone {
 
	@Column(name="isoname")	
	private String isoname;
	@Column(name="isocode2")	
	private String isocode2;
	@Column(name="isocode3")	
	private String isocode3;
	@Column(name="dialcode")	
	private String dialcode;
	
	public String getIsoname() {
		return isoname;
	}
	
	public void setIsoname(String isoname) {
		this.isoname = isoname;
	}
		
	public String getIsocode2() {
		return isocode2;
	}
	
	public void setIsocode2(String isocode2) {
		this.isocode2 = isocode2;
	}

	public String getIsocode3() {
		return isocode3;
	}
	
	public void setIsocode3(String isocode3) {
		this.isocode3 = isocode3;
	}
	
	public String getDialcode() {
		return dialcode;
	}
	
	public void setDialcode(String dialcode) {
		this.dialcode = dialcode;
	}
		 
}