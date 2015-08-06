package com.deccanrock.planovik.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.deccanrock.planovik.Tenant.TenantContextHolder;

public class PlnvkAuthUsernamePasswordFilter extends UsernamePasswordAuthenticationFilter implements AuthenticationProvider   {
	
    public PlnvkAuthUsernamePasswordFilter() {
        super();
    }

	@Override	
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
			TenantContextHolder.setTenantFromRequestURL(request, response);
			
			final String tenantid = request.getParameter("tenantid");
			request.getSession().setAttribute("tenantid", tenantid);

		    // return super.attemptAuthentication(request, response); 
			
		    return getAuthenticationManager().authenticate((Authentication) new UsernamePasswordAuthenticationToken(
		    		request.getParameter("username"), request.getParameter("password")));	
	}

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}
	 
  }