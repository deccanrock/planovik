<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
		<script src="/resources/js/bootstrap-tag.min.js"></script>
		<script src="/resources/js/typeahead.bundle.min.js"></script>
		<script src="/resources/js/chosen.jquery.min.js"></script>	
		<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />	
		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>
		

		
		<!-- #section:basics/sidebar -->
		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>

					<button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>

					<!-- #section:basics/sidebar.layout.shortcuts -->
					<button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>

					<button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>

					<!-- /section:basics/sidebar.layout.shortcuts -->
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span>

					<span class="btn btn-info"></span>

					<span class="btn btn-warning"></span>

					<span class="btn btn-danger"></span>
				</div>
			</div><!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">
				<li class="">
					<a id="dash" href="/app/dash">
						<i class="menu-icon fa fa-tachometer"></i>
						<span class="menu-text"> Dashboard </span>
					</a>

					<b class="arrow"></b>
				</li>


				<li>
					<a id="tasks" href="/app/itineraries" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i>
						<span class="menu-text"> Itineraries </span>
					</a>
				</li>
				
				<li  class="active">
					<a id="manage" href="/app/manage" class="dropdown-toggle">
						<i class="menu-icon fa fa-pencil-square-o"></i>
						<span class="menu-text"> Manage </span>
					</a>
				</li>				

				<li class="">
					<a id="support" href="/app/support" class="dropdown-toggle">
						<i class="menu-icon fa fa-desktop"></i>
						<span class="menu-text"> Support </span>
					</a>
				</li>


			</ul><!-- /.nav-list -->

			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>

			<!-- /section:basics/sidebar.layout.minimize -->
			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
			</script>
		</div>

		<!-- /section:basics/sidebar -->

		<div class="main-content">
			<!-- #section:basics/content.breadcrumbs -->

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<!-- #section:settings.box -->

				<!-- /section:settings.box -->
				<div class="page-content-area">
					<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
					<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
							</button>
							<strong><i class="ace-icon fa fa-times"></i></strong>
							${error}
						</div>										
					</c:if>			

					<div class="row">
    					<div class="col-xs-12" style="margin-top:-200px;">

							<div class="col-sm-6">
							
								<div style="margin-top:-10px;">
									<label for="day"><H4>Pick a day</H4></label>	
									<br />
									<select class="chosen-select" id="dayselect" data-placeholder="Pick a day...">
										<option value="">  </option>
										<c:forEach var="i" begin="1" end="${activitymaster.numtourdays}">								
										<option value="${i}">Day ${i}</option>								
		          						</c:forEach>								
									</select>
								</div>
								<div class="col-sm-2" style="margin-top:15px;margin-left:10px;">
									<button id="hotel" class="btn btn-white btn-pink btn-round" style="width:110%;line-height:10px;">Add Hotel</button>																	
									<span id="arrowhotel" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="color:#AF6F87;margin-left:55px;margin-top:-3px;display:none;"></span>
								</div>			
								<div id="traveldiv" class="col-sm-2" style="margin-top:15px;margin-left:5px;">
									<button id="travel" class="btn btn-white btn-success btn-round" style="margin-left:10px;width:110%;line-height:10px;">Add Travel</button>
									<span id="arrowtravel" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#A7C9A1;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:15px;margin-left:15px;">
									<button id="rental" class="btn btn-white btn-default btn-round" style="margin-left:10px;width:110%;line-height:10px;">Add Rental</button>
									<span id="arrowrental" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#ABBAC3;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:15px;margin-left:10px;">
									<button id="visit" class="btn btn-white btn-warning btn-round" style="margin-left:15px;width:110%;line-height:10px;">Add Visit</button>
									<span id="arrowvisit" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#E7B979;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:15px;margin-left:20px;">
									<button id="other" class="btn btn-white btn-info btn-round" style="margin-left:10px;width:110%;line-height:10px;">Add Other</button>
									<span id="arrowother" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#8FBCD9;display:none;"></span>
								</div>			
								
								
								<div class="widget-box" id="travelactivitywidget" style="margin-top:50px;border-style:solid;display:none;">          
									<div class="widget-header">
										<h5 class="widget-title">Activity Id: ${travelacitivity.activityid}</h5>
										<div class="widget-toolbar">
											<a href="#" data-action="fullscreen" class="orange2" style="visibility:hidden;">
											</a>
											<a href="#" class="red" id="activityclose" onClick="resetactivityform('travelactivityform', 'travelactivitywidget', 'arrowtravel'); return false;">
												<i class="ace-icon fa fa-times"></i>
											</a>
											<!-- /section:custom/widget-box.toolbar -->
										</div>										
									</div>									
								    <div class="widget-body">
								    	<div class="widget-main">
											<form:form id="travelactivityform" method="post" action="/app/travelactivity/save" modelAttribute="travelactivity" 
											name="travelactivity" class="form-horizontal">
									        
									        <div class="row">									    																					    
												<div class='col-md-6'>	
												    <div class="form-group" style="margin-left:6px;">
												        <div class="clearfix">
													        <label for="code">Travel Code</label>
																<form:select class="form-control col-sm-11" path="code" name="travelcodes" id="travelcodes" style="width:90%;">
																	<option value="">  </option>
																</form:select>
														</div>
													</div>							        
												</div>
												<div class='col-md-6'>	
												    <div class="form-group" style="margin-left:5px;">
												        <div class="clearfix">
													        <label for="name">Specify a name for activity</label>
											    				<form:input id="name" class="col-sm-11" path="name" type="text" style="width:93%; "/>												
														</div>
													</div>							        
												</div>

											</div> <!-- row -->

											<form:input id="day" type="hidden" path="day" />
											<form:input id="status" type="hidden" path="status" value="0" />
											<form:input id="savemode" type="hidden" path="savemode" />
											<form:input id="itinnum" type="hidden" path="itinnum" value="${activitymaster.itinnum}" />
											<form:input id="version" type="hidden" path="version" value="${activitymaster.version}" />
											<form:input id="tzoffset" type="hidden" path="tzoffset" value="${activitymaster.tzoffset}" />
											<form:input id="activityid" type="hidden" path="activityid" value='0' />
											
											<div id="formelements" disabled="disabled">

										        <div class="row">									    																					    										
													<div class='col-md-6'>	
													    <div class="form-group" style="margin-left:6px;">
													        <div class="clearfix">
														        <label for="code">PAX</label>
												    				<form:input id="pax" class="col-sm-11" path="pax" type="text" value="${activitymaster.pax}" />												
															</div>
														</div>							        
													</div>
													<div class='col-md-6'>	
													    <div class="form-group" style="margin-left:6px;">
													        <div class="clearfix">
														        <label for="groupnum">Group No</label>
												    				<form:input id="groupnum" class="col-sm-11" path="groupnum" type="text" style="width:93%; "/>												
															</div>
														</div>							        
													</div>													
												</div>											

					        					<div class="row">
													<div class='col-md-6'>										    																					    
													    <div class="form-group" style="margin-left:6px;">
													        <div class="clearfix">
																<label for="vesselno">Flight/Train/Bus Number</label>
											    				<form:input id="vesselno" class="col-sm-11" path="vesselno" type="text" />												
															</div>
														</div>
													</div>
													
													<div class='col-md-6'>										    																					    
														<div class="form-group"  style="margin-left:5px;">
													        <div class="clearfix">
																<label for="vesselconame">Travel Company</label>
											    				<form:input id="vesselconame" class="col-sm-11" path="vesselconame" type="text" style="width:93%;"/>												
															</div>
										    			</div>
										    		</div>
												</div><!-- row -->																						
	
										        <div class="row">
													<div class='col-md-6'>										    																					    
													    <div class="form-group" style="margin-left:6px;">
													        <div class="clearfix">
																<label for="bookingno">Booking Details</label>
											    				<form:input id="bookingno" class="col-sm-11" path="bookingno" type="text" />	
											    			</div>
											    		</div>
											    	</div>	
	
													<div class='col-md-6'>										    																					    
													    <div class="form-group" style="margin-left:5px;">
													        <div class="clearfix">
																<label for="bookingclass">Booking Class</label>
											    				<form:input id="bookingclass" class="col-sm-11" path="bookingclass" type="text" style="width:93%;" />
											    			</div>
											    		</div>												
													</div>
												</div>		
	
										        <div class="row">
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
									                    		<label for ="depdatetime">Departure Date and Time</label>
													            <div class='input-group'>
																	<span class="input-group-addon">
																		<i class="fa fa-calendar bigger-110"></i>
																	</span>					            
													                <input type='text' id="depdatetimepicker" name="depdatetimepicker" class="form-control col-sm-11"
													                	value="${travelactivity.depdatetime}" style="z-index:0;width:90%;" />
													                <form:input type='hidden' id="depdatetimestr" path="depdatetimestr" name="depdatetimestr" value="${travelactivity.depdatetimestr}" />
													                <form:input type='hidden' id="depdatetimelong" name="depdatetimelong" path="depdatetimelong" />
													       		</div>
													 		</div>
											        	</div>
													</div>
	
													<div class='col-md-6'>										    																					    
												        <div class="form-group" style="margin-left:5px;">
								                    		<label for ="arrdatetime">Arrival Date and Time</label>
												            <div class='input-group'>
																<span class="input-group-addon">
																	<i class="fa fa-calendar bigger-110"></i>
																</span>					            
												                <input type='text' id="arrdatetimepicker" name="arrdatetimepicker" class="form-control col-sm-11"
												                	value="${travelactivity.arrdatetime}" style="z-index:0;width:93%;" />
												                <form:input type='hidden' id="arrdatetimestr" path="arrdatetimestr" name="arrdatetimestr" value="${travelactivity.arrdatetimestr}" />
												                <form:input type='hidden' id="arrdatetimelong" name="arrdatetimelong" path="arrdatetimelong" />
												            </div>
												        </div>
													</div>
												</div>									        
												
										        <div class="row">
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
								                        		<label for="depstation">Departure Station</label>
												                <form:input type='text' path="depstation" id="depstation" name="depstation" class="col-sm-11" 
												                	value="${travelactivity.depstation}" />
															</div>
														</div>
													</div>
													<div class='col-md-6'>										    																					    									        
												        <div class="form-group" style="margin-left:5px;">
									                        <div class="clearfix">
								                        		<label for="arrstation">Arrival Station</label>
												                <form:input type='text' path="arrstation" id="arrstation" name="arrstation" class="col-sm-11" 
												                	value="${travelactivity.arrstation}" style="width:93%;" />
															</div>
												        </div>
										        	</div>	
										        </div>
										        
			
										        <div class="row">
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
																<label for="cost">Cost</label>
											    				<form:input id="cost" path="cost" type="text" class="col-sm-11" />												
															</div>
														</div>
													</div>
															
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
																<label for="costmarkup">Cost Markup (as %)</label>
											    				<form:input id="costmarkup" path="costmarkup" type="text" class="col-sm-11" style="width:93%;" />												
															</div>
														</div>
													</div>
												</div>
																					
										        <div class="row" id="asstreqgroup">		
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
																<label for="asstcost">Assistance Fee</label>
											    				<form:input id="asstcost" path="asstcost" class="col-sm-11" type="text" />												
															</div>
														</div>
													</div>
			
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:5px;">
															<div class="clearfix">
																<label for="asstcostmarkup">Fee Markup</label>
											    				<form:input id="asstcostmarkup" path="asstcostmarkup" class="col-sm-11" style="width:93%;" type="text" />												
															</div>
														</div>
													</div>
												</div>
											
										        <div class="row" id="pikupgroup">	
													<div class='col-md-6'>										    																					    
														<div class="form-group" style="margin-left:6px;">														
															<div class="clearfix">
																<label for="pikupveh"> Pickup - Specify Vehicle</label>
											    				<form:input id="pikupveh" path="pikupveh" type="text" class="col-sm-11" />												
															</div>
														</div>
													</div>
												
													<div class='col-md-3'>										    																					    
														<div class="form-group" style="margin-left:6px;">
															<div class="clearfix">
																<label for="pikupcost">Pickup Fee</label>
											    				<form:input id="pikupcost" path="pikupcost" type="text" style="width:120%;" />												
															</div>
														</div>
													</div>
			
													<div class='col-md-3'>										    																					    
														<div class="form-group" style="margin-left:28px;">
															<div class="clearfix">
																<label for="pikupcostmarkup">Fee Markup</label>
											    				<form:input id="pikupcostmarkup" path="pikupcostmarkup" type="text" style="width:82%;"/>												
															</div>
														</div>
													</div>
												</div>
															
			
										        <div class="row">									    																					    
													<div class='col-md-10'>	
													    <div class="form-group" style="margin-left:6px;">
													        <div class="clearfix">
																<label for="comments">Comments</label>
																<form:textarea class="form-control limited" id="comments" path="comments" maxlength="100" />
															</div>
														</div>
													</div>
												</div>
			
										        <div class="row">									    																					    
													<div class='col-md-8' >	
												        <div class="col-md-3 col-md-offset-4">
												            <button type="submit" id="travelactivitysavedraft" class="btn btn-purple" >Save Draft</button>
												        </div>
												        <div class="col-md-3  col-md-offset-2">
												            <button type="submit" id="travelactivitysavefinal" class="btn btn-purple">Save Final</button>
												        </div>											    
													</div>
												</div>
											</div> <!-- formelements -->			
											</form:form>
										</div> <!-- widget body -->	
									</div> <!-- widget main -->	
								</div> <!-- widget box -->
`
							</div><!-- col-sm-6 -->

							<div class="col-sm-6" style="margin-top:-20px;">    					
								<h3 class="row header smaller lighter blue">
									<span class="col-xs-6"> Day wise activity preview </span><!-- /.col -->
								</h3>
								<!-- #section:elements.accordion -->
								<div id="accordion" class="accordion-style1 panel-group">
									<c:forEach var="i" begin="1" end="${activitymaster.numtourdays}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<c:if test="${i == 1}">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse${i}">
															<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;Day ${i}
														</a>
													</c:if>
													<c:if test="${i != 1}">
														<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${i}">
															<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;Day ${i}
														</a>
													</c:if>
												</h4>
											</div>
											<c:if test="${i == 1}">
												<div class="panel-collapse collapse in" id="collapse${i}">
											</c:if>											
											<c:if test="${i != 1}">
												<div class="panel-collapse collapse" id="collapse${i}">
											</c:if>											
													<div class="panel-body">


											<div class="widget-box widget-color-orange collapsed">
												<!-- #section:custom/widget-box.options.collapsed -->
												<div class="widget-header widget-header-small">
													<h6 class="widget-title">
														<i class="ace-icon fa fa-sort"></i>
														Travel - Adam family visit to Udaipur
													</h6>
	
													<div class="widget-toolbar">
														<a href="#" data-action="collapse">
															<i class="ace-icon fa fa-plus" data-icon-show="fa-plus" data-icon-hide="fa-minus"></i>
														</a>
	
														<a href="#" data-action="settings">
															<i class="ace-icon fa fa-cog"></i>
														</a>
		
														<a href="#" data-action="close">
															<i class="ace-icon fa fa-times"></i>
														</a>
													</div>
												</div>
	
												<!-- /section:custom/widget-box.options.collapsed -->
												<div class="widget-body">
													<div class="widget-main">
														<p style="background:#A7C9A1;">
															Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis.
														</p>
													</div>
												</div>
											</div>

													</div>
												</div>
										</div>
	          						</c:forEach>																	
								</div><!-- /section:elements.accordion -->
							</div><!-- /.col -->

						</div><!-- /.col-xs-12 -->
					</div><!-- row -->					
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
		window.jQuery || document.write("<script src='/resources/js/jquery.min.js'"+"<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/resources/js/jquery1x.min.js'"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='/resources/js/jquery.mobile.custom.min.js'>" + "<"+"/script>");
	</script>
	<script src="/resources/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
	  <script src="/resources/js/excanvas.min.js"></script>
	<![endif]-->
	<script src="/resources/js/jquery-ui.custom.min.js"></script>
	<script src="/resources/js/jquery.ui.touch-punch.min.js"></script>
	<script src="/resources/js/jquery.easypiechart.min.js"></script>
	<script src="/resources/js/jquery.sparkline.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.pie.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.resize.min.js"></script>

	<!-- ace scripts -->
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">

		function loadActivityCodes (activitytype) {
	
			var request = $.ajax({type: 'GET', url: "/app/activity/getactivitycodes?" + "query=" + activitytype });
			request.done(function( data ) {
				  $('#' + activitytype + 'codes').html('');
				  var first_entry = "<option value=" +  ""+ ">" +  ""+ "</option>";
	        	  $(first_entry).appendTo('#' + activitytype + 'codes');			  
				  $.each(data, function(i, val){
					var div_data="<option value=" + val + ">" + val + "</option>";
					// This should be changed to a global var for optimization
	        		$(div_data).appendTo('#' + activitytype + 'codes'); 					  	
				  })				
			}); 
		    request.fail(function( jqXHR, textStatus ) {
			});
			
			return false;		
		}


		$('.chosen-select').chosen({allow_single_deselect:true}); 
		//resize the chosen on window resize
	
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			})
		}).trigger('resize.chosen');	
	        	
		
		function resetactivityform(activityformname, widgetname, arrowname)	{
	 		$(".error").html('');
			$(".error").removeClass("error");
	    	$('#' + activityformname).trigger('reset');
	    	$('#' + widgetname).hide();
	    	$('#' + arrowname).hide();	    	
		}
		
				
		$('#travelcodes').change(function() {

		    if ( $(this).val() === '' ) {
		        $('#formelements').find('*').prop('disabled', true);		    
				return;		    
		    }

		    if ( $(this).val() != '' ) {
		        $('#formelements').find('*').prop('disabled', false);		    
		    }

		    if ( $(this).val() === 'TADOM0' || $(this).val() === 'TAINTL0' || $(this).val() === '' ) {
		        // Disable airport pickup and assistance required options
		        $('#asstreqgroup').find('*').prop('disabled', true);
		        $('#pikupgroup').find('*').prop('disabled', true);		        
		    }

		    if ( $(this).val() === 'TADOM1' || $(this).val() === 'TAINTL1' ) {
		        // Disable airport pickup and enable assistance required options
		        $('#asstreqgroup').find('*').prop('disabled', false);
		        $('#pikupgroup').find('*').prop('disabled', true);		        
		    }

		    if ( $(this).val() === 'TADOM2' || $(this).val() === 'TAINTL2' ) {
		        // Enable airport pickup and disable assistance required options
		        $('#asstreqgroup').find('*').prop('disabled', true);
		        $('#pikupgroup').find('*').prop('disabled', false);		        
		    }

		    if ( $(this).val() === 'TADOM3' || $(this).val() === 'TAINTL3' ) {
		        // Enable airport pickup and assistance required options
		        $('#asstreqgroup').find('*').prop('disabled', false);
		        $('#pikupgroup').find('*').prop('disabled', false);		        
		    }
		    
		});		
		
		$("button").click(function() {

	    	if (this.id == 'travelactivitysavedraft')
	    		return;

	    	if (this.id == 'travelactivitysavefinal')
	    		return;
	    		
			// Check if day was selected
			if ($('#dayselect').val() == "")
				return false;
			
	    	$('#arrow' + this.id).show();	    	
	    	var color;
	    	if (this.id == 'travel')
	    		color = '#A7C9A1';
	    	if (this.id == 'rental')
	    		color = '#ABBAC3';
	    	if (this.id == 'rental')
	    		color = '#D299AE';
	    	if (this.id == 'rental')
	    		color = '#E7B979';
	    	if (this.id == 'rental')
	    		color = '#8FBCD9';
	    	$('#' + this.id + 'activitywidget').css('border-color', color);
		    $('#' + this.id + 'activitywidget').css('border-width', 'thin');

		    loadActivityCodes(this.id);	    	

		    if ( $('#travelcodes').val() === '' )
		        $('#formelements').find('*').prop('disabled', true);		    

		    $('#' + this.id + 'activitywidget').show();				    
		});
		
		$("#travelactivitysavedraft").click(function() {
		    		
            var startdate = GetDate($('#depdatetimepicker').val());
            var enddate = GetDate($('#arrdatetimepicker').val());
            
            $('#depdatelong').val(startdate.getTime());
            $('#arrdatelong').val(enddate.getTime());
            
			$('#day').val($('#dayselect').val());            
			$('#savemode').val('Save Draft');
			activityid             
		});
				
		$("#travelactivitysavefinal").click(function() {
		    		
            var startdate = GetDate($('#depdatetimepicker').val());
            var enddate = GetDate($('#arrdatetimepicker').val());
            
            $('#depdatelong').val(startdate.getTime());
            $('#arrdatelong').val(enddate.getTime());
            
			$('#day').val($('#dayselect').val());            
			$('#savemode').val('Save Final');                         
		});

		$(function() {
		
            $("#depstation").suggest({
                key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
                filter:'(any type:/location/citytown)'
            })
			.bind("fb-select", function(e, data) {

			});  
					
            $("#arrstation").suggest({
                key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
                filter:'(any type:/location/citytown)'
            })
			.bind("fb-select", function(e, data) {

			});                      

        });
                
        $('#travelactivityform').validate({
        	ignore: ":disabled",
            rules: {
				name: {
					required: true
				}
            },
            messages: {

            }            
        });        

		jQuery.validator.addMethod("costnumbersdecimal", function(value, element){
            return (value.match(/^\d+\.\d{0,2}$/));
     	}, 'Cost should contain digits and a single decimal only!');   

		jQuery.validator.addMethod("costmarkupnumberlimit", function(value, element){
            return (value.match(/^\d{1,3}$/));
     	}, 'Cost markup should contain upto 3 digits only!');   

		jQuery.validator.addMethod("endstationdifferent", function(value, element){
            return $('#depstation').val() != value;
     	}, 'Departure and Arrival stations should be different!');   
     	
		jQuery.validator.addMethod("enddategtstartdate", function(value, element){
           var startdate = GetDate($('#depdatetimepicker').val());
           var enddate = GetDate(value);
            return enddate > startdate;
     	}, 'Arrival date/time should be greater than departure date/time.');   


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
                       
			
		$("#itineraries").click(function(e){
		    window.location = "/app/itineraries";
		});	

		$("#dash").click(function(e){
		    window.location = "/app/dash";
		});	
		
		$("#support").click(function(e){
		    window.location = "/app/support";
		});
		
		function toggle_edit (element) {
			if ( $(element).prop('disabled') )
				$(element).prop('disabled', false);
			else
				$(element).prop('disabled', true);			
		}
		
		$("#contactnamelnk").click(function(ev) {
       		ev.preventDefault();
   		});

		$("#contactnamelnk").click(function(ev) {
       		ev.preventDefault();
   		});
				
		$("#contactphoneofficelnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		
		$("#contactphonemobilelnk").click(function(ev) {
       		ev.preventDefault();
   		});

		$("#contactemaillnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		
		$("#contactdesignationlnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		   		
		function Manage() {					
			var token = $('#csrfToken').val();
			var header = $('#csrfHeader').val();
			$('input[name="_csrf"]').val(token);
		}
					
		// Instantiate the Bloodhound suggestion engine		
		var itinlist = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
		   	remote: {
		        url: '/app/getItinList?query=%QUERY',
		        filter: function (parsedResponse) {
		            // $.map converts the JSON array into a JavaScript array
		            return $.map(parsedResponse, function (list) {
		                return {
		                    // NB : replace original_title below with your JSON film key
		                    value: list.valueOf()
		                };
		            });
		        }
		    }										
		}); 		
		
		itinlist.initialize();			
						
		$('#remote .typeahead').typeahead(null, {
		    displayKey: 'value',
		    source: itinlist.ttAdapter()
		});		 
								
								
		jQuery(function($) {
		
			$.fn.extend({
				 trackChanges: function() {
				   $(":input",this).change(function() {
				      $(this.form).data("changed", true);
				   });
				 }
				 ,
				 isChanged: function() { 
				   return this.data("changed"); 
				 }
			});
			
			$("#travelactivityform").trackChanges();        		    
		    
		    $(function () {
				$('#depdatetimepicker').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
		
				$('#arrdatetimepicker').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
			});
			
									
			$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('.tab-content')
				var off1 = $parent.offset();
				var w1 = $parent.width();
		
				var off2 = $source.offset();
				//var w2 = $source.width();
		
				if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
				return 'left';
			}
		
		
			$('.dialogs,.comments').ace_scroll({
				size: 300
		    });
			
			
			//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
			//so disable dragging when clicking on label
			var agent = navigator.userAgent.toLowerCase();
			if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
			  $('#itineraries').on('touchstart', function(e){
				var li = $(e.target).closest('#tasks li');
				if(li.length == 0)return;
				var label = li.find('label.inline').get(0);
				if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
			});
		
			$('#itineraries').sortable({
				opacity:0.8,
				revert:true,
				forceHelperSize:true,
				placeholder: 'draggable-placeholder',
				forcePlaceholderSize:true,
				tolerance:'pointer',
				stop: function( event, ui ) {
					//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
					$(ui.item).css('z-index', 'auto');
				}
				}
			);
			$('#itineraries').disableSelection();
			$('#itineraries input:checkbox').removeAttr('checked').on('click', function(){
				if(this.checked) $(this).closest('li').addClass('selected');
				else $(this).closest('li').removeClass('selected');
			});
		
		
			//show the dropdowns on top or bottom depending on window height and menu position
			$('#itineraries-tab .dropdown-hover').on('mouseenter', function(e) {
				var offset = $(this).offset();
		
				var $w = $(window)
				if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
					$(this).addClass('dropup');
				else $(this).removeClass('dropup');
			});
		
		})
	</script>

	<!-- the following scripts are used in demo only for onpage help and you don't need them -->
	<link rel="stylesheet" href="/resources/css/ace.onpage-help.css" />
	<link rel="stylesheet" href="/resources/docs/assets/js/themes/sunburst.css" />

	<script type="text/javascript"> ace.vars['base'] = '..'; </script>
	<script src="/resources/js/ace/elements.onpage-help.js"></script>
	<script src="/resources/js/ace/ace.onpage-help.js"></script>
	<script src="/resources/docs/assets/js/rainbow.js"></script>
	<script src="/resources/docs/assets/js/language/generic.js"></script>
	<script src="/resources/docs/assets/js/language/html.js"></script>
	<script src="/resources/docs/assets/js/language/css.js"></script>
	<script src="/resources/docs/assets/js/language/javascript.js"></script>
</body>
</html>