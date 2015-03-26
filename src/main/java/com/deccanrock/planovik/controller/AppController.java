package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.codehaus.jackson.map.ObjectMapper;

import com.deccanrock.planovik.entity.ActivityMasterEntity;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.entity.RentalActivityEntity;
import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.entity.TasksEntity;
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.dao.ActivityEntityDAO;
import com.deccanrock.planovik.service.dao.ActivityMasterDAO;
import com.deccanrock.planovik.service.dao.ItineraryEntityDAO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
import com.deccanrock.planovik.service.utils.UriHandler;
import com.deccanrock.planovik.service.utils.FileHandler;
import com.deccanrock.planovik.service.ActivitiesListForItinerary;

/**
 * Handles all requests for Organization general Users and functions
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
	
	
    @RequestMapping(value = "/app/**", method = RequestMethod.GET)
    public String appDash(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("Application Dash");

		if (!IsUserLoggedIn(map))
    		return "app/login";
        
        // map.addAttribute("admin", new AdminEntity());
		map.addAttribute("title", "Planovik Home");
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);

		// map.addAttribute("admintaskList", adminManager.getAllPending());
	    
	    return "app/dash";
    
    }
    
      
    @RequestMapping(value = "/app/userprofile", method = RequestMethod.GET)
    public String UserProfile(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("User Profile");

		if (!IsUserLoggedIn(map))
    		return "app/login";
        
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		
		UserEntity user = UED.GetUser(username);
		
		map.addAttribute("user", user);
		map.addAttribute("title", "Planovik User Profile");
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);

		// map.addAttribute("admintaskList", adminManager.getAllPending());
		((ClassPathXmlApplicationContext) context).close();	
	    return "app/userprofile";
    
    }
    
    // For now updates only the password, should be extended to allow any other fields to be updated
    // by users
        
	@RequestMapping(value = "/app/userprofileupdate", method = RequestMethod.POST)    
	public String UserProfileUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap map, 
								@RequestParam("id") int id,	@RequestParam("pass") String pass) {

		logger.info("User Profile Update");
		
		if (pass.isEmpty())
			return "";
		
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
		UserEntity user = UED.GetUser(username);
		
		String result;

		if (HashCode.matchPassword(pass, user.getPass())) {
			map.addAttribute("user", user);
			map.addAttribute("title", "Planovik User Profile");
			map.addAttribute("username", username);
			String userphoto = "/resources/images/avatars/" + username + ".jpg";
			map.addAttribute("userphoto", userphoto);
			map.addAttribute("error", "New and current password cannot be same!");	
			((ClassPathXmlApplicationContext) context).close();

			return "app/userprofile";						
		}
		
		// In future pass in fields and flags to see 
		result = UED.UpdateUserProfile(id, pass);

		((ClassPathXmlApplicationContext) context).close();
		if (result.contentEquals("Success")) {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			SecurityContextLogoutHandler ctxLogOut = new SecurityContextLogoutHandler();
			ctxLogOut.setInvalidateHttpSession(true);
			ctxLogOut.logout(request, response, auth);

			map.addAttribute("title", "Planovik - Login Required!");
			map.addAttribute("header", "User Login");
			map.addAttribute("msg", "Update successful! Please login with your new password.");	
			  
			return "app/login";						
		}
		else {
			map.addAttribute("user", user);
			map.addAttribute("title", "Planovik User Profile");
			map.addAttribute("username", username);
			String userphoto = "/resources/images/avatars/" + username + ".jpg";
			map.addAttribute("userphoto", userphoto);
			map.addAttribute("error", "New and current password cannot be same!");	
			((ClassPathXmlApplicationContext) context).close();
			return "app/userprofile";						
		}
	}	
	
    
    
    // for 403 access denied page
	@RequestMapping(value = "/app/error403", method = RequestMethod.GET)
	public String accesssDenied(ModelMap map) {

		if (!IsUserLoggedIn(map)) {
			map.addAttribute("msg", "You do not have permission to access this page!");	
		} else {
			UserName();		
			map.addAttribute("msg", "Hello " + username 
			+ ", you do not have permission to access this restriced page!");

		}
 
		return "app/error403";
 
	}    

    @RequestMapping(value = "/app/dash", method = RequestMethod.GET)
    public String Dash(ModelMap map) {
		logger.info("Dash");    	

		if (!IsUserLoggedIn(map))
    		return "app/login";
		
		map.addAttribute("title", "Planovik Home");
		
        UserName();		
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		
		return "app/dash";
    }
     
    @RequestMapping(value = "/app/itineraries", method = RequestMethod.GET)
    public String Manage(ModelMap map) {
		logger.info("Tasks");    	
		
		if (!IsUserLoggedIn(map))
    		return "app/login";
		
		map.addAttribute("title", "Verifyed Admin Home");
		map.addAttribute("header", "Admin Zone");

        UserName();		
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);
		
		// Get Task records from database
		
		return "app/itineraries";
    }
    
    // Hook for jqGrid (Edit's and Delete's)
    @RequestMapping(value = "/app/itineraries/edit", method = RequestMethod.POST, 
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
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto); 
		
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
			itinerary.setCreatedbyusername(username);
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
		itinerary.setCreatedbyusername(username);
		
		ActivityMasterEntity ame = null;
		// Get master activity for the itinerary since information changes on every save
		if ( itinerary.getPostbutton().contentEquals("manageitinerary")) {
			ItineraryEntity itinerarydb = null;			
			itinerarydb = IED.SaveItinerary(itinerary);
			map.addAttribute("itinerary", itinerarydb);
		
			ame = IED.GetActivityMaster(itinerarydb);
			ame.setItinnum(itinerarydb.getId());
			ame.setGroupnum(1); // set to 1 for testing
			ame.setVersion(itinerarydb.getVersion());
			ame.setTzoffset(itinerarydb.getTzoffset());
			ame.setPax(itinerarydb.getNumtravellers());
		}
		else if ( itinerary.getPostbutton().contentEquals("activity")) {
			map.addAttribute("itinerary", itinerary);

			ame = IED.GetActivityMaster(itinerary);
			ame.setItinnum(itinerary.getId());
			ame.setGroupnum(1); // set to 1 for testing
			ame.setVersion(itinerary.getVersion());
			ame.setTzoffset(itinerary.getTzoffset());
			ame.setPax(itinerary.getNumtravellers());
		}
		else if ( itinerary.getPostbutton().contentEquals("activitymaster")) {
			map.addAttribute("itinerary", itinerary);

			ame = IED.GetActivityMaster(itinerary);
			ame.setItinnum(itinerary.getId());
			ame.setGroupnum(1); // set to 1 for testing
			ame.setVersion(itinerary.getVersion());
			ame.setTzoffset(itinerary.getTzoffset());
			ame.setPax(itinerary.getNumtravellers());
		}
		
		map.addAttribute("activitymaster", ame);
		
		// Get all activities sorted day wise, heavy hitter
		ActivitiesListForItinerary ALE = new ActivitiesListForItinerary(ame.getItinnum(), ame.getVersion(), ame.getTzoffset(), itinerary.getStartdatelong());
		Object[] AL = ALE.BuildActivitiesList();
		
		map.addAttribute("activitylist", AL);
		
		TravelActivityEntity TAE = new TravelActivityEntity();
		TAE.setActivityid(0); // default to 0 should be changed at client side
		TAE.setItinnum(ame.getItinnum());
		TAE.setVersion(ame.getVersion());
		TAE.setTzoffset(ame.getTzoffset());
		TAE.setPax(ame.getPax());

		RentalActivityEntity RAE = new RentalActivityEntity();

		map.addAttribute("travelactivity", TAE);
		map.addAttribute("rentalactivity", RAE);

		((ClassPathXmlApplicationContext) context).close();		
		// return "app/activitymanage";
		return "app/activitymanagecal";    	    	    	    	
    }
    
    
    // Read session variables and build the page
    @RequestMapping(value = "/app/manage/travelactivitymanage", method = RequestMethod.GET)    
    public String travelActivityManage(ModelMap map, HttpSession session, @RequestParam int itinnum, @RequestParam int activityid, @RequestParam int type, 
    		@RequestParam short tzoffset, @RequestParam long startdatelong) throws IOException, SQLException {

    	// This is ajax support function for JQGrid
    	logger.info("Travel Activity Manage");

		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");
		TravelActivityEntity TAE = null;		
		if (type == 0) {// travel
			if (activityid == 0) {// safe to assume new activity
				TAE = new TravelActivityEntity();
				TAE.setActivityid(activityid);
				TAE.setItinnum(itinnum);
				TAE.setType(type);
				TAE.setTzoffset(tzoffset);
				TAE.setActivitystarttimelong(startdatelong);
			}
			else
				TAE = (TravelActivityEntity)AED.GetActivityDetails(activityid, type, tzoffset, startdatelong);
		}
		
		map.addAttribute("travelactivity", TAE);
		((ClassPathXmlApplicationContext) context).close();		

		return "app/travelactivitymanage";	
    }
    
    
    // Hook for jqGrid ('Manage'), Set Session variables and manage tab
    @RequestMapping(value = "/app/travelactivity/save", method = RequestMethod.POST, produces = "application/json")    
    public @ResponseBody String saveTravelActivity(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
    	
    	// This is ajax support function for JQGrid
    	logger.info("Itinerary Travel Activity Save - POST");
			
		// Save model to database
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");
		
		// Record admin who created/edited/modifyed
		// User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		TravelActivityEntity travelactivity = new TravelActivityEntity();
		travelactivity.setLastupdatedby(username);
		// Get all parameters from header
		// hidden fields
		travelactivity.setActivityid(Integer.parseInt(request.getParameter("activityid")));
		travelactivity.setDay(Integer.parseInt(request.getParameter("day")));
		travelactivity.setVersion(Integer.parseInt(request.getParameter("version")));
		travelactivity.setTzoffset((short)Integer.parseInt(request.getParameter("tzoffset")));
		travelactivity.setItinnum(Integer.parseInt(request.getParameter("itinnum")));
		travelactivity.setGroupnum(Integer.parseInt(request.getParameter("groupnum")));
		
		// User filled data
		travelactivity.setCode(request.getParameter("code"));
		travelactivity.setActname(request.getParameter("actname"));		
		travelactivity.setVesselno(request.getParameter("vesselno"));
		travelactivity.setVesselconame(request.getParameter("vesselconame"));
		
		if (request.getParameter("pax").contentEquals(""))
			travelactivity.setPax(0);			
		else
			travelactivity.setPax(Integer.parseInt(request.getParameter("pax")));

		travelactivity.setBookingno(request.getParameter("bookingno"));
		travelactivity.setBookingclass(request.getParameter("bookingclass"));
		
		if (request.getParameter("depdatetimelong").contentEquals(""))
			travelactivity.setDepdatetimelong(0);			
		else
			travelactivity.setDepdatetimelong((long)Integer.parseInt(request.getParameter("depdatetimelong")));
		
		if (request.getParameter("arrdatetimelong").contentEquals(""))
			travelactivity.setArrdatetimelong(0);			
		else
			travelactivity.setArrdatetimelong((long)Integer.parseInt(request.getParameter("arrdatetimelong")));

		travelactivity.setDepstation(request.getParameter("depstation"));
		travelactivity.setArrstation(request.getParameter("arrstation"));

		if (request.getParameter("cost").contentEquals(""))
			travelactivity.setCost((float) 0);		
		else
			travelactivity.setCost(Float.parseFloat(request.getParameter("cost")));

		if (request.getParameter("costmarkup").contentEquals(""))
			travelactivity.setCostmarkup(0);			
		else
			travelactivity.setCostmarkup(Integer.parseInt(request.getParameter("costmarkup")));


		travelactivity.setPikupdroplocfrom(request.getParameter("pikupdroplocfrom"));
		travelactivity.setPikupdroplocto(request.getParameter("pikupdroplocto"));

		if (request.getParameter("pikupdropdatetimelong").contentEquals(""))
			travelactivity.setPikupdropdatetimelong(0);			
		else
			travelactivity.setPikupdropdatetimelong((long)Integer.parseInt(request.getParameter("pikupdropdatetimelong")));

		if (request.getParameter("asstcost").contentEquals(""))
			travelactivity.setAsstcost((float)0);			
		else
			travelactivity.setAsstcost(Float.parseFloat(request.getParameter("asstcost")));

		if (request.getParameter("asstcostmarkup").contentEquals(""))
			travelactivity.setAsstcostmarkup(0);			
		else
			travelactivity.setAsstcostmarkup(Integer.parseInt(request.getParameter("asstcostmarkup")));
		
		travelactivity.setVehdetails(request.getParameter("vehdetails"));

		if (request.getParameter("pikupdropcost").contentEquals(""))
			travelactivity.setPikupdropcost((float)0);			
		else
			travelactivity.setPikupdropcost(Float.parseFloat(request.getParameter("pikupdropcost")));
				
		if (request.getParameter("pikupdropcostmarkup").contentEquals(""))
			travelactivity.setPikupdropcostmarkup(0);			
		else
			travelactivity.setPikupdropcostmarkup(Integer.parseInt(request.getParameter("pikupdropcostmarkup")));
		
		travelactivity.setComments(request.getParameter("comments"));
		
		
		TravelActivityEntity taedb = AED.saveTravelActivity(travelactivity);
		
		// Send information for succcess as json format
		((ClassPathXmlApplicationContext) context).close();		
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(taedb);		
		
		// String jsonOutput = gson.toJson(taedb);
		return jsonOut;
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
    public String login(ModelMap map, HttpServletResponse response, HttpServletRequest request,
    		@RequestParam(value = "error", required = false) String error,
    		@RequestParam(value = "logout", required = false) String logout)
    {
		logger.info("User Login");    	
		map.addAttribute("title", "Planovik - Login Required!");
		map.addAttribute("header", "User Login");

		if (error != null) {
			map.addAttribute("error", error);
		}
 
		if (logout != null) {
			map.addAttribute("msg", "You've been logged out successfully.");
		}
				
        HttpSession session =   request.getSession(false);
        if(session!=null){
            session.invalidate();//old session invalidated
        }		
				
		return "app/login";
    }
 
    @RequestMapping(value = "/app/denied", method = RequestMethod.GET)
    public String loginerror(ModelMap map) {
		logger.info("User access denied");    	
        map.addAttribute("error", "true");
		map.addAttribute("title", "Planovik - Access Denied!");        
		map.addAttribute("header", "User Access Denied!");
		return "app/denied";
    }
 
    @RequestMapping(value = "/app/logout", method = RequestMethod.POST)
    public String logout(HttpServletResponse resp, ModelMap map) {
		logger.info("Admin logout");    	
    	map.addAttribute("title", "Planovik User - Logged out!");  	
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
	@RequestMapping(value = "/checkusername", method = RequestMethod.GET)
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
    
    
	@RequestMapping(value = "/app/uploadphoto", method = RequestMethod.POST)    
	public @ResponseBody String UploadPhoto(HttpServletRequest request, ServletResponse response, @RequestParam("image") MultipartFile image) {
		logger.info("Upload photo");
		
		if (image.isEmpty())
			return "";
		
		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
		FileHandler FH = (FileHandler)context.getBean("filehandler");
		String result = FH.fileUpload(image, "image", "setavatar", username);
		((ClassPathXmlApplicationContext) context).close();

		return result;				
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
		    	
    	
    	if (userObj==null || userObj.toString() == "anonymousUser") {
    		username = null;
    		return;
    	}
    	
            activeUser = (User) userObj;
            username = activeUser.getUsername();    		
    }
}
