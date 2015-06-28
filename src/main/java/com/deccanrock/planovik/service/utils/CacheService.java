package com.deccanrock.planovik.service.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;


public class CacheService { 

    @Autowired
    @Qualifier("cache")
    private net.sf.ehcache.Cache cache;
    
    public CacheService(net.sf.ehcache.Cache cache) {
    	super();
	    this.cache = cache;
    }    
    
    CacheService () {}
	
    // This is a singleton
    public net.sf.ehcache.Cache getCache() {
        return cache;
    }
}