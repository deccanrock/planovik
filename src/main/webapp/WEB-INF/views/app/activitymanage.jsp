<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="/resources/js/bootstrap-tag.min.js"></script>
		<script src="/resources/js/typeahead.bundle.min.js"></script>
		<script src="/resources/js/chosen.jquery.min.js"></script>	
		<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />	

		
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
							
								<div>
									<label for="form-field-select-3"><H4>Pick a day</H4></label>	
									<br />
									<select class="chosen-select" id="form-field-select-3" data-placeholder="Pick a day...">
										<option value="">  </option>
										<c:forEach var="i" begin="1" end="${activitymaster.numtourdays}">								
										<option value="${i}">Day ${i}</option>								
		          						</c:forEach>								
									</select>
								</div>
								<div class="col-sm-2" style="margin-top:10px;margin-left:5px;">
									<button id="hotelbtn" class="btn btn-white btn-pink btn-round" style="width:130%;">Add Hotel</button>																	
									<span id="arrowhotel" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="color:#AF6F87;margin-left:55px;margin-top:-3px;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:10px;margin-left:5px;">
									<button id="travelbtn" class="btn btn-white btn-success btn-round" style="margin-left:10px;width:130%;">Add Travel</button>
									<span id="arrowtravel" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#ABBAC3;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:10px;margin-left:15px;">
									<button id="rentalbtn" class="btn btn-white btn-default btn-round" style="margin-left:10px;width:130%;">Add Rental</button>
									<span id="arrowrental" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#ABBAC3;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:10px;margin-left:10px;">
									<button id="visitbtn" class="btn btn-white btn-warning btn-round" style="margin-left:15px;width:130%;">Add Visit</button>
									<span id="arrowvisit" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#E7B979;display:none;"></span>
								</div>			
								<div class="col-sm-2" style="margin-top:10px;margin-left:20px;">
									<button id="otherbtn" class="btn btn-white btn-info btn-round" style="margin-left:10px;width:130%;">Add Other</button>
									<span id="arrowother" class="ace-icon glyphicon glyphicon-play arrowdown" 
											style="margin-left:55px;margin-top:-3px;color:#8FBCD9;display:none;"></span>
								</div>			
								
								<form:form id="travelactivityform" method="post" action="/app/travelactivity/save" modelAttribute="travelactivity" 
									name="travelactivity" class="form-horizontal" style="display:none;">
								    					
									<c:if test="${not empty travelactivity.activityid}">
								        <label class="col-xs-3 control-label">Activityid: ${travelactivity.activityid}</label>
									</c:if>
									<c:if test="${empty travelactivity.activityid}">
								        <label class="col-xs-3 control-label">Activityid: <i>new</i></label>
									</c:if>
														    
								    <div class="form-group">
								        <label class="col-xs-3 control-label">Travel Code</label>
											<form:select class="form-control" path="codes" id="codes">
												<option value="">  </option>
												<c:forEach var="code" items="${travelactivity.codes}">							
													<option value="${code}">${code}</option>								
				          						</c:forEach>
											</form:select>							        
								    </div>
								   	
								   	<form:input id="day" type="hidden" path="day" />

									<div class="form-group">
										<label for="vesselconame">Transport Company</label>
					    				<form:input id="vesselconame" path="vesselconame" type="text" />												
					    			</div>
									
									<div class="form-group">
										<label for="vesselno">Flight/Train/Bus Number</label>
					    				<form:input id="vesselno" path="vesselno" type="text" />												
									</div>
									
									<div class="form-group">
										<label for="class">Class</label>
					    				<form:input id="class" path="class" type="text" />												
									</div>
									
									<div class="form-group">
										<label for="bookingno">Booking Details</label>
					    				<form:input id="bookingno" path="bookingno" type="text" />												
									</div>

							        <div class="form-group">
			                    		<label for ="depdatetime">Departure Date and Time</label>
							            <div class='input-group'>
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>					            
							                <input type='text' id="depdatetimepicker" name="depdatetimepicker" class="form-control"
							                	value="${travelactivity.depdatetime}" style="z-index:0;" />
							                <form:input type='hidden' id="depdatetimestr" path="depdatetimestr" name="depdatetimestr" value="${travelactivity.depdatetimestr}" />
							                <form:input type='hidden' id="depdatetimelong" name="depdatetimelong" path="depdatetimelong" />
							            </div>
							        </div>

							        <div class="form-group">
			                    		<label for ="arrdatetime">Arrival Date and Time</label>
							            <div class='input-group'>
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>					            
							                <input type='text' id="arrdatetimepicker" name="arrdatetimepicker" class="form-control"
							                	value="${travelactivity.arrdatetime}" style="z-index:0;" />
							                <form:input type='hidden' id="arrdatetimestr" path="arrdatetimestr" name="arrdatetimestr" value="${travelactivity.arrdatetimestr}" />
							                <form:input type='hidden' id="arrdatetimelong" name="arrdatetimelong" path="arrdatetimelong" />
							            </div>
							        </div>
							        
							        <div class="form-group">
				                        <div class="clearfix">
			                        		<label for="depstation">Departure Station</label>
							                <form:input type='text' path="depstation" id="depstation" name="depstation" class="col-sm-12" 
							                	value="${travelactivity.depstation}" />
										</div>
							        </div>
							        
							        <div class="form-group">
				                        <div class="clearfix">
			                        		<label for="arrstation">Arrival Station</label>
							                <form:input type='text' path="arrstation" id="arrstation" name="arrstation" class="col-sm-12" 
							                	value="${travelactivity.arrstation}" />
										</div>
							        </div>

									<div class="form-group">
										<label for="cost">Cost</label>
					    				<form:input id="cost" path="cost" type="text" />												
									</div>

									<div class="form-group">
										<label for="costmarkup">Cost Markup (Example: 125=1.25 X Cost)</label>
					    				<form:input id="costmarkup" path="cost" type="text" />												
									</div>
									
									<div class="control-group">
										<label class="control-label bolder blue">Assistance Required></label>
										<div class="radio" id="asstreq">
											<label>
												<input name="form-field-radio" id="asstreq" path="asstreq" type="radio" class="ace" />
												<span class="lbl"> Yes</span>
											</label>
										</div>

										<div class="radio">
											<label>
												<input name="form-field-radio"  id="asstreq" path="asstreq" type="radio" class="ace" />
												<span class="lbl"> No</span>
											</label>
										</div>
									</div>

									<div class="form-group">
										<label for="asstcost">Fees for providing assistance</label>
					    				<form:input id="asstcost" path="asstcost" type="text" />												
									</div>

									<div class="form-group">
										<label for="asstcostmarkup">Fee Markup for assistance (Example: 125=1.25 X Cost)</label>
					    				<form:input id="asstcostmarkup" path="cost" type="text" />												
									</div>
								
									<div class="control-group">
										<label class="control-label bolder blue">Arrival Pickup></label>
										<div class="radio" id="arrvlpikup">
											<label>
												<input name="form-field-radio" id="arrvlpikup" path="arrvlpikup" type="radio" class="ace" />
												<span class="lbl"> Yes</span>
											</label>
										</div>

										<div class="radio">
											<label>
												<input name="form-field-radio" type="radio" id="arrvlpikup" path="arrvlpikup" class="ace" />
												<span class="lbl"> No</span>
											</label>
										</div>
									</div>

									<div class="form-group">
										<label for="pikupveh">Specify vehicle for Arrival pickup</label>
					    				<form:input id="pikupveh" path="pikupveh" type="text" />												
									</div>
									
									<div class="form-group">
										<label for="pikupcost">Fees for Arrival pickup</label>
					    				<form:input id="pikupcost" path="pikupcost" type="text" />												
									</div>

									<div class="form-group">
										<label for="pikupcostmarkup">Fee Markup for Arrival pickup</label>
					    				<form:input id="pikupcostmarkup" path="pikupcostmarkup" type="text" />												
									</div>

									<div class="form-group">
										<label for="comment">Comments</label>
										<form:textarea class="form-control limited" id="comment" path="comment" maxlength="100" />
									</div>

								    <div class="form-group">
								        <div class="col-xs-5 col-xs-offset-3">
								            <button type="submit" id="newtravelactivitysubmit" class="btn btn-purple">Create new</button>
								        </div>
								    </div>

								</form:form>	

								<form:form id="travelrentalform" method="post" action="/app/travelrental/save" modelAttribute="rentalactivity" 
									name="rentalactivity" class="form-horizontal" style="display:none;">

									<c:if test="${not empty rentalactivity.activityid}">
								        <label class="col-xs-3 control-label">Activityid: ${rentalactivity.activityid}</label>
									</c:if>
									<c:if test="${empty rentalactivity.activityid}">
								        <label class="col-xs-3 control-label">Activityid: <i>new</i></label>
									</c:if>

								    <div class="form-group">
								        <label class="col-xs-3 control-label">Travel Code</label>
											<form:select class="form-control" path="codes" id="codes">
												<option value="">  </option>
												<c:forEach var="code" items="${rentalactivity.codes}">							
													<option value="${code}">${code}</option>								
				          						</c:forEach>
											</form:select>							        
								    </div>
								   	
								   	<form:input id="day" type="hidden" path="day" />
									
									<div class="form-group">
										<label for="vehrentco">Vehicle Rental Company</label>
					    				<form:input id="vehrentco" path="vehrentco" type="text" />												
					    			</div>
					    			
									<div class="form-group">
										<label for="vehrentco">Rental Company Contact</label>
					    				<form:input id="vehrentcontact" path="vehrentcontact" type="text" />												
									</div>
									
									<div class="form-group">
										<label for="vehrenttype">Rental Type</label>
					    				<form:input id="vehrenttype" path="vehrenttype" type="text" />												
									</div>
							        <div class="form-group">
			                    		<label for ="vehrentfromdatetime">Rental Start date and time</label>
							            <div class='input-group'>
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>					            
							                <input type='text' id="vehrentfrmdatetimepicker" name="vehrentfrmdatetimepicker" class="form-control"
							                	value="${rentalactivity.vehrentfromdatetime}" style="z-index:0;" />
							                <form:input type='hidden' id="vehrentfromdatetimestr" path="vehrentfromdatetimestr" name="vehrentfromdatetimestr" value="${rentalactivity.vehrentfromdatetimestr}" />
							                <form:input type='hidden' id="vehrentfromdatetimelong" name="vehrentfromdatetimelong" path="vehrentfromdatetimelong" />
							            </div>
							        </div>

							        <div class="form-group">
			                    		<label for ="vehrenttodatetime">Rental End date and time</label>
							            <div class='input-group'>
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>					            
							                <input type='text' id="vehrenttodatetimepicker" name="vehrenttodatetimepicker" class="form-control"
							                	value="${rentalactivity.vehrentfromdatetime}" style="z-index:0;" />
							                <form:input type='hidden' id="vehrenttodatetimestr" path="vehrenttodatetimestr" name="vehrenttodatetimestr" value="${rentalactivity.vehrenttodatetimestr}" />
							                <form:input type='hidden' id="vehrenttodatetimelong" name="vehrenttodatetimelong" path="vehrenttodatetimelong" />
							            </div>
							        </div>
							        
							        <div class="form-group">
				                        <div class="clearfix">
			                        		<label for="vehrentloc">Rental Location</label>
							                <form:input type='text' path="vehrentloc" id="vehrentloc" name="vehrentloc" class="col-sm-12" 
							                	value="${rentalactivity.vehrentloc}" />
										</div>
							        </div>
							        
									<div class="form-group">
										<label for="vehrentcost">Rental Cost</label>
					    				<form:input id="vehrentcost" path="vehrentcost" type="text" />												
									</div>

									<div class="form-group">
										<label for="vehrentcostmarkup">Rental Cost Markup (Example: 125=1.25 X Cost)</label>
					    				<form:input id="vehrentcostmarkup" path="vehrentcostmarkup" type="text" />												
									</div>
									
									<div class="form-group">
										<label for="comment">Comments</label>
										<form:textarea class="form-control limited" id="comment" path="comment" maxlength="100" />
									</div>

								    <div class="form-group">
								        <div class="col-xs-5 col-xs-offset-3">
								            <button type="submit" id="newrentalactivitysubmit" class="btn btn-purple">Create new</button>
								        </div>
								    </div>

								</form:form>
							</div><!-- col-sm-6 -->

							<div class="col-sm-6">    					
								<div id="activitydisplay" class="accordion-style1 panel-group">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
													<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
													&nbsp;Activity preview
												</a>
											</h4>
										</div>

										<div class="panel-collapse collapse in" id="collapseOne">
											<div class="panel-body">
												Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
											</div>
										</div>
									</div>

								</div>

								<!-- /section:elements.accordion -->
							</div><!-- col-sm-6 -->

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
	        	
		$("button").click(function() {

		    var parentId = $(this).closest('div').prop('id');		    
		    if (this.id == 'hotelbtn') {
		    	$('#arrowhotel').show();
		    	LoadHotelActivityForm();
		    }
		    if (this.id == 'travelbtn') {
		    	$('#arrowtravel').show();
		    	// LoadTravelActivityForm();
		    	$('#travelactivityform').show();
		    }
		    if (this.id == 'rentalbtn') {
		    	$('#arrowrental').show();
		    	// LoadTravelActivityForm();
		    	$('#rentalactivityform').show();
		    }
		    if (this.id == 'visitbtn') {
		    	$('#arrowvisit').show();
		    	LoadVisitActivityForm();
		    }
		    if (this.id == 'otherbtn') {
		    	$('#arrowother').show();
		    	LoadOtherActivity();
		    }
		    
		});
 
			
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
				
				
        function checkandsavedata(orgname) {
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
								
		jQuery(function($) {		
		
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