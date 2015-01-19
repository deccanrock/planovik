package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.entity.TenantEntity;

public interface IOrgEntityDAO {
	
	Map<String, Object> createOrg( OrgEntity org) throws IOException, SQLException;
	boolean OrgExists( String orgname) throws IOException, SQLException;
	OrgEntity GetOrgDetails( String orgidname) throws IOException, SQLException;
	TenantEntity GetTenant(String tenantName) throws IOException, SQLException;
}