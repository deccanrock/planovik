package com.deccanrock.planovik.service.dao;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import com.deccanrock.planovik.Tenant.ContextHolder;

public class TenantRoutingDataSource extends AbstractRoutingDataSource {

   @Override
   protected Object determineCurrentLookupKey() {
      return ContextHolder.getTenant();
   }
}