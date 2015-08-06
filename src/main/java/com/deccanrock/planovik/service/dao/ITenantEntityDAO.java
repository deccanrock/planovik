package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;

import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.entity.TenantEntity;

public interface ITenantEntityDAO {
	
	public String TenantExists(String tenantInfo, boolean isDesc) throws IOException, SQLException;
	TenantEntity GetTenant(String domain, int infotype) throws IOException, SQLException;
	String UpdateTenant(TenantEntity tenant) throws IOException, SQLException;
	void SetStatus(int tenantid, int value) throws IOException, SQLException;
	String VerifyPin(Short pin, int tenantid) throws IOException, SQLException;
	String GetTenantName(String parameter) throws IOException, SQLException;
	String CreateTenant(String tenantdesc, AccountEntity account, String regIPAddress, short tenanttype, 
			short billingplan, AccountEntity ae) throws IOException, SQLException;
}