package com.deccanrock.planovik.service.dao;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.deccanrock.planovik.entity.OrgEntity;
import com.deccanrock.planovik.service.OrgDetailsMapper;
 
@Component
@Transactional
public class OrgEntityDAO implements
		IOrgEntityDAO {

	@Autowired
	private JdbcTemplate dbtemplate;
	@Autowired
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public void setTemplate(JdbcTemplate template) {
		this.dbtemplate = template;
	}
	
    @Override
    public Map<String, Object> createOrg( OrgEntity org) {

    	dbtemplate = new JdbcTemplate(dataSource);    	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_vrf_org_insert");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("orgname", org.getName());
		inParamMap.put("contactip", org.getContactip());
		inParamMap.put("isocountrycode", org.getIsocountrycode());
		inParamMap.put("contacttitle", org.getContacttitle());
		String contactname = org.getContactfname() + ' ' + org.getContactlname();		
		inParamMap.put("contactname", contactname);
		inParamMap.put("contactphoneoffice", org.getContactphoneoffice());
		inParamMap.put("contactphonemobile", org.getContactphonemobile());
		inParamMap.put("contactemail", org.getContactemail());
		inParamMap.put("contactdesignation", org.getContactdesignation());
		inParamMap.put("tzoffset", org.getTzoffset());

		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);

		// System.out.println(simpleJdbcCallResult);
		
		return simpleJdbcCallResult;    	
    }

    
    @Override
    public OrgEntity GetOrgDetails ( String orgidname) {

    	// Use either org name or id to get details, orgid is PK
    	// format of orgidname is "<name> <id>"
    	
    	String orgid = orgidname.substring(orgidname.lastIndexOf(' ')+1, orgidname.length()); 
    			
        String SQL = "Call sp_getorgdetails(" + "'" + orgid + "'" + ");";
    	dbtemplate = new JdbcTemplate(dataSource);    	

 		List<OrgEntity> org = dbtemplate.query(SQL, new OrgDetailsMapper());
 		
 		// For now only return one but can be used to retrieve multiple org details
 		return org.get(0); 			
		
    }
    
    @Override
    public boolean OrgExists( String orgname) {

        
        dbtemplate = new JdbcTemplate(dataSource);    	
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dbtemplate)
		.withProcedureName("sp_org_exists");

		Map<String, Object> inParamMap = new HashMap<String, Object>();

		inParamMap.put("orgname", orgname);
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);

		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		String orgid = (String) simpleJdbcCallResult.get("organizationid");
		
		if (orgid != null)
			return true;
		else
			return false;
    }
 
}