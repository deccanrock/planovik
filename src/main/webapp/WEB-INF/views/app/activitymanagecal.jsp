<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<meta charset="utf-8" />
		<title>Full Calendar - Ace Admin</title>

		<meta name="description" content="with draggable and editable events" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />	
		<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" />	

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.custom.min.css'/>" />	
		<link rel="stylesheet" href="<c:url value='/resources/css/fullcalendar.css'/>" />	

		<!-- text fonts -->
		<link rel="stylesheet" href="<c:url value='/resources/css/ace-fonts.css'/>" />	

		<!-- ace styles -->
		<link rel="stylesheet" href="<c:url value='/resources/css/ace.min.css'/>" />	

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<c:url value='/resources/css/ace-part2.min.css'/>" />	
		<![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/ace-skins.min.css'/>" />	
		<link rel="stylesheet" href="<c:url value='/resources/css/ace-rtl.min.css'/>" />	

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../assets/css/ace-ie.min.css" />
		  <link rel="stylesheet" href="<c:url value='/resources/css/ace-ie.min.css'/>" />	
		<![endif]-->
		
		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="<c:url value='/resources/css/datepicker.css'/>" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-timepicker.css'/>" />
		<link rel="stylesheet" href="<c:url value='/resources/css/daterangepicker.css'/>" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-datetimepicker.css'/>" />	
				
		<!-- ace settings handler -->
		<script src="/resources/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/resources/js/html5shiv.min.js"></script>
		<script src="/resources/js/respond.min.js"></script>
		<![endif]-->
		
	</head>
	
	<%@ include file="nav.jsp" %>
	
	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div class="navbar_signup navbar-inverse1 navbar-fixed-top">
		    <div class="loggedout_menubar">
		        <div class="navbar-header pull-left">
		            <a href="#">
		                <div class="img_logo">
		                    <img src="<c:url value='/resources/images/planovik_logo_small.png'/>" />
		                </div>
		            </a>
		        </div>
		        <div class="navbar-header navbar-toggle-admin-header">
		        </div>
		    </div>
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container" style="padding-top:0px;">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
	
			<c:set var="activetab" value='Manage' scope="request"/>
			<!-- /section:basics/sidebar -->
			<%@ include file="sidebar.jsp" %>
			<!-- /section:basics/sidebar -->
			
			<div class="main-content">
				<div class="page-content">
					<div class="page-content-area">
						<div class="page-header">
							<h1 >
								Itinerary
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									activity &nbsp;&nbsp;&nbsp;
									<span style="font-size:14px;color:black;">Itinerary (Number: <i>${itinerary.id}</i></span>&nbsp;&nbsp;
									<span style="font-size:14px;color:black;">Version: <i>${itinerary.version}</i>)</span>&nbsp;&nbsp;
								    <span style="font-size:14px;color:black;">Activity (Group: <i>${activitymaster.groupnum}</i></span>&nbsp;&nbsp;	
									<span style="font-size:14px;color:black;">Count: <i>
											${activitymaster.countactivityhotel + activitymaster.countactivityother + 
											  activitymaster.countactivityvisit + activitymaster.countactivitytravel +
											  activitymaster.countactivityrental}
									</i>)</span>						
									</small>
							</h1>
						</div><!-- /.page-header -->
						<div class="row" style="margin-left:1px;margin-top:-10px;">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-sm-9">
										<div class="space"></div>

										<!-- #section:plugins/data-time.calendar -->
										<div id="calendar"></div>

										<!-- /section:plugins/data-time.calendar -->
									</div>

									<div class="space-14"></div>
									<!-- #section:settings.box -->
									<div class="ace-settings-container" id="master-act-container" >
										<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
											<i class="ace-icon fa fa-cog bigger-150" id="master-act-cog"></i>
										</div>	
																				
										<div class="ace-settings-box" id="ace-settings-box">										
											
											<div class="pull-left">
												<h5>Manage Master Activities</h5>
											</div><!-- /.pull-left -->

											<div id="selectmasteract">
												<div class="row" style="margin-left:3px;margin-right:5px;">
													<div class="space-10"></div>
													<div class="pull-left clearfix">
														<select class="hideearrow selectof" id="masteractnames" style="width:420px;"></select>
													</div>											
												</div>
												<div class="space-4"></div>
												<div class="row" style="margin-left:40px;">
													<div class="pull-left">
														<h4> or </h4>
													</div>											
												</div>
												<div class="space-4"></div>
												<div class="row" style="margin-left:3px;">
													<div class="pull-left">
														<button type="submit" style="margin-left=20px;" id="masteractnew" class="btn btn-primary" > Create New </button>
													</div>
												</div>
											</div>

											<div class="space-10"></div>
											
											<form:form id="masteractform" method="post" modelAttribute="activitymasteract" name="masteractform">											
														
						        			<div id="managemasteractgroup">
						        				<div class="row" style="margin-left:3px;">									    																					    										
													<div class="space-10"></div>

														<div class="pull-left">
																<span id="spnnewactname">Specify New Activity Name</span>
																<span id="spnchangeactname" style="display:none;">Change Activity Name</span>
															</div>
														</div>
												
														<div class="space-2"></div>
							        			
								        				<div class="row" style="margin-left:3px;margin-right:5px;">									    																					    																        				
										    				<form:input type="text" id="masteractname" name="masteractname" path="masteractname" style="width:420px;"  maxlength="45" />																		        				
								        				</div>	
											
												
												<div class="space-10"></div>											
						        			
						        				<div class="row" style="margin-left:3px;">									    																					    										
													<div class="pull-left" style="width:48%;">
														<span>Pick Start Date and Time</span>
											
														<div class="space-2"></div>
						        			
											            <div class='input-group'>
															<span class="input-group-addon">
																<i class="fa fa-calendar bigger-110"></i>
															</span>															
															
											                <input type='text' id="masteractstartdate" name="masteractstartdate" class="form-control" 
											                	style="z-index:0;width:89%;" />
											                <form:input type='hidden' id="masteractstartdatestr" path="masteractstartdatestr" name="masteractstartdatestr" />
											                <form:input type='hidden' id="masteractstartdatelong" name="masteractstartdatelong" path="masteractstartdatelong" />
											       		</div>
													</div>
																				        			
													<div class="pull-right" style="width:48%;">
														<span>Pick End Date and Time</span>
												
														<div class="space-2"></div>
								        			
											            <div class='input-group'>
															<span class="input-group-addon">
																<i class="fa fa-calendar bigger-110"></i>
															</span>					            
											                <input type='text' id="masteractenddate" name="masteractenddate" class="form-control" 
											                	style="z-index:0;width:89%;" />
											                <form:input type='hidden' id="masteractenddatestr" path="masteractenddatestr" name="masteractenddatestr" />
											                <form:input type='hidden' id="masteractenddatelong" name="masteractenddatelong" path="masteractenddatelong" />
														</div>
										       		</div>
												</div>
												
												<div class="space-10"></div>																						
											
												<form:input type="hidden" id="itinnum" path="itinnum" value = "${itinerary.id}" />
												<form:input type="hidden" id="version" path="version" value = "${itinerary.version}" />
												<form:input type="hidden" id="tzoffset" path="tzoffset" value = "${itinerary.tzoffset}" />
												<form:input type="hidden" id="masteractid" path="masteractid" value = "0" />														
												
												<div class="row" style="margin-left:3px;">
													<div class="pull-left" style="width:80%;">
														<a href="" id = "hrefgoback" class="ace-icon fa fa-hand-o-left green" style="text-decoration:none;margin-right:2px;">
														<i style="margin-right:30px;color:black;">Go Back</i></a>
														<button type="submit" id="masteractnewsubmit" class="btn btn-primary"> Create </button>
														<button type="submit" style="display:none;" id="masteracteditsubmit" class="btn btn-primary"> Save </button>
														<button type="submit" style="display:none;margin-left:20px;" id="masteractdelsubmit" class="btn btn-danger btn-primary"> Delete </button>
													</div>										
												</div>
												<div class="space-10"></div>
																						
												
												</form:form>
											</div>

										</div><!-- /.ace-settings-box -->
									</div><!-- /.ace-settings-container -->	
									<!-- /section:settings.box -->
									<div class="space-32"></div>
									<div class="col-sm-3">
										<div class="widget-box transparent scrolltop">
											<div class="widget-header">
												<h4>Draggable activities</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<div id="external-events">
													
														<div class="external-event label-success" data-class="label-success">
															<i class="ace-icon fa fa-arrows"></i>
															New Travel
														</div>

														<div class="external-event label-danger" data-class="label-danger">
															<i class="ace-icon fa fa-arrows"></i>
															New Hotel
														</div>

														<div class="external-event label-purple" data-class="label-purple">
															<i class="ace-icon fa fa-arrows"></i>
															New Rental
														</div>

														<div class="external-event label-yellow" data-class="label-yellow">
															<i class="ace-icon fa fa-arrows"></i>
															New Visit
														</div>

														<div class="external-event label-pink" data-class="label-pink">
															<i class="ace-icon fa fa-arrows"></i>
															New Other
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

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
	
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='/resources/js/jquery.min.js'>"+"<"+"/script>");
		</script>
		
		<!-- <![endif]-->
		
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='../assets/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='/resources/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="/resources/js/bootstrap.min.js"></script>
		
		<!-- page specific plugin scripts -->
		<script src="/resources/js/jquery-ui.custom.min.js"></script>
		<script src="/resources/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="/resources/js/fullcalendar.min.js"></script>
		<script src="/resources/js/bootbox.min.js"></script>
		<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
		
		<!-- ace scripts -->
		<script src="/resources/js/ace-elements.min.js"></script>
		<script src="/resources/js/ace.min.js"></script>

		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>
	
				
		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
												
		var masteractarr = new Array();
							
		jQuery(function($) {
			    	
			var calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				 buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
				
				timezone: 'local',
			
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'		
				},
			   events: function(start, end, timezone, callback) {
			
					var events = [];
					<c:forEach items="${activitylist}" var="event">
						var title = "${fn:escapeXml(event.actname)}";
				
						var date = new Date(${event.activitystarttimelong});
						// var date = new Date();
						var d = date.getDate();
						var m = date.getMonth();
						var y = date.getFullYear();				
			
						var start = new Date(y, m, d);
			            // console.log(start);
						if (${event.type == 0})
							var color = "#82AF6F";
						if (${event.type == 1})
							var color = "#D15B47";
						if (${event.type == 2})
							var color = "#9585BF";
						if (${event.type == 3})
							var color = "#FEE188";
						if (${event.type == 4})
							var color = "#D6487E";
						
						var event = {
							"title": title,
							"start": start,
							"color": color,
							"activityid": ${event.activityid},
							"code": "${fn:escapeXml(event.code)}",
							"itinnum": "${fn:escapeXml(event.itinnum)}",
							"activitystarttimelong": "${fn:escapeXml(event.activitystarttimelong)}",
							"actname": "${fn:escapeXml(event.actname)}",
							"tzoffset": ${itinerary.tzoffset},
							"startdatelong": ${itinerary.startdatelong},
							"type": ${event.type}
						}
						events.push(event);				
					</c:forEach>

					callback(events);
					//console.log(JSON.stringify(events));			
				}				   
			    ,		
				editable: true,
				droppable: true, // this allows things to be dropped onto the calendar !!!
				drop: function(date, allDay) { // this function is called when something is dropped
				
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject');
					var $extraEventClass = $(this).attr('data-class');
						
					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);
					
					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = allDay;
					if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
					
					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
					
					console.log(copiedEventObject);
					displaymodal(copiedEventObject);
				},
				selectable: true,
				selectHelper: true,
				select: function(start, end, allDay) {
					
					bootbox.prompt("New Event Title:", function(title) {
						if (title !== null) {
							calendar.fullCalendar('renderEvent',
								{
									title: title,
									start: start,
									end: end,
									allDay: allDay
								},
								true // make the event "stick"
							);
						}
					});
					
			
					calendar.fullCalendar('unselect');
				}
				,
				eventClick: function(calEvent, jsEvent, view) {
			
					displaymodal(calEvent);
				}		
			});			
	    
	    	setMasterActArrInitial(masteractarr);
			setMasterActArr(masteractarr);
	    
	    	$.validator.setDefaults({	    
	            errorElement: 'div',
	            errorClass: 'help-block',
	            focusInvalid: false,
	            highlight: function (e) {
	                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
	            },
	            success: function (e) {
	                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
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
		

			jQuery.validator.addMethod("enddategtstartdate", function(value, element){
	           var startdate = GetDate($('#masteractstartdate').val());
	           var enddate = GetDate($('#masteractenddate').val());
	            return startdate.getTime() <= enddate.getTime();
	     	}, 'Activity end date/time should be equal or more than activity start date/time.');   
		        
			jQuery.validator.addMethod("startdategtitinstartdate", function(value, element){
	           var startdate = GetDate($('#masteractstartdate').val());
	            return ${itinerary.startdatelong} <= startdate.getTime();
	     	}, 'Activity start date/time should equal or fall after itinerary start date/time.');   

			jQuery.validator.addMethod("startdateltitinenddate", function(value, element){
	           var startdate = GetDate($('#masteractstartdate').val());
	            return ${itinerary.enddatelong} >= startdate.getTime();
	     	}, 'Activity start date/time should equal or fall before itinerary end date/time.');   

			jQuery.validator.addMethod("enddategtitinenddate", function(value, element){
	           var enddate = GetDate($('#masteractenddate').val());
	            return enddate.getTime() <= ${itinerary.enddatelong};
	     	}, 'Activity end date/time should be equal or fall before itinerary end date/time.');   

			jQuery.validator.addMethod("enddateltitinstartdate", function(value, element){
	           var enddate = GetDate($('#masteractenddate').val());
	            return enddate.getTime() <= ${itinerary.enddatelong};
	     	}, 'Activity end date/time should be equal or after itinerary start date/time.');   

			jQuery.validator.addMethod("dateinneroverlaperror", function(value, element){
	            return checkInnerActivityOverlap (value, masteractarr);
	     	}, 'Master activity date cannot overlap with another. Please adjust date.');  

			jQuery.validator.addMethod("dateouteroverlaperror", function(value, element){
	            return checkOuterActivityOverlap ($('#masteractstartdate').val(), $('#masteractenddate').val(), masteractarr);
	     	}, 'Master activities cannot overlap with each other. Please adjust dates.');  

	        $('#masteractform').validate({
	            rules: {
	                masteractname: {
	                    required: true
	                },
	                masteractstartdate: {
	                    required: true,
	                    dateinneroverlaperror: 'required',
	                    startdategtitinstartdate: 'required',
	                    startdateltitinenddate: 'required'
	                },
	                masteractenddate: {
	                    required: true,
	                    dateinneroverlaperror: 'required',
	                    dateouteroverlaperror: 'required',
	                    enddategtstartdate: 'required',
	                    enddategtitinenddate: 'required',
	                    enddateltitinstartdate: 'required'
	                }
	            },
	            messages: {
	            	masteractname: {
	            		required: "Please provide activity name, 45 chars or less"
	            	},
	                masteractstartdate: {
	                    required: "Please provide master activity start date and time."
	                },
	                masteractenddate: {
	                    required: "Please provide master activity end date and time."
	                }
	            }
	        });        
			
		
			$('#masteractnames').change(function() {
				if ($(this).val() > 0) {
					$("#selectmasteract").hide();
					// Set the values in the fields
					setMasterEntities(masteractarr, $(this).val());				
					$("#managemasteractgroup").show();
				}			    
			});			
		
			$('#masteractstartdate').datetimepicker({
			
			   beforeShowDay: function (date) {
        		return date.valueOf() >= $('${itinerary.startdatelong}');
    		},
    		autoclose: true
			
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
				console.log($(this));
			});
	
			$('#masteractenddate').datetimepicker().next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
				
			$("button").click(function() {
	
				if (this.id == "masteractnew") {
					$("#selectmasteract").hide();
					$("#managemasteractgroup").show();
					// Set Calendar dates
				}
				
				if (this.id == "masteracteditsubmit" || this.id == "masteractnewsubmit" || this.id == "masteractdelsubmit") {	
				
		            var startdate = GetDate($('#masteractstartdate').val());
		            var enddate = GetDate($('#masteractenddate').val());

		            if (startdate == "" || enddate == "" || $('#masteractname').val() == "") {
		             	return false;	
		             }	            
		            
		            $('#masteractstartdatelong').val(startdate.getTime());
		            $('#masteractenddatelong').val(enddate.getTime());
		            $('#masteractenddatelong').val(enddate.getTime());
		            
					if (this.id == "masteractnewsubmit")
						$("#masteractid").val(0);
					
					var str = $("#masteractform").serialize();
					
					var type = this.id;

					var request;
					if (this.id == "masteractdelsubmit") {
						request = $.ajax({
						    type:"post",
						    data: str,
						    url:"/app/masteractivityact/delete",
						    dataType: "json"
						});
					
					}					
					else {
						request = $.ajax({
						    type:"post",
						    data: str,
						    url:"/app/masteractivityact/save",
						    dataType: "json"
						});
					
					}
					
					request.done(function( data ) {
					    if (this.id == 'masteractdelsubmit')
					    	deletemasteractselect($('#masteractid').val(), masteractarr);
						else
					  		updatemasteractselect(type, data, masteractarr);	
						
						$('#masteractstartdate').val("");														
						$('#masteractenddate').val("");	
						$('#masteractname').val("");					    
					    $("#managemasteractgroup").hide();
					    
					    if (this.id == 'masteractdelsubmit')
						    setMasterActArr(masteractarr,"delete");
					    else 
						    setMasterActArr(masteractarr);
					    
						$("#selectmasteract").show();
					}); 
				    request.fail(function( jqXHR, textStatus ) {
						$('#masteractstartdate').val("");														
						$('#masteractenddate').val("");	
						$('#masteractname').val("");
						$("#managemasteractgroup").hide();	
						$("#selectmasteract").show();				    					    
					});	
				}
				
				return false;
					
			});
		
		    $("#master-act-cog").click(function() {
				if ($('#ace-settings-box').hasClass('ace-settings-box')) {
					$("#selectmasteract").show();
					$("#managemasteractgroup").hide();
					$('#masteractstartdate').val("");														
					$('#masteractenddate').val("");
					setMasterActArr(masteractarr);
					$('#masteractnames').val("0");	
					$('#masteractname').val("");
					$("#spnchangeactname").hide();
					$("#spnnewactname").show();
					$("#masteracteditsubmit").hide();
					$("#masteractdelsubmit").hide();
					$("#masteractnewsubmit").show();
					$(".help-block").hide();	
				}
				
				return true;
    		});

			$(window).on('scroll', function () {
			    var scrollPos = $(document).scrollTop();
			    $('.scroll').css({
			        top: scrollPos
			    });
			}).scroll();
		
			$('#external-events div.external-event').each(function() {
		
				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title: $.trim($(this).text()) // use the element's text as the event title
				};
		
				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);
		
				$(this).draggable({
					zIndex: 999,
					revert: true,      // will cause the event to go back to its
					revertDuration: 0  //  original position after the drag
				});
				
			});
			
			$( "#hrefgoback" ).click(function() {
					$("#selectmasteract").show();
					$("#managemasteractgroup").hide();
					$('#masteractstartdate').val("");														
					$('#masteractenddate').val("");
					$('#masteractnames').val("0");	
					$('#masteractname').val("");
					$("#spnchangeactname").hide();
					$("#spnnewactname").show();
					$("#masteracteditsubmit").hide();
					$("#masteractdelsubmit").hide();
					$("#masteractnewsubmit").show();
					$(".help-block").hide();	
					return false;			
			});

		})

		function displaymodal(calEvent) {
			
			var framesrc;
			if (calEvent.title === "New Travel") {
				framesrc = '"travelactivitymanage?itinnum=' + ${itinerary.id} + '&activityid=' +  '0' + '&type=' + '0' +
				            '&tzoffset=' + ${itinerary.tzoffset} + '&startdatelong=' + ${itinerary.startdatelong} + '&version=' + ${itinerary.version} + '"';	
			}
			else {
				framesrc = '"travelactivitymanage?itinnum=' + calEvent.itinnum + '&activityid=' +  calEvent.activityid + '&type=' + calEvent.type +
			            '&tzoffset=' + calEvent.tzoffset + '&startdatelong=' + calEvent.startdatelong + '&version=' + ${itinerary.version} + '"';
			}
			
			var modal =
			'<div class="modal"  id="activitymodal">\
			   <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   	<button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				 	<iframe id="activityiFrame" src=';
				 	
			
			modal = modal.concat(framesrc);
			
			// T_PIKUPDRP (h - 610), T_BOOK (h - 680)
			
			var modalend = 
			' frameborder="0" scrolling="no" width="700" onload="onLoadHandler();" ></iframe>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';									
		
			modal = modal.concat(modalend);
			
			var modal = $(modal).appendTo("body");
			
			modal.find('form').on('submit', function(ev){
				ev.preventDefault();

				calEvent.title = $(this).find("input[type=text]").val();
				calendar.fullCalendar('updateEvent', calEvent);
				modal.modal("hide");
			});
			modal.find('button[data-action=delete]').on('click', function() {
				calendar.fullCalendar('removeEvents' , function(ev){
					return (ev._id == calEvent._id);
				})
				modal.modal("hide");
			});
			
			modal.modal('show').on('hidden', function(){
				modal.remove();
			});

			$(document).on('hide.bs.modal','#activitymodal', function () {

			 	$('#activityiFrame').attr("src", " ");
				$('#activityiFrame').remove();

			});

			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);

			// change the border color just for fun
			//$(this).css('border-color', 'red');
		
		}

		function onLoadHandler() {
			var actIframesHeight = $("#activityiFrame").height();
			adjustModalHeight(actIframesHeight+10);
		}
		
		function adjustModalHeight(height) {
			$("#activityiFrame").height(height);
			$('.modal-body #activitymodal').css({"height":height + "px"} );
		}
		
		function GetDate(datestr) {
			var arrdate = datestr.split(/\/|\s|:/);
			var date; 
		    if (datestr.indexOf("PM") > 0) {
		    		if (arrdate[3] < 12) {
						date = new Date(arrdate[2], arrdate[0] -1, arrdate[1], parseInt(arrdate[3]) +12, arrdate[4]);
					}    
					else
						date = new Date(arrdate[2], arrdate[0] -1, arrdate[1], arrdate[3], arrdate[4]);
			}
		    else {
		    	if (arrdate[3] == 12)
					date = new Date(arrdate[2], arrdate[0] -1, arrdate[1], arrdate[3] -12, arrdate[4]);
		    	else
					date = new Date(arrdate[2], arrdate[0] -1, arrdate[1], arrdate[3], arrdate[4]);		    
		    }
		    
		    return date;
		};

		function setMasterEntities(masteractarr, maid) {
		  for (var i = 0; i < masteractarr.length; i++) {
		    if (masteractarr[i].masteractid == maid) {
				$("#masteractid").val(maid);
				$("#masteractname").val(masteractarr[i].masteractname);
				$("#masteractstartdate").val(masteractarr[i].masteractstartdatestr);
				$("#masteractenddate").val(masteractarr[i].masteractenddatestr);
				$("#spnchangeactname").show();
				$("#spnnewactname").hide();
				$("#masteracteditsubmit").show();
				$("#masteractdelsubmit").show();
				$("#masteractnewsubmit").hide();
		    }
		  }
		};
		
		function setMasterActArrInitial (masteractarr, calendar) {		
				<c:forEach var="item" items = "${activitymaster.masteractentities}">
					var mactivity = {masteractid: ${item.masteractid}, masteractname:"${item.masteractname}", 
									masteractstartdatestr:"${item.masteractstartdatestr}", masteractenddatestr:"${item.masteractenddatestr}",
									masteractstartdatelong:${item.masteractstartdatelong}, masteractenddatelong:${item.masteractenddatelong}, activitycount: 0};
					masteractarr.push(mactivity);
					setCalendarMasterActivity(${item.masteractid}, "${item.masteractname}", ${item.masteractstartdatelong}, ${item.masteractenddatelong})
				</c:forEach>
		}
		
		function setMasterActArr (masteractarr, mode) {		
			
			$('#masteractnames').children().remove();
			
			var div_data = 	"<option value=\"0\">" + "Pick a activity master..." + "</option>";
   			$(div_data).appendTo('#masteractnames');

			for (var i = 0; i < masteractarr.length; i++) {
				// var optgroup = "<optgroup label=" + masteractarr[i].masteractstartdatestr + masteractarr[i].masteractenddatestr + ">";
				var optgroup = "<optgroup label=" + "\"" + masteractarr[i].masteractstartdatestr + " - " + masteractarr[i].masteractenddatestr + "\"" + ">";
				var option = "<option value=" + masteractarr[i].masteractid + ">" + masteractarr[i].masteractid + " - " + masteractarr[i].masteractname + "</option>";
				var closeoptgroup = "</optgroup>";
				div_data = optgroup + option + closeoptgroup;
	   			$(div_data).appendTo('#masteractnames');
				//setCalendarMasterActivity(masteractarr[i].masteractid, masteractarr[i].masteractname, masteractarr[i].masteractstartdatelong, 
				//  masteractarr[i].masteractenddatelong);		  			  			  	
	   			
			 }				
		}

		function updatemasteractselect(type, data, masteractarr) {
		  	var item = JSON.parse(data);
		  	console.log(item);
			if (type == "masteractnewsubmit") {
				var mactivity = {masteractid: item.masteractid, masteractname:item.masteractname, 
								masteractstartdatestr:item.masteractstartdate, masteractenddatestr:item.masteractenddate, masteractstartdatelong:item.masteractstartdatelong,
								 masteractenddatelong:item.masteractenddatelong,  activitycount: 0};
				masteractarr.push(mactivity);
				var maid = Number(item.masteractid);
				var masdl = Number(item.masteractstartdatelong);
				var maedl = Number(item.masteractenddatelong);
				setCalendarMasterActivity(maid, item.masteractname, masdl, maedl);
			}
    			
    		if (type == "masteracteditsubmit") {
			  for (var i = 0; i < masteractarr.length; i++) {
			    if (masteractarr[i].masteractid == item.masteractid) {			    
			    	masteractarr[i].masteractname = item.masteractname;
			    	masteractarr[i].masteractstartdatestr = item.masteractstartdate;
			    	masteractarr[i].masteractenddatestr = item.masteractenddate;
			    	masteractarr[i].masteractstartdatelong = item.masteractstartdatelong;
			    	masteractarr[i].masteractenddatelong = item.masteractenddatelong;		  			  			  	
					var maid = Number(masteractarr[i].masteractid);
					var masdl = Number(masteractarr[i].masteractstartdatelong);
					var maedl = Number(masteractarr[i].masteractenddatelong);

					setCalendarMasterActivity(maid, masteractarr[i].masteractname, masdl, maedl, "update"); 
			    }
			  }
		  	}
		  	
		}
		
		function deletemasteractselect(masteractid, masteractarr) {
			for (var i = 0; i < masteractarr.length; i++) {
		    	if (masteractarr[i].masteractid == masteractid) {			    
			    	masteractarr[i].masteractname = item.masteractname;
			    	masteractarr[i].masteractstartdatestr = item.masteractstartdate;
			    	masteractarr[i].masteractenddatestr = item.masteractenddate;
			    	masteractarr[i].masteractstartdatelong = item.masteractstartdatelong;
			    	masteractarr[i].masteractenddatelong = item.masteractenddatelong;		  			  			  	
					var maid = Number(masteractarr[i].masteractid);
					var masdl = Number(masteractarr[i].masteractstartdatelong);
					var maedl = Number(masteractarr[i].masteractenddatelong);
	
					setCalendarMasterActivity(maid, masteractarr[i].masteractname, masdl, maedl, "update"); 
		    	}
			}	  	
		}

		function setCalendarMasterActivity(masteractid, masteractname, masteractstartdatelong, masteractenddatelong, mode) {
			
			var sdate = new Date(masteractstartdatelong);
			console.log(sdate);
			var edate = new Date(masteractenddatelong);			
			var color = "#A0A0A0";
			var event = {
				"id": masteractid,
				"title": masteractname,
				"start": sdate,
				"end": edate,
				"color": color,
			}
                        
            if (mode === 'update' || mode === 'delete') {
				 var calevent = $('#calendar').fullCalendar( 'clientEvents', masteractid );            
			     console.log(calevent[0]);
			     
			     if (mode === 'delete') {
				     $('#calendar').fullCalendar( 'removeEvents', masteractid )		     
			     }
			     else {
				     calevent[0].masteractname = masteractname;
				     calevent[0].start = sdate;
				     calevent[0].end = edate;			     
					 $('#calendar').fullCalendar('updateEvent', calevent[0]);			     
			     }
				 return;
            }
             
            $('#calendar').fullCalendar( 'renderEvent', event, 'stick');
	        $('#calendar').fullCalendar({
	            editable: false
	        });		
	        
		}
		
		function checkInnerActivityOverlap (newdate, masteractarr) {
		
			var newmasteractdate = GetDate(newdate);
			
			for (var i = 0; i < masteractarr.length; i++) {
		    	if (newmasteractdate.getTime() >= masteractarr[i].masteractstartdatelong &&
		    		newmasteractdate.getTime() <= masteractarr[i].masteractenddatelong ) {			    
					return false;	
		    	}
			}	  	
			
			return true;		
		}				    					    

	    function checkOuterActivityOverlap (newdatestart, newdateend, masteractarr) {
			var newmasteractstartdate = GetDate(newdatestart);
			var newmasteractenddate = GetDate(newdateend);
			
			for (var i = 0; i < masteractarr.length; i++) {
		    	
		    	if (masteractarr[i].masteractstartdatelong >= newmasteractstartdate.getTime() &&
		    		masteractarr[i].masteractstartdatelong <= newmasteractenddate.getTime() ) {			    
					return false;	
		    	}

		    	if (masteractarr[i].masteractenddatelong >= newmasteractstartdate.getTime() &&
		    		masteractarr[i].masteractenddatelong <= newmasteractenddate.getTime() ) {			    
					return false;	
		    	}

			}	  	
			
			return true;			    
	    }
					
		</script>
	</body>
</html>
