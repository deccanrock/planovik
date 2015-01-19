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
	 *
	 * @param url is non-null.
	 * @return the domain name within {@code url}.
	 */
	public static String getUrlDomainName(String url) {
		String domainName = new String(url);
		
		int index = domainName.indexOf("://");
		
		if (index != -1) {
		  // keep everything after the "://"
		  domainName = domainName.substring(index + 3);
		}
		
		index = domainName.indexOf('/');
		
		if (index != -1) {
		  // keep everything before the '/'
		  domainName = domainName.substring(0, index);
		}
		
		// check for and remove a preceding 'www'
		// followed by any sequence of characters (non-greedy)
		// followed by a '.'
		// from the beginning of the string
		domainName = domainName.replaceFirst("^www.*?\\.", "");
		
		// Look for first '.' or ':' and get the string until that position which is real domain name we are looking
		int pos = domainName.indexOf('.');
		if (pos == -1) {
			pos = domainName.indexOf(':');			
		}
		
		if (pos == -1)
			return domainName.substring(0, domainName.length()-1);
		else
			return domainName.substring(0, pos);
	}
}