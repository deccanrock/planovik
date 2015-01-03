package com.deccanrock.planovik.service.dao;

import com.deccanrock.planovik.entity.UserLoginAttempts;

public interface IUserDetailsDao {

	void updateFailAttempts(String username);

	void resetFailAttempts(String username);
	
	UserLoginAttempts getUserAttempts(String username);

}