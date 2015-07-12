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

    <title>Planovik - Travel Planner and more!</title>
    
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

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <h1>Start Planning</h1>
            <h3>Travel Planning, Tracking and more</h3>
            <br>
            <a href="#" id="signupbtn" class="btn btn-dark btn-lg">Sign Up</a>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
                    <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Our Services</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-cloud fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-compass fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-shield fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Service Name</strong>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
            <h1>Vertically Centered Text</h1>
        </div>
    </aside>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2>Our Work</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-1.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-2.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-3.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-4.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>The buttons below are impossible to resist.</h3>
                    <a href="#" class="btn btn-lg btn-light">Click Me!</a>
                    <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
                </div>
            </div>
        </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
        <br />
        <small>
            <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
        </small>
        </iframe>
    </section>
    
    <div id="signupdlg" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
				<div class="signup-header">
	                <button type="button" class="close modal-close" data-dismiss="modal" aria-hidden="true">&times;</button>
	           		<div class="text">
	    				<h1 class="signup-title">
	        				<strong>Join for free</strong>
	         					in seconds!
	    				</h1> 
						<h2 class="signup-subtitle">
	        				Trip planning made absolutely delightful
	    				</h2>
					</div>
				</div>	
	        
	            <div class="modal-body">
                    <form class="" id="register-form" method="post" action="register">

					    <span class="btn-text">
							<img width="49%" alt="LinkedIn_signup" src="resources/images/LinkedIn-SignUp.png"></img>
							<img width="49%" alt="Facebook_signup" src="resources/images/facebook_signup.png"></img>
	    				</span>
	
						<div class="or">
						    or
						</div>

							<div class="input-group" style="width:100%" id="tenantdescdiv">
						    	<input class="form-control" type="text" placeholder="Company Name" id="tenantdesc" maxlength="120" name="tenantdesc" style="border-radius:0px;" />
                               	<div class="pull-right center spinner-preview" id="spinnertenantdesc" class="col-sm-1"></div>
						    </div>
						    
						    <div id="tenantdeschelp" style="display:none;color:#A94442;"><p>Company already exists! Please input a different name.</p></div>	
					
							<div class="space-2"></div>
							
							<div class="input-group" style="width:100%;">							
								<input class="form-control" type="text" placeholder="Your Name" id="contactname" maxlength="60" name="contactname" style="border-radius:0px;" />
						    </div>			
							
							<div class="space-2"></div>							

							<div class="input-group" style="width:100%;">														
								<input class="form-control" type="text" placeholder="Your Email" id="contactemail" maxlength="100" name="contactemail" style="border-radius:0px;" />
						    </div>			
						    
							<div class="space-2"></div>
							
							<div class="input-group" style="width:100%;">														
								<input class="form-control" type="password" placeholder="Input Password" id="contactpswd" maxlength="20" name="contactpswd" style="border-radius:0px;" />
						    </div>			
	                        
	                        <input type="hidden" id="tzoffset" name="tzoffset"/>					
						
							<div class="space-4"></div>
													
							<button id="registerbtn" class="btn btn-success" type="submit">					
				                <span class="btn-text">Create Account</span>
				            </button>
				            <div class="terms"> By signing up you agree to our <a href="/www/terms">terms of service</a></div>
		        	</form>
		    	</div> <!-- modal-body -->
		    </div> <!-- modal-content -->
		</div> <!-- modal-dialog -->       
	</div> <!-- signupdlg -->

	
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Planovik</strong>
                    </h4>
                    <p>Plot 32 Road and Raju Colony<br>Road No 2 Banjara Hills<br>Hyderabad, TS 500034</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (+91) 9866277000</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:support@planovik.com">Planovik Support</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Deccan Rock Pvt Ltd. 2015</p>
                </div>
            </div>
        </div>
    </footer>
</body>
    <!-- jQuery -->
    <script src="<c:url value='/resources/www/js/jquery.js'/>" ></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/resources/www/js/bootstrap.min.js'/>" ></script>

    <script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
	<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
    
    <!-- Custom Theme JavaScript -->
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

    // Scrolls to the selected menu item on the page
    $(function() {
         
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
        
       	$('#tenantdesc').blur(function() {
       		if ($('#tenantdesc').val() != '') {
		    	checkname($('#tenantdesc').val());
		    }
	   	});
       
    	var opts = {
	        lines:8, length:5, width:3, radius:3, corners:1,
        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
        	hwaccel:false, className:'spinner', zIndex:2e9
    	};

        function checkname(tenantdesc) {
   			var target = document.getElementById('spinnertenantdesc');
	   		var spinner = new Spinner(opts).spin(target);	
        	var request = $.ajax({url: "/checktenantdesc", type: "GET", data: "tenantdesc=" + tenantdesc});
        	request.done(function( msg ) {
				spinner.stop();
				if (msg == "exists") {
					$("#tenantdescdiv").attr("class", "input-group has-error");
					$("#tenantdeschelp").show();
					$( "#registerbtn" ).prop( "disabled", true );			
				}
				else {
					$("#tenantdescdiv").attr("class", "input-group");
					$("#tenantdeschelp").hide();							
					$( "#registerbtn" ).prop( "disabled", false );			
				}
			}); 
	        request.fail(function( jqXHR, textStatus ) {
				$('spinner').data('spinner').stop();;
			});		
			
    	}        
        
        $.ajax({
          url: "/phonecode",
          type: "GET"
        }).done(function( data ) {
			$("#dialcode").text(data);
		});
                
		$( "#signupbtn" ).click(function() {		
	    	$("#register-form")[0].reset();
	    	$(".help-block").remove();
	    	$('.has-error').removeClass('has-error');	    	
	    	$('.input-group').addClass('input-group');	    	
			$("#signupdlg").modal('show');
	    });
	    	    
        jQuery.validator.addMethod("contactphone", function (value, element) {
            return this.optional(element) || /^\d{10}$/.test(value);
        }, "Enter a valid phone number with 10 digits.");

        jQuery.validator.addMethod("contactname", function (value, element) {
            return this.optional(element) || /^[a-z  A-Z0-9]*$/.test(value);
        }, "Enter a valid username. Alphanumeric only!");
        
		jQuery.validator.addMethod("contactemail", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");
        
        jQuery.validator.addMethod("contactpswd", function (value, element) {
            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
        }, "Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, min 1 upper case, min one special character.");
                       

        $('#register-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
	        submitHandler: function(form) {
	            var d = new Date();
	            $('#tzoffset').val(d.getTimezoneOffset());  
				var dataString = 'tenantdesc=' + $('#tenantdesc').val() + '&contactname=' +  $('#contactname').val() + 
								 '&contactemail=' +  $('#contactemail').val() + '&contactpswd=' + $('#contactpswd').val() +
								 '&tzoffset=' + $('#tzoffset').val();
				console.log(dataString);						 
	            $.ajax({
	              url: "/register",
	              data: dataString,
	              type: "POST"
	            }).done(function( data ) {
	            	if (data != "Fail") {
		                // alert( data );
		                //$("#signupdlg .modal-body").html("SUCCESS!");	                			
		                //location.reload();
						var url = 'http://www.planovik.com:8080/signupwelcome?' + data;
						$(location).attr('href',url);		                
		                return true;	            	
	            	}
				});
	        },            
            rules: {
                tenantdesc: {
                    required: true,
                    minlength: 3
                },
                contactemail: {
                    required: true,
                    contactemail: 'required'
                },
                contactpswd: {
                    required: true,
                    contactpswd: 'required'
                },
                contactname: {
                    required: true,
                    minlength: 3,
                    contactname: 'required'
                }
            },
            messages: {

            },

            highlight: function (e) {
                $(e).closest('.input-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.input-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
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
            
    });

    </script>

</body>

</html>
