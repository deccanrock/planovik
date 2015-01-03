<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
<html>

<head>

	<title><%= request.getAttribute("title")%></title>
    <!-- General META -->
    <meta charset="utf-8">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1"> 

    <!-- Semantic META -->
    <meta name="keywords" content="">
    <meta name="description" content="">

    <!-- Fav Icon -->
    <link rel="shortcut icon" href="<c:url value='/resources/images/favicon.png'/>" type="image/x-icon" />

    <!--Application CSS Files-->
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" />

    <!-- page specific plugin styles -->
	<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/css/datepicker.css'/>" />    
    <link rel="stylesheet" href="<c:url value='/resources/css/ui.jqgrid.css'/>" />    
    <link rel="stylesheet" href="<c:url value='/resources/css/select2.css'/>" />

    <!-- text fonts -->
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-fonts.css'/>" />

    <link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />

    <!-- ace styles -->
    <link rel="stylesheet" href="<c:url value='/resources/css/ace.min.css'/>" id="main-ace-style" />
      
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
    <script src="https://www.gstatic.com/freebase/suggest/4_2/suggest.min.js"></script>
    <script type="text/javascript">

        $(function() {
            $("#orgname").suggest({
                key: "AIzaSyBBJoStIWMWfWkgHIoRtLCCAg8B4ay2Vk8"
            })
			.bind("fb-select", function(e, data) {
  				checkname(data.name);
			});            

        });
        
        function checkname(orgname) {
       		var target = document.getElementById('spinner');
	    	var opts = {
    	        lines:8, length:5, width:3, radius:3, corners:1,
            	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
            	hwaccel:false, className:'spinner', zIndex:2e9
        	};
       		var spinner = new Spinner(opts).spin(target);	
        	
        	var request = $.ajax({url: "/checkorgname", type: "GET", data: "orgname=" + orgname});
        	request.done(function( msg ) {
				spinner.stop();
				if (msg == 'exists') {
					$.gritter.add({
						title: 'Organization details already on file!',
						text: 'Required details for your Organization are already on file. We have sent email to your official id with further instructions.',
						image: '',
						sticky: true,
						time: '',
						// (function | optional) function called after it closes
						after_close: function(e, manual_close){
							var orgname = document.getElementById('orgname');
							$('#orgname').val('');
							$('#orgname').focus();
						},						
						class_name: 'gritter-error gritter-center' + (!$('#spinner').get(0).checked ? ' gritter-dark' : '')
					});
				}
			}); 
	        request.fail(function( jqXHR, textStatus ) {
				$('spinner').data('spinner').stop();;
			});		
			
        }
    </script>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-part2.min.css'/>" />
    <![endif]-->
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-skins.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-rtl.min.css'/>" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-ie.min.css'/>" />
    <![endif]-->    
    
    <link rel="stylesheet" href="https://www.gstatic.com/freebase/suggest/4_2/suggest.min.css">

    <!-- ace settings handler -->
    <script src="<c:url value='/resources/js/ace-extra.min.js'/>" ></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <script src="<c:url value='/resources/js/html5shiv.min.js'/>" ></script>
    <script src="<c:url value='/resources/js/respond.min.js'/>" ></script>
    <![endif]-->
    
	<!-- inline styles related to this page -->
	<style>
		.spinner-preview {
			width: 20px;
			height: 20px;
			text-align: center;
			margin-top: 5px;
		}

		.error {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #a94442;
			background-color: #f2dede;
			border-color: #ebccd1;
		}
		 
		.msg {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #31708f;
			background-color: #d9edf7;
			border-color: #bce8f1;
		}
	</style>  
	

</head>

<body class="no-skin" style="background-color:#fff;">
	<div class="navbar_signup navbar-inverse1 navbar-fixed-top">
	    <div class="loggedout_menubar">
	        <div class="navbar-header pull-left">
	            <a href="#">
	                <div class="img_logo">
	                    <img src="<c:url value='/resources/images/verifyed_logo_small.png'/>" />
	                </div>
	            </a>
	        </div>
	        <div class="navbar-header navbar-toggle-admin-header">
					<H2>
						<div class="light-red">
							<%= request.getAttribute("header")%>
						</div>
					</H2>
	        </div>
	    </div>
	</div>
