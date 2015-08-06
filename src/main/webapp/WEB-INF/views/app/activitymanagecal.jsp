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
			   
  		<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" />
	    <link href="<c:url value='/resources/css/froala_editor.min.css" rel="stylesheet'/>" />
		<link href="<c:url value='/resources/css/froala_style.min.css" rel="stylesheet'/>" />

	   <script src="<c:url value='/resources/js/jquery.min.js'/>" ></script>

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
		                    <img src="<c:url value='/resources/images/planovik_fav_new.png'/>" />
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
						<div class="page-header pull left">
							<!-- #section:settings.box -->
							<div class="ace-settings-container" id="master-act-container" >
								<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
									<i class="ace-icon fa fa-cog bigger-150" id="master-act-cog"></i>
								</div>	
																		
								<div class="ace-settings-box" id="ace-settings-box">										


								</div><!-- /.ace-settings-box -->
							</div><!-- /.ace-settings-container -->	
							<!-- /section:settings.box -->							

							<h1>
								Itinerary
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									activity &nbsp;&nbsp;&nbsp;
									<span style="font-size:12px;color:black;">Itinerary (Number: <i>${itinerary.id}</i></span>&nbsp;&nbsp;
									<span style="font-size:12px;color:black;">Version: <i>${itinerary.version}</i>)</span>&nbsp;&nbsp;
									<!--
									<span style="font-size:12px;color:black;" id="activitycntspn">Count: <i>
									</i>)</span>-->&nbsp;&nbsp;
									</small>
							</h1>
							
							
						</div><!-- /.page-header -->
						<div class="row" style="margin-left:1px;margin-top:-10px;">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-sm-9" style="width:85%;">
										<div class="space"></div>
										
										<!-- #section:plugins/data-time.calendar -->
										<div id="calendar"></div>

										<!-- /section:plugins/data-time.calendar -->
									</div>

									<div class="space-14"></div>
									<div class="space-32"></div>
									<div class="col-sm-1">
										<div class="widget-box transparent scrolltop">

											<div class="widget-body">
												<div class="widget-main no-padding" style="width:56%;">
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
											<span style="font-size:12px;color:black;">Arr: <i>${itinerary.startdatestr}</i></span><br>
											<span style="font-size:12px;color:black;">Dep: <i>${itinerary.enddatestr}</i></span>	
										
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
		<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>
		
	    <!-- Include JS files. -->
	    <script src="<c:url value='/resources/js/froala_editor.min.js'/>"></script>
	
	    <!-- Include IE8 JS. -->
	    <!--[if lt IE 9]>
	      <script src="<c:url value='/resources/js/froala_editor_ie8.min.js'/>"></script>
	    <![endif]-->		

		  <!-- Initialize the editor. -->
		  <script>
		      $(function() {
		          $('#rteditor').editable({inlineMode: false})
		      });
		  </script>
		  
		<script>
		  $(function() {
		    $('.selector')
		      .editable({
		        // Set the image upload parameter.
		        imageUploadParam: 'image',
		
		        // Set the image upload URL.
		        imageUploadURL: '/app/uploadphoto',
		
		        // Additional upload params.
		        imageUploadParams: {id: 'rteditor'}
		      })
		      .on('editable.imageError', function (e, editor, error) {
		        // Custom error message returned from the server.
		        if (error.code == 0) alert("Code 0");
		
		        // Bad link.
		        else if (error.code == 1) alert("Code 1");
		
		        // No link in upload response.
		        else if (error.code == 2) alert("Code 2");
		
		        // Error during image upload.
		        else if (error.code == 3) alert("Code 3");
		
		        // Parsing response failed.
		        else if (error.code == 4) alert("Code 4");
		
		        // Image too text-large.
		        else if (error.code == 5) alert("Code 5");
		
		        // Invalid image type.
		        else if (error.code == 6) alert("Code 6");
		
		        // Image can be uploaded only to same domain in IE 8 and IE 9.
		        else if (error.code == 7) alert("Code 7");
		      });
		  });
		</script>		  
  
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
							
		// var masteractarr = [];
		var activitystartdate;
		var calendar;
		var modal;
		var events = [];
		var activitycnt;
		var itinstartdate;
		var itinenddate;

							
		jQuery(function($) {	
		
			//$("#masteractstartdate").change(function(){
		    //	$("#masteractenddate").val($("#masteractstartdate").val());
			//});
			
			
		    //activitycnt = ${activitymaster.countactivityhotel} + ${activitymaster.countactivityother} + ${activitymaster.countactivityvisit} + 
		    //			  ${activitymaster.countactivitytravel} + ${activitymaster.countactivityrental};
			//$('#activitycntspn').html('Count: <i>' + activitycnt + '</i>)'); 
		 
			itinstartdate = ${itinerary.startdatelong};
			itinenddate = ${itinerary.enddatelong};
			
			var defaultDate = formatForCalendar("${itinerary.startdatestr}");

			calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				 buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
				
				timezone: 'local',
			
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month'		
				},	
			   events: function(start, end, timezone, callback) {

			    	// setMasterActArrInitial(masteractarr);
					// setMasterActArr(masteractarr);
					setItinDays();
					<c:forEach items="${activitylist}" var="activity">
						var title = "${fn:escapeXml(activity.actname)}";
						var sdate = new Date(${activity.activitystarttimelong});						
						var edate = new Date(${activity.activityendtimelong});
			
						var idtype;
						if (${activity.type == 0}) {
							var color = "#82AF6F";
							//idtype = "T";
						}
						if (${activity.type == 1}) {
							var color = "#D15B47";						
							//idtype = "H";
						}
						if (${activity.type == 2}) {
							var color = "#9585BF";
							//idtype = "V";							
						}
						if (${activity.type == 3}) {
							var color = "#FEE188";
							//idtype = "R";													
						}
						if (${activity.type == 4}) {
							var color = "#D6487E";
							//idtype = "O";																			
						}
					
						var strid =  ${activity.activityid} + "." + ${activity.type};						
						var activity = {
							"id": "Event - " + strid,
							"title": title,
							"start": sdate,
							"end": edate,							
							"color": color,
							"activityid": ${activity.activityid},
							"activityidpair": "${fn:escapeXml(activity.activityidpair)}",
							"code": "${fn:escapeXml(activity.code)}",
							"itinnum": "${fn:escapeXml(activity.itinnum)}",
							"activitystarttimelong": "${fn:escapeXml(activity.activitystarttimelong)}",
							"actname": "${fn:escapeXml(activity.actname)}",
							"tzoffset": ${itinerary.tzoffset},
							"startdatelong": "${fn:escapeXml(activity.activitystarttimelong)}",
							"enddatelong": "${fn:escapeXml(activity.activityendtimelong)}",
							"eventdrop": 0,							
							"type": ${activity.type}
						}
						
					
						console.log(activity);
					
						$('#calendar').fullCalendar( 'renderEvent', activity);
					
						// events.push(activity);				
					</c:forEach>

					// callback(events);

					//console.log(JSON.stringify(events));			
				}				   
			    ,		
				editable: true,
				droppable: true, // this allows things to be dropped onto the calendar !!!
				drop: function(date, allDay) { // this function is called when something is dropped


					// Don't render activity if out of range
					
		    		if ( (date._d.getTime() >= ${itinerary.startdatelong} && date._d.getTime() <= ${itinerary.enddatelong}) == false)
		    			return false;
					
					
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject');
					originalEventObject.id = 0;
					// originalEventObject.masteractid = masteractid;
					originalEventObject.startdatelong = date._d.getTime();
					
					// Format for calendar
					activitystartdate = date.format("MM/DD/YYYY h:mm A");	
					console.log(activitystartdate);

					var $extraEventClass = $(this).attr('data-class');
						
					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);
					
					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = allDay;
					if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
					
					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					// $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
					copiedEventObject.eventdrop = 0;					
					displaymodal(copiedEventObject);
						
				},
			    eventDrop: function(event, delta, revertFunc) {
			
			        // alert(event.title + " was dropped on " + event.start.format());
					// Don't render activity if out of range
					console.log(event); 
					console.log(delta);
//					if (!checkActivityInItinRange(event.start._d.getTime(), event.masteractid, masteractarr)) {
		    		if (!(event.start._d.getTime() >= ${itinerary.startdatelong} && event.start._d.getTime() <= ${itinerary.enddatelong})) {
						revertFunc();
						return;
					}
			
			        if (!confirm("Are you sure about this change?")) {
			            revertFunc();
			            return;
			        }
			        event.startdatelong = event.start._d.getTime();
			        activitystartdate = event.start.format("MM/DD/YYYY h:mm A");
					event.eventdrop = 1;
			        displaymodal(event);
			
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
								}
							);
						}
					});
					
			
					calendar.fullCalendar('unselect');
				}
				,
				eventClick: function(calEvent, jsEvent, view) {
					activitystartdate = calEvent.start.format("MM/DD/YYYY h:mm A");	
					calEvent.eventdrop = 0;					
					console.log(calEvent);					
					displaymodal(calEvent);
				}
				,
				defaultDate: defaultDate
				// defaultDate: ${itinerary.startdatestr}
			});			
	    
			// calendar.fullCalendar( 'gotoDate', '2015-05-01' );
			
    
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
	            return checkInnerActivityOverlap ($("#masteractid").val(), value, masteractarr);
	     	}, 'Master activity date cannot overlap with another. Please adjust date.');  

			jQuery.validator.addMethod("dateouteroverlaperror", function(value, element){
	            return checkOuterActivityOverlap ($("#masteractid").val(), $('#masteractstartdate').val(), $('#masteractenddate').val(), masteractarr);
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
			});
	
			$('#masteractenddate').datetimepicker({
			   beforeShowDay: function (date) {
        		return date.valueOf() >= $('${itinerary.enddatelong}');
    		},
    		autoclose: true
			
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
				
			$("button").click(function(e) {
	
				e.preventDefault();
				if (this.id == "masteractnew") {
					$("#selectmasteract").hide();
					$("#masteractname").val("");
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
					
						if (masterhasactivities($('#masteractid').val(), masteractarr)) {
							$('#masteractdelerr').show();
							return false;
						}
						
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
					    if (type == 'masteractdelsubmit')
					    	deletemasteractselect($('#masteractid').val(), masteractarr);
						else
					  		updatemasteractselect(type, data, masteractarr);	
						
						$('#masteractstartdate').val("");														
						$('#masteractenddate').val("");	
						$('#masteractname').val("");					    
					    $("#managemasteractgroup").hide();
					    
					    if (type == 'masteractdelsubmit')
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
					//$("#selectmasteract").show();
					//$("#managemasteractgroup").hide();
					//$('#masteractstartdate').val("");														
					//$('#masteractenddate').val("");
					//setMasterActArr(masteractarr);
					//$('#masteractnames').val("0");	
					//$('#masteractname').val("");
					//$("#spnchangeactname").hide();
					//$("#spnnewactname").show();
					//$("#masteracteditsubmit").hide();
					//$("#masteractdelsubmit").hide();
					//$('#masteractdelerr').hide();
					//$("#masteractnewsubmit").show();
					//$(".help-block").hide();	
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
					$('#masteractdelerr').hide();
					$(".help-block").hide();	
					return false;			
			});

		})

		function displaymodal(calEvent) {
			
			var framesrc;

			if (calEvent.type == -1) {
				modal =
				'<div class="modal" id="activitymodal" style="z-index:2099;">\
					<div class="modal-dialog" style="min-height:50px;">\
				   		<div class="modal-content">\
							<div class="modal-body">\
					   			<button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
					   			<span>To manage master activity, click on the cog wheel on right and use manage master activities panel</span>\
								<form method="post"><textarea  style="margin-top:20px;height:400px;width:600px;"></textarea></form>\
					 		</div>\
					 	</div>\
					</div>\
				</div>';									
				 	
			
			}			
			else {
				if (calEvent.id == 0) {
					// Get Masteractid
					
					framesrc = '"travelactivitymanage?itinnum=' + ${itinerary.id} + '&activityid=' +  '0' + '&type=' + '0' +
					//framesrc = '"travelactivitymanage?itinnum=' + ${itinerary.id} + '&activityid=' +  '0' + '&masteractid=' +  calEvent.masteractid + '&type=' + '0' +
					            // '&tzoffset=' + ${itinerary.tzoffset} + '&eventdrop=' + calEvent.eventdrop + '&startdatelong=' + calEvent.startdatelong + '&version=' + ${itinerary.version} + '&groupnum=' + ${activitymaster.groupnum} + '"';	
								'&tzoffset=' + ${itinerary.tzoffset} + '&eventdrop=' + calEvent.eventdrop + '&startdatelong=' + calEvent.startdatelong + '&version=' + ${itinerary.version} + '"';					            
				}
				else {
					framesrc = '"travelactivitymanage?itinnum=' + calEvent.itinnum + '&activityid=' +  calEvent.activityid + '&type=' + calEvent.type +
					// framesrc = '"travelactivitymanage?itinnum=' + calEvent.itinnum + '&activityid=' +  calEvent.activityid + '&masteractid=' +  calEvent.masteractid +  '&type=' + calEvent.type +
				            // '&tzoffset=' + calEvent.tzoffset + '&eventdrop=' + calEvent.eventdrop + '&startdatelong=' + calEvent.startdatelong + '&version=' + ${itinerary.version} + '&groupnum=' + ${activitymaster.groupnum} + '"';
				            '&tzoffset=' + calEvent.tzoffset + '&eventdrop=' + calEvent.eventdrop + '&startdatelong=' + calEvent.startdatelong + '&version=' + ${itinerary.version} + '"';
				}
				
				modal =
				'<div class="modal"  id="activitymodal" style="z-index:2099;">\
				   <div class="modal-dialog">\
				   <div class="modal-content">\
					 <div class="modal-body">\
					   	<button type="button" class="close" data-dismiss="modal" data-action="cancel" style="margin-top:-10px;">&times;</button>\
					 	<iframe id="activityiFrame" src=';
					 	
				
				modal = modal.concat(framesrc);
				
				// T_PIKUPDRP (h - 610), T_BOOK (h - 680)

				// var modalend1 = 'frameborder="0" scrolling="no" width="840" onload="onLoadHandler(' + calEvent.masteractid + ');" ></iframe>';
				var modalend1 = 'frameborder="0" scrolling="no" width="840" onload="onLoadHandler(' + 0 + ');" ></iframe>';
				
				modal = modal.concat(modalend1);
				
				var modalend2 = 
					 '</div>\
					 <div class="modal-footer">\
						<button type="button" id="activitydelbtn" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
						<button type="button" class="btn btn-sm" data-dismiss="modal" data-action="cancel"><i class="ace-icon fa fa-times"></i> Cancel</button>\
					 </div>\
				  </div>\
				 </div>\
				</div>';									
		
				modal = modal.concat(modalend2);
			}
				
			
			modal = $(modal).appendTo("body");

			
			modal.draggable({
            	handle: ".modal-body"
        	});			
			
			modal.find('form').on('submit', function(ev){
				ev.preventDefault();
				
				calEvent.title = $(this).find("input[type=text]").val();
				calendar.fullCalendar('updateEvent', calEvent);
				modal.modal("hide");
			});
			
			modal.find('button[data-action=cancel]').on('click', function(e) {
				if (calEvent.eventdrop == 1) {
					calEvent.start._d = calEvent.start._i;
					calEvent.end._d = calEvent.end._i;
					calendar.fullCalendar('updateEvent', calEvent);			
				}
			});
			
			modal.find('button[data-action=delete]').on('click', function(e) {
				console.log("Delete button");

//				$('#calendar').fullCalendar('removeEvents' , function(ev){
					// if (ev.activityid == calEvent.activityid) {
						console.log(calEvent);
						if (calEvent.activityid > 0) {

							var activityidpair = 0;						
							if (calEvent.code == 'T_BOOK_RETURN') {
								activityidpair = calEvent.activityidpair;
								if (!confirm("This is a return booking activity, this will delete both onward and return activities!"))
					            	return;
					        }
							else				
								if (!confirm("Do you really wish to delete this activity?"))
				            		return;
							
							$.ajax({type: 'GET', 
								url: "/app/activity/inactive?" + "activityid=" + calEvent.activityid + "&activityidpair=" + activityidpair + "&itinnum=" + calEvent.itinnum + "&type=" + calEvent.type +
										// "&version=" + ${itinerary.version} + "&groupnum=" + ${activitymaster.groupnum},
										"&version=" + ${itinerary.version},
						        success:function(data, textStatus, jqXHR) {
						        	var result = JSON.parse(data);
						        	if (result.result == "success") {
				        				$('#calendar').fullCalendar('removeEvents', calEvent._id);
					        			activitycnt = activitycnt - 1;
										// updatemasteractivitycount(calEvent.masteractid, masteractarr, 'delete');	
						        		// $('#activitycntspn').html('Count: <i>' + activitycnt + '</i>)');
	
						        		if (calEvent.activityidpair > 0 ) {
						        			// var stridpair = calEvent.masteractid + "." + calEvent.activityidpair + "." + calEvent.type;
						        			var stridpair = calEvent.activityidpair + "." + calEvent.type;
						        			console.log(stridpair);
											var pairevent = $('#calendar').fullCalendar( 'clientEvents', stridpair);
						        			console.log(pairevent);
											if (typeof pairevent[0] !== "undefined" && pairevent[0] !== null)					        			
						        				$('#calendar').fullCalendar('removeEvents', stridpair);
											else {
							        			activitycnt = activitycnt - 1;
												// updatemasteractivitycount(calEvent.masteractid, masteractarr, 'delete');												
											}
										}
										
										modal.modal("hide");						
										
									}									
						        	
						        },
						        error: function(jqXHR, textStatus, errorThrown) {
						        	alert(textStatus + " " + errorThrown);
						            console.log(textStatus);    
						        }													  										  
							});					
							e.preventDefault();						
						}
						else
							modal.modal("hide");

						return true;
					//}
					return false;
				// });				
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
		

		function onLoadHandler(masteractid) {
			var actIframesHeight = $("#activityiFrame").height();
			if (masteractid == 0) {
				adjustModalHeight(actIframesHeight+10);
			}
			else
				adjustModalHeight(actIframesHeight+60);
		}
		
		function adjustModalHeight(height) {
			$("#activityiFrame").height(height);
			$('.modal-body #activitymodal').css({"height":height + "px"} );
		}
		
		function parentModalHeight() {
			return $("#activityiFrame").height();		
		}
		
		function adjustModalHeightDelta(delta) {
			var actIframesHeight = $("#activityiFrame").height() + delta;
			adjustModalHeight(actIframesHeight);
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

					<c:if test="${item.masteractid > 0}">
						setCalendarMasterActivity(${item.masteractid}, "${item.masteractname}", ${item.masteractstartdatelong}, ${item.masteractenddatelong});
					</c:if>

				</c:forEach>
				console.log(masteractarr);
		}
		
		function setMasterActArr (masteractarr, mode) {		
			
			$('#masteractnames').children().remove();
			
			var div_data = 	"<option value=\"0\">" + "Pick a activity master..." + "</option>";
   			$(div_data).appendTo('#masteractnames');

			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == 0)
					continue;
					
				var optgroup = "<optgroup label=" + "\"" + masteractarr[i].masteractstartdatestr + " - " + masteractarr[i].masteractenddatestr + "\"" + ">";
				var option = "<option value=" + masteractarr[i].masteractid + ">" + masteractarr[i].masteractid + " - " + masteractarr[i].masteractname + "</option>";
				var closeoptgroup = "</optgroup>";
				div_data = optgroup + option + closeoptgroup;
	   			$(div_data).appendTo('#masteractnames');	  			  			  	
			 }				
		}

		function updatemasteractselect(type, data, masteractarr) {
		  	var item = JSON.parse(data);
			if (type == "masteractnewsubmit") {
				var mactivity = {masteractid: item.masteractid, masteractname:item.masteractname, 
								masteractstartdatestr:item.masteractstartdate, masteractenddatestr:item.masteractenddate, masteractstartdatelong:item.masteractstartdatelong,
								 masteractenddatelong:item.masteractenddatelong,  activitycount: 0};
				masteractarr.push(mactivity);
				console.log(masteractarr.length);
				console.log(masteractarr);				
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

					setCalendarMasterActivity(maid, masteractarr[i].masteractname, masdl, maedl, 'update'); 
			    }
			  }
		  	}
		  	
		}
		
		function deletemasteractselect(masteractid, masteractarr) {
			console.log(masteractarr.length);
			console.log(masteractarr);			
			for (var i = 0; i < masteractarr.length; i++) {
		    	if (masteractarr[i].masteractid == masteractid) {
		    		if (masteractarr[i].activitycount > 0) {
						return false;
		    		}
		    		else {
						setCalendarMasterActivity(masteractid, "", 0, 0, 'delete'); 
						masteractarr.splice(i,1);
		    		}			    
		    	}
			}			
			  	
		}

		function masterhasactivities(masteractid, masteractarr) {
			for (var i = 0; i < masteractarr.length; i++) {
		    	if (masteractarr[i].masteractid == masteractid) {
		    		if (masteractarr[i].activitycount > 0) {
						return true;
		    		}
		    	}
			}			
			return false;			  	
		}

		function setCalendarMasterActivity(masteractid, masteractname, masteractstartdatelong, masteractenddatelong, mode) {
			
			var sdate = new Date(masteractstartdatelong);
			var edate = new Date(masteractenddatelong);			
			var color = "#A0A0A0";
			var event = {
				"id": masteractid.toString(),
				"title": masteractname,
				"start": sdate,
				"end": edate,
				"color": color,
				"type": -1,
				"editable": false
			}
			
			console.log(event);
            
            if (mode == 'update' || mode == 'delete') {
				 var calevent = $('#calendar').fullCalendar( 'clientEvents', masteractid.toString() );            
			     
			     if (mode == 'delete')
				     $('#calendar').fullCalendar( 'removeEvents', masteractid.toString() );		     
			     else {
				     calevent[0].masteractname = masteractname;
				     calevent[0].start = sdate;
				     calevent[0].end = edate;			     
					 $('#calendar').fullCalendar('updateEvent', calevent[0]);			     
			     }
				 return;
            }
             
            $('#calendar').fullCalendar( 'renderEvent', event);
	        //$('#calendar').fullCalendar({
	        //    editable: false
	        //});		
	        
		}
		
		function setItinDays() {
			
			var numDays = Math.abs(${itinerary.enddatelong} - ${itinerary.startdatelong})/(24*60*60*1000);			
			
			var caldate = ${itinerary.startdatelong};
			var color = "#A0A0A0";
			for (var i = 0; i < numDays; i++) {
				var id = "day" + (i+1).toString();
				var title = "Day " + (i+1).toString();
				
				var event = {
					"id": id,
					"title": title,
					"start": caldate,
					"allDay": "true",
					"color": color,
					"type": -1,
					"editable": false,
					"overlap": false
				}

				console.log(event);             
	            $('#calendar').fullCalendar( 'renderEvent', event);
	            caldate = caldate + 24*60*60*1000;
			}
		}
		
		function setCalendarMasterActivity(mode) {
			
			var sdate = new Date(masteractstartdatelong);
			var edate = new Date(masteractenddatelong);			
			var color = "#A0A0A0";
			var event = {
				"id": masteractid.toString(),
				"title": masteractname,
				"start": sdate,
				"end": edate,
				"color": color,
				"type": -1,
				"editable": false
			}
			
			console.log(event);
            
            if (mode == 'update' || mode == 'delete') {
				 var calevent = $('#calendar').fullCalendar( 'clientEvents', masteractid.toString() );            
			     
			     if (mode == 'delete')
				     $('#calendar').fullCalendar( 'removeEvents', masteractid.toString() );		     
			     else {
				     calevent[0].masteractname = masteractname;
				     calevent[0].start = sdate;
				     calevent[0].end = edate;			     
					 $('#calendar').fullCalendar('updateEvent', calevent[0]);			     
			     }
				 return;
            }
             
            $('#calendar').fullCalendar( 'renderEvent', event);		
		}

		function checkInnerActivityOverlap (masteractid, newdate, masteractarr) {
		
			var newmasteractdate = GetDate(newdate);
			
			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == masteractid || masteractarr[i].masteractid == 0)
					continue;
		    	if (newmasteractdate.getTime() >= masteractarr[i].masteractstartdatelong &&
		    		newmasteractdate.getTime() <= masteractarr[i].masteractenddatelong ) {			    
					return false;	
		    	}
			}	  	
			
			return true;		
		}				    					    

	    function checkOuterActivityOverlap (masteractid, newdatestart, newdateend, masteractarr) {
			var newmasteractstartdate = GetDate(newdatestart);
			var newmasteractenddate = GetDate(newdateend);
			
			for (var i = 0; i < masteractarr.length; i++) {

				if (masteractarr[i].masteractid == masteractid  || masteractarr[i].masteractid == 0)
					continue;
		    	
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
	    
	    function checkActivityInItinRange(newactstartdatetime, masteractid, masteractarr) {

	    	console.log(masteractid);
	    	console.log(${itinerary.startdatelong});
	    	console.log(newactstartdatetime);
	    	console.log(${itinerary.enddatelong});
	    	
	    	if (masteractid == 0) {
		    	if (newactstartdatetime >= ${itinerary.startdatelong} && newactstartdatetime <= ${itinerary.enddatelong})
		    		return true;
		    	else
		    		return false;
			}
			
			if (masteractid > 0) {			
				for (var i = 0; i < masteractarr.length; i++) {
					if (masteractarr[i].masteractid == 0)
						continue;
					if (masteractarr[i].masteractid == masteractid)  		
			  			if (newactstartdatetime >= masteractarr[i].masteractstartdatelong && newactstartdatetime <= masteractarr[i].masteractenddatelong )			    
							return true;	
				}	  				
			}
	    	
	    	return false;
	    }

		function getMasterActId( masteractarr, date) {
			
			console.log(masteractarr);
			console.log(date._d.getTime());
			// console.log(masteractarr[0].masteractstartdatelong, date._d.getTime(), masteractarr[0].masteractenddatelong);

			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == 0)
					continue;
		    	if ( (date._d.getTime() >= masteractarr[i].masteractstartdatelong) &&
		    		(date._d.getTime() <= masteractarr[i].masteractenddatelong) ) {
					return masteractarr[i].masteractid;
		    	}
			}
			
			return 0;	
		}
		
		function updatemasteractivitycount(masteractid, masteractarr, action) {
			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == masteractid) {
					if ( !(action === undefined) && action === 'delete' )
						masteractarr[i].activitycount = masteractarr[i].activitycount - 1;						
					else
						masteractarr[i].activitycount = masteractarr[i].activitycount + 1;						
				}
			}				
		}
		
		function getMasterActDetails(masteractid, masteractarr) {
			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == masteractid)
					return masteractarr[i].masteractname + " / Dates: " + masteractarr[i].masteractstartdatestr + " - " + masteractarr[i].masteractenddatestr;		
			}						
		}
		
		function checkDateWithinMasteractRange(masteractid, pikeddate, masteractarr) {
			console.log(masteractid);
			console.log(pikeddate);
			console.log(masteractarr);
			
			for (var i = 0; i < masteractarr.length; i++) {
				if (masteractarr[i].masteractid == masteractid) {
					if (pikeddate.getTime() >= masteractarr[i].masteractstartdatelong &&
					    pikeddate.getTime() <= masteractarr[i].masteractenddatelong)
					    return true;
				}
			}
			
			return false;			
		}
		
		function formatForCalendar(aDate) {
			var c =  aDate.substring(6,10) + "-" + aDate.substring(0, 2) + "-" + aDate.substring(3, 5);
			return c;
		}
		
		function incrActivityCnt () {			
    		activitycnt = activitycnt + 1;
    		$('#activitycntspn').html('Count: <i>' + activitycnt + '</i>)');
		}
		
		function getFormattedDateTime(timelong) {
			var datemoment = new moment(timelong).format('MM/DD/YYYY hh:mm A');;
			// 05/10/2015 2:00 AM
			return datemoment;
		}

		function addUpdateActivity(data) {
			var idtype;
			console.log(data);
			if (data.type == 0) {
				var color = "#82AF6F";
				//idtype = "T";
			}
			if (data.type == 1) {
				var color = "#D15B47";						
				//idtype = "H";
			}
			if (data.type == 2) {
				var color = "#9585BF";
				//idtype = "V";							
			}
			if (data.type == 3) {
				var color = "#FEE188";
				//idtype = "R";													
			}
			if (data.type == 4) {
				var color = "#D6487E";
				//idtype = "O";																			
			}
		
			var strid =  data.activityid + "." + data.type;
			console.log(strid);
			var calevent = $('#calendar').fullCalendar( 'clientEvents', strid);
			console.log(calevent);

			if (typeof calevent[0] !== "undefined" && calevent[0] !== null) {
				if (data.activitystarttimelong == 0)
					data.activitystarttimelong = data.activitystarttimelongpair;
				if (data.activityendtimelong == 0)
					data.activityendtimelong = data.activityendtimelongpair;
					
				calevent[0].title = data.actname;
				calevent[0].start = data.activitystarttimelong;
				calevent[0].end = data.activityendtimelong;				
				calevent[0].activitystarttimelong =  data.activitystarttimelong;
				calevent[0].actname = data.actname;
				calevent[0].startdatelong =  data.activitystarttimelong;
				calevent[0].enddatelong = data.activityendtimelong;
				
			 	$('#calendar').fullCalendar('updateEvent', calevent[0]);			     							
			}				
  			else {
				var event = {
					"id": strid,
					"title": data.actname,
					"start": data.activitystarttimelong,
					"end": data.activityendtimelong,							
					"color": color,
					"activityid": data.activityid,
					"activityidpair": data.activityidpair,						
					"code": data.code,
					"itinnum": data.itinnum,
					"activitystarttimelong": data.activitystarttimelong,
					"actname": data.actname,
					"tzoffset": data.tzoffset,
					"startdatelong": data.activitystarttimelong,
					"enddatelong": data.activityendtimelong,
					"type": data.type
				}
				events.push(event);
				// updatemasteractivitycount(event, masteractarr);				
				$('#calendar').fullCalendar( 'renderEvent', event);

				if (data.code == "T_BOOK_RETURN") {
					var stridpair =  data.activityidpair + "." + data.type;
					var eventpair = {
						"id": stridpair,
						"title": data.actname,
						"start": data.activitystarttimelongpair,
						"end": data.activityendtimelongpair,							
						"color": color,
						"activityid": data.activityidpair,
						"activityidpair": data.activityid,						
						"code": data.code,
						"itinnum": data.itinnum,
						"activitystarttimelong": data.activitystarttimelongpair,
						"actname": data.actname,
						"tzoffset": data.tzoffset,
						"startdatelong": data.activitystarttimelongpair,
						"enddatelong": data.activityendtimelongpair,
						"type": data.type
					}
					events.push(eventpair);
					//updatemasteractivitycount(eventpair, masteractarr);				
					$('#calendar').fullCalendar( 'renderEvent', eventpair);				
				}
  			}
  					
		}
				
		</script>
	</body>
</html>
