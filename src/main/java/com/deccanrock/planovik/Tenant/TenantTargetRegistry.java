package com.deccanrock.planovik.Tenant;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.util.Assert;

import com.deccanrock.planovik.entity.TenantEntity;

public class TenantTargetRegistry implements TargetRegistry<DataSource> {
	
	private Map<String, DataSource> map = new ConcurrentHashMap<String, DataSource>();

	@Override
	public DataSource getTarget(TenantEntity intenant) {
		//TenantEntity tenant = ContextHolder.getTenant();

		Assert.notNull(intenant, "Tenant was not set.");
		String key = String.valueOf(intenant.getDomainname());
		DataSource dataSource = null;
		
		// Check if intenant is different from current tenant, if yes then get new data source and set in map
		if (map.containsKey(key))
			synchronized (this) {
				dataSource = map.get(key);
			}
		
		else {	
			dataSource = getDataSource(intenant.getDsusername(), intenant.getDspassword(), intenant.getDsurl());
			synchronized (this) {
				map.put(key, dataSource);
			}
		}
		
		return dataSource;
	}

	private DataSource getDataSource(String username, String password,
			String url) {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		dataSource.setUrl(url);
		return dataSource;
	}

	@Override
	public Boolean IsTenantInMap(String domainname) {
		if (map.containsKey(domainname))
			return true;
		return false;
	}

}