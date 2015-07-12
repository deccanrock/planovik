package com.deccanrock.planovik.service.utils;

import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.Random;
import java.util.StringTokenizer;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.apache.commons.codec.binary.Base64;


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
	  
	  public static String ComputeSecretKeyForTenant () throws GeneralSecurityException {
		  SecretKey secretKey = null;
		  String stringKey=null;

		  try {
			  secretKey = KeyGenerator.getInstance("AES").generateKey();
		  } catch (NoSuchAlgorithmException e) {/* LOG YOUR EXCEPTION */}

		  if (secretKey != null)
			  stringKey = Base64.encodeBase64String(secretKey.getEncoded());
		  
		  return stringKey;
	  }
	  
	  public static short genrandomnumber() {
		  // Returns 5 digit random number in the range 12345 - 98765
		  // *TODO* change this to generate variable length
		  Random r = new Random( System.currentTimeMillis() );
		  return (short) (r.nextInt(98766-12345) + 12345);
	  }
	  
	  // Checks if a given string contains digits only
	  public static boolean isNumeric(String str) {
		  NumberFormat formatter = NumberFormat.getInstance();
		  ParsePosition pos = new ParsePosition(0);
		  formatter.parse(str, pos);
		  return str.length() == pos.getIndex();
	  }	  
}