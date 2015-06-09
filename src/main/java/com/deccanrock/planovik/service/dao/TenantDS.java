package com.deccanrock.planovik.service.dao;

import javax.sql.DataSource;

import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.Tenant.TenantTargetRegistry;


public class TenantDS {
	
	public static DataSource setTenantDataSource (DataSource datasource) {
		
	    // Change data source based on tenant or default to main
		if (TenantContextHolder.getTenant() == null)
			return datasource;
		else {
			// If datasouce is set to null, safe to assume, we need main DB
			TenantTargetRegistry ttr = new TenantTargetRegistry();
			DataSource ds = ttr.getTarget(TenantContextHolder.getTenant());
			return ds;
		}		
	}
}
