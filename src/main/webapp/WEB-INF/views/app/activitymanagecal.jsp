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
		<script src="/resources/js/date-time/moment.min.js"></script>
		<script src="/resources/js/fullcalendar.min.js"></script>
		<script src="/resources/js/bootbox.min.js"></script>
		
		<!-- ace scripts -->
		<script src="/resources/js/ace-elements.min.js"></script>
		<script src="/resources/js/ace.min.js"></script>
		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		
			$(window).on('scroll', function () {
			    var scrollPos = $(document).scrollTop();
			    $('.scroll').css({
			        top: scrollPos
			    });
			}).scroll();
					
		jQuery(function($) {
		
			$('#external-events div.external-event').each(function() {
		
				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title: $.trim($(this).text()) // use the element's text as the event title
				};
		
				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);
		
				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex: 999,
					revert: true,      // will cause the event to go back to its
					revertDuration: 0  //  original position after the drag
				});
				
			});

			var calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				 buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
			
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'		
				},
			   events: function(start, end, timezone, callback) {
			
					var events = [];
					var i = 0;
					<c:forEach items="${activitylist}" var="event">
						var title = "${fn:escapeXml(event.actname)}";
				
						var date = new Date(${event.activitystarttimelong});
						// var date = new Date();
						var d = date.getDate();
						var m = date.getMonth();
						var y = date.getFullYear();				
			
						var start = new Date(y, m, d);
			            console.log(start);
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
							"activityid": ${event.activityid}  
						}
						events.push(event);				
						i++;
					</c:forEach>
					callback(events);
					console.log(JSON.stringify(events));			
				}				   
			    ,		
				editable: true,
				droppable: true, // this allows things to be dropped onto the calendar !!!
				drop: function(date, allDay) { // this function is called when something is dropped
				
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject');
					var $extraEventClass = $(this).attr('data-class');
					
					console.log(date);			
					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);
					
					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = allDay;
					if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
					
					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
					
				},
				eventReceive: function (event) {
					alert("event");
					console.log(event);
				},
				eventDrop: function(event, delta, revertFunc) {
			        alert(event.title + " was dropped on " + event.start.format());
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
			
					displaymodal(calEvent, jsEvent, view);
				}		
			});			
			
		})

		function displaymodal(calEvent, jsEvent, view) {
		
			var framesrc = '"travelactivitymanage?activityid=' +  calEvent.activityid + '"';

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


			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);

			// change the border color just for fun
			//$(this).css('border-color', 'red');
		
		}

		function onLoadHandler() {
				var actIframesHeight = $("#activityiFrame").height() + 10;
				$("#activityiFrame").height(actIframesHeight);
		}
		
		function adjustModalHeight(height) {
				$("#activityiFrame").height(height);
				$('.modal-body #activitymodal').css({"height":height + "px"} );
		}			

		</script>
	</body>
</html>
