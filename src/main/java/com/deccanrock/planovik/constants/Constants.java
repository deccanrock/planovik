package com.deccanrock.planovik.constants;

/**
* Place all constants relating to Admin Tasks here.
*
*/


public class Constants {
	
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
	
	
}
