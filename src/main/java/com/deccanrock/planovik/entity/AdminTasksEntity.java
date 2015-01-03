package com.deccanrock.planovik.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

@Entity
@Table(name="vrf_admin_tasks") // DB=verifyed_admin
public class AdminTasksEntity {
	
	@Column(name="id")
	@GeneratedValue	
	private int id;

	@Column(name="subid")
	private int subid;

	private String orgidname;
	
	private String code;
	
	private int assigned;
	
	private String status;
	
	@Column(name="remarks")	
	private String remarks;
		

	private Date lastupdate;
	
	// From jqGrid (values='edit', 'delete')
	private String oper;
	
	public void setId(int id) {
	      this.id = id;
	}
		
	public int getId() {
	      return id;
	}

	public void setSubid(int subid) {
		this.subid = subid;
	}
	
	public int getSubid() {
		return subid;
	}	
	
	public void setOrgidname(String orgidname) {
		this.orgidname = orgidname;
	}
	
	public String getOrgidname() {
		return orgidname;
	}	

	
	public void setCode(String code) {
		this.code = code;
	}
		
	public String getCode() {
		return code;
	}

	public void setAssigned(int assigned) {
		this.assigned = assigned;
	}
		
	public int getAssigned() {
		return assigned;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
		
	public String getStatus() {
		return status;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRemarks() {
		return remarks;
	}
	
	public Date getLastupdate() {
		return lastupdate;
	}
	
	public void setLastupdate(Date lastupdate) {
		this.lastupdate = lastupdate;
	}
	
	public void setOper(String oper) {
		this.oper = oper;
	}

	public String getOper() {
		return oper;
	}	

}