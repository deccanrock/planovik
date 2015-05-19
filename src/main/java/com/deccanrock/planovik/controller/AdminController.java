package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.validation.BindingResult;

import com.deccanrock.planovik.entity.ServiceProviderEntity;
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.ServiceProviderDAO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
import com.deccanrock.planovik.constants.PlnvkConstants;

/**
 * Handles all requests for Organization and User level signup's
 */
@Controller
public class AdminController {
	
	@Autowired
	MaxLocationBO locationBO;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/** TO-DO **/
	// Need to investigate why null parameter gets appended	
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = {"/admin/index", "/admin/null"}, method = RequestMethod.GET)
	public String appAdmin(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
		final String userIPAddress = request.getRemoteAddr();
		
		request.setAttribute("title", "Planovik Admin - Home");
		request.setAttribute("header", "Admin Home");
		
		// For Testing
		MaxLocation location = locationBO.getLocation("66.249.69.52");
		// MaxLocation location = locationBO.getLocation(userIPAddress);
		String phonecode = "+91";
		if (location.getCountryCode().equals("IN"))
			phonecode = "+91"; // Hard code for now, read off country - phone code table
        map.addAttribute("phonecode", phonecode);	
        
        UserEntity user = new UserEntity();    
        map.addAttribute("user", user);
        
        ServiceProviderEntity SPE = new ServiceProviderEntity();
		PlnvkConstants pc = new PlnvkConstants();
		SPE.setTypes(pc.getServicetype());
        map.addAttribute("serviceprovider", SPE);
		
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		
        return "admin/index";
    
    }	
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = "/admin/manageservicesform", method = RequestMethod.POST)
    public String servicesprocessform(@ModelAttribute(value="serviceprovider") ServiceProviderEntity serviceprovider, Model map, HttpServletRequest request) {

		logger.info("Manager Services Process Form");
		
		request.setAttribute("title", "Planovik Admin Manage Service");
		
		if (serviceprovider.getMode().equals("Create"))
			request.setAttribute("header", "Manage Services - Create");
		else
			request.setAttribute("header", "Manage Services - Edit");
			
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		

		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");
		
		// This is required as admin form contains both user and service management
		UserEntity user = new UserEntity();
		map.addAttribute("user", user);
		
		boolean isError = false;
		// Set the type
		PlnvkConstants constants = new PlnvkConstants();
		serviceprovider.setType((short)constants.getServiceIndex(serviceprovider.getTypestr()));		
		ServiceProviderEntity dbServiceProvider = SPD.GetService(serviceprovider.getServicename(), serviceprovider.getType());
		
		
		if ( dbServiceProvider!=null && serviceprovider.getMode().equals("Create")) {
			String error = "Service: " + serviceprovider.getServicename() + " already exists!";
			map.addAttribute("serviceerror", error);
			isError = true;
		}
		
		if ( dbServiceProvider==null && (serviceprovider.getMode().equals("Edit"))) {
			String error = "Service: " + serviceprovider.getServicename() + " not found!";
			map.addAttribute("serviceerror", error);
			isError = true;
		}
		
		if (isError)
			return "admin/index";			
		
		if ( dbServiceProvider==null && serviceprovider.getMode().equals("Create")) {
			map.addAttribute("serviceprovider", serviceprovider);
		}
		
		if ( dbServiceProvider!=null && (dbServiceProvider.getMode().equals("Edit"))) {
			dbServiceProvider.setMode("Edit");
			map.addAttribute("serviceprovider", dbServiceProvider);
		}
		
		return "admin/manageservicesform";
	}
			
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = "/admin/manageservices", method = RequestMethod.POST)
    public String manageservices(@ModelAttribute(value="serviceprovider") ServiceProviderEntity serviceprovider, HttpServletRequest request, Model map) {
		
		logger.info("Manage Services");
		
		request.setAttribute("title", "Planovik Signup - Confirmation");		
		
		// Record admin who created/edited/modifyed
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		serviceprovider.setCreatedby(loggeduser.getUsername());
		serviceprovider.setUpdatedby(loggeduser.getUsername());
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		
		// This is required as admin form contains both user and service management
		UserEntity user = new UserEntity();
		map.addAttribute("user", user);
		
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");	
		String dbresult = SPD.ManageService(serviceprovider);
		PlnvkConstants pc = new PlnvkConstants();
		serviceprovider.setTypes(pc.getServicetype());

		if (dbresult.matches("Success")) {
			map.addAttribute("servicemsg", "Service manage operation was successful!");
			return "admin/index";
		}
		else {
			map.addAttribute("serviceerror", dbresult);
			return "admin/manageservicesform";
		}

	}
		
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = "/admin/manageusersform", method = RequestMethod.POST)
    public String signupupprocess(@ModelAttribute(value="user") UserEntity user, Model map, HttpServletRequest request) {

		logger.info("Manager Users Process Form");
		
		request.setAttribute("title", "Planovik Admin - Home");
		request.setAttribute("header", "Admin Home");	
				
		request.setAttribute("title", "Planovik Admin Manage User");
		if (user.getMode().equals("Create"))
			request.setAttribute("header", "Manage Users - Create");
		else
			request.setAttribute("header", "Manage Users - Edit");
			
		map.addAttribute("phonecode", "+91");	
		
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);

		// This is required as admin form contains both user and service management
		ServiceProviderEntity spe = new ServiceProviderEntity();
		map.addAttribute("serviceprovider", spe);

		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		
		UserEntity dbUser = UED.GetUser(user.getUsername());
		PlnvkConstants constants = new PlnvkConstants();
		
		boolean isError = false;
		
		if ( dbUser!=null && user.getMode().equals("Create")) {
			String error = "User: " + user.getUsername() + " already exists!";
			map.addAttribute("usererror", error);
			isError = true;
		}
		
		// Error if account is disabled
		if ( dbUser!=null && user.getMode().equals("Edit") && dbUser.isEnabled()==false) {
			String error = "User account: " + user.getUsername() + " is permanently disabled!";
			map.addAttribute("usererror", error);
			isError = true;
		}
		
		if ( dbUser==null && (user.getMode().equals("Edit"))) {
			String error = "User: " + user.getUsername() + " not found!";
			map.addAttribute("usererror", error);
			isError = true;
		}
		
		if (isError)
			return "admin/index";			

		if ( dbUser!=null && (user.getMode().equals("Disable"))) {
			UED.DeleteUser(user.getUsername());
			String msg = "User: " + user.getUsername() + " was successfully disabled.";
			map.addAttribute("usermsg", msg);
			return "admin/index";
		}
		
		if ( dbUser==null && user.getMode().equals("Create")) {
			user.setRolelist(constants.getUserRoles());
			map.addAttribute("user", user);
		}
		
		if ( dbUser!=null && (user.getMode().equals("Edit"))) {
			dbUser.setMode("Edit");
			dbUser.setRolelist(constants.getUserRoles());
			map.addAttribute("user", dbUser);
		}

		return "admin/manageusersform";
	}
		
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = "/admin/manageusers", method = RequestMethod.POST)
    public String signupshowform(@ModelAttribute(value="user") UserEntity user, HttpServletRequest request, BindingResult result, Model map) {
		
		logger.info("Manager Users Show Form");
		
		request.setAttribute("title", "Planovik Signup - Confirmation");		
		
		//user.setFullname(user.getFullname());
		//user.setUsername(user.getUsername());
		//user.setPass(user.getPass());
		//user.setPhone(user.getPhone());
		//user.setDesignation(user.getDesignation());
		//user.setRole(user.getLevel());
		//user.setMode(user.getMode());
		//user.setTzoffset(user.getTzoffset());
		// Record admin who created/edited/modifyed
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user.setCreatedbyusername(loggeduser.getUsername());
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		//user.setReportstousername(loggeduser.getUsername());

		// This is required as admin form contains both user and service management
		ServiceProviderEntity spe = new ServiceProviderEntity();
		map.addAttribute("serviceprovider", spe);
		
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");	
		String dbresult = UED.ManageUser(user);

		if (dbresult.matches("Success"))
			map.addAttribute("usermsg", "User manage operation was successful!");
		else
			map.addAttribute("usererror", dbresult);
			
		return "admin/index";
	}
		
}
