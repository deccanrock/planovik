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

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.JsonMappingException;
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


class searchRules {
	private String field;
	private String op;
	private String data;
	
    public searchRules () {
    	
    }

    public searchRules (String field, String op, String data) {
    	this.field = field;
    	this.op = op;
    	this.data = data;        	
    }
    
	public String getField () {
		return this.field;
	}
	
	public void setField (String field) {
		this.field = field;
	}
	
	public String getOp () {
		return this.op;
	}
	
	public void setOp (String op) {
		this.op = op;
	}

	public String getData () {
		return this.data;
	}
	
	public void setData (String data) {
		this.data = data;
	}

}

class searchfilterData {
    private String groupOp;
    private List<searchRules> rules;
            
    // {"groupOp":"AND","rules":[{"field":"cityname","op":"eq","data":"delhi"}]}
    public searchfilterData (@JsonProperty String groupOp, @JsonProperty List<searchRules> rules) {
    // public searchfilterData (@JsonProperty String groupOp) {
    	this.groupOp = groupOp;
    	this.rules = new ArrayList<searchRules>();
    	this.rules = rules;
    }
    
    public searchfilterData () {

    }
    
	public String getGroupOp () {
		return this.groupOp;
	}
	
	public void setGroupOp (String groupOp) {
		this.groupOp = groupOp;
	}
	
	
	public List<searchRules> getRules () {
		return this.rules;
	}
	
	public void setRules (List<searchRules> rules) {
		this.rules = rules;
	}
	    	
    @Override
	public String toString() {
		// return "searchfilterData [groupOp" + groupOp + ", rules=" + rules +  "]";
		return "searchfilterData [groupOp" + groupOp + "]";        	
	}                
    
    
    public String createSQLSearchStr(String groupop, List<searchRules> rules) {
    	String searchfilter = "";
    	int size = rules.size();
    	searchRules sr = null;
    	for (int i=0; i<size; i++) {
    		// "rules":[{"field":"cityname","op":"eq","data":"delhi"}]}
    		// cityname LIKE CONCAT("%", searchstring, "%")
    		if (i > 0)
    			searchfilter = searchfilter + ' ' + groupop + ' ';
    		sr = rules.get(i);
    		if (sr.getOp().contentEquals("eq"))
    			searchfilter = searchfilter + sr.getField() + "=" + "\"" + sr.getData() + "\"";
    		else if (sr.getOp().contentEquals("cn"))
				searchfilter = searchfilter + sr.getField() +  " LIKE \"%" + sr.getData() + "%\"";
    	}
    	return searchfilter;
    }
    
}
    



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
        public String hotelstar;
        public String ourrating;
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
    		 @RequestParam(value = "filters", required = false) String searchfilters, ServletResponse response) throws IOException {
		
    	// This is ajax support function for JQGrid
    	logger.info("Admin Manage Service");    	
		
		// Get Task records from database
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");
		List<HotelInfoEntity> hotelinfoentities;
		
		// searchfilters is received as json stream from client jqgrid, convert it into mysql search condition
		
		String filterstring="";
		// Pass in page number and row
		if (_search) {
			// Parse json into relevant class for futher conversion to SQL where clause
	        // {"groupOp":"AND","rules":[{"field":"cityname","op":"eq","data":"delhi"}]}
			// String teststr = "{\"groupOp\":\"AND\"}";
			ObjectMapper mappersrch = new ObjectMapper();
			searchfilterData sfd = new searchfilterData();
			sfd = mappersrch.readValue(searchfilters, searchfilterData.class);		
			// sfd = mappersrch.readValue(teststr, searchfilterData.class);			
			filterstring = sfd.createSQLSearchStr(sfd.getGroupOp(), sfd.getRules());
			hotelinfoentities = SPD.GetServiceInfoEntities(servicetype, page, rows, (short)1, filterstring);			
		}
		else
			hotelinfoentities = SPD.GetServiceInfoEntities(servicetype, page, rows, (short)0, filterstring);

		
		// Stuff the dataset in cache as user may click on individual rows
		List <HotelInfo> hotelinfolist = new ArrayList<HotelInfo>();

		for (int i=0; i<hotelinfoentities.size(); i++) {
			
			HotelInfo hotelinfo = new HotelInfo();
			hotelinfo.id = hotelinfoentities.get(i).getId();
			hotelinfo.citycode = hotelinfoentities.get(i).getCitycode();
			hotelinfo.cityname = hotelinfoentities.get(i).getCityname();
			hotelinfo.hotel = hotelinfoentities.get(i).getHotel();
			hotelinfo.hotelstar = hotelinfoentities.get(i).getHotelstar();
			hotelinfo.ourrating = hotelinfoentities.get(i).getOurrating();
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
		spgd.records = SPD.GetServiceInfoNumRecords(servicetype, _search, filterstring);
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
    public @ResponseBody String manageserviceinfoedit(@RequestBody String inString, HttpServletRequest request, ServletResponse response) throws IOException {
    	// This is ajax support function for JQGrid
    	logger.info("Edit Admin Tasks");
    	
    	String result = null;
    	try {
			Map<String, String> modelMap = UriHandler.Decode(inString);
			ApplicationContext context = AppCtxtProv.getApplicationContext();
			ServiceProviderDAO SPD = (ServiceProviderDAO)context.getBean("ServiceProviderDAO");
			// Add/Update/Delete based on value set in oper field
			result = SPD.UpdateServiceInfo(modelMap);

    	} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		if (result.contentEquals("Success")) {
	    	ObjectMapper mapper = new ObjectMapper();
			String jsonOut = mapper.writeValueAsString("Operation Successful!"); 
			response.setContentType("application/json");		
			return jsonOut;
    	}
		else
			return "Operation failed!";
    	
    }

	
		
}
 