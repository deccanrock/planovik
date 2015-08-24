package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.validation.BindingResult;

import com.deccanrock.planovik.entity.HotelInfoEntity;
import com.deccanrock.planovik.entity.ServiceProviderEntity;
import com.deccanrock.planovik.entity.UserEntity;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBO;
import com.deccanrock.planovik.service.dao.ServiceProviderDAO;
import com.deccanrock.planovik.service.dao.UserEntityDAO;
import com.deccanrock.planovik.service.utils.UriHandler;
import com.deccanrock.planovik.Tenant.TenantContextHolder;
import com.deccanrock.planovik.constants.PlnvkConstants;

/**
 * Handles all requests for Organization and User level signup's
 */
@Controller
public class AdminController {
	
	@Autowired
	MaxLocationBO locationBO;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
    public class serviceproviderGridData {
        public int total;
        public int page;
        public int records;
        public List<HotelInfo> rows;
        
    	@Override
    	public String toString() {
    		return "serviceproviderGridData [total=" + total + ", page=" + page + ", " +
    				"records=" + records + ", " + "rows=" + rows + "]";
    	}        
    }		

    // Hotel info class 
    public class HotelInfo {
        public int id;
        public String citycode;
        public String cityname;
        public String hotel;
        public String stars;
        public String or;
        public String room;
        public String fromdate;
        public String todate;
        public String operdays;
        public String convcode;
        public String grp;        
        public String epsngl;
        public String epdbl;
        public String cpsngl;
        public String cpdbl;
        public String mapsngl;
        public String mapdbl;
        public String apsngl;
        public String apdbl;
        public String eb;
        public String mealbf;
        public String mealln;
        public String mealdn;
        public String jpsngl;
        public String jpdbl;
        public String mjpsngl;
        public String mjpdbl;
        public String spnoting;
        public String currcode;
        public String rate;
        public String misc;
        public String aisngl;
        public String aidbl;
        public String notitle1;
        public String notitle2;
        public String notitle3;
    }
    
    

    /** TO-DO **/
	// Need to investigate why null parameter gets appended	
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = {"/admin/index", "/admin"}, method = RequestMethod.GET)
	public String appAdmin(ModelMap map, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
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
		SPE.setTypes(pc.getServicetypes());
        map.addAttribute("serviceprovider", SPE);
		
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		
		String photopath = "/zone" + TenantContextHolder.getTenant().getZoneid() + "/tenant/" + TenantContextHolder.getTenant().getTenantid() + "/images/avatars/" + session.getAttribute("userid") + ".jpg";
		map.addAttribute("userphoto", photopath);
		map.addAttribute("contactname", session.getAttribute("contactname"));
		
        return "admin/index";
    
    }	
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = {"/admin/manageservicesform", "/admin/admin/manageservicesform"}, method = RequestMethod.POST)
    public String servicesprocessform(@ModelAttribute(value="serviceprovider") ServiceProviderEntity serviceprovider, Model map, HttpServletRequest request, HttpSession session) {

		logger.info("Manager Services Process Form");
		
		request.setAttribute("title", "Planovik Admin Manage Service");
		
		if (serviceprovider.getMode().equals("Create"))
			request.setAttribute("header", "Manage Services - Create");
		else
			request.setAttribute("header", "Manage Services - Edit");
			
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		
		String photopath = "/zone" + TenantContextHolder.getTenant().getZoneid() + "/tenant/" + TenantContextHolder.getTenant().getTenantid() + "/images/avatars/" + session.getAttribute("userid") + ".jpg";
		map.addAttribute("userphoto", photopath);
		map.addAttribute("contactname", session.getAttribute("contactname"));

		// Save model to database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
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
		
		if ( dbServiceProvider!=null && (serviceprovider.getMode().equals("Edit"))) {
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
    public String manageservices(@ModelAttribute(value="serviceprovider") ServiceProviderEntity serviceprovider, HttpServletRequest request, HttpSession session, Model map) {
		
		logger.info("Manage Services");
		request.setAttribute("title", "Planovik Admin - Manage Services");		
		request.setAttribute("header", "Admin - Manage " + serviceprovider.getTypes().get(serviceprovider.getType()) +  
				" Service");		
		
		// Record admin who created/edited/modifyed
		User loggeduser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		serviceprovider.setCreatedby(loggeduser.getUsername());
		serviceprovider.setUpdatedby(loggeduser.getUsername());
        String username = loggeduser.getUsername();
		map.addAttribute("username", username);
		String photopath = "/zone" + TenantContextHolder.getTenant().getZoneid() + "/tenant/" + TenantContextHolder.getTenant().getTenantid() + "/images/avatars/" + session.getAttribute("userid") + ".jpg";
		map.addAttribute("userphoto", photopath);
		map.addAttribute("contactname", session.getAttribute("contactname"));
		
		// This is required as admin form contains both user and service management
		UserEntity user = new UserEntity();
		map.addAttribute("user", user);
		
		// Save model to database
		// ApplicationContext context = AppCtxtProv.getApplicationContext();
		// ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");	
		// String dbresult = SPD.ManageService(serviceprovider);
		// PlnvkConstants pc = new PlnvkConstants();
		// serviceprovider.setTypes(pc.getServicetype());

		/*
		if (dbresult.matches("Success")) {
			map.addAttribute("servicemsg", "Service manage operation was successful!");
			return "admin/index";
		}
		else {
			map.addAttribute("serviceerror", dbresult);
			return "admin/manageservicesform";
		}
		*/

		map.addAttribute("servicename", serviceprovider.getTypes().get(serviceprovider.getType()));
		map.addAttribute("lastrowid", "0");
		
		return "admin/manageservicesgrid";

	}
		
	
	/**
	 * Manage users for an org
	 * @throws URISyntaxException **/
	 
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")	
	@RequestMapping(value = {"/admin/manageusersform", "/admin/admin/manageusersform"}, method = RequestMethod.POST)
    public String signupupprocess(@ModelAttribute(value="user") UserEntity user, Model map, HttpServletRequest request, HttpSession session) {

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
		String photopath = "/zone" + TenantContextHolder.getTenant().getZoneid() + "/tenant/" + TenantContextHolder.getTenant().getTenantid() + "/images/avatars/" + session.getAttribute("userid") + ".jpg";
		map.addAttribute("userphoto", photopath);
		map.addAttribute("contactname", session.getAttribute("contactname"));

		// This is required as admin form contains both user and service management
		ServiceProviderEntity spe = new ServiceProviderEntity();
		map.addAttribute("serviceprovider", spe);

		// Save model to database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
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
    public String signupshowform(@ModelAttribute(value="user") UserEntity user, HttpServletRequest request, BindingResult result, Model map, HttpSession session) {
		
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
		String photopath = "/zone" + TenantContextHolder.getTenant().getZoneid() + "/tenant/" + TenantContextHolder.getTenant().getTenantid() + "/images/avatars/" + session.getAttribute("userid") + ".jpg";
		map.addAttribute("userphoto", photopath);
		map.addAttribute("contactname", session.getAttribute("contactname"));
		//user.setReportstousername(loggeduser.getUsername());

		// This is required as admin form contains both user and service management
		ServiceProviderEntity spe = new ServiceProviderEntity();
		map.addAttribute("serviceprovider", spe);
		
		// Save model to database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		UserEntityDAO UED = (UserEntityDAO)context.getBean("UserEntityDAO");	
		String dbresult = UED.ManageUser(user);

		if (dbresult.matches("Success"))
			map.addAttribute("usermsg", "User manage operation was successful!");
		else
			map.addAttribute("usererror", dbresult);
			
		return "admin/index";
	}
	
    @RequestMapping(value = "/admin/manageserviceinfo", method = RequestMethod.GET,  produces = "application/json")
    public @ResponseBody String manageserviceinfo(ModelMap map, HttpServletRequest request, @RequestParam String servicetype, HttpSession session,
    		 @RequestParam int page, @RequestParam boolean _search, @RequestParam short rows, 
    		 @RequestParam(value = "searchField", required = false) String searchField,
    		 @RequestParam(value = "searchOper", required = false) String searchOper,
    		 @RequestParam(value = "searchString", required = false) String searchString,
    		 ServletResponse response) throws IOException {
		
    	// This is ajax support function for JQGrid
    	logger.info("Admin Manage Service");    	
		
		// Get Task records from database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");
		List<HotelInfoEntity> hotelinfoentities;
		
		// Calculate ranges based on page number and oper mode
		int range1=1, range2=60;

		if (_search) {
			// Use combination of lastrowid
		}
		else {
			if (page == 1) {
				range1 = 1; range2 = rows;
			}
			else {
				range1 = ((page-1)*rows)+1; range2 = (range1-1) + rows;
			}			
		}

		// This function is hit for View record, search records and reload
    	// Jqgrid currently hits the server for everything, therefore, every it should be deciphered and handled properly
    	if (_search) { // only one case wherein actual search is being done
    		int lastrowid = 0;
    		if (session.getAttribute("lastoper").toString().contentEquals("search"))
    			lastrowid = (Integer) session.getAttribute("lastrowid");
    				
    		hotelinfoentities = SPD.GetInfoEntitiesForSearch(servicetype, lastrowid, rows,
    								searchField, searchOper, searchString);
    	}
    	else // Check if reset function or pagination, *fix*, cannot make out reset, should be handled on client side
    		hotelinfoentities = SPD.GetServiceInfoEntities(servicetype, range1, range2);    			
    			
		// Build a smaller set for jqgrid as the entire dataset with 38 fields is not required
		// Stuff the dataset in cache as user may click on individual rows
		List <HotelInfo> hotelinfolist = new ArrayList<HotelInfo>();

		for (int i=0; i<hotelinfoentities.size(); i++) {
			
			HotelInfo hotelinfo = new HotelInfo();
			hotelinfo.id = hotelinfoentities.get(i).getId();
			hotelinfo.citycode = hotelinfoentities.get(i).getCitycode();
			hotelinfo.cityname = hotelinfoentities.get(i).getCityname();
			hotelinfo.hotel = hotelinfoentities.get(i).getHotel();
			hotelinfo.stars = hotelinfoentities.get(i).getHotelstar();
			hotelinfo.or = hotelinfoentities.get(i).getOurrating();
			hotelinfo.room = hotelinfoentities.get(i).getRoom();
			hotelinfo.fromdate = hotelinfoentities.get(i).getFromdate();
			hotelinfo.todate = hotelinfoentities.get(i).getTodate();
			hotelinfo.operdays = hotelinfoentities.get(i).getOperdays();
			hotelinfo.convcode = hotelinfoentities.get(i).getConvcode();
			hotelinfo.grp = hotelinfoentities.get(i).getGrp();
			hotelinfo.epsngl = hotelinfoentities.get(i).getEpsngl();
			hotelinfo.epdbl = hotelinfoentities.get(i).getEpdbl();
			hotelinfo.cpsngl = hotelinfoentities.get(i).getCpsngl();
			hotelinfo.cpdbl = hotelinfoentities.get(i).getCpdbl();
			hotelinfo.mapsngl = hotelinfoentities.get(i).getMapsngl();
			hotelinfo.mapdbl = hotelinfoentities.get(i).getMapdbl();
			hotelinfo.apsngl = hotelinfoentities.get(i).getApsngl();
			hotelinfo.apdbl = hotelinfoentities.get(i).getApdbl();
			hotelinfo.eb = hotelinfoentities.get(i).getEb();
			hotelinfo.mealbf = hotelinfoentities.get(i).getMealbf();
			hotelinfo.mealln = hotelinfoentities.get(i).getMealln();
			hotelinfo.mealdn = hotelinfoentities.get(i).getMealdn();
			hotelinfo.jpsngl = hotelinfoentities.get(i).getJpsngl();
			hotelinfo.jpdbl = hotelinfoentities.get(i).getJpdbl();
			hotelinfo.mjpsngl = hotelinfoentities.get(i).getMjpsngl();
			hotelinfo.mjpdbl = hotelinfoentities.get(i).getMjpdbl();
			hotelinfo.spnoting = hotelinfoentities.get(i).getSpnoting();
			hotelinfo.currcode = hotelinfoentities.get(i).getCurrcode();
			hotelinfo.rate = hotelinfoentities.get(i).getRate();
			hotelinfo.misc = hotelinfoentities.get(i).getMisc();
			hotelinfo.aisngl = hotelinfoentities.get(i).getAisngl();
			hotelinfo.aidbl = hotelinfoentities.get(i).getAidbl();
			hotelinfo.notitle1 = hotelinfoentities.get(i).getNotitle1();
			hotelinfo.notitle2 = hotelinfoentities.get(i).getNotitle2();
			hotelinfo.notitle3 = hotelinfoentities.get(i).getNotitle3();

			hotelinfolist.add(hotelinfo);
		}

		// Add lastrowid to session object, it is required during search
		if (_search) {	
			if (hotelinfolist.isEmpty())
				session.setAttribute("lastrowid", 0);
			else
				session.setAttribute("lastrowid", hotelinfolist.get(hotelinfolist.size()-1).id);
		}
		else
			session.setAttribute("lastrowid", 0);
			
		if (_search)
			session.setAttribute("lastoper", "search");
		else
			session.setAttribute("lastoper", "view");
			
		// Build Json Reader map for jqgrid				
		ObjectMapper mapper = new ObjectMapper();
		serviceproviderGridData spgd = new serviceproviderGridData();						
		spgd.records = SPD.GetServiceInfoNumRecords(servicetype, _search, searchField, searchOper, searchString);
		spgd.total = spgd.records / rows + (spgd.records % rows == 0 ? 0 : 1);
		spgd.rows = hotelinfolist;
		spgd.page = page;
		String jsonOut = mapper.writeValueAsString(spgd); 
		response.setContentType("application/json");	
		
		return jsonOut;
    }
    
    // Hook for jqGrid (Edit's and Delete's)
    @RequestMapping(value = "/admin/manageserviceinfo/edit", method = RequestMethod.POST, 
    		consumes = {"application/x-www-form-urlencoded; charset=utf-8"}, 
    		produces = "application/json")    
    public @ResponseBody String manageserviceinfoedit(@RequestBody String inString, HttpServletRequest request) {
    	// This is ajax support function for JQGrid
    	logger.info("Edit Admin Tasks");
    	
    	try {
			Map<String, String> modelMap = UriHandler.Decode(inString);
			ApplicationContext context = AppCtxtProv.getApplicationContext();
			ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");
			String result = SPD.UpdateServiceInfo(modelMap);

    	} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
		return "OK:OK";	
    }

	
		
}
