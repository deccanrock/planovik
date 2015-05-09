package com.deccanrock.planovik.constants;

import java.util.Arrays;
import java.util.List;

/**
* Global constants placeholder class.
*
*/


public class PlnvkConstants {
	
	public enum Status {
	    OPEN(0),
	    LOCKED(1),
	    CLOSED(2);

	    private final int value;

	    private Status(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }
	}
	
	public enum Code {
		VERIFY_NEW_ORG(0), 
		NEW_ORG_VERIFIED(1), 
		ENABLE_ORG_FOR_ACTIVITY(2), 
		AWAITING_ORG_CONFIRMATION(3), 
		ORG_DETAILS_VERIFIED(4), 
		ORG_SUSPENDED(5);
		
	    private final int value;

	    private Code(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }		
	}
	
	public enum  Itinstatus {
		Initial(0),
		Draft(1),
		Final(2),
		Closed(3),
		Deleted(4);

		private final int value;

	    private Itinstatus(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }		
	}

	public enum  Itincurrconv {
		Inactive(0),
		Active(1),
		Deleted(2);

		private final int value;

	    private Itincurrconv(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }		
	}

	public enum  Itinactivitystatus {
		Draft(0),
		Final(1),
		Deleted(2);

		private final int value;

	    private Itinactivitystatus(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }		
	}
		
	public enum  ActivityType {
		Travel(0),
		Hotel(1),
		Visit(2),
		Rental(3),
		Other(4);

		private final int value;

	    private ActivityType(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }		
	}
	
	// TO_DO - This should be moved to DB
	private final List <String> roles = Arrays.asList("ROLE_USER", "ROLE_ADMIN");
	public List<String> getUserRoles() { return roles; }
		
	private final List <String> travelmodes = Arrays.asList("Air", "Train", "Car", "Bus", "Boat", "Ship");
	public List<String> getTravelmodes() { return travelmodes; }
	
	private final List <String> servicetype = Arrays.asList("Airlines", "Hotels", "Transport", "Other");
	public List<String> getServicetype() { return servicetype; }

    // 0=city transfers, 1=intercity
	private final List <String> transportcoverage = Arrays.asList("cityonly", "intercity");
	public List<String> getTransportcoverage() { return transportcoverage; }

}
