package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.codehaus.jackson.map.ObjectMapper;







//import com.deccanrock.planovik.entity.ActivityMasterActEntity;
//import com.deccanrock.planovik.entity.ActivityMasterEntity;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.entity.RentalActivityEntity;
import com.deccanrock.planovik.entity.ItineraryEntity;
import com.deccanrock.planovik.entity.TasksEntity;
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.dao.ActivityEntityDAO;
import com.deccanrock.planovik.service.dao.ItineraryEntityDAO;
import com.deccanrock.planovik.service.dao.TenantDS;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
import com.deccanrock.planovik.service.utils.UriHandler;
import com.deccanrock.planovik.service.utils.FileHandler;
import com.deccanrock.planovik.service.ActivitiesListForItinerary;
import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.constants.PlnvkConstants;

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
        
		UserEntityDAO UED = (UserEntityDAO)AppCtxtProv.getApplicationContext().getBean("UserEntityDAO");
		
		UserEntity user = UED.GetUser(username);
		
		map.addAttribute("user", user);
		map.addAttribute("title", "Planovik User Profile");
		map.addAttribute("username", username);
		String userphoto = "/resources/images/avatars/" + username + ".jpg";
		map.addAttribute("userphoto", userphoto);

		// map.addAttribute("admintaskList", adminManager.getAllPending());
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
		
		ApplicationContext context = AppCtxtProv.getApplicationContext();
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

			return "app/userprofile";						
		}
		
		// In future pass in fields and flags to see 
		result = UED.UpdateUserProfile(id, pass);

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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");
		
		// Record admin who created/edited/modifyed
		itinerary.setLastupdatedbyusername(username);
		
		ItineraryEntity itinerarydb = null;
		if ( itinerary.getMode().equals("Create")) {
			// Create new itinerary and display form
			itinerary.setCreatedbyusername(username);
			itinerarydb = IED.CreateItinerary(itinerary);
			map.addAttribute("itinerary", itinerarydb);

			if (itinerarydb.getError().equals("Duplicate") == true) {
				String errDup = "Itinerary: " + "\'" + itinerarydb.getName() + "\'" + " already exists! Edit that itinerary instead."; 
				map.addAttribute("error", errDup);				
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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
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
		itinerary.setLastupdatedbyusername(username);
		
		// ActivityMasterEntity ame = null;
		// Get master activity for the itinerary since information changes on every save
		if ( itinerary.getPostbutton().contentEquals("manageitinerary")) {
			ItineraryEntity itinerarydb = null;			
			// itinerarydb = IED.SaveItinerary(itinerary);
			itinerary = IED.SaveItinerary(itinerary);
			map.addAttribute("itinerary", itinerarydb);
		
			//ame = IED.GetActivityMaster(itinerarydb);
			//ame.setItinnum(itinerarydb.getId());
			//ame.setGroupnum(1); // set to 1 for testing
			//ame.setVersion(itinerarydb.getVersion());
			//ame.setTzoffset(itinerarydb.getTzoffset());
			//ame.setPax(itinerarydb.getNumtravellers());
		}
		else if ( itinerary.getPostbutton().contentEquals("activitymaster")) {
			map.addAttribute("itinerary", itinerary);

			//ame = IED.GetActivityMaster(itinerary);
			//ame.setItinnum(itinerary.getId());
			//ame.setGroupnum(1); // set to 1 for testing
			//ame.setVersion(itinerary.getVersion());
			//ame.setTzoffset(itinerary.getTzoffset());
			//ame.setPax(itinerary.getNumtravellers());
		}
		else if ( itinerary.getPostbutton().contentEquals("activity")) {
			map.addAttribute("itinerary", itinerary);

			//ame = IED.GetActivityMaster(itinerary);
			//ame.setItinnum(itinerary.getId());
			//ame.setGroupnum(1); // set to 1 for testing
			//ame.setVersion(itinerary.getVersion());
			//ame.setTzoffset(itinerary.getTzoffset());
			//ame.setPax(itinerary.getNumtravellers());
		}
		
		//map.addAttribute("activitymaster", ame);
		
		//ActivityMasterActEntity AMAE = new ActivityMasterActEntity();
		//map.addAttribute("activitymasteract", AMAE);
		
		// Get all activities sorted day wise, heavy hitter
		// ActivitiesListForItinerary ALE = new ActivitiesListForItinerary(ame.getItinnum(), ame.getVersion(), ame.getTzoffset());
		// Hate to do anything with datasource within controller but due to Thread not having any knowledge of TenantContext we have 
		// to make an exception
		DataSource tenantdataSource = TenantDS.setTenantDataSource(null); 
		ActivitiesListForItinerary ALE = new ActivitiesListForItinerary(itinerary.getId(), itinerary.getVersion(), itinerary.getTzoffset(), 
				TenantContextHolder.getTenant().getTenantid(), tenantdataSource);
		Object[] AL = ALE.BuildActivitiesList();
		
		map.addAttribute("activitylist", AL);
		
		TravelActivityEntity TAE = new TravelActivityEntity();
		TAE.setActivityid(0); // default to 0 should be changed at client side
		// TAE.setItinnum(ame.getItinnum());
		TAE.setItinnum(itinerary.getId());
		TAE.setVersion(itinerary.getVersion());
		TAE.setTzoffset(itinerary.getTzoffset());
		TAE.setPax(itinerary.getNumtravellers());

		RentalActivityEntity RAE = new RentalActivityEntity();

		map.addAttribute("travelactivity", TAE);
		map.addAttribute("rentalactivity", RAE);

		// return "app/activitymanage";
		return "app/activitymanagecal";    	    	    	    	
    }
    
    
    // Read session variables and build the page
    @RequestMapping(value = "/app/manage/travelactivitymanage", method = RequestMethod.GET)    
    public String travelActivityManage(ModelMap map, HttpSession session, @RequestParam int itinnum, @RequestParam int activityid, @RequestParam int type, 
    		// @RequestParam short tzoffset, @RequestParam short eventdrop, @RequestParam long startdatelong, @RequestParam int version, @RequestParam int groupnum) throws IOException, SQLException {
    		@RequestParam short tzoffset, @RequestParam short eventdrop, @RequestParam long startdatelong, @RequestParam int version) throws IOException, SQLException {

    	// This is ajax support function for JQGrid
    	logger.info("Travel Activity Manage");

		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");
		TravelActivityEntity TAE = null;		
		if (type == 0) {// travel
			if (activityid == 0) {// safe to assume new activity
				TAE = new TravelActivityEntity();
				TAE.setActivityid(activityid);
				//TAE.setMasteractid(masteractid);				
				TAE.setItinnum(itinnum);
				TAE.setType(type);
				TAE.setTzoffset(tzoffset);
				TAE.setVersion(version);
				//TAE.setGroupnum(groupnum);
				TAE.setError("Success");
			}
			else {
				TAE = (TravelActivityEntity)AED.GetActivityDetails(activityid, type, tzoffset);
				TAE.setEventdrop(eventdrop);
			}

			TAE.setActivitystarttimelong(startdatelong);
 
			PlnvkConstants pc = new PlnvkConstants();
			TAE.setTravelmodelist(pc.getTravelmodes());
		}
		
		map.addAttribute("travelactivity", TAE);

		return "app/travelactivitymanage";	
    }
    
    
    // Hook for jqGrid ('Manage'), Set Session variables and manage tab
    @RequestMapping(value = "/app/manage/travelactivitymanage", method = RequestMethod.POST, produces = "application/json")    
    public @ResponseBody String saveTravelActivity(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
    	
    	// This is ajax support function for JQGrid
    	logger.info("Itinerary Travel Activity Save - POST");
			
		// Save model to database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");
		
		// Record admin who created/edited/modifyed
		// User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		TravelActivityEntity travelactivity = new TravelActivityEntity();
		travelactivity.setLastupdatedby(username);
		// Get all parameters from header
		// hidden fields
		travelactivity.setActivityid(Integer.parseInt(request.getParameter("activityid")));
		travelactivity.setVersion(Integer.parseInt(request.getParameter("version")));
		travelactivity.setTzoffset((short)Integer.parseInt(request.getParameter("tzoffset")));
		travelactivity.setItinnum(Integer.parseInt(request.getParameter("itinnum")));
		// travelactivity.setMasteractid((short) Integer.parseInt(request.getParameter("masteractid")));		
		//travelactivity.setGroupnum(Integer.parseInt(request.getParameter("groupnum")));
		// travelactivity.setGroupnum(1);
		
		// User filled data
		travelactivity.setCode(request.getParameter("code"));
		travelactivity.setActname(request.getParameter("actname"));		
		
		travelactivity.setVesselconame(request.getParameter("vesselconame"));
		
		if (request.getParameter("pax").contentEquals(""))
			travelactivity.setPax(0);			
		else
			travelactivity.setPax(Integer.parseInt(request.getParameter("pax")));


		if (travelactivity.getCode().contentEquals("T_BOOK_ONEWAY") || travelactivity.getCode().contentEquals("T_BOOK_RETURN")) {

			if (request.getParameter("vesselnoon").contentEquals(""))
				travelactivity.setVesselnoon("");
			else
				travelactivity.setVesselnoon(request.getParameter("vesselnoon"));
			
			travelactivity.setBookingno(request.getParameter("bookingno"));
			travelactivity.setBookingclass(request.getParameter("bookingclass"));

			if (request.getParameter("depdatetimeonlong").contentEquals(""))
				travelactivity.setDepdatetimeonlong(0);			
			else
				travelactivity.setDepdatetimeonlong(Long.valueOf(request.getParameter("depdatetimeonlong")));
			
			if (request.getParameter("arrdatetimeonlong").contentEquals(""))
				travelactivity.setArrdatetimeonlong(0);			
			else
				travelactivity.setArrdatetimeonlong(Long.valueOf(request.getParameter("arrdatetimeonlong")));
	
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
		}

		if (travelactivity.getCode().contentEquals("T_BOOK_RETURN")) {

			
			if (request.getParameter("vesselnoret").contentEquals(""))
				travelactivity.setVesselnoret("");
			else
				travelactivity.setVesselnoret(request.getParameter("vesselnoret"));
				
			if (request.getParameter("depdatetimeretlong").contentEquals(""))
				travelactivity.setDepdatetimeretlong(0);			
			else
				travelactivity.setDepdatetimeretlong(Long.valueOf(request.getParameter("depdatetimeretlong")));
			
			if (request.getParameter("arrdatetimeretlong").contentEquals(""))
				travelactivity.setArrdatetimeretlong(0);			
			else
				travelactivity.setArrdatetimeretlong(Long.valueOf(request.getParameter("arrdatetimeretlong")));
	
		}
		
		if (travelactivity.getCode().contentEquals("T_PIKUPDRP")) {
			
			if (request.getParameter("vesselnopikupdrp").contentEquals(""))
				travelactivity.setVesselnoon("");
			else
				travelactivity.setVesselnopikupdrp(request.getParameter("vesselnopikupdrp"));

			travelactivity.setPikupdroplocfrom(request.getParameter("pikupdroplocfrom"));
			travelactivity.setPikupdroplocto(request.getParameter("pikupdroplocto"));
	
			if (request.getParameter("pikupdropdatetimelong").contentEquals(""))
				travelactivity.setPikupdropdatetimelong(0);			
			else
				travelactivity.setPikupdropdatetimelong(Long.valueOf(request.getParameter("pikupdropdatetimelong")));
	
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
		}

		travelactivity.setCommentsinternal(request.getParameter("commentsinternal"));
		travelactivity.setCommentsexternal(request.getParameter("commentsexternal"));
		
		
		TravelActivityEntity taedb = AED.saveTravelActivity(travelactivity);
		
		// Send information for succcess as json format
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(taedb);		
		
		return jsonOut;
    }

/*    
    @RequestMapping(value = "/app/masteractivityact/save", method = RequestMethod.POST, produces = "application/json")    
    public @ResponseBody String saveMasterActivityAct(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
    	
    	// This is ajax support function for JQGrid
    	logger.info("Master Activity Act Save - POST");
			
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		ActivityMasterDAO AMD = (ActivityMasterDAO)context.getBean("ActivityMasterDAO");
		
		String actname = request.getParameter("masteractname");
		long startdatetimelong = Long.valueOf(request.getParameter("masteractstartdatelong"));
		long enddatetimelong = Long.valueOf(request.getParameter("masteractenddatelong"));
		int itinnum = Integer.valueOf(request.getParameter("itinnum"));
		int version = Integer.valueOf(request.getParameter("version"));
		short tzoffset = Short.valueOf(request.getParameter("tzoffset"));
		// int masteractid = Integer.valueOf(request.getParameter("masteractid"));
		String startdateStr = request.getParameter("masteractstartdate");
		String enddateStr = request.getParameter("masteractenddate");
		
		
		String result = AMD.CreateMasterActivityAct(itinnum, version, actname, startdatetimelong, enddatetimelong, tzoffset, masteractid);
		String strObj = "{ \"masteractid\": " + "\"" + result + "\"" + ", \"masteractname\": " + "\"" + actname + "\"" + ", \"masteractstartdate\": " +
							"\"" +  startdateStr + "\"" + ", \"masteractenddate\": " + "\"" + enddateStr + "\"" + 
							", \"masteractstartdatelong\": " + "\"" +  startdatetimelong + "\"" + ", \"masteractenddatelong\": " + "\"" + enddatetimelong + "\"" +"}";
				
		// Send information for succcess as json format
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(strObj);		
		
		return jsonOut;
    }

    
    @RequestMapping(value = "/app/masteractivityact/delete", method = RequestMethod.POST, produces = "application/json")    
    public @ResponseBody String deleteMasterActivityAct(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
    	
    	// This is ajax support function for JQGrid
    	logger.info("Master Activity Act Delete - POST");
			
		// Save model to database
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		ActivityMasterDAO AMD = (ActivityMasterDAO)context.getBean("ActivityMasterDAO");
		
		int itinnum = Integer.valueOf(request.getParameter("itinnum"));
		int version = Integer.valueOf(request.getParameter("version"));
		int masteractid = Integer.valueOf(request.getParameter("masteractid"));		
		
		String result = AMD.DeleteMasterActivityAct(itinnum, version, masteractid);
				
		// Send information for succcess as json format
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String strObj = "{ \"result\": " + "\"" + result + "\"" + "}";

		String jsonOut = mapper.writeValueAsString(strObj);		
		
		return jsonOut;
    }

*/    
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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		String convcode = IED.CreateCurrConvCode(fromcurr, tocurr, Float.parseFloat(unitrate));
				
		return convcode;
    }
    
    @RequestMapping(value = "/app/login")
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
				
        HttpSession session = request.getSession(true);
        if(session!=null) {
        	// Get tenant id information from session
        	map.addAttribute("tenantid" , session.getAttribute("tenantid"));
        	map.addAttribute("tenantname" , session.getAttribute("tenantname"));
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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> itinList = IED.GetItinList(query);

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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> isocurrlist = IED.GetISOCurrList(query);

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
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ItineraryEntityDAO IED = (ItineraryEntityDAO)context.getBean("ItineraryEntityDAO");	
		List<String> isocurrlist = IED.GetCurrConvCodes(query);

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(isocurrlist); 
		response.setContentType("application/json");	
				
		return jsonOut;
	}
	
	@RequestMapping(value = "/app/activity/inactive", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String deleteActivity(ServletResponse response, @RequestParam(value = "activityid") int activityid, @RequestParam(value = "activityidpair") int activityidpair,
											  @RequestParam(value = "itinnum") int itinnum, @RequestParam(value = "type") int type,
											  //@RequestParam(value = "version") int version, @RequestParam(value = "groupnum") int groupnum)
											  @RequestParam(value = "version") int version)
											  throws IOException {

		logger.info("Inactive - Delete Activity");
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ActivityEntityDAO AED  = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");
		String result = null;
		try {
			// result = AED.DeleteActivity(activityid, activityidpair, itinnum, type, version, groupnum);
			result = AED.DeleteActivity(activityid, activityidpair, itinnum, type, version);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(result);			
				
		return jsonOut;
	}	
	
	@RequestMapping(value = "/app/activity/getactivitycodes", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getActivityCodes(ServletResponse response, @RequestParam(value = "query") String query) 
			throws IOException {
		logger.info("Get Activity Codes");

		if (query.isEmpty())
			return "";
		
		// Get Org List from database, should be changed to get from cache
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ActivityEntityDAO AMD = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");	
		List<String> activitycodelist = AMD.GetActivityCodes(query);

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

		ApplicationContext context = AppCtxtProv.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");
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
		
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		FileHandler FH = (FileHandler)context.getBean("filehandler");
		String result = FH.fileUpload(image, "image", "setavatar", username);

		return result;				
	}	
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response) {                 
 
		Iterator<String> itr =  request.getFileNames();
 
		MultipartFile mpf = request.getFile(itr.next());
		System.out.println(mpf.getOriginalFilename() +" uploaded!");
 
//	     try {
	        //just temporary save file info into ufile
	        //ufile.length = mpf.getBytes().length;
	        //ufile.bytes= mpf.getBytes();
	        //ufile.type = mpf.getContentType();
	        //ufile.name = mpf.getOriginalFilename();
//	 		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
//			FileHandler FH = (FileHandler)context.getBean("filehandler");
//			String result = FH.fileUpload(mpf, "image", "setavatar", username);	 

//	     } catch (IOException e) {
	        // TODO Auto-generated catch block
//	        e.printStackTrace();
//	    }
	 
	   //2. send it back to the client as <img> that calls get method
	   //we are using getTimeInMillis to avoid server cached image 
	 
	   return "<img src='http://localhost:8080/repo/du/"+ mpf.getOriginalFilename() +"' />";
 
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
