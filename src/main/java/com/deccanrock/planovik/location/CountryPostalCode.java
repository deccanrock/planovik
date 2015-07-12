package com.deccanrock.planovik.location;
 
public class CountryPostalCode {
 
	// ISO 2 digit ("IN", "UK, "US", ...)
	private String countrycode;
	
	private String postalcode;

	private String city;
	
	private String district;
	
	private String stateregion;
	
	private String cityarea;
	
	public String getCountrycode() {
		return countrycode;
	}
	
	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}
		
	public String getPostalcode() {
		return postalcode;
	}
	
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getDistrict() {
		return district;
	}
	
	public void setDistrict(String district) {
		this.district = district;
	}
	
	public String getStateregion() {
		return stateregion;
	}
	
	public void setStateregion(String stateregion) {
		this.stateregion = stateregion;
	}

	public String getCityarea() {
		return cityarea;
	}

	public void setCityarea(String cityarea) {
		this.cityarea = cityarea;
	}
		 
}