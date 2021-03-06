package com.deccanrock.planovik.service.dao;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import com.deccanrock.planovik.Tenant.TenantContextHolder;

public class TenantRoutingDataSource extends AbstractRoutingDataSource {

   @Override
   protected Object determineCurrentLookupKey() {
      return TenantContextHolder.getTenant();
   }
}