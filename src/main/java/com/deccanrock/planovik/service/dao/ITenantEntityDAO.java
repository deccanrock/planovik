package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;

import com.deccanrock.planovik.entity.TenantEntity;

public interface ITenantEntityDAO {
	
 	public TenantEntity GetTenant(String tenantName) throws IOException, SQLException;
}