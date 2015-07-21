
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
	                <form class="" id="register-form" method="post" action="/app/j_spring_security_check">
		                <div class="col-xs-4">
					    	<input class="form-control" type="text" placeholder="Email" id="username" maxlength="120" name="username" style="border-radius:0px;" />			    	
						</div>
		                <div class="col-xs-4">
					    	<input class="form-control" type="password" placeholder="Password" id="password" maxlength="120" name="password" style="border-radius:0px;" />
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
            <div class="col-xs-12 text-center">
	            <h2>Hello ${contactname},</h2>
	            <h4>Your country of registration is "${addrcountryname}"</h4>
				<h3 id="updateaccmsg" style="display:none;">Thank you! Your information has been updated. Please login using your credentials</h3>
	            <div id = "div_pin" class="col-xs-12 text-center">
	                <h4 style="margin-top:30px;">Please enter the pin that you received on your mobile to complete your registration</h4>
					<div class="space-4"></div>				
	                <form id="confirm-pin" method="post" style="width:15%;margin-left:42%;">
				    	<input class="form-control digitsonly" type="text" placeholder="Enter pin" id="pin" maxlength="5" name="pin" style="border-radius:0px;" />
						<input type="hidden" id="tenantid" name="tenanid" value="${tenantid}" />                
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
                	<h4><b>Congratulations! You registration is now confirmed.</b></h4>
	                <h5>You may login any time. Happy planning!</h5>
					<div class="space-4"></div>				
	                <h5>To help us serve you and your customers better, please provide us following information</h5>				
					<div class="space-4"></div>				
	
					<div class="col-xs-10 col-centered text-center">                                       
						<div class="col-xs-2"></div> 
	                    <form class="" id="update-profile-form" method="post" action="updateacc">
						<div class="col-xs-4 text-center">                    					    	
					    	<input class="form-control" type="text" placeholder="Your Designation" id="contactdesignation" maxlength="45" name="contactdesignation" style="border-radius:0px;" />
							<div class="space-2"></div>
	
							<div class="input-group">
							    <span class="input-group-addon" style="border-radius:0;padding:3px 12px;"><p style="margin-bottom:0;">${dialcode}</p></span>
							    <div class="col-xs-4">
									<input class="form-control input-mask-phone digitsonly" style="border-radius:0;margin-left:-15px;width:130%;" type="text" placeholder="STD" maxlength="4" id="contactphoneofficestd" name="contactphoneofficestd" />
								</div>
							    <div class="col-xs-8">
									<input class="form-control input-mask-phone digitsonly" style="border-radius:0;margin-left:-19px;width:121%;" type="text" placeholder="Your Landline" maxlength="8" id="contactphoneoffice" name="contactphoneoffice" />
								</div>
								<span class="errormsg" id="errcontactphoneoffice"></span>
								<span class="errormsg" id="errcontactphoneofficestd"></span>
							</div>					    	
							
							<div class="space-2"></div>
	
					    	<input class="form-control" type="text" placeholder="Website URL" id="addrhomeurl" maxlength="120" name="addrhomeurl" style="border-radius:0px;" />
							<div class="space-2"></div>
	
						</div>
	
						<div class="col-xs-4 text-center">                    
	
				    		<input class="form-control digitsonly" type="text" placeholder="Enter your Postal Code" id="addrpostalcode" maxlength="6" name="addrpostalcode" 
				    		style="border-radius:0px" />
				    		<div class="pull-right spinner-preview" id="spinneraddrpostalcode" style="margin-right:-15px;margin-top:-15px;"></div>
							<span class="errormsg" id="erraddrpostalcode"></span>
							<div class="space-2"></div>
	
							<div id="companyaddr">							
								<select class="form-control" id="addrstreetsel" name="addrstreetsel" style="border-radius:0px;">
								<option value="" disabled selected>Please select your region...</option> 
								</select>							
								<div class="space-2"></div>
	
						    	<input class="form-control" type="text" placeholder="Your Company Address1" id="addrstreet1" maxlength="100" name="addrstreet1" style="border-radius:0px;" />
								<span class="errormsg" id="erraddrstreet1"></span>
								<div class="space-2"></div>
		
						    	<input class="form-control" type="text" placeholder="Your Company Address2" id="addrstreet2" maxlength="100" name="addrstreet2" style="border-radius:0px;" />
								<div class="space-4"></div>
	
						    	<input class="form-control" type="text" placeholder="Enter City/Town" id="addrcitytown" maxlength="100" name="addrcitytown" style="border-radius:0px;" />
								<div class="space-4"></div>
	
								<div class="row" style="text-align:left;">
									<div class="col-xs-6">                    
										<p>District/Region</p>
									</div>				
									<div class="col-xs-6">                    
										<p>State/Province</p>
									</div>				
								</div>
								<div class="row" style="text-align:left;font-size:12px;">
									<div class="col-xs-6" style="margin-top:-6px;">                    
										<p id="addrdistrictpara"></p>
									</div>				
									<div class="col-xs-6" style="margin-top:-6px;">                    
										<p id="addrstateprovrgnpara"></p>
									</div>				
								</div>
	
							</div>
	
						</div>
							
						<input type="hidden" id="addrdistrict" name="addrdistrict" />
						<input type="hidden" id="addrstateprovrgn" name="addrstateprovrgn" />
						
						<input type="hidden" id="tenantid" name="tenantid" value="${tenantid}" />
					</div>
				</div>						
            </div> <!-- /.col-xs-12 -->
        </div> <!-- /.row -->
        
        <div class="row" id="row_pin_update" style="display:none;">
	    	<div class="col-xs-2 col-centered text-center">						
				<button id="updatebtn" class="btn btn-success" type="submit" style="margin-top:10px;">					
	                <span class="btn-text">Update Account</span>
	            </button>
	            <span class="errormsg" id="errupdatebtn"></span>
			</div>
	    	</form>                                        
		</div>
	</div> <!-- /.wrapper -->    

    <!-- Footer -->
    <footer class="footer">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <p style="margin-bottom:0px;">Copyright &copy; Deccan Rock Pvt Ltd. 2015</p>
            </div>
        </div>
    </footer>

</body>

	
	<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
	<script>

	    // Closes the sidebar menu
	    $("#menu-close").click(function(e) {
	        e.preventDefault();
	        $("#sidebar-wrapper").toggleClass("active");
	    });
	
	    // Opens the sidebar menu
	    $("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#sidebar-wrapper").toggleClass("active");
	    });
	    	    

		$(function() {
			var tmplist = [];
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
						$('#row_pin_update').show();
	            	}
				});
				
				return false;
			});
			
			$.fn.extend({
				 trackChanges: function() {
				   $(":input",this).change(function() {
				      $(this.form).data("changed", true);
				      console.log(this);
				   });
				 }
				 ,
				 isChanged: function() { 
				   return this.data("changed"); 
				 }
			});
			
			$("#update-profile-form").trackChanges();
			
			$("button").click(function(e) {
			
		    	if (this.id === 'updatebtn') {
					if ($("#update-profile-form").isChanged() == false) {
						$('#errupdatebtn').text("No data has been entered.");
						$('#errupdatebtn').show();
						alert("no data");
						return false;									    	
					}
				}
			
			});   			
			
            $("#update-profile-form").on("submit", function(event) {
	            event.preventDefault();
                $.ajax({
                    url: "/updateacc",
                    type: "post",
                    data: $(this).serialize()
	            }).done(function( data ) {
	            	if (data == "Fail") {
						$('#errupdatebtn').text("An error occured. Please try again.");
						$('#errupdatebtn').show();
						return false;
	            	}
	            	else if (data == "Success") {
						$('#errupdatebtn').hide();
						$('#row_pin').hide();
						$('#row_pin_update').hide();
						$('#updateaccmsg').show();
						return true;
	            	}
	            	
				});
            });			
		
			$('#addrstreetsel').change(function() {
				if ($('#addrstreetsel :selected').text() != 'None of the above') {
					$('#addrstreet1').val(tmplist[$('#addrstreetsel :selected').val()].cityarea);
					$('#addrcitytown').val(tmplist[$('#addrstreetsel :selected').val()].city);
					$('#addrcitytown').prop("readonly", true);
					$('#erraddrstreet1').text('Please provide complete street address');
					$('#erraddrstreet1').show();
				}
				else {
					$('#addrcitytown').val("");
					$('#addrcitytown').prop("readonly", false);				
				}
				$('#addrstreet1').focus();
				$('#addrdistrictpara').text(tmplist[$('#addrstreetsel').val()].district);
				$('#addrstateprovrgnpara').text(tmplist[$('#addrstreetsel').val()].stateregion);				
			});
			
			$('#addrstreet1').change(function() {
				if (tmplist[$('#addrstreetsel :selected').val()].cityarea != $('#addrstreet1').val())
					$('#erraddrstreet1').hide();
			});
						

	   		function fillAddrForPostalCode(pc) {
	   			var target = document.getElementById('spinneraddrpostalcode');
		   		var spinner = new Spinner(opts).spin(target);		   		
	            $.ajax({
	              url: "/GetGeoDetailsForPC",
	              data: 'addrpostalcode=' + pc + '&addrcountrycode=' + '${addrcountrycode}',
	              type: "GET"
	            }).done(function( data ) {
					spinner.stop();            
	            	if (data && data != "Fail") {
		                //console.log(data.valueOf());
		                var counter;
		                $.map(data, function( val, i ) {
		                	tmplist[i] = val;
		                	$('#addrstreetsel').append('<option value="' + i + '">' + val.cityarea + '</option>');
			                // console.log(i + '=' + val.cityarea);
			                counter = i;
						});
						console.log(tmplist);
		                $('#addrstreetsel').append('<option value="' + counter++ + '">None of the above' + '</option>');
						$("#companyaddr").show();	
						$('#addrstreetsel').focus();	
		                return true;	            	
	            	}
				});
	   		
	   		}

			$('#companyaddr').hide();

			$(".digitsonly").keypress(function(e) {
 		     	 var $errelem = $("#err" + e.target.id);
			     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			        $errelem.html("Digits Only").show().fadeOut("slow");
		            return false;		        
			    }
			    
			    var text = $(e.target).val();
		       	if (e.which == 48 && text.length == 0) {
			        $errelem.html("Starting digit cannot be 0").show().fadeOut("slow");		       		
		            return false;		        
		       	}			    
			});
					
			$("#addrpostalcode").keyup(function(e) {			
		       	var data=$("#addrpostalcode").val();
		       	if (data.length == 6) {
					$('#addrstreetsel').html('');		       		
                	$('#addrstreetsel').append('<option value="" disabled selected>Please select your area...' + '</option>');
					$('#addrstreet1').val("");
					$('#addrcitytown').text("");
					$('#addrdistrictpara').text("");
					$('#addrstateprovrgnpara').text("");
					$('#addrdistrict').val("");
					$('#addrstateprovrgn').val("");
		       		fillAddrForPostalCode(data);	       			       	
		       	}
		       	else if (data.length < 6)
		       		$("#companyaddr").hide();				       
			});
								 			
		});       
            
    </script>

</body>

</html>
