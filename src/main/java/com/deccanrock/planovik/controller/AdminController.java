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
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.validation.BindingResult;

import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBO;
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

	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
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
	@RequestMapping(value = "/admin/manageusersform", method = RequestMethod.POST)
    public String signupupprocess(@ModelAttribute(value="user") UserEntity user, Model map, HttpServletRequest request) {

		logger.info("Manager Users Process Form");
		
		request.setAttribute("title", "Planovik Admin Manage User");
		if (user.getMode().equals("Create"))
			request.setAttribute("header", "Manage Users - Create");
		else
			request.setAttribute("header", "Manage Users - Edit");
			
		map.addAttribute("phonecode", "+91");	
		
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		
		UserEntity dbUser = UED.GetUser(user.getUsername());
		PlnvkConstants constants = new PlnvkConstants();
		
		boolean isError = false;
		
		if ( dbUser!=null && user.getMode().equals("Create")) {
			String error = "User: " + user.getUsername() + " already exists!";
			map.addAttribute("error", error);
			isError = true;
		}
		
		// Error if account is disabled
		if ( dbUser!=null && user.getMode().equals("Edit") && dbUser.isEnabled()==false) {
			String error = "User account: " + user.getUsername() + " is permanently disabled!";
			map.addAttribute("error", error);
			isError = true;
		}
		
		if ( dbUser==null && (user.getMode().equals("Edit"))) {
			String error = "User: " + user.getUsername() + " not found!";
			map.addAttribute("error", error);
			isError = true;
		}
		
		if (isError)
			return "admin/index";			

		if ( dbUser!=null && (user.getMode().equals("Disable"))) {
			UED.DeleteUser(user.getUsername());
			String msg = "User: " + user.getUsername() + " was successfully disabled.";
			map.addAttribute("msg", msg);
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
		//user.setReportstousername(loggeduser.getUsername());
		
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");	
		String dbresult = UED.ManageUser(user);

		if (dbresult.matches("Success"))
			map.addAttribute("msg", "User manage operation was successful!");
		else
			map.addAttribute("error", dbresult);
			
		return "admin/index";
	}
		
}
