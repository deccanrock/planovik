package com.deccanrock.planovik.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import org.springframework.security.core.GrantedAuthority;

@Entity

public class UserEntity
{
	// Columns
    @Column(name="id")    
    @GeneratedValue
    private int id;
    
    @Column(name="fullname")    
	private String fullname;
  
    // Like an alias
    @Column(name="username")    
	private String username;

    @Column(name="pass")    
	private String pass;
    
    @Column(name="phone")    
	private String phone;
    
    // engineer, manager, supervisor, team lead...
    @Column(name="designation")    
	private String designation;
    
    @Column(name="reportsto")    
	private String reportsto;
    
    @Column(name="createdby")    
	private String createdby;
    
    // L1, L2, ...
    @Column(name="level")    
	private int level;
    
    // Active, pending approval, suspended, left company, deleted
    @Column(name="status")    
	private String status;
    
    @Column(name="tzoffset")    
	private Short tzoffset;
    
    @Column(name="datecreated")    
	private  Date datecreated;

    @Column(name="dateupdated")    
	private Date dateupdated;
    
    private String mode;
    
    private String reportstoemail;
    private String createdbyemail;
    
	/* Spring Security fields*/
	private Collection<? extends GrantedAuthority> authorities;
	private boolean accountNonExpired = true;
	private boolean accountNonLocked = true;
	private boolean credentialsNonExpired = true;
	private boolean enabled = true;    
    

    // Getter-Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String shortname) {
		this.username = shortname;
	}
	
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
		
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	public String getReportsto() {
		return reportsto;
	}

	public void setReportsto(String reportsto) {
		this.reportsto = reportsto;
	}

	public String getCreatedby() {
		return createdby;
	}
	
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}
		
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Short getTzoffset() {
		return tzoffset;
	}

	public void setTzoffset(Short tminutes) {
		this.tzoffset = tminutes;
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

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}
	
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	public boolean isAccountNonExpired() {
		return this.accountNonExpired;
	}
	
	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	
	public boolean isAccountNonLocked() {
		return this.accountNonLocked;
	}
	
	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	
	public boolean isCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}
	
	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	

	public boolean isEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}		
	
	public String getMode() {
		return this.mode;
	}
	
	public void setMode(String mode) {
		this.mode = mode;
	}
	
	public String getReportstoemail() {
		return this.reportstoemail;
	}
	
	public void setReportstoemail(String email) {
		this.reportstoemail = email;
	}
	public String getCreatedbyemail() {
		return this.createdbyemail;
	}
	
	public void setCreatedbyemail(String email) {
		this.createdbyemail = email;
	}


}
