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

    <!-- logo -->
    <nav id="plnvk_logo" class="pull-left" style="position:fixed; z-index: 1000;margin-left:30px;margin-top:20px;">
	    <a href="#">
	        <div class="img_logo">
	            <img src="/resources/images/planovik_logo_beta.png" />
	        </div>
	    </a>        
    </nav>
    
    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top"  onclick = $("#menu-close").click(); >Menu</a>
            </li>
            <li>
                <a href="#top" onclick = $("#menu-close").click(); >Home</a>
            </li>
            <li>
                <a href="#about" onclick = $("#menu-close").click(); >About</a>
            </li>
            <li>
                <a href="#services" onclick = $("#menu-close").click(); >Services</a>
            </li>
            <li>
                <a href="#portfolio" onclick = $("#menu-close").click(); >Portfolio</a>
            </li>
            <li>
                <a href="#contact" onclick = $("#menu-close").click(); >Contact</a>
            </li>
        </ul>
    </nav>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h2>Hello ${contactname},</h2>
                    <p class="lead">Thank you for confirmation. You are all set.</p>
                    <p class="lead">Your country of registration is "${addrcountryname}"</p>
					<div class="col-xs-2"></div>   
					<div class="col-xs-4">                    
	                    <p style="text-align:left;">To help us serve you and your customers better, please provide us following information</p>				
	                    <form class="" id="update-profile-form" method="post" action="register">

					    	<input class="form-control" type="text" placeholder="Your Full Name" id="contactname" maxlength="60" name="contactname" style="border-radius:0px;" />
							<div class="space-2"></div>
					    	
					    	<input class="form-control" type="text" placeholder="Your Designation" id="contactdesignation" maxlength="45" name="contactdesignation" style="border-radius:0px;" />
							<div class="space-2"></div>

				    		<input class="form-control digitsonly" type="text" placeholder="Enter your Postal Code" id="addrpostalcode" maxlength="6" name="addrpostalcode" 
				    		style="border-radius:0px" />
							<span class="errormsg" id="erraddrpostalcode"></span>
							<div class="space-2"></div>

							<div id="companyaddr">							
								<select class="form-control" id="addrstreetsel" name="addrstreetsel" style="border-radius:0px;">
								<option value="" disabled selected>Please select your region...</option> 
								</select>							
								<div class="space-2"></div>

						    	<input class="form-control" type="text" placeholder="Your Company Address1" id="addrstreet1" maxlength="100" name="addrstreet1" style="border-radius:0px;" />
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
										<p id="addrdistrict"></p>
									</div>				
									<div class="col-xs-6" style="margin-top:-6px;">                    
										<p id="addrstateprovrgn"></p>
									</div>				
								</div>

							</div>

							<div class="input-group">
							    <span class="input-group-addon" style="border-radius:0;padding:3px 12px;"><p style="margin-bottom:0;">${dialcode}</p></span>
							    <div class="col-xs-4">
									<input class="form-control input-mask-phone digitsonly" style="border-radius:0;margin-left:-15px;width:130%;" type="text" placeholder="STD" maxlength="4" id="contactphoneofficestd" name="contactphoneofficestd" />
								</div>
							    <div class="col-xs-8">
									<input class="form-control input-mask-phone digitsonly" style="border-radius:0;margin-left:-19px;width:120%;" type="text" placeholder="Your Landline" maxlength="8" id="contactphoneoffice" name="contactphoneoffice" />
								</div>
								<span class="errormsg" id="errcontactphoneoffice"></span>
								<span class="errormsg" id="errcontactphoneofficestd"></span>
							</div>					    	
							
							<div class="space-2"></div>

							<div class="input-group">
							    <span class="input-group-addon" style="border-radius:0;padding:3px 12px;"><p style="margin-bottom:0;">${dialcode}</p></span>
								<input class="form-control input-mask-phone digitsonly" style="border-radius:0;" type="text" placeholder="Your Mobile" maxlength="10" id="contactphonemobile" name="contactphonemobile" />
								<span class="errormsg" id="errcontactphonemobile"></span>
							</div>
							<div class="space-2"></div>

							<div class="space-2"></div>
					    	<input class="form-control" type="text" placeholder="Website URL" id="addrhomeurl" maxlength="120" name="addrhomeurl" style="border-radius:0px;" />
							<div class="space-2"></div>
							
							<div class="space-4"></div>
							
							<div class="col-xs-6">						
								<button id="updatebtn" class="btn btn-success" type="submit">					
					                <span class="btn-text">Update Account</span>
					            </button>
							</div>
			        	</form>                                        
					</div>

					<div class="col-xs-4" style="margin-left:20px;">
						<div style="text-align:left;">                                        
                    		<H4>Nah! Some other time</H4> <p>I would like to login and get my business started</p>
	                    </div>
	                    <form class="" id="register-form" method="post" action="register">
					    	<input class="form-control" type="text" placeholder="Email" id="contactemail" maxlength="120" name="contactemail" style="border-radius:0px;" />
							<div class="space-2"></div>
					    	
					    	<input class="form-control" type="password" placeholder="Password" id="contactpswd" maxlength="120" name="contactpswd" style="border-radius:0px;" />
							<div class="space-2"></div>
						
							<div class="space-4"></div>

							<div class="col-xs-6">																			
								<button id="loginbtn" class="btn btn-success" type="submit">					
					                <span class="btn-text">Login</span>
					            </button>
							</div>
			        	</form>                                        
					</div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>


    
    <!-- Footer -->
    <footer style="padding:30px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Planovik</strong>
                    </h4>
                    <p>Plot 32 Rao and Raju Colony, Road No 2 Banjara Hills<br>Hyderabad, TS 500034</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (+91) 9866277000</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:support@planovik.com">Planovik Support</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-2x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-2x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-linkedin fa-fw fa-2x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Deccan Rock Pvt Ltd. 2015</p>
                </div>
            </div>
        </div>
    </footer>
</body>

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
			
			$('#addrstreetsel').change(function() {
				if ($('#addrstreetsel :selected').text() != 'None of the above') {
					$('#addrstreet1').val(tmplist[$('#addrstreetsel :selected').val()].cityarea);
					$('#addrcitytown').val(tmplist[$('#addrstreetsel :selected').val()].city);
					$('#addrcitytown').prop("readonly", true);
				}
				else {
					$('#addrcitytown').val("");
					$('#addrcitytown').prop("readonly", false);				
				}
				$('#addrstreet1').focus();
				$('#addrdistrict').text(tmplist[$('#addrstreetsel').val()].district);
				$('#addrstateprovrgn').text(tmplist[$('#addrstreetsel').val()].stateregion);				
			});			
			
	   		function fillAddrForPostalCode(pc) {	
	            $.ajax({
	              url: "/GetGeoDetailsForPC",
	              data: 'addrpostalcode=' + pc + '&addrcountrycode=' + '${addrcountrycode}',
	              type: "GET"
	            }).done(function( data ) {
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
					$('#addrdistrict').text("");
					$('#addrstateprovrgn').text("");
		       		fillAddrForPostalCode(data);	       			       	
		       	}
		       	else if (data.length < 6)
		       		$("#companyaddr").hide();				       
			});
								 			
		});       
            
    </script>

</body>

</html>
