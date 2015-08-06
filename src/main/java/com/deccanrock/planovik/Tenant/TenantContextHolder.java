package com.deccanrock.planovik.Tenant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ehcache.Element;

import org.springframework.util.Assert;

import com.deccanrock.planovik.controller.AppCtxtProv;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.dao.TenantEntityDAO;
import com.deccanrock.planovik.service.utils.CacheService;
import com.deccanrock.planovik.service.utils.UriHandler;

public class TenantContextHolder {

   private static final ThreadLocal<TenantEntity> tenantcontextHolder = 
            new ThreadLocal<TenantEntity>();

   public static void setTenant(TenantEntity tenant ) {
      Assert.notNull(tenant, "Tenant cannot be null");
      tenantcontextHolder.set(tenant);
   }

   public static TenantEntity getTenant() {
	  if (tenantcontextHolder == null)
		  return null;
      return (TenantEntity) tenantcontextHolder.get();
   }

   public static void clearContext() {
	   tenantcontextHolder.remove();
   }
   
   public static void setTenantFromRequestURL(HttpServletRequest request, HttpServletResponse response) {
		
	   	// Set datasource context based on domain name in request uri
		String tenant = UriHandler.getTenantName(request.getRequestURL().toString());		
		if (tenant.equalsIgnoreCase("127.0.0.1") || tenant.equalsIgnoreCase("localhost"))
			tenant = "www";
		
		// Default is www
		if (tenant.equalsIgnoreCase(""))
			tenant = "www";		
		 
		// If current tenant context is same current tenant return
		if (TenantContextHolder.getTenant() != null && TenantContextHolder.getTenant().getTenantname().equalsIgnoreCase(tenant))
			return;
		
		CacheService cs = (CacheService) AppCtxtProv.getApplicationContext().getBean("cacheservice");
		Element tenantele = cs.getCache().get(tenant);
		
		TenantEntity te = null;
		if (tenantele != null) {
			te = (TenantEntity) tenantele.getObjectValue();
			TenantContextHolder.setTenant(te);
			tenant = te.getTenantname();
		}
		else {
			// This will hit DB
			TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");
			te = TED.GetTenant(tenant,1);
			if (te != null) {
				cs.getCache().put(new Element(tenant, te));				
				TenantContextHolder.setTenant(te);
				tenant = te.getTenantname();
			}
			else {
					// No matching tenant found, default to www
					tenantele = cs.getCache().get("www");
					TenantContextHolder.setTenant((TenantEntity) tenantele.getObjectValue());
					tenant = "www";			
			}
		}
		
        HttpSession session = request.getSession(true);
        if(session!=null) {
        	// Set tenant information
        	session.setAttribute("tenantid" , te.getTenantid());
        	session.setAttribute("tenantname" , te.getTenantname());
        	// Stuff remaining in cache for access till tenant is active
        	CacheService CS = (CacheService)AppCtxtProv.getApplicationContext().getBean("cacheservice");
        	CS.getCache().put(new Element(te.getTenantname(), te));
        }		
		
   }

}