package com.deccanrock.planovik.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.validation.BindingResult;

import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.OrgEntityDAO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;


/**
 * Handles all requests for Organization and User level signup's
 */
@Controller
public class AdminController {
	
	@Autowired
	MaxLocationBO locationBO;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "/app/admin/manageusers", method = RequestMethod.GET)
	public String signupform(HttpServletRequest request, ModelMap map) {
		final String userIPAddress = request.getRemoteAddr();
		
		request.setAttribute("title", "Planovik Admin - Manage Users");
		request.setAttribute("header", "Manage Users");
		
		// For Testing
		MaxLocation location = locationBO.getLocation("66.249.69.52");
		// MaxLocation location = locationBO.getLocation(userIPAddress);
		String phonecode = "+91";
		if (location.getCountryCode().equals("IN"))
			phonecode = "+91"; // Hard code for now, read off country - phone code table
        map.addAttribute("phonecode", phonecode);	
		
        UserEntity user = new UserEntity();    
        map.addAttribute("user", user);	
		return "app/admin/manageusers";
	}
	
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@RequestMapping(value = "/app/admin/manageusersform", method = RequestMethod.POST)
    public String signupupprocess(@ModelAttribute(value="user") UserEntity user, Model map, HttpServletRequest request) {

		logger.info("Manager Users Process Form");
		
		request.setAttribute("title", "Planovik Admin Manage User");
		if (user.getMode().equals("Create"))
			request.setAttribute("header", "Manage Users - Create");
		else
			request.setAttribute("header", "Manage Users - Edit");
			
		map.addAttribute("phonecode", "+91");	
		
		// Save model to database
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		
		UserEntity dbUser = UED.GetUser(user.getUsername());
		
		if ( dbUser!=null && user.getMode().equals("Create")) {
			String error = "User with email: " + user.getUsername() + " already exists!";
			map.addAttribute("error", error);
		}
		
		if ( dbUser==null && user.getMode().equals("Create")) {
			map.addAttribute("user", user);
			((ClassPathXmlApplicationContext) context).close();		
			return "app/admin/manageusersform";
		}
		
		if ( dbUser==null && (user.getMode().equals("Edit") || user.getMode().equals("Disable"))) {
			String error = "User with email: " + user.getUsername() + " not found!";
			map.addAttribute("error", error);
		}

		if ( dbUser!=null && (user.getMode().equals("Edit"))) {
			dbUser.setMode("Edit");
			map.addAttribute("user", dbUser);
			((ClassPathXmlApplicationContext) context).close();		
			return "app/admin/manageusersform";
		}

		if ( dbUser!=null && (user.getMode().equals("Disable"))) {
			UED.DeleteUser(user.getUsername());
			String msg = "User with email: " + user.getUsername() + " was successfully disabled.";
			map.addAttribute("msg", msg);
		}

		((ClassPathXmlApplicationContext) context).close();		
		return "app/admin/manageusers";
	}
		
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@RequestMapping(value = "/app/admin/manageusers", method = RequestMethod.POST)
    public String signupshowform(@ModelAttribute(value="user") UserEntity user, HttpServletRequest request, BindingResult result, Model map) {
		
		logger.info("Manager Users Show Form");
		
		request.setAttribute("title", "Planovik Signup - Confirmation");		
		
		user.setFullname(user.getFullname());
		user.setUsername(user.getUsername());
		user.setPass(user.getPass());
		user.setPhone(user.getPhone());
		user.setDesignation(user.getDesignation());
		user.setLevel(user.getLevel());
		user.setMode(user.getMode());
		user.setTzoffset(user.getTzoffset());
		// Record admin who created/edited/modifyed
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user.setCreatedbyemail(loggeduser.getUsername());
		user.setReportstoemail(user.getReportstoemail());
		
		// Save model to database
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");	
		String dbresult = UED.ManageUser(user);

		if (dbresult.matches("Success"))
			map.addAttribute("msg", "User manage operation was successful!");
		else
			map.addAttribute("error", dbresult);
			
		((ClassPathXmlApplicationContext) context).close();
		return "app/admin/manageusers";
	}
		
}
