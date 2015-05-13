package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.ServiceProviderEntity;
import com.deccanrock.planovik.entity.UserEntity;



public interface IServiceProviderDAO {
	
	boolean Login ( String username, String pass) throws IOException, SQLException;
	List<String> GetOrgList(String query) throws IOException, SQLException;
	String ManageUser(UserEntity user) throws IOException, SQLException;
	UserEntity GetUser(String username) throws IOException, SQLException;
	boolean UserExists(String userName) throws IOException, SQLException;
	public void DeleteUser(String username) throws IOException, SQLException;
	public String UpdateUserProfile (int id, String pass) throws IOException, SQLException;	
	public ServiceProviderEntity GetService(String name, short type) throws IOException, SQLException;
	public String ManageService(ServiceProviderEntity serviceprovider) throws IOException, SQLException;
}