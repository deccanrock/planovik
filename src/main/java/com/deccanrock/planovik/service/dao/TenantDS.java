package com.deccanrock.planovik.service.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.deccanrock.planovik.entity.TenantEntity;

public class TenantDS {
	
	private String tenantName;
	// At this point tenant domain should be available within application context 
	public TenantDS () {
		
		// Get Task records from database
		HttpServletRequest curRequest = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		tenantName = curRequest.getServerName();
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		OrgEntityDAO OED = (OrgEntityDAO)context.getBean("OrgEntityDAO");	
		TenantEntity tenantDet = OED.GetTenant(tenantName);
		((ClassPathXmlApplicationContext) context).close();		
	}
}
