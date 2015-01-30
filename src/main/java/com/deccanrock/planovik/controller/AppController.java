package com.deccanrock.planovik.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.codehaus.jackson.map.ObjectMapper;

import com.deccanrock.planovik.entity.TasksEntity;
import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
import com.deccanrock.planovik.service.dao.OrgEntityDAO;
import com.deccanrock.planovik.service.utils.UriHandler;

/**
 * Handles all requests for Organization Admin Users and functions
 */
@Controller
public class AppController {
	
	@Autowired
	MaxLocationBO locationBO;

    public class adminTasksGridData {
        public int totalpages;
        public int currpage;
        public int totalrecords;
        public List<TasksEntity> rows;
        
    	@Override
    	public String toString() {
    		return "adminTasksGridData [totalpages=" + totalpages + ", currpage=" + currpage + ", " +
    				"totalrecords=" + totalrecords + "rows=" + rows + "]";
    	}        
    }		
		
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	private String adminname;
	
	// TODO - Beef up logger details to catch more admin user info
	
    @RequestMapping(value = "/app/**", method = RequestMethod.GET)
    public String adminDash(ModelMap map) {
		logger.info(" Zone");

		if (!IsUserLoggedIn(map))
    		return "app/login";
        
        // map.addAttribute("admin", new AdminEntity());
		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");
		map.addAttribute("adminname", adminname);
		String adminphoto = "/resources/avatars/" + adminname + ".jpg";
		map.addAttribute("adminphoto", adminphoto);
		// map.addAttribute("admintaskList", adminManager.getAllPending());
 
        return "app/dash";
    }
    
    
	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(ModelMap map) {

		if (!IsUserLoggedIn(map)) {
			map.addAttribute("msg", "You do not have permission to access this page!");	
		} else {
			UserName(map);		
			map.addAttribute("adminname", adminname);
			map.addAttribute("msg", "Hi " + adminname 
			+ ", you do not have permission to access this page!");

		}
 
		return "app/admin403";
 
	}    

    @RequestMapping(value = "/app/dash", method = RequestMethod.GET)
    public String Dash(ModelMap map) {
		logger.info("Dash");    	

		if (!IsUserLoggedIn(map))
    		return "admin/login";
		
		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");
		
        UserName(map);		
		map.addAttribute("adminname", adminname);
		String adminphoto = "/resources/avatars/" + adminname + ".jpg";
		map.addAttribute("adminphoto", adminphoto);
		
		return "app/dash";
    }
     
    @RequestMapping(value = "/app/tasks", method = RequestMethod.GET)
    public String Manage(ModelMap map) {
		logger.info("Tasks");    	
		
		if (!IsUserLoggedIn(map))
    		return "app/login";
		
		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");

        UserName(map);		
		map.addAttribute("adminname", adminname);
		String adminphoto = "/resources/avatars/" + adminname + ".jpg";
		map.addAttribute("adminphoto", adminphoto);
		
		// Get Task records from database
		
		return "app/tasks";
    }
    
    // Hook for jqGrid (Edit's and Delete's)
    @RequestMapping(value = "/app/tasks/edit", method = RequestMethod.POST, 
    		consumes = {"application/x-www-form-urlencoded; charset=utf-8"}, 
    		produces = "application/json")    
    public @ResponseBody String update(@RequestBody String inString) {
    	// This is ajax support function for JQGrid
    	logger.info("Edit Admin Tasks");
    	
    	try {
			Map<String, String> modelMap = UriHandler.Decode(inString);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
		return "OK:OK";	
    }

    // Read session variables and build the page
    @RequestMapping(value = "/app/manage", method = RequestMethod.GET)    
    public String manageOrgGet(ModelMap map, HttpSession session) throws IOException {

    	// This is ajax support function for JQGrid
    	logger.info("Manage Admin Tasks - GET");
    	

		if (!IsUserLoggedIn(map))
    		return "app/login";

		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");
		
        UserName(map);		
		map.addAttribute("adminname", adminname);
		String adminphoto = "/resources/avatars/" + adminname + ".jpg";
		map.addAttribute("adminphoto", adminphoto); 
		
		String params = null;
		if (session.getAttribute("manageparams") != null) { // manage request from tasks pane
			params = session.getAttribute("manageparams").toString();
			Map<String, String> modelMap = null;
	    	try {
				modelMap = UriHandler.Decode(params);
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	// Set session value to null as required information is available
	    	session.setAttribute("manageparams", null);
	    	if (modelMap != null) {
	    		map.addAttribute("orgidname", modelMap.get("orgidname"));
	    		// Get all org related data to be displayed on page
				// Get Task records from database
				ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
				OrgEntityDAO OED = (OrgEntityDAO)context.getBean("OrgEntityDAO");	
				OrgEntity org = OED.GetOrgDetails(modelMap.get("orgidname"));    				
	    		map.addAttribute("orgdetails", org);    					    	
				((ClassPathXmlApplicationContext) context).close();	
	    	}
		}
		    	    	    	
		return "app/manage";	
    }
    
	
    // Hook for jqGrid ('Manage'), Set Session variables and manage tab
    @RequestMapping(value = "/app/tasks/manage", method = RequestMethod.POST,
    		consumes = {"application/x-www-form-urlencoded; charset=utf-8"})    
    public String managePost(@RequestBody String inString, HttpSession session, HttpServletRequest request) {

    	// This is ajax support function for JQGrid
    	logger.info("Manage Admin Tasks - POST");
    			
		session.setAttribute("manageparams", inString);
		
		if (inString.contains("ispost")) {
			// Safe to assume request for regular form post, redirect
			String targetURL = request.getContextPath() + "/app/manage";
			return "redirect:" + targetURL;
		}
    	    	    	    	
		return "app/manage";	
    }
    
    
    @RequestMapping(value = "/app/login", method = RequestMethod.GET)
    public String login(ModelMap map,
    		@RequestParam(value = "error", required = false) String error,
    		@RequestParam(value = "logout", required = false) String logout)
    {
		logger.info("Admin Login");    	
		map.addAttribute("title", "Verifyed Admin - Login Required!");
		map.addAttribute("header", "Admin Login");

		if (error != null) {
			map.addAttribute("error", "Invalid username and password!");
		}
 
		if (logout != null) {
			map.addAttribute("msg", "You've been logged out successfully.");
		}
				
		return "app/login";
    }
 
    @RequestMapping(value = "/app/denied", method = RequestMethod.GET)
    public String loginerror(ModelMap map) {
		logger.info("Admin access denied");    	
        map.addAttribute("error", "true");
		map.addAttribute("title", "Verifyed Admin - Access Denied!");        
		map.addAttribute("header", "Admin Access Denied!");
		return "app/denied";
    }
 
    @RequestMapping(value = "/app/logout", method = RequestMethod.POST)
    public String logout(HttpServletResponse resp, ModelMap map) {
		logger.info("Admin logout");    	
    	map.addAttribute("title", "Verifyed Admin - Logged out!");  	
		map.addAttribute("header", "Admin Log Out");
		
		
		 resp.setHeader("Expires", "Tue, 03 Jul 2001 06:00:00 GMT");
	     resp.setHeader("Last-Modified", new Date().toString());
	     resp.setHeader("Cache-Control", "no-cache");
	     resp.setHeader("Pragma", "no-cache"); 
		return "app/logoutsuccess";
    }
      
	/**
	 * Typeahead support
	 */
	@RequestMapping(value = "/app/getOrgList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getOrgList(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Admin Get Org List");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO AED = (UserEntityDAO)context.getBean("UserEntityDAO");	
		List<String> orgList = AED.GetOrgList(query);
		((ClassPathXmlApplicationContext) context).close();

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(orgList); 
		response.setContentType("application/json");	
				
		return jsonOut;
	}
	
	/**
	 * Check if email exists
	 * All lookahead code should be refactored into a caching layer
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/app/checkusername", method = RequestMethod.GET)
	public @ResponseBody String checkUserName(@RequestParam(value = "username") String userName) {
		logger.info("Check User Name");

		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		((ClassPathXmlApplicationContext) context).close();
		// This should be changed to memcached
		if (UED.UserExists(userName))
			return "exists";
		else
			return "none";
	}	
    
    private boolean IsUserLoggedIn(ModelMap map) {
    
        UserName(map);
        if (adminname == null || adminname == "anonymousUser") {
        	// User not logged in, redirect to login
    		map.addAttribute("title", "Verifyed Admin - Login Required!");
    		map.addAttribute("header", "Admin Login");
    		return false;
        }
        
        return true;
    }
    
    private void UserName (ModelMap map) {
    	User activeUser;
    	Object userObj =  SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (userObj.toString() == "anonymousUser")
    		return;
    	
    	if (userObj != null) {
            activeUser = (User) userObj;
            adminname = activeUser.getUsername();    		
    	}
    }
}
