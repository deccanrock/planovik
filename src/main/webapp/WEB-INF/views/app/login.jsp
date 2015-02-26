<%@ include file="header.jsp" %>


<div  class="loginblock">
	<div class="loginform">
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
			<div class="error">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<form name='loginForm' autocomplete='off' action="<c:url value='/j_spring_security_check' />" method='POST'>		
		
			<div>
				<span style="color: #777;font-size:14px;">Username</span>
				<input type='text' name='username' style="margin-bottom:16px;" class="col-sm-12" />				
			</div>
			<div>
				<span style="color: #777;font-size:14px;">Password</span>
				<input type="text" name="preventAutoPass" id="preventAutoPass" style="display:none" />
				<input type='password' name='password' style="margin-bottom:16px;" class="col-sm-12" />
				<br />
			</div>

			<div>		
	            <input type="submit" id="signupsubmit" class="btn btn-info btn-sm" value="Login" />
			</div>
						
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
		</form>
	</div>
	<div style="margin-top:20px;font-size:14px;">
		<a href="http://localhost:8080/app/recoverpassword">
	    	Lost your password?
		</a>
	</div>
</div>

<%@ include file="footer.jsp" %>