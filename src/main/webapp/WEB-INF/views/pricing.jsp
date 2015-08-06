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

    <title>Planovik Pricing ${tenantdesc}</title>
    
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

		<div class="col-xs-12">

			<c:if test="${freeplan != 1}">
				<div class="row">
					<div class="col-xs-2"></div>
					<div class="col-xs-6">
						<h3>Select a pricing plan for "${tenantdesc}"</h3>
					</div>
				</div>
			</c:if>

			<div class="space-4"></div>							

			<div class="row">
				<div class="col-xs-2"></div>
				<!-- #section:pages/pricing.small-header -->
				<div class="col-xs-2 col-sm-3 pricing-span-header">
					<div class="widget-box transparent">
						<div class="widget-header">
							<h5 class="widget-title bigger lighter">Plan Type</h5>
						</div>
	
						<div class="widget-body">
							<div class="widget-main no-padding">
								<ul class="list-unstyled list-striped pricing-table-header">
									<li>No of Active Itineraries </li>
									<li>No of logins </li>
									<li>No of new Itineraries within 30 day cycle </li>
									<li style="height:57px;padding-top:20px;">Your own custom URL </li>
									<li>Independent data storage </li>
									<li>Reports + Dashboard </li>
									<li>Convert itinerary to pdf </li>									
									<li>Online customer workflow </li>																		
								</ul>
							</div>
						</div>
					</div>
				</div>
	
				<!-- /section:pages/pricing.small-header -->
	
				<!-- #section:pages/pricing.small-body -->
				<div class="col-xs-4 col-sm-6 pricing-span-body">

					<c:if test="${freeplan != 1}">
						<div class="pricing-span" id="div_freeplan">
							<div class="widget-box pricing-box-small widget-color-orange">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">Free</h5>
								</div>
		
								<div class="widget-body">
									<div class="widget-main no-padding">
										<ul class="list-unstyled list-striped pricing-table">
											<li> 1 </li>
											<li> 1 </li>
											<li> 3 </li>
											<li style="height:57px;padding-top:10px;"><i class="ace-icon fa fa-times red"></i><br/>
												planovik.com/${tenantname}
											</li>
											<li><i class="ace-icon fa fa-times red"></i></li>
											<li> Basic </li>
											<li><i class="ace-icon fa fa-times red"></i></li>
											<li><i class="ace-icon fa fa-times red"></i></li>
										</ul>
		
										<div class="price">
											<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
												Free
											</span>
										</div>
									</div>
		
								</div>
							</div>
						</div>
					</c:if> 
	
					<div class="pricing-span" id="bizplan">
						
						<div class="widget-box pricing-box-small widget-color-blue">
						
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">Business</h5>
							</div>
	
							<div class="widget-body">
								<div class="widget-main no-padding">
									<ul class="list-unstyled list-striped pricing-table">
										<li> Unlimited </li>
										<li> 4 (1 Admin + 3 Users) </li>
										<li> Unlimited </li>
										<li><i class="ace-icon fa fa-check green"></i><br/>
											<div id="div_formpickname" style="font:small;">
												<form id="formpickname">
													<input type="text" maxlength="11" style="width:35%;" id="tenantname" name="tenantname" placeholder="pick a name"><span> . planovik.com</span>
													<button style="height:40%;" id="btn_urlname" class="btn" type="submit" disabled>					
										                <span class="btn-text-small">Select</span>
										            </button>										          
												</form>
											</div>
											<span class="errormsg" id="errpickupname" style="display:none"></span>				
										</i>
										<li><i class="ace-icon fa fa-check green"></i></li>
										<li> Advanced </li>
										<li><i class="ace-icon fa fa-check green"></i></li>
										<li><i class="ace-icon fa fa-check green"></i></li>
									</ul>
	
									<div class="price">
										<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
											&#8377 2500
											<small>/month *</small>
										</span>
										or
										<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
											&#8377 25000
											<small>/year *</small>
										</span>
									</div>	
					                <form method="post" action="/setuptenant">
					                	<input type="hidden" id="accountid" name="accountid" value="${accountid}" />
										<div>
											<button class="btn btn-block btn-sm btn-primary" type="submit">					
												<span>Subscribe</span>
								            </button>										
										</div>
									</form>				
								</div> <!--./widget-main no-padding-->
							
							</div>													
						
						</div>
						
						<div>
							<span><small>* 14% Service Tax additional</small></span>
						</div>
						
					</div>
	
				<!-- /section:pages/pricing.small-body -->
			</div><!-- /.row -->

			<div class="row" id="newregistration" style="margin-top:20px;">
				<div class="col-xs-4"></div>
				<div class="col-xs-4 col-sm-6 pricing-span-body">
					<h3 style="margin-left:40px;margin-top:5px;margin-bottom:20px;">Click Subscribe to get premium service. It's really worth it!</h3>
					<c:if test="${freeplan != 1}">
		                <form method="post" action="/setuptenant">
		                	<input type="hidden" id="accountid" name="accountid" value="${accountid}" />
		                	<input type="hidden" id="tenanttype" name="tenanttype" value="1" />
		                	<input type="hidden" id="billingplan" name="billingplan" value="1" />
		                	<input type="hidden" id="tenantdesc" name="tenantdesc" value="${tenantdesc}" />
							<button style="background-color:#FFC657;color:#855D10 !important; width:20%;height:20%;" id="verifypinbtn" class="btn btn-block btn-sm" type="submit" style="width:40%;">					
								<span style="align:center;font-size:12px;">Give me free..</span>
				            </button>	
						</form>
					</c:if>
				</div>
			</div>
				
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
    

	<div class="row">
		<%@ include file="footer.jsp" %>
	</div>


	</div> <!-- /.wrapper -->    
	      
	<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
	<script>

		$(function() {

	    	var opts = {
		        lines:8, length:5, width:3, radius:3, corners:1,
	        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
	        	hwaccel:false, className:'spinner', zIndex:2e9
	    	};
	    	
       		$('#tenantname').blur(function() {
				
				if ($('#tenantname').val() == "")
					return false;
				
	            if (/^[a-zA-Z0-9]*$/.test($('#tenantname').val()) == false) {
					$('#errpickupname').text("Alpha numeric only, no special no space!");
					$('#errpickupname').show();	
					$( "#btn_urlname" ).prop( "disabled", true );						
					return false;		            
			    }				
				
				$( "#btn_urlname" ).prop( "disabled", false );
					
	   			var target = document.getElementById('div_formpickname');
		   		var spinner = new Spinner(opts).spin(target);		   		
	            $.ajax({
	              url: "/verifytenantinfo",
	              data: 'tenantname=' + $('#tenantname').val() + '&tenantdesc=' + '',
	              type: "GET"
	            }).done(function( data ) {
	            	spinner.stop();
	            	if (data == "exists") {
						$('#errpickupname').text("Name already taken! Input a different name.");
						$('#errpickupname').show();
						$( "#btn_urlname" ).prop( "disabled", true );						
						return false;
	            	}
	            	else if (data == "none") {
						$('#errpickupname').hide();
						return true;
	            	}
	            	else if (data == "fail") {
						$('#errpickupname').text("An unknown error has occured, please retry.");
						$('#errpickupname').show();
						return false;
	            	}
				});
			});
	    	

			$('#btn_urlname').click(function() {
				if ( ($('#tenantname').val()).length == 0 ) {
					$('#errpickupname').text("Please enter a name!");
					$('#errpickupname').show();
					return false;
				}
												
			});
						
		});       
            
    </script>

	
</body>

</html>
