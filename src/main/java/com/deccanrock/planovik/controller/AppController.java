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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.codehaus.jackson.map.ObjectMapper;

import com.deccanrock.planovik.entity.ActivityMasterEntity;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.entity.RentalActivityEntity;
import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.entity.TasksEntity;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.ActivityMasterDAO;
import com.deccanrock.planovik.service.dao.ItineraryEntityDAO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
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
	private String username;
	
	// TODO - Beef up logger details to catch more admin user info
	
    @RequestMapping(value = "/app/**", method = RequestMethod.GET)
    public String adminDash(ModelMap map, HttpServletRequest request) {
		logger.info(" Zone");

		if (!IsUserLoggedIn(map))
    		return "app/login";
        
        // map.addAttribute("admin", new AdminEntity());
		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");
		map.addAttribute("adminname", username);
		String adminphoto = "/resources/avatars/" + username + ".jpg";
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
			UserName();		
			map.addAttribute("adminname", username);
			map.addAttribute("msg", "Hi " + username 
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
		
        UserName();		
		map.addAttribute("adminname", username);
		String adminphoto = "/resources/avatars/" + username + ".jpg";
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

        UserName();		
		map.addAttribute("adminname", username);
		String adminphoto = "/resources/avatars/" + username + ".jpg";
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
    	logger.info("Manage Tasks - GET");
    	

		if (!IsUserLoggedIn(map))
    		return "app/login";

		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");
		
        UserName();		
		map.addAttribute("adminname", username);
		String adminphoto = "/resources/avatars/" + username + ".jpg";
		map.addAttribute("adminphoto", adminphoto); 
		
		ItineraryEntity itinerary = new ItineraryEntity();
        map.addAttribute("itinerary", itinerary);	
		    	    	    	
		return "app/manage";	
    }
    
	
    // Hook for jqGrid ('Manage'), Set Session variables and manage tab
    @RequestMapping(value = "/app/manage", method = RequestMethod.POST)    
    public String manageItinerary(@ModelAttribute(value="itinerary") ItineraryEntity itinerary, ModelMap map, HttpServletRequest request) {
   
    	// This is ajax support function for JQGrid
    	logger.info("Itinerary Manage - POST");

		if (!IsUserLoggedIn(map))
    		return "app/login";
		
		request.setAttribute("title", "Planovik Manage Itinerary");
		if (itinerary.getMode().equals("Create"))
			request.setAttribute("header", "Manage Itinerary - Create");
		else
			request.setAttribute("header", "Manage Itinerary - Edit");
			
		map.addAttribute("phonecode", "+91");	
		
		// Save model to database
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");
		
		// Record admin who created/edited/modifyed
		itinerary.setLastupdatedbyemail(username);
		
		ItineraryEntity itinerarydb = null;
		if ( itinerary.getMode().equals("Create")) {
			// Create new itinerary and display form
			itinerary.setCreatedbyemail(username);
			itinerarydb = IED.CreateItinerary(itinerary);
			map.addAttribute("itinerary", itinerarydb);

			if (itinerarydb.getError().equals("Duplicate") == true) {
				String errDup = "Itinerary: " + "\'" + itinerarydb.getName() + "\'" + " already exists! Edit that itinerary instead."; 
				map.addAttribute("error", errDup);				
				((ClassPathXmlApplicationContext) context).close();		
				return "app/manage";
			}
			
			// Have to find a better way to do this
			itinerarydb.setArrivalcity("");
			itinerarydb.setDepcity("");
			itinerarydb.setConvcode(1);
			itinerarydb.setConvcodestr("");
			itinerarydb.setEnddatestr("");
			itinerarydb.setStartdatestr("");
			itinerarydb.setGrouphead("");
			itinerarydb.setQuotecurrencystr("");
			itinerarydb.setQuotecurrency("");

			if (itinerarydb.getError().equals("Success") == false)
				map.addAttribute("error", itinerarydb.getError());				
		}
		else {	// assume edit
			// Check if lookahead or edit request from itineraries tab or search
			if (itinerary.getId() == 0) {
				// Assume manual edit/lookahead
				int index = itinerary.getName().indexOf('-')-1;
				if (index != 0) {// lookahead type contains id string
					int itinnum = Integer.parseInt(itinerary.getName().substring(0, index));
					itinerarydb = IED.GetItinerary(itinnum);
				}
			}
			else
				itinerarydb = IED.GetItinerary(itinerary.getId());
			
			map.addAttribute("itinerary", itinerarydb);
		}

		((ClassPathXmlApplicationContext) context).close();		
		return "app/itinerarymanage";
    	    	    	    	
    }
    
    
    // Hook for jqGrid ('Manage'), Set Session variables and manage tab
    @RequestMapping(value = "/app/manage/save", method = RequestMethod.POST)    
    public String manageSaveItinerary(@ModelAttribute(value="itinerary") ItineraryEntity itinerary, ModelMap map, HttpServletRequest request) {
   
    	// This is ajax support function for JQGrid
    	logger.info("Itinerary Manage Save - POST");
		if (!IsUserLoggedIn(map))
    		return "app/login";
    	
		request.setAttribute("title", "Planovik Save Itinerary");
		if (itinerary.getMode().equals("Create"))
			request.setAttribute("header", "Manage Itinerary - Create");
		else
			request.setAttribute("header", "Manage Itinerary - Edit");
			
		
		// Save model to database
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");
		
		// Check for Currency code and conversion code
		if (itinerary.getQuotecurrencystr().contains(" - ")) {
			String quotecurr = itinerary.getQuotecurrencystr().substring(0, itinerary.getQuotecurrencystr().indexOf('-')-1);
			itinerary.setQuotecurrency(quotecurr);
		}
		
		if (itinerary.getConvcodestr().contains(" - ")) {
			// Value is from typeahead
			int convcode = Integer.parseInt(itinerary.getConvcodestr().substring(0, itinerary.getConvcodestr().indexOf('-')-1));
			itinerary.setConvcode(convcode);
		}
		
		// Record admin who created/edited/modifyed
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		itinerary.setLastupdatedbyemail(loggeduser.getUsername());
		
		ItineraryEntity itinerarydb = null;
		
		itinerarydb = IED.SaveItinerary(itinerary);
		map.addAttribute("itinerary", itinerarydb);

		// Get master activity for the itinerary
		ActivityMasterEntity ame = IED.GetActivityMaster(itinerarydb);
		ame.setItinnum(itinerarydb.getId());
		ame.setStatus(itinerarydb.getStatus());
		ame.setVersion(itinerarydb.getVersion());
		map.addAttribute("activitymaster", ame);
		
		TravelActivityEntity TAE = new TravelActivityEntity();
		RentalActivityEntity RAE = new RentalActivityEntity();

		map.addAttribute("travelactivity", TAE);
		map.addAttribute("rentalactivity", RAE);
		
		((ClassPathXmlApplicationContext) context).close();		
		return "app/activitymanage";
    	    	    	    	
    }
    
    
    @RequestMapping(value = "/app/createcurrconvcode", method = RequestMethod.GET)    
    public @ResponseBody String createCurrConvCode(ServletResponse response, @RequestParam(value = "fromcurr") String fromcurr, @RequestParam(value = "tocurr") String tocurr,
    		@RequestParam(value = "unitrate") String unitrate) 	throws IOException {
   
    	// This is ajax support function for JQGrid
    	logger.info("Create Currency Conversion Code");
    	
		// Check for Currency code and conversion code
		if (fromcurr.contains(" - ")) {
			fromcurr = fromcurr.substring(0, fromcurr.indexOf('-')-1);
		}
		    	
		if (tocurr.contains(" - ")) {
			tocurr = tocurr.substring(0, tocurr.indexOf('-')-1);
		}
    	
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		String convcode = IED.CreateCurrConvCode(fromcurr, tocurr, Float.parseFloat(unitrate));
		((ClassPathXmlApplicationContext) context).close();	
				
		return convcode;
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
	@RequestMapping(value = "/app/getItinList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getItinList(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Get Itinerary List");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> itinList = IED.GetItinList(query);
		((ClassPathXmlApplicationContext) context).close();

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(itinList); 
		response.setContentType("application/json");	
				
		return jsonOut;
	}
	
	/**
	 * Typeahead support
	 */
	@RequestMapping(value = "/app/getISOCurrList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getCurrList(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Get Currency List");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> isocurrlist = IED.GetISOCurrList(query);
		((ClassPathXmlApplicationContext) context).close();

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(isocurrlist); 
		response.setContentType("application/json");	
				
		return jsonOut;
	}
	

	/**
	 * Typeahead support
	 */
	@RequestMapping(value = "/app/getCurrConvCodes", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getCurrConvCodes(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Get Currency Conversion Codes");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> isocurrlist = IED.GetCurrConvCodes(query);
		((ClassPathXmlApplicationContext) context).close();

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(isocurrlist); 
		response.setContentType("application/json");	
				
		return jsonOut;
	}
	
	
	
	@RequestMapping(value = "/app/activity/getactivitycodes", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getActivityCodes(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Get Activity Codes");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ActivityMasterDAO AMD = (ActivityMasterDAO)context.getBean("ActivityMasterDAO");	
		List<String> activitycodelist = AMD.GetActivityCodes(query);
		((ClassPathXmlApplicationContext) context).close();

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(activitycodelist); 
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
    
        UserName();
        if (username == null || username == "anonymousUser") {
        	// User not logged in, redirect to login
    		map.addAttribute("title", "Planovik - Login Required!");
    		map.addAttribute("header", "User Login");
    		return false;
        }
        
        return true;
    }
    
    private void UserName () {
    	User activeUser;
    	
    	Object userObj = null;
		try {
	    	userObj =  SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}
		catch (Exception ex) {
			userObj = null;
		}
		    	
    	
    	if (userObj==null || userObj.toString() == "anonymousUser")
    		return;
    	
            activeUser = (User) userObj;
            username = activeUser.getUsername();    		
    }
}
