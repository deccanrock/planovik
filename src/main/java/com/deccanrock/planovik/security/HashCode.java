package com.deccanrock.planovik.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class HashCode {

	public static String getHashPassword(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		// Default salt strength of 10 is applied
		return hashedPassword;
	}
	
	public static boolean matchPassword(String rawPassword, String encodedPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if (passwordEncoder.matches(rawPassword, encodedPassword))
				return true;
		else return false;
	}
}
