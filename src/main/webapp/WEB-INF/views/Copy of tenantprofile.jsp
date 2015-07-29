
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

    <title>Planovik</title>
    
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
						<img class="profilelogo" src="/resources/tenant/${tenantid}/avatars/contact.jpg" class="photo" alt="Srinivas Paruchuri">
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
								<img src="/resources/tenant/${tenantid}/avatars/contact.jpg" class="photo" width="50" height="50" alt="Srinivas Paruchuri">
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
					<div id="tenant-details">					
						<h3>Your registered company name</h3>
						<span>${tenantdesc}</span>
						<br/><br/>
						<h3>Click to proceed to your personalized portal >></h3>
						<a href="http://${tenantname}.planovik.com:8080" alt="${tenantname}">${tenantname}.planovik.com:8080</a>
					</div>
				</div>					

				<div id="need-help">
				<a href="https://help.linkedin.com/app/home/loc/na/trk/NoPageKey/">Need help?</a>
				</div>
				</div>
			</div>
		</div> <!-- ./row -->
        
	</div> <!-- /.wrapper -->    

    <!-- Footer -->
    <div class="footer">
		<div class="footer-inner">
            <!-- #section:basics/footer -->
            <div class="footer-content">
                                <span class="bigger-120">
                                    <span class="blue bolder">DeccanRock Pvt Ltd.</span>
                                    &copy; 2013-2014
                                </span>
                &nbsp; &nbsp;
                                <span class="action-buttons">
                                    <a href="#">
                                        <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                                    </a>

                                    <a href="#">
                                        <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                                    </a>

                                    <a href="#">
                                        <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                                    </a>
                                </span>
            </div>

            <!-- /section:basics/footer -->
        </div>
    </div>

</body>

	
	<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
	<script>

		$(function() {
	    	var opts = {
		        lines:8, length:5, width:3, radius:3, corners:1,
	        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
	        	hwaccel:false, className:'spinner', zIndex:2e9
	    	};

			
			$('#verifypinbtn').click(function() {
				if ( ($('#pin').val()).length == 0 ) {
					$('#errpin').text("Please enter pin!");
					$('#errpin').show();
					return false;
				}

				if ( ($('#pin').val()).length < 4 ) {
					$('#errpin').text("Incorrect pin entered! Please try again.");
					$('#errpin').show();
					return false;
				}
								
	   			var target = document.getElementById('div_pin');
		   		var spinner = new Spinner(opts).spin(target);		   		
	            $.ajax({
	              url: "/verifypin",
	              data: 'pin=' + $('#pin').val() + '&tenantid=' + $('#tenantid').val(),
	              type: "GET"
	            }).done(function( data ) {
	            	spinner.stop();
	            	if (data == "Fail") {
						$('#errpin').text("Incorrect pin entered! Please try again.");
						$('#errpin').show();
	            	}
	            	else if (data == "Success") {
						$('#errpin').hide();
						$('#div_pin').hide();	            
						$('#row_pin').show();	            
						$('#div_login').show();	
						$( "#username" ).focus();            
	            	}
				});
				
				return false;
			});
			
		});       
            
    </script>

</body>

</html>
