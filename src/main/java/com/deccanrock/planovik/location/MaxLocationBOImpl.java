package com.deccanrock.planovik.location;
 
import java.io.IOException;
import java.net.URL;
import org.springframework.stereotype.Component;
import com.maxmind.geoip.Location;
import com.maxmind.geoip.LookupService;
import com.maxmind.geoip.regionName;
 
@Component
public class MaxLocationBOImpl implements MaxLocationBO {
 
	@Override
	public MaxLocation getLocation(String ipAddress) {
 
		String dataFile = "location/GeoLiteCity.dat";
		return this.getLocation(ipAddress, dataFile);
 
	}
 
	private MaxLocation getLocation(String ipAddress, String locationDataFile) {
 
	  MaxLocation maxlocation = null;
 
	  URL url = getClass().getClassLoader().getResource(locationDataFile);
 
	  if (url == null) {
		  System.err.println("location database is not found - "
			+ locationDataFile);
	  } else {
		  try {
			  	maxlocation = new MaxLocation();
				// Handle localhost
				if (ipAddress.equals("127.0.0.1") || ipAddress.equals("localhost")) {

					maxlocation.setCountryCode("IN"); // India
					maxlocation.setCountryName("India");
					maxlocation.setRegion("TS");
					maxlocation.setRegionName("Telangana");
					maxlocation.setCity("Hyderabad");
					maxlocation.setPostalCode("500034");
					maxlocation.setLatitude("17.3660° N");
					maxlocation.setLongitude("78.4760° E");
				}
				else {
					
					LookupService lookup = new LookupService(url.getPath(),
							LookupService.GEOIP_MEMORY_CACHE);
					Location locationServices = lookup.getLocation(ipAddress);
			 
					maxlocation.setCountryCode(locationServices.countryCode);
					maxlocation.setCountryName(locationServices.countryName);
					maxlocation.setRegion(locationServices.region);
					maxlocation.setRegionName(regionName.regionNameByCode(
							locationServices.countryCode, locationServices.region));
					maxlocation.setCity(locationServices.city);
					maxlocation.setPostalCode(locationServices.postalCode);
					maxlocation.setLatitude(
			                                String.valueOf(locationServices.latitude));
					maxlocation.setLongitude(
				                            String.valueOf(locationServices.longitude));
				}
			
		  } catch (IOException e) {
	 
			System.err.println(e.getMessage());
	 
		  }
 
	 }
 
	 return maxlocation;
 
	}
}