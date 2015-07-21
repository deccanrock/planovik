package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.location.CountryPostalCode;

public interface ITenantEntityDAO {
	
 	public String RegisterTenant(TenantEntity tenant)  throws IOException, SQLException;
	public boolean TenantExists(String tenantDesc) throws IOException, SQLException;
	TenantEntity GetTenant(String domain, int infotype) throws IOException, SQLException;
	List<CountryPostalCode> GetPCDetailsForCntry(String addrPostalCode, String addrCountryCode) throws IOException, SQLException;
	String UpdateTenant(TenantEntity tenant) throws IOException, SQLException;
	void SetRegStatus(int tenantid, int value) throws IOException, SQLException;
	String VerifyPin(Short pin, int tenantid) throws IOException, SQLException;
	TenantEntity TenantLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException;
}