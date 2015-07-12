package com.deccanrock.planovik.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.location.ISOCountryPhone;
import com.deccanrock.planovik.location.MaxLocation;
import com.deccanrock.planovik.location.MaxLocationBOImpl;
import com.deccanrock.planovik.location.CountryPostalCode;
import com.deccanrock.planovik.mandrill.MailService;
import com.deccanrock.planovik.security.AESSecure;
import com.deccanrock.planovik.service.dao.TenantEntityDAO;
import com.deccanrock.planovik.service.utils.MiscHelper;


/**
 * Handles all requests for Planovik Main website (www.planovik.com)
 */
@Controller
public class WebsiteController {
		
	private static final Logger logger = LoggerFactory.getLogger(WebsiteController.class);
	

	/**
	 * Process Signup request for an Organization
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)	
    public @ResponseBody String registerForm(HttpServletRequest request, ModelMap map,
    		@RequestParam(value = "tenantdesc") String tenantDesc, @RequestParam(value = "contactname") String contactName,
    		@RequestParam(value = "contactemail") String email, @RequestParam(value = "contactpswd") String contactPswd,
    		@RequestParam(value = "tzoffset") short tzoffset) {
		
		logger.info("New Tenant Registration");
		final String userIPAddress = request.getRemoteAddr();

		TenantEntity tenant = new TenantEntity();
		tenant.setTenantdesc(tenantDesc); // Here Tenant Name is complete tenant company name
		tenant.setContactname(contactName);
		tenant.setContactemail(email);
		tenant.setContactpswd(contactPswd);
		tenant.setTzoffset(tzoffset);
		tenant.setRegip(userIPAddress);
		
		String cc = "";
		// Get country dial code
		MaxLocationBOImpl locobj = new MaxLocationBOImpl();
		if (userIPAddress.contentEquals("127.0.0.1")) // localhost
			cc = "IN";
		else {
			MaxLocation location = locobj.getLocation(userIPAddress);
			cc = location.getCountryCode();
		}
		
		tenant.setAddrcountrycode(cc);

		try {
			tenant.setSecurekey(MiscHelper.ComputeSecretKeyForTenant());
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

		// Generate a random pin for additional mobile verification, *TODO*
		tenant.setPin(MiscHelper.genrandomnumber());
		
		// Save model to database
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");		
		String result = TED.RegisterTenant(tenant);
		
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

			// Send welcome email
			MailService ms = new MailService();			
			url = "http://www.planovik.com:8080/signupconfirm?" + secureuri;
			String content = "<html><body><h1>Almost there " + tenant.getContactname() + "</h1>" + 
							 "Please click <a href=\"" + url + "\">here</a>" + " to complete your registration.</body></html>";			
			ms.SendMessage("Planovik", "signup@planovik.com", tenant.getContactname(), tenant.getContactemail(), "Welcome to Planovik", content);
			
			// *TODO* plug mobile verification logic here when available
						
			return secureuri;
		}
				
		return secureuri;
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
	 * Check if tenant already exists
	 * @throws URISyntaxException 
	 */
	@RequestMapping(value = "/checktenantdesc", method = RequestMethod.GET)	
	public @ResponseBody String checkTenantDesc(@RequestParam(value = "tenantdesc") String tenantDesc) {
		logger.info("Check Tenant Desc");

		ApplicationContext context = AppCtxtProv.getApplicationContext();
		TenantEntityDAO TED = (TenantEntityDAO)context.getBean("TenantEntityDAO");
		// This should be changed to memcached
		if (TED.TenantExists(tenantDesc))
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
		TenantEntityDAO TED = (TenantEntityDAO)context.getBean("TenantEntityDAO");
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
		
		TenantEntity tenant = TED.GetTenant(plainURI, 0);

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
		
		map.addAttribute("contactname", tenant.getContactname());
		map.addAttribute("contactemail", tenant.getContactemail());
		
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
		TenantEntityDAO TED = (TenantEntityDAO)context.getBean("TenantEntityDAO");
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
		
		TenantEntity tenant = TED.GetTenant(plainURI, 0);
		
		map.addAttribute("contactname", tenant.getContactname());
		map.addAttribute("contactemail", tenant.getContactemail());
		ISOCountryPhone countryinfo = GetCountryInfo(tenant.getAddrcountrycode());
		map.addAttribute("dialcode", "+" + countryinfo.getDialcode());
		map.addAttribute("addrcountryname", countryinfo.getIsoname());
		map.addAttribute("addrcountrycode", countryinfo.getIsocode2());
		
		return "signupconfirm";
		
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
		
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");		
		List <CountryPostalCode> countrypostalcodes = TED.GetPCDetailsForCntry(addrPostalCode, addrCountryCode);

		// Build Json Reader map for jqgrid		
		ObjectMapper mapper = new ObjectMapper();
		String jsonOut = mapper.writeValueAsString(countrypostalcodes); 
		response.setContentType("application/json");	
				
		return jsonOut;	
	}	

	private ISOCountryPhone GetCountryInfo(String CountryCode) {
		TenantEntityDAO TED = (TenantEntityDAO)AppCtxtProv.getApplicationContext().getBean("TenantEntityDAO");		
		ISOCountryPhone isocntryph = TED.GetInfoForISOCode(CountryCode);
				
		return isocntryph;		
	}

}
