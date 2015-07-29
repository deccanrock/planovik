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

    <title>Planovik - Signup Welcome</title>
    
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
			</div>
		</div>    
	
	    <div class="row">
	        <div class="col-xs-12 text-center">
	            <h2>Hello ${contactname},</h2>
	            <p class="lead">Thank you for signing up! You are almost there..</p> 
	            <p>Please check confirmation email we have sent to your email id "${contactemail}".<br>
	               Follow the instructions and complete your registration.</p>
	            <h3>Happy Planning!</h3>
	        </div>
	    </div>
	    <!-- /.row -->
					
	    <div class="row" style="margin-top:50px;">
	        <div class="col-xs-10 col-xs-offset-1 text-center">
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
	        </div>
	    </div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>
