package com.deccanrock.planovik.controller;

import java.net.URISyntaxException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.validation.BindingResult;

import com.deccanrock.planovik.entity.AdminTasksEntity;
import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.OrgEntityDAO;


/**
 * Handles all requests for Organization and User level signup's
 */
@Controller
public class SignupController {
	
	@Autowired
	MaxLocationBO locationBO;
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	/**
	 * Renders Signup page for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupShowForm(HttpServletRequest request, ModelMap map) {
		logger.info("Organization Initial Signup form");
		
		final String userIPAddress = request.getRemoteAddr();
		
		request.setAttribute("title", "Verifyed Signup - Welcome");
		
		// For Testing
		MaxLocation location = locationBO.getLocation("66.249.69.52");
		// MaxLocation location = locationBO.getLocation(userIPAddress);
		String phonecode = "+91";
		if (location.getCountryCode().equals("IN"))
			phonecode = "+91"; // Hard code for now, read off country - phone code table
        map.addAttribute("phonecode", phonecode);	
		
        OrgEntity organization = new OrgEntity();    
        map.addAttribute("organization", organization);	
		return "signup";
	}
	
	/**
	 * Renders Signup page for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signupProcessForm(@ModelAttribute(value="organization") OrgEntity org, HttpServletRequest request, BindingResult result, Model map) {
		logger.info("Organization Signup Post received");
		final String userIPAddress = request.getRemoteAddr();
		
		request.setAttribute("title", "Verifyed Signup - Confirmation");		
		
		org.setContactip(userIPAddress);
		org.setIsocountrycode("IN");
		org.setContactphonemobile(org.getContactphone());
		org.setContactphoneoffice(org.getContactphone());
		// Save model to database
		
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		OrgEntityDAO OED = (OrgEntityDAO)context.getBean("OrgEntityDAO");	
		Map<String, Object> dbresult = OED.createOrg(org);
		if (dbresult.get("regerror") != null) {
			// Error
			org.setRegError(dbresult.get("regerror").toString());
		}
		org.setOrgid(dbresult.get("organizationid").toString());
		map.addAttribute("org", org);
		
		((ClassPathXmlApplicationContext) context).close();
		return "signup_confirm";
	}	

    @RequestMapping(value = "/signup/edit", method = RequestMethod.POST, consumes = "application/json; charset=utf-8")    
    public String update(@RequestBody AdminTasksEntity admintask) {
    	// This is ajax support function for JQGrid
    	logger.info("Edit Admin Tasks");    	
		return "OK";	
    }
    	
	
	
	/**
	 * Renders Signup page for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/checkorgname", method = RequestMethod.GET)
	public @ResponseBody String checkOrgName(@RequestParam(value = "orgname") String orgName) {
		logger.info("Check Organization Name");

		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		OrgEntityDAO OED = (OrgEntityDAO)context.getBean("OrgEntityDAO");
		((ClassPathXmlApplicationContext) context).close();
		// This should be changed to memcached
		if (OED.OrgExists(orgName))
			return "exists";
		else
			return "none";
	}	
	
}
