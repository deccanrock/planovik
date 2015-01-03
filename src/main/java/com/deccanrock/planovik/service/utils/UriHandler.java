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
	
}