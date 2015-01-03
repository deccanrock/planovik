package com.deccanrock.planovik.service.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;



public class TimeFormatter {

	public static String Format (Short inminutes, String format) {
		
		// This will be extended to support various formats, for now hh:mm
		
		// Check if minutes is -ve, if yes then local timezone is ahead of UTC
		boolean localTimeAheadOfUTC=false, localTimeSameAsUTC=false;
		
		if (Math.signum(inminutes) == 0)
			localTimeSameAsUTC = true;
		
		if (Math.signum(inminutes) == -1.0)
			localTimeAheadOfUTC = true;
				
	    int divisor_for_hours = Math.abs(inminutes) / 60;   
	    int divisor_for_minutes = Math.abs(inminutes) % 60;

	    if (localTimeSameAsUTC)
	    	return "";
	    
	    if (localTimeAheadOfUTC)
	    	return "+" + Integer.toString(divisor_for_hours) + ":" + Integer.toString(divisor_for_minutes);
	    else
	    	return "-" + Integer.toString(divisor_for_hours) + ":" + Integer.toString(divisor_for_minutes);
	    	
	}

	public static Date TimeUTCToLocal (Date utcDate, short tzoffset ) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(utcDate);
		// tzoffset is -ve, its represents offset of GMT from local time
		cal.add(Calendar.MINUTE, -(tzoffset));
		
		return cal.getTime();
	   
	}
	
	public static boolean IsNullDate (Date inDate) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(inDate);
		
		if (cal.get(Calendar.YEAR) < 10 )
	    	return false;
	    else 
	    	return true;
		
	}

}