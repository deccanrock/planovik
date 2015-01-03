package com.deccanrock.planovik.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

@Entity
@Table(name="vrf_organization")
public class OrgEntity
{
	// Columns
	@Column(name="orgid")
	@GeneratedValue
	private String orgid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="shortname")
	private String shortname;
	
	@Column(name="ip")
	private String ip;
	
	@Column(name="regcode")
	private String regcode;
	
	@Column(name="regcodeissuingauthority")
	private String regcodeissuingauthority;
	
	@Column(name="isocountrycode")
	private String isocountrycode;

	private String countryname="India"; // default
	
	@Column(name="logosealloc")
	private String logosealloc;
	
	@Column(name="addrstreet1")
	private String addrstreet1;
	
	@Column(name="addrstreet2")
	private String addrstreet2;
	
	@Column(name="addrcitytown")
	private String addrcitytown;
	
	@Column(name="addrdistrict")
	private String addrdistrict;
	
	@Column(name="addrstateprovrgn")
	private String addrstateprovrgn;
	
	@Column(name="addrpostalcode")
	private String addrpostalcode;
	
	@Column(name="addrhomeurl")
	private String addrhomeurl;
	
	// contact_name = contacttitle + contact_firstname + contact_lastname
	private String contacttitle;
	
	private String contactfname;
	private String contactlname;
	
	@Column(name="contactname")
	private String contactname;
	
	// Copy contact_phone data on initial signup to contact_phoneoffice, contact_phonemobile
	private String contactphone;
	
	@Column(name="contactphoneoffice")
	private String contactphoneoffice;
	
	@Column(name="contactphonemobile")
	private String contactphonemobile;
	
	@Column(name="contactemail")
	private String contactemail;
	
	@Column(name="contactip")
	private String contactip;
	
	@Column(name="contactdesignation")
	private String contactdesignation;
	
	@Column(name="type")
	private String type;
	
	@Column(name="subtype")
	private String subtype;
	
	@Column(name="status")
	private String status;
	
	@Column(name="vrfreqcnt")
	private Integer vrfreqcnt;
	
	@Column(name="vrfproccnt")
	private Integer vrfproccnt;
	
	@Column(name="alrtpendingcnt")
	private Integer alrtpendingcnt;
	
	@Column(name="msgsunrdcnt")
	private Integer msgsunrdcnt;
	
	@Column(name="accntbal")
	private Float accntbal;
	
	@Column(name="payoutbal")
	private Float payoutbal;
	
	@Column(name="payoutdate")
	private Date payoutdate;
	
	@Column(name="payoutdatelocal")
	private Date payoutdatelocal;

	@Column(name="tzoffset")
	private Short tzoffset;
	
	private String localtoutcoff;
	
	@Column(name="datecreated")
	private Date datecreated;
	
	private Date datecreatedlocal;
	
	@Column(name="dateupdated")
	private Date dateupdated;

	private Date dateupdatedlocal;
	
	// Labels
	private String useragreement;
	
	// Error codes
	private String regerror;
	
	// Getter-Setters
	public String getUseragreement() {
		return useragreement;
	}
	public void setUseragreement(String ua) {
		this.useragreement = ua;
	}
	
	public String getOrgid() {
		return orgid;
	}
	
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}	
	
	public String getName() {
		return name;
	}
	
	public void setName(String orgname) {
		this.name = orgname;
	}
	
	public String getShortname() {
		return shortname;
	}
	
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getRegcode() {
		return regcode;
	}
	
	public void setRegcode(String regcode) {
		this.regcode = regcode;
	}
	
	public String getRegcodeissuingauthoriry() {
		return regcodeissuingauthority;
	}
	
	public void setRegcodeissuingauthority(String regcodeissuingauthority) {
		this.regcodeissuingauthority = regcodeissuingauthority;
	}
	
	public String getIsocountrycode() {
		return isocountrycode;
	}
	
	public void setIsocountrycode(String countrycode) {
		this.isocountrycode = countrycode;
	}
	
	public String getCountryname() {
		return countryname;
	}
	
	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}
	
	public String getLogosealloc() {
		return logosealloc;
	}
	
	public void setLogosealloc(String logosealloc) {
		this.logosealloc = logosealloc;
	}
	
	public String getAddrstreet1() {
		return addrstreet1;
	}
	
	public void setAddrstreet1(String addrstreet1) {
		this.addrstreet1 = addrstreet1;
	}
	
	public String getAddrstreet2() {
		return addrstreet2;
	}
	
	public void setAddrstreet2(String addrstreet2) {
		this.addrstreet2 = addrstreet2;
	}
	
	public String getAddrcitytown() {
		return addrcitytown;
	}
	
	public void setAddrcitytown(String addrcitytown) {
		this.addrcitytown = addrcitytown;
	}
	
	public String getAddrDistrict() {
		return addrdistrict;
	}
	
	public void setAddrDistrict(String addrdistrict) {
		this.addrdistrict = addrdistrict;
	}
	
	public String getAddrStateprovrgn() {
		return addrstateprovrgn;
	}
	
	public void setAddrStateprovrgn(String addrstateprovrgn) {
		this.addrstateprovrgn = addrstateprovrgn;
	}
	
	public String getAddrPostalcode() {
		return addrpostalcode;
	}
	
	public void setAddrPostalcode(String addrpostalcode) {
		this.addrpostalcode = addrpostalcode;
	}
	
	public String getAddrhomeurl() {
		return addrhomeurl;
	}
	
	public void setAddrhomeurl(String addrhomeurl) {
		this.addrpostalcode = addrhomeurl;
	}
	
	public String getContactname() {
		return contactname;
	}
	
	public void setContactname(String contactname) {
		this.contactname = contactname;
	}
	
	public String getContacttitle() {
		return contacttitle;
	}
	
	public void setContacttitle(String title) {
		this.contacttitle = title;
	}
	
	public String getContactphoneoffice() {
		return contactphoneoffice;
	}
	
	public void setContactphoneoffice(String contactphoneoffice) {
		this.contactphoneoffice = contactphoneoffice;
	}
	
	public String getContactphonemobile() {
		return contactphonemobile;
	}
	
	public void setContactphonemobile(String contactphonemobile) {
		this.contactphonemobile = contactphonemobile;
	}
	
	public String getContactfname() {
		return contactfname;
	}
	
	public void setContactfname(String firstname) {
		this.contactfname = firstname;
	}
	
	public String getContactlname() {
		return contactlname;
	}
	
	public void setContactlname(String name) {
		this.contactlname = name;
	}
	
	public String getContactemail() {
		return contactemail;
	}
	
	public void setContactemail(String email) {
		this.contactemail = email;
	}
	
	public String getContactdesignation() {
		return contactdesignation;
	}
	
	public void setContactdesignation(String designation) {
		this.contactdesignation = designation;
	}
	
	public String getContactphone() {
		return contactphone;
	}
	
	public void setContactphone(String phone) {
		this.contactphone = phone;
	}
	
	public String getContactip() {
		return contactip;
	}
	
	public void setContactip(String contactip) {
		this.contactip = contactip;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getSubtype() {
		return subtype;
	}
	
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Integer getVrfreqcnt() {
		return vrfreqcnt;
	}
	
	public void setVrfreqcnt(Integer vrfreqcnt) {
		this.vrfreqcnt = vrfreqcnt;
	}
	
	public Integer getVrfproccnt() {
		return vrfproccnt;
	}
	
	public void setVrfproccnt(Integer vrfproccnt) {
		this.vrfproccnt = vrfproccnt;
	}
	
	public Integer getAlrtpendingcnt() {
		return alrtpendingcnt;
	}
	
	public void setAlrtpendingcnt(Integer alrtpendingcnt) {
		this.alrtpendingcnt = alrtpendingcnt;
	}
	
	public Integer getMsgsunrdcnt() {
		return msgsunrdcnt;
	}
	
	public void setMsgsunrdcnt(Integer msgsunrdcnt) {
		this.msgsunrdcnt = msgsunrdcnt;
	}
	
	public Float getAccntbal() {
		return accntbal;
	}
	
	public void setAccntbal(Float accntbal) {
		this.accntbal = accntbal;
	}
	
	public Float getPayoutbal() {
		return payoutbal;
	}
	
	public void setPayoutbal(Float payoutbal) {
		this.payoutbal = payoutbal;
	}

	public Date getPayoutdate() {
		return payoutdate;
	}
	
	public void setPayoutdate(Date payoutdate) {
		this.payoutdate = payoutdate;
	}
	
	public Date getPayoutdatelocal() {
		return payoutdatelocal;
	}
	
	public void setPayoutdatelocal(Date payoutdatelocal) {
		this.payoutdatelocal = payoutdatelocal;
	}

	public Short getTzoffset() {
		return tzoffset;
	}
	
	public void setTzoffset(Short tminutes) {
		this.tzoffset = tminutes;
	}
	
	
	public String getLocaltoutcoff() {
		return localtoutcoff;
	}
	
	public void setLocaltoutcoff(String minutes) {
		this.localtoutcoff = minutes;
	}

	
	public Date getDatecreated() {
		return datecreated;
	}
	
	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	
	public Date getDatecreatedlocal() {
		return datecreatedlocal;
	}
	
	public void setDatecreatedlocal(Date datecreatedlocal) {
		this.datecreatedlocal = datecreatedlocal;
	}
	
	public Date getDateupdated() {
		return dateupdated;
	}
	
	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}
	
	public Date getDateupdatedlocal() {
		return dateupdatedlocal;
	}
	
	public void setDateupdatedlocal(Date dateupdatedlocal) {
		this.dateupdatedlocal = dateupdatedlocal;
	}
	
	public String getRegError() {
		return regerror;
	}
	
	public void setRegError(String regerror) {
		this.regerror = regerror;
	}	
}