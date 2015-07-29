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
import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.location.ISOCountryPhone;
import com.deccanrock.planovik.location.CountryPostalCode;
import com.deccanrock.planovik.security.HashCode;
import com.deccanrock.planovik.service.AccountEntityMapper;
import com.deccanrock.planovik.service.CountryPostalCodeMapper;
import com.deccanrock.planovik.service.TenantEntityMapper;

@Component
@Transactional
public class AccountEntityDAO implements IAccountEntityDAO {

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;
	
    public AccountEntityDAO(DataSource dataSource) {
    	super();
	    this.dataSource = dataSource;
    }
		
	AccountEntityDAO () {}
	
 	
	@Override
 	public AccountEntity GetAccount(String info, int infotype) {
 		
		// set infotype=0 to getAccount using accountid id
		// set infotype=1 to getAccount using account email
		// set infotype=2 to getAccount using tenant id
		// set infotype=3 to getAccount using tenant name
		
        String SQL = "Call sp_getaccount(" + "'" + info + "'," + infotype + ");";
        
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   	
		
    	// Should only get one account
 		List<AccountEntity> AccountList = jdbcTemplate.query(SQL, new AccountEntityMapper());
 		
 		if (AccountList.size() == 0)
 			return null;
 		else {
 			// Get Tenants
 			AccountList.get(0).setTenants(this.GetTenants(AccountList.get(0).getId()));
 			return AccountList.get(0);
 		}
 	}

	@Override
	public String CreateAccount(AccountEntity account) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_createaccount");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();
		
		inParamMap.put("incontactname", account.getContactname());
		inParamMap.put("incontactemail", account.getContactemail());
		inParamMap.put("inaddrcountrycode", account.getAddrcountrycode());
		inParamMap.put("incontactpswd", HashCode.getHashPassword(account.getContactpswd()));
		inParamMap.put("incontactphonemobile", account.getContactphonemobile());
		inParamMap.put("intzoffset", account.getTzoffset());
		inParamMap.put("inaccountstatus", PlnvkConstants.RegStatus.Pending.getValue());
		inParamMap.put("insecurekey", account.getSecurekey());
		inParamMap.put("inpin", account.getPin());
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result;
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = simpleJdbcCallResult.get("result").toString();
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
		
    	return result;		
	}

	@Override
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
	public boolean AccountExists(String contactemail) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_checkaccountexists");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("incontactemail", contactemail);		
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

	@Override
	public String UpdateAccount(AccountEntity account) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_updateaccount");
    	     	 
    	Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("inid", account.getId());    	
		inParamMap.put("incontactname", account.getContactname());
		inParamMap.put("incontactdesignation", account.getContactdesignation());
		// inParamMap.put("incontactemail", tenant.getContactemail());
		// inParamMap.put("incontactpswd", HashCode.getHashPassword(tenant.getContactpswd()));
		inParamMap.put("incontactphoneoffice", account.getContactphoneoffice());
		inParamMap.put("incontactphonemobile", account.getContactphonemobile());
		inParamMap.put("inaddrpostalcode", account.getAddrpostalcode());
		inParamMap.put("inaddrstreet1", account.getAddrstreet1());
		inParamMap.put("inaddrstreet2", account.getAddrstreet2());
		inParamMap.put("inaddrcitytown", account.getAddrcitytown());
		inParamMap.put("inaddrdistrict", account.getAddrdistrict());
		inParamMap.put("inaddrstateprovrgn", account.getAddrstateprovrgn());
		inParamMap.put("inaddrhomeurl", account.getAddrhomeurl());
		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		String result = "Success";
    	try {    	
    		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);			
		} catch (Exception ex) {
		    result = ex.getMessage();
		} 					
		
    	return result;				
	}

	@Override
	public void SetAccountStatus(int id, int value) {
        String SQL = "Call sp_updateaccountstatus(" +  id + "," + value + ");";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	   			
 		jdbcTemplate.execute(SQL);
 		// Assume success though result should be tracked
	}

	@Override
	public String VerifyPin(Short pin, int id) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_verifypin");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("inpin", pin);		
    	inParamMap.put("inid", id);		
    	SqlParameterSource in = new MapSqlParameterSource(inParamMap);
 		
    	String result = "Fail";
    	try {    	
			Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
			result = simpleJdbcCallResult.get("result").toString();
    	} catch (Exception ex) {
		}
    	
    	if (result.contentEquals("Success")) {
    		SetAccountStatus(id, PlnvkConstants.RegStatus.Confirmed.getValue());
    		// Setup tenant instance along with credentials and inform user
    		
    	}
    	
    	return result;
	}

	@Override
	public boolean ContactEmailExists(String contactEmail) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);	    	    	
    	SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
    	.withProcedureName("sp_checkcontactemailexists");
    	
    	Map<String, Object> inParamMap = new HashMap<String, Object>();		
    	inParamMap.put("incontactemail", contactEmail);		
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
	public List<TenantEntity> GetTenants(int id) {
		String SQL = "Call sp_gettenants(" + id + ");";    	
		
		JdbcTemplate dbtemplate = new JdbcTemplate(dataSource);  	

		TenantEntityMapper tem = new TenantEntityMapper();

		List <TenantEntity> tenants = null;
    	try {    	
    		tenants = dbtemplate.query(SQL, tem);
    	} catch (Exception ex) {
    		tenants = null;
    	} 					
 		
 		return tenants; 			
	}

}