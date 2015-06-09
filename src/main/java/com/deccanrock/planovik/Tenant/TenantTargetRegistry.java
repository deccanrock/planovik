package com.deccanrock.planovik.Tenant;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.naming.NamingException;
import javax.sql.DataSource;
import org.springframework.jndi.JndiTemplate;
import org.springframework.util.Assert;

import com.deccanrock.planovik.entity.TenantEntity;

public class TenantTargetRegistry implements TargetRegistry<DataSource> {
	
	private Map<String, DataSource> map = new ConcurrentHashMap<String, DataSource>();

	@Override
	public DataSource getTarget(TenantEntity intenant) {
		//TenantEntity tenant = ContextHolder.getTenant();

		Assert.notNull(intenant, "Tenant was not set.");
		String key = String.valueOf(intenant.getTenantname());
		DataSource dataSource = null;
		
		// Check if intenant is different from current tenant, if yes then get new data source and set in map
		if (map.containsKey(key))
			synchronized (this) {
				dataSource = map.get(key);
			}
		
		else {	
			dataSource = getDataSource(intenant.getDatastore());
			synchronized (this) {
				map.put(key, dataSource);
			}
		}
		
		return dataSource;
	}

	private DataSource getDataSource(String datastore) {
		// BasicDataSource dataSource = new BasicDataSource();
		// dataSource.setUsername(username);
		// dataSource.setPassword(password);
		// dataSource.setUrl(url);
	    JndiTemplate jndiTemplate = new JndiTemplate();
	    DataSource dataSource = null;
		try {
			dataSource = (DataSource) jndiTemplate.lookup("java:comp/env/jdbc/" + datastore);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataSource;
	}

	@Override
	public Boolean IsTenantInMap(String tenantname) {
		if (map.containsKey(tenantname))
			return true;
		return false;
	}

}