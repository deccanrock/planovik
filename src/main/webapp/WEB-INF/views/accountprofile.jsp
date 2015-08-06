<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
<html lang="en">

<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Account - ${contactname}</title>
    
    <!-- Fav Icon -->
    <link rel="shortcut icon" href="<c:url value='/resources/images/planovik_fav.png'/>" type="image/x-icon" />    

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/www/css/bootstrap.min.css'/>" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/www/css/stylish-portfolio.css'/>" />

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="<c:url value='/resources/www/font-awesome/css/font-awesome.min.css'/>" />
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery -->
    <script src="<c:url value='/resources/www/js/jquery.min.1.10.js'/>" ></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/resources/www/js/bootstrap.min.js'/>" ></script>
    
	<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
		    
</head>

<body>

	<div class="wrapper">
	
	    <!-- logo -->
	    <div class="header_container_small">
	    	<div class="container">
            	<div class="col-xs-12">
	            	<div class="col-xs-6">
					    <a href="#">
				            <img class="logo" src="/resources/images/planovik_fav_new.png" />
					    </a>        
					</div>
	            	<div class="col-xs-6">
						<a href="" title="${contactname}">
						<img class="profilelogo" src="/resources/account/${accountid}/avatars/contact.jpg" class="photo" alt="${contactname}">
						</a>
					</div>
				</div>
            	<div class="col-xs-6 loginblock" id="div_login" style="display:none;">				
	                <form class="" id="register-form" method="post" action="/login">
		                <div class="col-xs-4">
					    	<input class="form-control" type="text" placeholder="Email" id="contactemail" maxlength="120" name="contactemail" style="border-radius:0px;" />			    	
						</div>
		                <div class="col-xs-4">
					    	<input class="form-control" type="password" placeholder="Password" id="contactpswd" maxlength="120" name="contactpswd" style="border-radius:0px;" />
					    	<a href="/recoverpswd">Forgot password?</a> 
						</div>
		                <div class="col-xs-2">
							<button id="loginbtn" class="btn loginbutton" type="submit">					
				                <span class="btn-text">Login</span>
				            </button>
						</div>
		        	</form>                                        
				</div>
			</div>
		</div>

        <div class="row" style="margin-top:5px;">
            <div id="settings">
				<div id="account">
					<div id="acct-info">
						<div id="personal-info">
							<div id="name-and-pic">
								<a href="/profile/editpicture" title="Edit picture">
								<img src="/resources/account/${accountid}/avatars/contact.jpg" class="photo" width="50" height="50" alt="Srinivas Paruchuri">
								</a>
								<h2>${contactname}</h2>
								<span class="member-since"><strong>Registered on: </strong>${registerdate}</span>
							</div>
							<ul id="personal-links">
								<li>
									<h3>Password <a href="/profile/changepswd">Change</a></h3>
								</li>
								<li class="primary-email">
									<h3>Primary Email <a href="/profile/changeemail">Change</a></h3>
									<div id="primary-address">
										<address title="${contactemail}">${contactemail}</address>
									<div id="truncated-53136823" class="callout-container" style="display: none">
									<div class="callout-content">
									<div class="callout-body">
									<p>${contactemail}</p>
									</div>
									</div>
									</div>
									</div>
								</li>
								<li>
									<h3>Phone numbers <a href="/profile/phone" title="Add/remove">Add/remove</a></h3>
								</li>
							</ul>
							<ul id="payment-links">
							<li>
								<h3>Payment</h3>
								<ul class="options">
									<li>
									<a href="/payments/paymentaccounts/personal?goback=%2Enas_*1_*1_nav*4account*4sub*4nav*4settings_*1_*1">
									Manage personal account</a>
									</li>
									<li><a href="/payments/purchasehistory?goback=%2Enas_*1_*1_nav*4account*4sub*4nav*4settings_*1_*1">View purchase history</a></li>
								</ul>
							</li>
							<li>
								<h3>Your active sessions</h3>
							<ul class="options">
							<li>
							<a href="/settings/sessions" title="Manage your active sessions">See where you're signed in</a>
							</li>
							</ul>
							</li>
							</ul>
				</div>
				<ul id="acct-type-info">
				<li class="acct-type-option">
				<h3>Account Type:
				<span class="acct-name">
				${accountype}
				</span>
				</h3>
				<ul class="options">
				<li>
				<a href="/premium/manage">
				Manage or cancel your Premium account
				</a>
				</li>
				</ul>
				</li>
				<li class="acct-type-option">
				<div class="upgrade-renew basic">
				<h3>Get More When You Upgrade!</h3>
				<ul class="options">
				<li>More communication options</li>
				<li>Enhanced search tools</li>
				</ul>
				<a class="action primary btn-action" href="/premium/products?trk=acct_sub_2"><span>Upgrade</span></a>
				</div>
				</li>
				</ul>
				</div>

				<div id="tenant-info">
					<div id="need-help">
					<a href="https://help.linkedin.com/app/home/loc/na/trk/NoPageKey/">Need help?</a>
					</div>

					<div id="tenant-details">

						<c:if test="${fn:length(tenants) lt 1}">
							<h2 style="font-size:145%;"><b>Get rolling with your first travel planner!</b></h2>
							<div class="space-4"></div>
			                <form class="" id="setuptenant" method="post" action="/dpricing">
					            <span class="errormsg" id="errsetuptenant" style="display:none"></span>				
								<input class="form-control" type="text" placeholder="Enter your company name" id="tenantdesc" maxlength="120" name="tenantdesc" style="border-radius:0px;" />			    	
								<input type="hidden" id="accountid" name="accountid" value="${accountid}" />
								<input type="hidden" id="contactname" name="contactname" value="${contactname}" />
								<div class="space-4"></div>
								<div class="col-xs-8">
									<div class="row">
										<button id="btn_setuptenant" class="btn" disabled type="submit">					
							                <span class="btn-text">Click to get your planner</span>
							            </button>
										<div id="div_setuptenant" style="margin-top:13px;" class="col-sm-1 pull-right"></div>
									</div>
								</div>
				        	</form>                                        							
						</c:if>				

						<c:if test="${fn:length(tenants) gt 0}">
						<!--						
							<c:forEach var="tenant" items="${tenants}">
							    <c:out value="${tenant.tenantdesc}" />
							    <c:out value="${tenant.tenantname}" />
							</c:forEach>						
						-->	
							<h3>Your registered travel planner sites</h3>
							
										<table id="travel-sites" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Site</th>
													<th>Type</th>
													<th>Registered on</th>
													<th class="hidden-480">Status</th>
												</tr>
											</thead>


											<tbody>
											
												<c:forEach items="${tenants}" var="tenant">
												
													<tr>
														<td>
															<a href="http://${tenant.tenantname}.planovik.com">${tenant.tenantname}.planovik.com</a>
														</td>
															<c:if test="${tenant.tenanttype == 0}">
																<td>NA</td>
															</c:if> 
															<c:if test="${tenant.tenanttype == 1}">
																<td>Free
																	<c:set var="freeplan" scope="page" value="1"/>
																	<c:if test="${tenant.status == 2}">
																		<form id="formupgrade" action="/tenantupgrade">
																			<input type="hidden" id="tenantid" value="{tenant.tenantid}" />
																			<button id="btn_tenantupgrade" class="btn btn-minier btn-purple" type="submit">					
																                Upgrade
																            </button>										          																		
																		</form>
																	</c:if> 
																</td>
															</c:if> 
															<c:if test="${tenant.tenanttype == 2}">
																<td>Business</td>
															</c:if> 
														<td>${tenant.datecreatedsettings}</td>
														<td class="hidden-480">
															<c:if test="${tenant.status == 2}">
																<span class="label label-sm label-success">Registered</span>
															</c:if> 															
															<c:if test="${tenant.status == 3}">
																<span class="label label-sm label-warning">Expiring</span>
															</c:if> 															
															<c:if test="${tenant.status == 5}">
																<span class="label label-sm label-danger">Suspended</span>
															</c:if> 															
															<c:if test="${tenant.status == 4}">
																<span class="label label-sm label-grey">Closed</span>
															</c:if> 															
														</td>
													</tr>
	
												</c:forEach>																						
												
											</tbody>
										</table>							
							
							
							<!-- 
							<span>${tenantdesc}</span>
							<br/><br/>
							<h3>Click to proceed to your personalized portal >></h3>
							<a href="http://${tenantname}.planovik.com:8080" alt="${tenantname}">${tenantname}.planovik.com:8080</a>
							-->
						</c:if>				
					</div>

				<c:if test="${fn:length(tenants) gt 0}">
					<div id="create-new-site" style="margin-left:10px;">
						<h2 style="font-size:125%;"><b>Create new site</b></h2>
						<div class="space-4"></div>
		                <form class="" id="setuptenant" method="post" action="/dpricing">
				            <span class="errormsg" id="errsetuptenant" style="display:none"></span>				
							<input class="form-control" type="text" placeholder="Enter company name" id="tenantdesc" maxlength="120" name="tenantdesc" style="border-radius:0px;" />			    	
							<input type="hidden" id="accountid" name="accountid" value="${accountid}" />
							<input type="hidden" id="contactname" name="contactname" value="${contactname}" />
							<input type="hidden" id="freeplan" name="freeplan" value="${freeplan}" />							
							<div class="space-4"></div>
							<div class="col-xs-8">
								<div class="row">
									<button id="btn_setuptenant" class="btn" disabled type="submit">					
						                <span class="btn-text">Click to create</span>
						            </button>
									<div id="div_setuptenant" style="margin-top:13px;" class="col-sm-1 pull-right"></div>
								</div>
							</div>
			        	</form>                                        							
					</div>
				</c:if>				

			</div>					


				</div>
			</div>
		</div> <!-- ./row -->
        
	</div> <!-- /.wrapper -->  

	<%@ include file="footer.jsp" %>


	
	<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
	<script>

		$(function() {
	    	var opts = {
		        lines:8, length:5, width:3, radius:3, corners:1,
	        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
	        	hwaccel:false, className:'spinner', zIndex:2e9
	    	};
	    	
       		$('#tenantdesc').blur(function() {
       			if ( ($('#tenantdesc').val()).length == 0 )
       				return;
       				 
	   			var target = document.getElementById('div_setuptenant');
		   		var spinner = new Spinner(opts).spin(target);		   		
	            $.ajax({
	              url: "/verifytenantinfo",
	              data: 'tenantdesc=' + $('#tenantdesc').val() + '&tenantname=' + '',
	              type: "GET"
	            }).done(function( data ) {
	            	spinner.stop();
	            	if (data == "exists") {
						$('#errsetuptenant').text("Company already exists! Please pick a different name.");
						$('#errsetuptenant').show();
						$( "#btn_setuptenant" ).prop( "disabled", true );
						
						return false;
	            	}
	            	else if (data == "none") {
						$('#errsetuptenant').hide();
						$( "#btn_setuptenant" ).prop( "disabled", false );
						return true;
	            	}
	            	else if (data == "fail") {
						$('#errsetuptenant').text("An unknown error has occured, please retry.");
						$('#errsetuptenant').show();
						$( "#btn_setuptenant" ).prop( "disabled", true );
						return false;
	            	}
				});
			});
	    	

			$('#btn_setuptenant').click(function() {
				if ( ($('#tenantdesc').val()).length == 0 ) {
					$('#errsetuptenant').text("Please enter a company name!");
					$('#errsetuptenant').show();
					return false;
				}
												
			});
						
		});       
            
    </script>

</body>

</html>
