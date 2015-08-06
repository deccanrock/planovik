<%@ include file="header.jsp" %>


<div  class="loginblock">
	<div class="loginform">
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
			<div class="error">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<c:url var="loginUrl" value="/app/j_spring_security_check" />
		<form name='loginForm' autocomplete='off' action="${loginUrl}" method='POST'>		
		
			<div>
				<span style="color: #777;font-size:14px;">Username</span>
				<input type='text' id="username" name="username" style="margin-bottom:16px;" class="col-sm-12" />				
			</div>
			<div>
				<span style="color: #777;font-size:14px;">Password</span>
				<input type='password' id="password" name="password" style="margin-bottom:16px;" class="col-sm-12" />
				<br />
			</div>
			<input type='hidden' id="tenantid" name="tenantid" value="${tenantid}" />
			<input type='hidden' id="tenantname" name="tenantname" value="${tenantname}" />
			
			<div>		
	            <input type="submit" id="signupsubmit" class="btn btn-info btn-sm" value="Login" />
			</div>
								
		</form>
	</div>
	<div style="margin-top:20px;font-size:14px;">
		<a href="http://localhost:8080/app/recoverpassword">
	    	Lost your password?
		</a>
	</div>
</div>

<%@ include file="footer.jsp" %>