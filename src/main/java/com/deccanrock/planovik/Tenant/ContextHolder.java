package com.deccanrock.planovik.Tenant;

import org.springframework.util.Assert;
import com.deccanrock.planovik.entity.TenantEntity;

public class ContextHolder {

   private static final ThreadLocal<TenantEntity> contextHolder = 
            new ThreadLocal<TenantEntity>();

   public static void setTenant(TenantEntity tenant ) {
      Assert.notNull(tenant, "Tenant cannot be null");
      contextHolder.set(tenant);
   }

   public static TenantEntity getTenant() {
      return (TenantEntity) contextHolder.get();
   }

   public static void clearContext() {
      contextHolder.remove();
   }

}