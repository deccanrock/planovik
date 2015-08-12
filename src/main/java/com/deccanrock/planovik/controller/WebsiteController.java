package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;
import java.util.concurrent.Future;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ehcache.Element;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deccanrock.planovik.SMS.SMSService;
import com.deccanrock.planovik.constants.PlnvkConstants;
import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.location.ISOCountryPhone;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBOImpl;
import com.deccanrock.planovik.location.CountryPostalCode;
import com.deccanrock.planovik.mandrill.MailService;
import com.deccanrock.planovik.security.AESSecure;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.dao.AccountEntityDAO;
import com.deccanrock.planovik.service.dao.TenantEntityDAO;
import com.deccanrock.planovik.service.utils.CacheService;
import com.deccanrock.planovik.service.utils.MiscHelper;
import com.deccanrock.planovik.service.utils.TimeFormatter;
import com.mashape.unirest.http.exceptions.UnirestException;


/**
 * Handles all requests for Planovik Main website (www.planovik.com)
 */
@Controller
public class WebsiteController {
		
	private static final Logger logger = LoggerFactory.getLogger(WebsiteController.class);
	

	/**
	 * Process Signup request for an Organization
	 * @throws InterruptedException 
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)	
    public @ResponseBody String registerForm(HttpServletRequest request, ModelMap map,
    		@RequestParam(value = "contactname") String contactName,
    		@RequestParam(value = "contactemail") String contactEmail, @RequestParam(value = "contactphonemobile") String contactPhoneMobile, 
    		@RequestParam(value = "contactpswd") String contactPswd, @RequestParam(value = "tzoffset") short tzoffset) throws InterruptedException {
		
		logger.info("New Tenant Registration");
		final String userIPAddress = request.getRemoteAddr();

		String cc = "";
		// Get country dial code
		MaxLocationBOImpl locobj = new MaxLocationBOImpl();
		if (userIPAddress.contentEquals("127.0.0.1")) // localhost
			cc = "IN";
		else {
			MaxLocation location = locobj.getLocation(userIPAddress);
			cc = location.getCountryCode();
		}
		

		ISOCountryPhone countryinfo = GetCountryInfo(cc);
				
		AccountEntity account = new AccountEntity();
		account.setAddrcountrycode(cc);				
		account.setContactname(contactName);
		account.setContactemail(contactEmail);
		account.setContactphonemobile("+" + countryinfo.getDialcode() + "-" + contactPhoneMobile);
		account.setContactpswd(contactPswd);
		account.setTzoffset(tzoffset);
		account.setRegip(userIPAddress);
		

		try {
			account.setSecurekey(MiscHelper.ComputeSecretKeyForTenant());
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

		// Generate a random pin for additional mobile verification, *TODO*
		account.setPin(MiscHelper.genrandomnumber());
		
		// Save model to database
		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");		
		String result = AED.CreateAccount(account);
		
		String secureuri = "Fail";		
		if (MiscHelper.isNumeric(result)) {
			// byte[] encodedKey     	= Base64.decodeBase64(tenant.getSecurekey());
			// SecretKey originalKey 	= new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
			// Encrypt Register confirmation URI
			//String hostname = null;
			//try {
			//	hostname = InetAddress.getLocalHost().getHostName();
			//} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
			//	e.printStackTrace();
			//}
			
			String url = null;
			try {
				secureuri = AESSecure.convertToSecureURI(result, null);
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// mobile verification logic here when available
			Future<String> smsresult = sendSMS(contactPhoneMobile, account.getPin());
			// Send Mail
			Future<String> mailserviceresult = sendMail(secureuri, account.getContactname(), account.getContactemail());														
	        // Wait until they are all done
	        while (!(mailserviceresult.isDone() && smsresult.isDone())) {
	            Thread.sleep(10); //10-millisecond pause between each check
	        }

	        return secureuri;
		}
				
		return secureuri;
	}
	
    @Async
    public Future<String> sendSMS(String contactPhoneMobile, short pin) throws InterruptedException {
		
    	// mobile verification logic here when available
		try {
			SMSService.SendSMS(contactPhoneMobile, "One time pin to complete planvoik registration is: " + pin);
		} catch (UnirestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return new AsyncResult<String>("Done");
    }	
		
    @Async
    public Future<String> sendMail(String secureuri, String contactname, String contactemail) {
		// Send welcome email
		MailService ms = new MailService();			
		String url = "http://www.planovik.com:8080/signupconfirm?" + secureuri;
		String content = "<html><body><h1>Almost there " + contactname + "</h1>" + 
						 "<h3>Please click <a href=\"" + url + "\">here</a>" + " to complete your registration.</h3></body></html>";			
		ms.SendMessage("Planovik", "signup@planovik.com", contactname, contactemail, "Welcome to Planovik", content);
		return new AsyncResult<String>("Done");
    }	

    
    /**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/phonecode", method = RequestMethod.GET)	
    public @ResponseBody String getPhoneCode(HttpServletRequest request, ModelMap map) {
		
		logger.info("Phonecode");
		String userIPAddress = request.getRemoteAddr();
		
		// Get country dial code
		MaxLocationBOImpl locobj = new MaxLocationBOImpl();
		
		// * For Testing ONLY *
		// userIPAddress = "67.228.221.19";
		// userIPAddress = "123.176.40.18";

		String cc = "";
		if (userIPAddress.contentEquals("127.0.0.1")) // localhost
			cc = "IN";
		else {
			MaxLocation location = locobj.getLocation(userIPAddress);
			cc = location.getCountryCode();
		}

		ISOCountryPhone countryinfo = GetCountryInfo(cc);
		return "+" + countryinfo.getDialcode();
	}	
	
	
	/**
	 * Check if account contact email already exists
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/checkcontactemail", method = RequestMethod.GET)	
	public @ResponseBody String checkContactEmail(@RequestParam(value = "contactemail") String contactEmail) {
		logger.info("Check Tenant Contact Email");

		ApplicationContext context = AppCtxtProv.getApplicationContext();
		AccountEntityDAO AED = (AccountEntityDAO)context.getBean("AccountEntityDAO");
		// This should be changed to memcached
		if (AED.ContactEmailExists(contactEmail))
			return "exists";
		else
			return "none";
	}	

	/**
	 * Display tenant welcome page
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/signupwelcome", method = RequestMethod.GET)	
	public String signupWelcome(HttpServletRequest request, ModelMap map) { 

		logger.info("Signup Welcome");
		
		String secureuri = request.getQueryString();
		// String tenantid = uri.substring(0, uri.indexOf('-'));
		// String secureuri = uri.substring(uri.indexOf('-')+1, uri.length());
		
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		AccountEntityDAO AED = (AccountEntityDAO)context.getBean("AccountEntityDAO");
		String plainURI = null;		
		try {
			plainURI = AESSecure.convertToPlainURI(secureuri, null);
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		AccountEntity account = AED.GetAccount(plainURI, 0);

		/*
		byte[] encodedKey     	= Base64.decodeBase64(tenant.getSecurekey());
		SecretKey originalKey 	= new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");		
		// Decrypt and get info
		String plainURI = null;
		try {
			plainURI = AESSecure.convertToPlainURI(secureuri, originalKey);
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		map.addAttribute("contactname", account.getContactname());
		map.addAttribute("contactemail", account.getContactemail());
		
		return "signupwelcome";
		
	}	
	
	/**
	 * Display tenant confirmation page
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/signupconfirm", method = RequestMethod.GET)	
	public String signupConfirm(HttpServletRequest request, ModelMap map) { 

		logger.info("Signup Confirm");
		
		String secureuri = request.getQueryString();
		
		ApplicationContext context = AppCtxtProv.getApplicationContext();
		AccountEntityDAO AED = (AccountEntityDAO)context.getBean("AccountEntityDAO");
		String plainURI = null;		
		try {
			plainURI = AESSecure.convertToPlainURI(secureuri, null);
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		AccountEntity account = AED.GetAccount(plainURI, 0);
		
		// Set registration status of user to confirmed
		// if (tenant != null)
		//	TED.SetRegStatus(tenant.getTenantid(),PlnvkConstants.RegStatus.Confirmed.getValue());

		map.addAttribute("accountid", account.getId());		
		map.addAttribute("contactname", account.getContactname());
		map.addAttribute("contactemail", account.getContactemail());
		ISOCountryPhone countryinfo = GetCountryInfo(account.getAddrcountrycode());
		map.addAttribute("dialcode", "+" + countryinfo.getDialcode());
		map.addAttribute("addrcountryname", countryinfo.getIsoname());
		map.addAttribute("addrcountrycode", countryinfo.getIsocode2());
		
		return "signupfinal";
		
	}
	
	/**
	 * Process Signup request for an Organization
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/GetGeoDetailsForPC", method = RequestMethod.GET, produces = "application/json")	
    public @ResponseBody String detailsforPC(HttpServletRequest request, HttpServletResponse response, ModelMap map,
    		@RequestParam(value = "addrpostalcode") String addrPostalCode, @RequestParam(value = "addrcountrycode") String addrCountryCode) 
    				throws JsonGenerationException, JsonMappingException, IOException {
		
		logger.info("Geo Details for Postal Code");		
		
		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");		
		List <CountryPostalCode> countrypostalcodes = AED.GetPCDetailsForCntry(addrPostalCode, addrCountryCode);

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(countrypostalcodes); 
		response.setContentType("application/json");	
				
		return jsonOut;	
	}	

	/**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/updateacc", method = RequestMethod.POST)	
    public @ResponseBody String registerForm(HttpServletRequest request, ModelMap map) {
		
		// This should be changed to use entity model (TenantEntity) that will allow data edits at 
		// the time of registration and subsequent updates
		logger.info("Account update");

		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");		
		
		AccountEntity account = AED.GetAccount(request.getParameter("tenantid"), 0); // using id
		
		if (account == null)
			// Should really never happen
			map.addAttribute("error", "Oops! We were unable to find your information. Please try again.");
		else {			
			// Compare info and update			
			if (request.getParameter("contactdesignation").length()!=0 && 
					account.getContactdesignation().contentEquals(request.getParameter("contactdesignation")) == false)
				account.setContactdesignation(request.getParameter("contactdesignation"));

			// Format "+91-40-23608380" (Country Code - Area Code - Phone number)
			if (request.getParameter("contactphoneoffice").length()!=0 && 
					account.getContactphoneoffice().contentEquals(request.getParameter("contactphoneoffice")) == false)
				account.setContactphoneoffice(request.getParameter("contactphoneoffice"));

			// Format "+91-9866277000" (Country Code - Mobile Number)
			if (request.getParameter("addrpostalcode").length()!=0 && 
					account.getAddrpostalcode().contentEquals(request.getParameter("addrpostalcode")) == false)
				account.setAddrpostalcode(request.getParameter("addrpostalcode"));

			if (request.getParameter("addrstreet1").length()!=0 && 
					account.getAddrstreet1().contentEquals(request.getParameter("addrstreet1")) == false)
				account.setAddrstreet1(request.getParameter("addrstreet1"));

			if (request.getParameter("addrstreet2").length()!=0 && 
					account.getAddrstreet2().contentEquals(request.getParameter("addrstreet2")) == false)
				account.setAddrstreet2(request.getParameter("addrstreet2"));

			if (request.getParameter("addrcitytown").length()!=0 && 
					account.getAddrcitytown().contentEquals(request.getParameter("addrcitytown")) == false)
				account.setAddrcitytown(request.getParameter("addrcitytown"));

			if (request.getParameter("addrdistrict").length()!=0 && 
					account.getAddrdistrict().contentEquals(request.getParameter("addrdistrict")) == false)
				account.setAddrdistrict(request.getParameter("addrdistrict"));

			if (request.getParameter("addrstateprovrgn").length()!=0 && 
					account.getAddrstateprovrgn().contentEquals(request.getParameter("addrstateprovrgn")) == false)
				account.setAddrstateprovrgn(request.getParameter("addrstateprovrgn"));

			if (request.getParameter("addrhomeurl").length()!=0 && 
					account.getAddrhomeurl().contentEquals(request.getParameter("addrhomeurl")) == false)
				account.setAddrhomeurl(request.getParameter("addrhomeurl"));
			
			AED.UpdateAccount(account);

		}
		
		return "updateprofile"; 		
						
	}	

    @RequestMapping(value = "/accountlogin")
    public @ResponseBody String accountlogin(ModelMap map, HttpServletResponse response, HttpServletRequest request)
    {
		logger.info("Account Login");    	
		map.addAttribute("title", "Planovik - Your Profile");
		map.addAttribute("header", "Account Login");

		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");
		// Get Tenant using email		
		AccountEntity account = AED.GetAccount(request.getParameter("contactemail"), 1);
		
		if (account == null)
			return "Login failed! Incorrect email";

		if (account.getAccountstatus() == PlnvkConstants.RegStatus.Pending.getValue())
			return "Your registration is not confirmed. Please check your email for instructions.";
		
		if (account.getAccountstatus() == PlnvkConstants.RegStatus.Suspended.getValue())
			return "Your account has been suspended. Please contact customer support for further assistance.";

		if (account.getAccountstatus() == PlnvkConstants.RegStatus.Closed.getValue())
			return "Your account has been closed. Please contact customer support for further assistance.";
		
		// Match Password
		if (HashCode.matchPassword(request.getParameter("contactpswd"), account.getContactpswd()) == false)
			return "Login failed! Incorrect password";
				
        HttpSession session = request.getSession(true);
        if(session!=null) {
        	// Set tenant information
        	session.setAttribute("accountid" , account.getId());
        	session.setAttribute("contactemail" , account.getContactemail());
        	// Stuff remaining in cache for access till tenant is active
        	CacheService CS = (CacheService)AppCtxtProv.getApplicationContext().getBean("cacheservice");
        	CS.getCache().put(new Element(account.getContactemail(), account));
        }		
				
		return "Success";
    }


    @RequestMapping(value = "/accountprofile", method = RequestMethod.GET)	
    public String accountprofile(ModelMap map, HttpServletResponse response, HttpServletRequest request) {
		
		logger.info("Account Profile");
        HttpSession session = request.getSession(false);
        if(session!=null) {
        	CacheService CS = (CacheService)AppCtxtProv.getApplicationContext().getBean("cacheservice");
    		Element accountele = CS.getCache().get(session.getAttribute("contactemail"));
    		
    		if (accountele != null) {
        		AccountEntity account = null;
        		account = (AccountEntity) accountele.getObjectValue();
        		// Get creation date time in local tz
        		map.addAttribute("registerdate",
        				TimeFormatter.FormatTimeMS(account.getDatecreatedlong(), "SettingsDisplay", true, account.getTzoffset()));
        		map.addAttribute("accountid", account.getId());		
        		map.addAttribute("contactname", account.getContactname());		
        		map.addAttribute("contactemail", account.getContactemail());
        		ISOCountryPhone countryinfo = GetCountryInfo(account.getAddrcountrycode());
        		map.addAttribute("dialcode", "+" + countryinfo.getDialcode());
        		map.addAttribute("addrcountryname", countryinfo.getIsoname());
        		map.addAttribute("addrcountrycode", countryinfo.getIsocode2());
        		map.addAttribute("tenants", account.getTenants());        		
    		}
    		    		
        }
        	
		return "accountprofile";

	}

    @RequestMapping(value = "/verifypin", method = RequestMethod.GET)	
    public @ResponseBody String verifyPin(@RequestParam(value = "pin") Short pin,
    		@RequestParam(value = "accountid") int accountid) {
		
		logger.info("Verify Pin");

		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");				
		String response = AED.VerifyPin(pin, accountid);		
		
		return response;

	}
    
    // Static pricing to display pricing information
    @RequestMapping(value = "/spricing", method = RequestMethod.GET)	
    public String staticpricing(ModelMap map, HttpServletResponse response, HttpServletRequest request) {
		
		logger.info("Static Pricing");
		
		return "pricing";

	}

    // Dynamic pricing when a tenant is created or upgrade
    @RequestMapping(value = "/dpricing", method = RequestMethod.POST)	
    public String dynamicpricing(ModelMap map, HttpServletResponse response, HttpServletRequest request) {
		
		logger.info("Dynamic Pricing");
		map.addAttribute("accountid", request.getParameter("accountid"));		
		map.addAttribute("contactname", request.getParameter("contactname"));		
		map.addAttribute("tenantdesc", request.getParameter("tenantdesc"));		
		map.addAttribute("freeplan", request.getParameter("freeplan"));		

		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");
		// Check against DB and compute a name to suggest
		String tenantname = TED.GetTenantName(request.getParameter("tenantdesc"));
		map.addAttribute("tenantname", tenantname);		
	
		return "pricing";

	}
    
    @RequestMapping(value = "/verifytenantinfo", method = RequestMethod.GET)	
    public @ResponseBody String verifyTenantDesc(@RequestParam(value = "tenantdesc") String tenantdesc,
    		@RequestParam(value = "tenantname") String tenantname) {
		
		logger.info("Verify Tenant Info");

		String response = "";
		
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");				

		if (tenantdesc.length() > 0 && tenantname.length() == 0)
			response = TED.TenantExists(tenantdesc, true);		
		if (tenantname.length() > 0 && tenantdesc.length() == 0)
			response = TED.TenantExists(tenantname, false);		
			
		
		return response;

	}

    /**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/setuptenant", method = RequestMethod.POST)	
    public String setupTenant(HttpServletRequest request, ModelMap map) {
		
		// This should be changed to use entity model (TenantEntity) that will allow data edits at 
		// the time of registration and subsequent updates
		logger.info("Setup Tenant");

		final String regIPAddress = request.getRemoteAddr();

        HttpSession session = request.getSession(false);
        AccountEntity account = null;
        AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");
        
        if(session!=null) {
        	CacheService CS = (CacheService)AppCtxtProv.getApplicationContext().getBean("cacheservice");
    		Element accountele = CS.getCache().get(session.getAttribute("contactemail"));
    		
    		if (accountele != null)
    			account = (AccountEntity) accountele.getObjectValue();
        }
        
        if (account == null) // fall back to DB
   			account = AED.GetAccount(request.getParameter("accountid"), 0); // using id
        
		if (account == null)
			// Should really never happen
			map.addAttribute("error", "Oops! We were unable to find your information. Please try again.");
		else {			
			// Setup Tenant Based
	        TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");
			TED.CreateTenant(request.getParameter("tenantdesc"), account, regIPAddress, 
					Short.valueOf(request.getParameter("tenanttype")), 
					Short.valueOf(request.getParameter("billingplan")), account);
		}
		
		// redirect to tenant site
		// Create tenant based session
		map.addAttribute("contactname", account.getContactname());		

		return "app/dash"; 		
						
	}	

    
	private ISOCountryPhone GetCountryInfo(String CountryCode) {
		AccountEntityDAO AED = (AccountEntityDAO)AppCtxtProv.getApplicationContext().getBean("AccountEntityDAO");		
		ISOCountryPhone isocntryph = AED.GetInfoForISOCode(CountryCode);
				
		return isocntryph;		
	}

}
