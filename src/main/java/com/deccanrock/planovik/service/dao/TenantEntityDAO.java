package com.deccanrock.planovik.service.dao;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.constants.PlnvkConstants;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.entity.TravelActivityEntity;
import com.deccanrock.planovik.location.ISOCountryPhone;
import com.deccanrock.planovik.location.CountryPostalCode;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.CountryPostalCodeMapper;
import com.deccanrock.planovik.service.TenantEntityMapper;
import com.deccanrock.planovik.service.TravelActivityMapper;
import com.deccanrock.planovik.service.utils.MiscHelper;

@Component
@Transactional
public class TenantEntityDAO implements ITenantEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;
	
    public TenantEntityDAO(DataSource dataSource) {
    	super();
	    this.dataSource = dataSource;
    }
		
	TenantEntityDAO () {}
	
 	
	@Override
 	public TenantEntity GetTenant(String domain, int infotype) {
 		
        String SQL = "Call sp_gettenantfordomain(" + "'" + domain + "'," + infotype + ");";
        
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
 		List<TenantEntity> tenantList = jdbcTemplate.query(SQL, new TenantEntityMapper());
 		
 		if (tenantList.size() == 0)
 			return null;
 		else
 			return tenantList.get(0);
 	}

	@Override
	public String RegisterTenant(TenantEntity tenant) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_registertenant");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();
		
    	inParamMap.put("intenantdesc", tenant.getTenantdesc());
		inParamMap.put("incontactname", tenant.getContactname());
		inParamMap.put("incontactemail", tenant.getContactemail());
		inParamMap.put("inaddrcountrycode", tenant.getAddrcountrycode());
		inParamMap.put("incontactpswd", HashCode.getHashPassword(tenant.getContactpswd()));
		// inParamMap.put("incontactphonemobile", tenant.getContactphonemobile());
		inParamMap.put("intzoffset", tenant.getTzoffset());
		inParamMap.put("inregstatus", PlnvkConstants.RegStatus.Pending.getValue());
		inParamMap.put("insecurekey", tenant.getSecurekey());
		inParamMap.put("inpin", tenant.getPin());
		
		// Generate tenant name from tenant desc, at this point a default name if reserved
		// for and pro and enterprise customers which they can change at a later time
		tenant.setTenantname(MiscHelper.ComputeTenantName(tenant.getTenantdesc()));
    	inParamMap.put("intenantname", tenant.getTenantname());
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result;
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = simpleJdbcCallResult.get("result").toString();
			if (result.contentEquals("tenantexists")) { // try until unique tenant set
				String tenantName = tenant.getTenantname();
				short i = 1;
				while (result.contentEquals("tenantexists")) {
					tenantName = tenant.getTenantname();
					tenantName = tenantName + String.valueOf(i);
			    	inParamMap.put("intenantname", tenantName);
			    	in = new MapSqlParameterSource(inParamMap);
					simpleJdbcCallResult = simpleJdbcCall.execute(in);
					result = simpleJdbcCallResult.get("result").toString();
					i++;
				} 
			}
			
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
		
    	return result;		
	}

	public ISOCountryPhone GetInfoForISOCode(String countryCode) {
		// TODO Auto-generated method stub
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_getisocountryphone");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();
		
    	inParamMap.put("inisocode2", countryCode);		
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

    	ISOCountryPhone isocntryph = new ISOCountryPhone();
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			isocntryph.setIsoname(simpleJdbcCallResult.get("outisoname").toString());
			isocntryph.setIsocode3(simpleJdbcCallResult.get("outisocode3").toString());
			isocntryph.setDialcode(simpleJdbcCallResult.get("outdialcode").toString());
			isocntryph.setIsocode2(countryCode);
    	} catch (Exception ex) {
			isocntryph = null;
		} 					
	
    	return isocntryph;
	}

	@Override
	public boolean TenantExists(String tenantDesc) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_checktenantexists");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("intenantdesc", tenantDesc);		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 		
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			String result = simpleJdbcCallResult.get("result").toString();
			if (result.contentEquals("exists"))
					return true;
			else
					return false;
    	} catch (Exception ex) {
			return false;
		} 					
	}

	@Override
	public List<CountryPostalCode> GetPCDetailsForCntry(String addrpostalcode, String addrcountrycode) {

        String SQL = "Call sp_postalcodeinforcntry(" + "'" + addrpostalcode + "'," +  "'" + addrcountrycode + "'" + ");";
        
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
    	CountryPostalCodeMapper cpcm = new CountryPostalCodeMapper();
    	cpcm.setCountrycode(addrcountrycode);
    	cpcm.setPostalcode(addrpostalcode);

		List <CountryPostalCode> countrypostalcodes = null;
		
    	try {    	
    		countrypostalcodes = jdbcTemplate.query(SQL, cpcm);
     		if (countrypostalcodes.size() == 0)
     			countrypostalcodes =  null;
    	} catch (Exception ex) {
    		countrypostalcodes = null;
    	} 			
    	 		
		return countrypostalcodes;		
		
	}
}