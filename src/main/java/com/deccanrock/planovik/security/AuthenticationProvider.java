package com.deccanrock.planovik.security;

import java.util.Date;

import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.deccanrock.planovik.entity.UserLoginAttempts;
import com.deccanrock.planovik.service.dao.UserDetailsDao;

public class AuthenticationProvider extends DaoAuthenticationProvider {

	UserDetailsDao userDetailsDao;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		try {

			Authentication auth = super.authenticate(authentication);

			// if reach here, means login success, else exception will be thrown
			// reset the user_attempts
			userDetailsDao.resetFailAttempts(authentication.getName());

			return auth;

		} catch (BadCredentialsException e) {

			userDetailsDao.updateFailAttempts(authentication.getName());
			throw e;

		} catch (LockedException e) {

			String error = "";
			UserLoginAttempts userAttempts = userDetailsDao.getUserAttempts(authentication.getName());
			if (userAttempts != null) {
				Date lastAttempts = userAttempts.getLastModified();
				error = "Your account " + authentication.getName() + " is locked due to unsuccessful login attempts!";
			} else {
				error = e.getMessage();
			}

			throw new LockedException(error);
		} catch (DisabledException e) {
			String error = "";
			error = e.getMessage();
			error = "Your account " + authentication.getName() + " is disabled.";			
			throw new DisabledException(error);
		}

	}

	public UserDetailsDao getUserDetailsDao() {
		return userDetailsDao;
	}

	public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
		this.userDetailsDao = userDetailsDao;
	}

}