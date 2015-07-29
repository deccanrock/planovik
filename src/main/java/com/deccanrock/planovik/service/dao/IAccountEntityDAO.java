package com.deccanrock.planovik.service.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.AccountEntity;
import com.deccanrock.planovik.entity.TenantEntity;
import com.deccanrock.planovik.location.CountryPostalCode;
import com.deccanrock.planovik.location.ISOCountryPhone;

public interface IAccountEntityDAO {

	AccountEntity GetAccount(String info, int infotype) throws IOException, SQLException;

	String CreateAccount(AccountEntity account) throws IOException, SQLException;

	boolean AccountExists(String contactemail) throws IOException, SQLException;

	ISOCountryPhone GetInfoForISOCode(String countryCode) throws IOException, SQLException;

	List<CountryPostalCode> GetPCDetailsForCntry(String addrpostalcode, String addrcountrycode)
										throws IOException, SQLException;

	String UpdateAccount(AccountEntity account) throws IOException, SQLException;

	void SetAccountStatus(int id, int value) throws IOException, SQLException;

	String VerifyPin(Short pin, int id) throws IOException, SQLException;

	boolean ContactEmailExists(String contactEmail) throws IOException, SQLException;

	List<TenantEntity> GetTenants(int id) throws IOException, SQLException;

}
