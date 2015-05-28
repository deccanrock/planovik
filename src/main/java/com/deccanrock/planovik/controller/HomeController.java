package com.deccanrock.planovik.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.deccanrock.planovik.service.dao.TenantImplDAO;
import com.deccanrock.planovik.service.utils.UriHandler;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		String domain = UriHandler.getTenantName(request.getRequestURL().toString());		
		String tagline;
		// No need to set context as its set by default to main data source
		if (domain.equalsIgnoreCase("corp") || domain.equalsIgnoreCase("") || domain.equalsIgnoreCase("/") ||
				domain.equalsIgnoreCase("127.0.0.1") || domain.equalsIgnoreCase("localhost"))
			tagline = "Home";
		else {
			// Domain and context check
			ApplicationContext context = ApplicationContextProvider.getApplicationContext();
			TenantImplDAO TID = (TenantImplDAO)context.getBean("TenantImplDAO");	
			tagline = TID.GetTagline("du");
		}
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("tagline", tagline );		
		return "home";
	}
	
}
