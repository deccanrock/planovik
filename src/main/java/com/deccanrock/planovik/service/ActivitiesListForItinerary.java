package com.deccanrock.planovik.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.dao.ActivityEntityDAO;

public class ActivitiesListForItinerary {
	
	private Object[] activityList = null;
	private List<TravelActivityEntity> travelList = null;
	private int itinnum, version;
	private short tzoffset;
	
    @SuppressWarnings("rawtypes")
	public static class ActivityCallable implements Callable {
    	
    	private int itinnum, version;
    	private short tzoffset;

    	ActivityCallable(int itinnum, int version, short tzoffset) {
            this.itinnum = itinnum;
            this.version = version;
            this.tzoffset = tzoffset;
        }
        
    	public Object call() throws InterruptedException {
    		List<TravelActivityEntity>travelListthread = null;
    		ApplicationContext  context = new ClassPathXmlApplicationContext("springdatabase.xml");
    		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");		
    		try {
    			travelListthread = AED.getTravelActivities(itinnum, version, tzoffset);
    			
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		((ClassPathXmlApplicationContext) context).close();
    		
    		return travelListthread;
        }
    }	
	

    public ActivitiesListForItinerary(int itinnum, int version, short tzoffset) {
		this.itinnum = itinnum;
		this.version = version;
		this.tzoffset = tzoffset;
	}
	

	public Object[] BuildActivitiesList() {
		
		// Highly optimized function using multi threading
		ExecutorService pool = Executors.newFixedThreadPool(1);
		
        ActivityCallable travelactivity = new ActivityCallable(itinnum, version, tzoffset);
        
        Future future1 = pool.submit(travelactivity);
        try {
			travelList = (List<TravelActivityEntity>)future1.get();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        pool.shutdown();	    	    		
		
		// Done, create daywise list for 5 activities nicely sorted by start of respective activity start times
	    Collections.sort(this.travelList, TravelActivityEntity.ActivityByIdComparator);
	    // Time may be set to 0 initially, therefore activity id sort is preceeds
	    Collections.sort(this.travelList, TravelActivityEntity.ActivityByTimeLongComparator);
	    return CreateDaywiseActivityList();
	}
	
	
	private Object[] CreateDaywiseActivityList () {
		// Currently only one
		return travelList.toArray();
	}
	 
}
	