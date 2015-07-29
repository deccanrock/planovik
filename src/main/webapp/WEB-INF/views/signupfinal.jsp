
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

    <title>Planovik - Signup Confirmation</title>
    
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
	    <div class="header_container">
	    	<div class="container">
            	<div class="col-xs-6">
				    <a href="#">
			            <img class="logo" src="/resources/images/planovik_logo_beta.png" />
				    </a>        
				</div>
            	<div class="col-xs-6 loginblock" id="div_login" style="display:none;">				
	                <form class="" id="login-form" method="post" action="/accountlogin">
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

        <div class="row">
            <div class="col-xs-12 text-center">
	            <h2>Hello ${contactname},</h2>
	            <h4>Your country of registration is "${addrcountryname}"</h4>
				<h3 id="updateaccmsg" style="display:none;">Thank you! Your information has been updated. Please login using your credentials</h3>
	            <div id = "div_pin" class="col-xs-12 text-center">
	                <h4 style="margin-top:30px;">Please enter the pin that you received on your mobile to complete your registration</h4>
					<div class="space-4"></div>				
	                <form id="confirm-pin" method="post" style="width:15%;margin-left:42%;">
				    	<input class="form-control digitsonly" type="text" placeholder="Enter pin" id="pin" maxlength="5" name="pin" style="border-radius:0px;" />
						<input type="hidden" id="accountid" name="accountid" value="${accountid}" />                
						<div class="space-2"></div>
						<span class="errormsg" id="errpin" style="display:none"></span>				
						<button id="verifypinbtn" class="btn btn-success" type="submit" style="margin-top:10px;width:60%;">					
			                <span class="btn-text">Verify Pin</span>
			            </button>
	                </form>
				</div>                
			</div>
		</div> <!-- ./row -->

        <div class="row" id="row_pin" style="display:none;">					
			<div class="space-4"></div>				
            <div class="col-xs-12 text-center">
	            <div id = "div_pin_success" class="text-center">
					<div id="div_msgnew" style="display:none;">
	                	<h4><b>Congratulations! Your registration is now confirmed.</b></h4>
					</div>
					<div id="div_msgrepeat" style="display:none;">
	                	<h4><b>Your registration is already confirmed!</b></h4>
					</div>
					<div class="space-4"></div>				
	                <h5>You may login any time. Happy planning!</h5>
					</div>
				</div>						
            </div> <!-- /.col-xs-12 -->
        </div> <!-- /.row -->
        
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
	    	
			jQuery.validator.addMethod("contactemail", function (value, element) {
	            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
	        }, "Enter a valid email address.");
	        
	        jQuery.validator.addMethod("contactpswd", function (value, element) {
	            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
	        }, "Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, min 1 upper case, min one special character.");
		    	
	    	
	        $('#login-form').validate({
	            errorElement: 'div',
	            errorClass: 'help-block',
	            focusInvalid: false,
		        submitHandler: function(form) {
		            $.ajax({
		              url: "/accountlogin",
		              data:$(form).serialize(),
		              type: "POST"
		            }).done(function( data ) {
		            	if (data === "Success") {
							var url = 'http://www.planovik.com:8080/accountprofile';
							$(location).attr('href',url);		                
			                return true;	            	
		            	}
		            	else {
		            		$('#errlogin').text(data);
		            		$('#errlogin').show();
		            		console.log(data);
		            		return false;
		            	}
					});
		        },            
	            rules: {
	                contactemail: {
	                    required: true,
	                    contactemail: 'required'
	                },
	                contactpswd: {
	                    required: true,
	                    contactpswd: 'required'
	                }
	            },
	            messages: {
	
	            },
	
	            highlight: function (e) {
	                $(e).closest('.input-group').removeClass('has-info').addClass('error');
	            },            
	
	            success: function (e) {
	                $(e).closest('.input-group').removeClass('error').addClass('has-info');
	            },
	
	            errorPlacement: function (error, element) {
	                if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
	                    var controls = element.closest('div[class*="col-"]');
	                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
	                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
	                }
	                else if(element.is('.select2')) {
	                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
	                }
	                else if(element.is('.chosen-select')) {
	                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
	                }
	                else error.insertAfter(element.parent());
	            },
	
	            invalidHandler: function (form) {
	            }
	        });
	    	
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
	              data: 'pin=' + $('#pin').val() + '&accountid=' + $('#accountid').val(),
	              type: "GET"
	            }).done(function( data ) {
	            	spinner.stop();
	            	if (data == "Fail") {
						$('#errpin').text("Incorrect pin entered! Please try again.");
						$('#errpin').show();
	            	}
	            	else if (data == "Success" || data == "Confirmed") {
						$('#errpin').hide();
						$('#div_pin').hide();	            
						$('#row_pin').show();	            
						$('#div_login').show();
						if (data == "Success")
							$('#div_msgnew').show();
						else
							$('#div_msgrepeat').show();											
						$( "#contactemail" ).focus();            
	            	}
				});
				
				return false;
			});
			
		});       
            
    </script>

</body>

</html>
