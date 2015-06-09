package com.deccanrock.planovik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.deccanrock.planovik.Tenant.TenantContextHolder;

@Component
public class RequestInterceptor extends HandlerInterceptorAdapter {
	
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		// Set datasource context based on domain name in request uri
		TenantContextHolder.setTenantFromRequestURL(request, response);
		return true;
	}
	
}