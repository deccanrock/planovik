package com.deccanrock.planovik.service.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;


public class FileHandler {

	private String resourcesfolder;
	private String zonefolder;

	public void setResourcesfolder(String resourcesfolder) {
	    this.resourcesfolder = resourcesfolder;
	}

	public void setZonefolder(String zonefolder) {
	    this.zonefolder = zonefolder;
	}
	
	public String getZonefolder() {
	    return this.zonefolder;
	}
	
	// This function should be overloaded based on future requirements
	public String fileUpload(MultipartFile uploadedFile, String type, String purpose, int istenant, 
			int accntortenantid, int userid, String zoneid) {

		try {        	
        	String orgfilename = uploadedFile.getOriginalFilename();
        	String uploadfolderpath = "";
        	String fulluploadfilename = "";
        	
        	// Example: c://zone1/account, c://zone1//tenant
        	// These folders must be already created and available for every zone
        	if (istenant == 0) // account upload 
        		uploadfolderpath = this.zonefolder + zoneid + '/' + "/account/" + accntortenantid;
        	else // tenant upload
        		uploadfolderpath = this.zonefolder + zoneid + '/' + "/tenant/" + accntortenantid;

        	// Check if account or tenant id folder exists
        	if (!Files.isDirectory(Paths.get(uploadfolderpath)))
        		// Create directory
        		new File(uploadfolderpath).mkdir();
        	        	
        	// At this point uploadfolder path should be created and something like
        	// c://zone1/account/1, c://zone1/tenant/2
        	// Now based on type and purpose set and create folders before writing
        	if (type == "image") {
        		uploadfolderpath = uploadfolderpath + "/images";
            	if (!Files.isDirectory(Paths.get(uploadfolderpath)))
            		// Create directory
            		new File(uploadfolderpath).mkdir();
        		
            	if (purpose == "setavatar") {
            		uploadfolderpath = uploadfolderpath + "/avatars";            		
                	if (!Files.isDirectory(Paths.get(uploadfolderpath)))
                		// Create directory
                		new File(uploadfolderpath).mkdir();
                	
                	if (istenant == 0)
                		fulluploadfilename = uploadfolderpath + '/' + accntortenantid + ".jpg";
                	else
                		fulluploadfilename = uploadfolderpath + '/' + userid + ".jpg";
            	}
        		
        	}
        	else if (type == "file") {
        		uploadfolderpath = uploadfolderpath + "/files";
            	if (!Files.isDirectory(Paths.get(uploadfolderpath))) {
            		new File(uploadfolderpath).mkdir();
               		uploadfolderpath = uploadfolderpath + '/' + accntortenantid;
            		new File(uploadfolderpath).mkdir();
            	}
            	else { 
               		uploadfolderpath = uploadfolderpath + '/' + accntortenantid;
            		if (!Files.isDirectory(Paths.get(uploadfolderpath)))
                		new File(uploadfolderpath).mkdir();
            	}
            		
           		fulluploadfilename = uploadfolderpath + '/' + orgfilename;            	
        	}
        		        	        	
        	byte[] bytes = uploadedFile.getBytes();
            BufferedOutputStream stream =
                    new BufferedOutputStream(new FileOutputStream(new File(fulluploadfilename)));
            stream.write(bytes);
            stream.close();
            return "File upload successful!";
        } catch (Exception e) {
            return "File upload failed. Please try again.";
        } 
	}

}