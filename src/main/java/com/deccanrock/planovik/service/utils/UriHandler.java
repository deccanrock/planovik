package com.deccanrock.planovik.service.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;


public class UriHandler {

	public static Map<String, String> Decode (String uri) throws UnsupportedEncodingException {

        Map<String, String> params = new HashMap<String, String>();
        for (String param : uri.split("&")) {
            String pair[] = param.split("=");
            String key = URLDecoder.decode(pair[0], "UTF-8");
            String value = "";
            if (pair.length > 1) {
                value = URLDecoder.decode(pair[1], "UTF-8");
            }
            params.put(new String(key), new String(value));
        }
        
        return params;
	}
	
	/**
	 * Extracts the domain name from {@code url}
	 * by means of String manipulation
	 * rather than using the {@link URI} or {@link URL} class.
	 * Example: extracts www from http://www.planovik.com:8080
	 * will return localhost for http://localhost:8080 and 127.0.0.1 for http://127.0.0.1:8080
	 * should handle various formats
	 * planovik.com, planovik.com:8080 (default to www)
	 * www.planovik.com (tenant is www)
	 * planovik.com/desunl (tenant is desunl)
	 * corp.planovik.com (tenant is corp)
	 * ignores port number
	 * @param url is non-null.
	 * @return the domain name within {@code url}.
	 */
	public static String getTenantName(String url) {
		
		if (url.contains("localhost"))
			return "localhost";
		
		if (url.contains("127.0.0.1"))
			return "127.0.0.1";

		String tName = new String(url);
		int index = tName.indexOf("://");
		
		if (index != -1) {
		  // keep everything after the "://"
			tName = tName.substring(index + 3);
		}
		
		index = tName.indexOf('/');
		
		if (index != -1) {
		  // keep everything before the '/'
			tName = tName.substring(0, index);
		}
		
		int pos = tName.indexOf('.');
		if (pos == -1) {
			pos = tName.indexOf(':');			
		}
		
		String tenantstr = "";
		if (pos == -1)
			tenantstr = tName.substring(0, tName.length()-1);
		else			
			tenantstr = tName.substring(0, pos);
		
		// Handle cases such as planovik.com
		if (tenantstr.contentEquals("planovik"))
			tenantstr = "www";
		
		return tenantstr; 
	}

	/**
	 * Extracts the domain name from {@code url}
	 * by means of String manipulation
	 * rather than using the {@link URI} or {@link URL} class.
	 * Example: extracts www from http://www.planovik.com:8080
	 * will return localhost for http://localhost:8080 and 127.0.0.1 for http://127.0.0.1:8080
	 * ignores port number
	 * @param url is non-null.
	 * @return the domain name within {@code url}.
	 */
	public static String getDomainUrl(String url) {
		
		if (url.contains("localhost"))
			return "localhost";
		
		if (url.contains("127.0.0.1"))
			return "127.0.0.1";

		String dName = new String(url);
		int index = dName.indexOf("://");
		
		if (index != -1) {
		  // keep everything after the "://"
			dName = dName.substring(index + 3);
		}
		
		index = dName.indexOf('/');
		
		if (index != -1) {
		  // keep everything after the '/'
			dName = dName.substring(index, url.length());
		}
		
		return dName;
	}

}