package com.deccanrock.planovik.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;

import com.deccanrock.planovik.controller.AppCtxtProv;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.service.dao.ActivityEntityDAO;

public class ActivitiesListForItinerary {
	
	private List<TravelActivityEntity> travelList = null;
	private int itinnum, version;
	private short tzoffset;
	private int tenantid;
	private DataSource tenantdatasource;
	
    @SuppressWarnings("rawtypes")
	public static class ActivityCallable implements Callable {
    	
    	private int itinnum, version, type;
    	private short tzoffset;
    	private int tenantid;
    	private DataSource tenantdatasource;

    	ActivityCallable(int itinnum, int version, short tzoffset, short type, int tenantid, DataSource tenantdataSource) {
            this.itinnum = itinnum;
            this.version = version;
            this.tzoffset = tzoffset;
            this.type = type;
            this.tenantid = tenantid;
            this.tenantdatasource = tenantdataSource;
        }
        
    	public Object call() throws InterruptedException {
    		List<TravelActivityEntity>travelListthread = null;
			ApplicationContext context = AppCtxtProv.getApplicationContext();
    		ActivityEntityDAO AED = (ActivityEntityDAO)context.getBean("ActivityEntityDAO");		
    		try {
    			// 0 = travel
    			travelListthread = AED.getActivitiesDetForType(itinnum, version, tzoffset, (short) 0, tenantid, tenantdatasource);
    			
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		return travelListthread;
        }
    }	
	

    public ActivitiesListForItinerary(int itinnum, int version, short tzoffset, int tenantid, DataSource tenantdataSource) {
		this.itinnum = itinnum;
		this.version = version;
		this.tzoffset = tzoffset;
		this.tenantid = tenantid;
		this.tenantdatasource = tenantdataSource;
	}
	

	public Object[] BuildActivitiesList() {
		
		// Highly optimized function using multi threading
		ExecutorService pool = Executors.newFixedThreadPool(1);
		
        ActivityCallable travelactivity = new ActivityCallable(itinnum, version, tzoffset, (short) 0, tenantid, tenantdatasource);
        
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
        if (this.travelList == null)
        	return null;
        
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
	
