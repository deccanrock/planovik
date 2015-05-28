package com.deccanrock.planovik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.deccanrock.planovik.Tenant.ContextHolder;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.service.dao.TenantEntityDAO;
import com.deccanrock.planovik.service.utils.UriHandler;

@Component
public class RequestInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		// Set datasource context based on domain name in request uri
		String domain = UriHandler.getTenantName(request.getRequestURL().toString());		

		if (domain.equalsIgnoreCase("127.0.0.1") || domain.equalsIgnoreCase("localhost"))
			return true;
		
		// Default is www
		if (domain.equalsIgnoreCase(""))
			domain = "www";		

		//if (ContextHolder.getTenant().getDomainname().contentEquals(domain))
		//	return true;
		
		// Get tenant object for the domain and send to context holder
		// This will hit DB, but a concurrent map object that is maintained should be accessed
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		TenantEntityDAO TED = (TenantEntityDAO)context.getBean("TenantEntityDAO");	
		TenantEntity tenant = TED.GetTenant(domain.toString());
		
		if (tenant == null)
			return true; // Main DS should be used
		
		ContextHolder.setTenant(tenant);
		return true;
	
	}
}