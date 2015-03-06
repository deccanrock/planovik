package com.deccanrock.planovik.service.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.multipart.MultipartFile;



public class FileHandler {

	private String resourcesfolder;

	@Resource(name="filehandler")
	public void setResourcesfolder(String resourcesfolder) {
	    this.resourcesfolder = resourcesfolder;
	}
	
		
	// This function should be overloaded based on future requirements
	public String fileUpload(MultipartFile uploadedFile, String type, String purpose, String username) {
		try {        	
        	String orgfilename = uploadedFile.getOriginalFilename();
        	String filefullpath = resourcesfolder;
        	String ext = null;
        	
        	if (type == "image") {
	        	int pos = orgfilename.indexOf('.');
	        	ext = orgfilename.substring(pos, orgfilename.length()); // will set .jpg.,.png...
	        	filefullpath = filefullpath + "/images";	        	

	        	if (purpose == "setavatar") {
	        		// Force extension to be jpg as browsers seem to be able to display any renamed image file
	        		if (!ext.contains(".jpg"))
	        			ext = ".jpg";
	        		filefullpath = filefullpath + "/avatars/" + username + ext;
	        	}
	        	else
	        		filefullpath = filefullpath + orgfilename;        	
        	}
        	else {
        		// Define action for type and purpose
        	}
        		        	        	
        	byte[] bytes = uploadedFile.getBytes();
            BufferedOutputStream stream =
                    new BufferedOutputStream(new FileOutputStream(new File(filefullpath)));
            stream.write(bytes);
            stream.close();
            return "File upload successful!";
        } catch (Exception e) {
            return "File upload failed. Please try again.";
        }
	}

}