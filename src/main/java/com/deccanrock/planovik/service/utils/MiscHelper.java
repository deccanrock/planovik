package com.deccanrock.planovik.service.utils;

import java.util.StringTokenizer;


public class MiscHelper { 
     
	  /**
	   * Compute short name from long name
	   * */
	  public static String ComputeTenantName(String tenantDesc) {

		  // Tokenize and consider first 2 strings for short name		  
		  tenantDesc = tenantDesc.toLowerCase();
		  StringTokenizer defaultTokenizer = new StringTokenizer(tenantDesc);

		  if (defaultTokenizer.countTokens() == 1) {
			  String token = defaultTokenizer.nextToken();
			  if (token.length() <= 6 )
				  return token.substring(0, token.length());
			  else
				  return token.substring(0, 6);
		  }
		  
		  String firsttoken = defaultTokenizer.nextToken();
		  String secondtoken = defaultTokenizer.nextToken();
		  if (firsttoken.length() <= 3 )
			  firsttoken = firsttoken.substring(0, firsttoken.length());
		  else
			  firsttoken =  firsttoken.substring(0, 3);
		  if (secondtoken.length() <= 3 )
			  secondtoken = secondtoken.substring(0, secondtoken.length());
		  else
			  secondtoken =  secondtoken.substring(0, 3);
		  
		  // 3 + 3 from first 2 tokens		  
		  return firsttoken + secondtoken;
	  }
}