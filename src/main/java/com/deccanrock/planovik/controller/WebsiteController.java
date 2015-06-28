package com.deccanrock.planovik.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.location.ISOCountryPhone;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBOImpl;
import com.deccanrock.planovik.service.dao.TenantEntityDAO;


/**
 * Handles all requests for Planovik Main website (www.planovik.com)
 */
@Controller
public class WebsiteController {
		
	private static final Logger logger = LoggerFactory.getLogger(WebsiteController.class);
	

	/**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)	
    public @ResponseBody String registerForm(HttpServletRequest request, ModelMap map,
    		@RequestParam(value = "tenantdesc") String tenantDesc, @RequestParam(value = "contactname") String contactName,
    		@RequestParam(value = "contactemail") String email, @RequestParam(value = "contactphonemobile") String contactPhoneMobile,
    		@RequestParam(value = "tzoffset") short tzoffset) {
		
		logger.info("New Tenant Registration");
		final String userIPAddress = request.getRemoteAddr();

		TenantEntity tenant = new TenantEntity();
		tenant.setTenantdesc(tenantDesc); // Here Tenant Name is complete tenant company name
		tenant.setContactname(contactName);
		tenant.setContactemail(email);
		tenant.setContactphonemobile(contactPhoneMobile);
		tenant.setTzoffset(tzoffset);
		tenant.setRegip(userIPAddress);
		
		// Save model to database
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");		
		String result = TED.RegisterTenant(tenant);
				
		return result;
	}	
		
	/**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/phonecode", method = RequestMethod.GET)	
    public @ResponseBody String getPhoneCode(HttpServletRequest request, ModelMap map) {
		
		logger.info("Phonecode");
		String userIPAddress = request.getRemoteAddr();
		
		// Get country dial code
		MaxLocationBOImpl locobj = new MaxLocationBOImpl();
		
		// * For Testing ONLY *
		// userIPAddress = "67.228.221.19";
		// userIPAddress = "123.176.40.18";

		String cc = "";
		if (userIPAddress.contentEquals("127.0.0.1")) // localhost
			cc = "IN";
		else {
			MaxLocation location = locobj.getLocation(userIPAddress);
			cc = location.getCountryCode();
		}
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");		
		ISOCountryPhone isocntryph = TED.GetInfoForISOCode(cc);
				
		return "+" + isocntryph.getDialcode();
	}	

	/**
	 * Check if tenant already exists
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/checktenantdesc", method = RequestMethod.GET)	
	public @ResponseBody String checkTenantDesc(@RequestParam(value = "tenantdesc") String tenantDesc) {
		logger.info("Check Tenant Desc");

		ApplicationContext context = AppCtxtProv.getApplicationContext();
		TenantEntityDAO TED = (TenantEntityDAO)context.getBean("TenantEntityDAO");
		// This should be changed to memcached
		if (TED.TenantExists(tenantDesc))
			return "exists";
		else
			return "none";
	}	
	
}
