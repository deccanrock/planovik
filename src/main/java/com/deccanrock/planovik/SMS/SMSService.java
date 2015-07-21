package com.deccanrock.planovik.SMS;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

// For testing this cheap shit service called freesms8 is being used, ideally in production this should be 
// replaced with something more respectable

public class SMSService {
	
	static String freesms8id = "9866277000";
	static String freesms8pswd = "9191";
	

	public static String SendSMS(String phonenumber, String message) throws UnirestException {
		
		String encmsg = null;
		try {
			encmsg = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String getbody = "https://freesms8.p.mashape.com/index.php?msg=" + encmsg + "&phone=" + 
							phonenumber + "&pwd=" + freesms8pswd + "&uid=" + freesms8id;
		HttpResponse<JsonNode> response = Unirest.get(getbody)
		.header("X-Mashape-Key", "qGGjOHTJh1mshg7XQynjcRyTVm0Vp1tBWMMjsnptROeWm58U8U")
		.asJson();
		
		return response.toString();
	}
	

}