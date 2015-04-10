<%@ include file="headerlight.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
		<script src="/resources/js/bootstrap-tag.min.js"></script>
		<script src="/resources/js/typeahead.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>
								
		<div class="main-content">
			<div class="page-content">
	
				<div class="widget-box" id="travelactivitywidget" style="border-style:1px;border-color:#A7C9A1;">          
					<form:form id="travelactivityform" method="post" modelAttribute="travelactivity" name="travelactivity" class="form-horizontal">
					<div class="widget-header">
				        <div class="row">									    																					    
							<div class='col-xs-4'>	
								<c:if test="${travelactivity.activityid > 0}">
									<h5 class="widget-title" id="headeractivityid">Edit Activity Id: ${travelactivity.activityid}</h5>
								</c:if>
								<c:if test="${travelactivity.activityid == 0}">
									<h5 class="widget-title" id="headeractivityid">Create New Activity </h5>
								</c:if>
							</div>
							<div class='col-xs-8'>
							
								<div class="control-group">								
									<div class="radio">
										<label>
											<input id="radioind" name="form-field-radio" value="0" type="radio" class="ace" />
											<span class="lbl"> Independent</span>
										</label>
										<label>
											<input id="radiopom" name="form-field-radio" type="radio" class="ace" />
											<span class="lbl"> Part of Master</span>
										</label>
									</div>
								</div>
							</div>
						</div>								
					</div>									

				    <div class="widget-body">
				    	<div class="widget-main">

							<c:if test="${not empty error}">
								<div class="alert alert-danger">
									<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
									</button>
									<strong><i class="ace-icon fa fa-times"></i></strong>
									${error}
								</div>										
							</c:if>			

							<c:if test="${travelactivity.masteractid > 0}">
						        <div class="row">									    																					    
									<div class='col-xs-10'>	
									    <div class="form-group" style="margin-left:6px;">
									        <div id="masteractdates" class="clearfix"></div>
										</div>							        
									</div>			
								</div> <!-- row -->
							</c:if>			
					        
					        <div class="row">									    																					    
								<div class='col-xs-4'>	
								    <div class="form-group" style="margin-left:6px;">
								        <div class="clearfix">
									        <label for="code">Travel Code</label>
												<form:select class="form-control col-sm-11 hideearrow" path="code" name="travelcodes" id="travelcodes" />
										</div>
									</div>							        
								</div>
								<div class='col-xs-8'>	
								    <div class="form-group" style="margin-left:5px;width:105%;">
								        <div class="clearfix">
									        <label for="name">Specify a name for activity</label>
							    				<form:input id="actname" class="col-sm-11" path="actname" value= "${travelactivity.actname}" type="text" style="width:92%;" maxlength="45" />												
										</div>
									</div>							        
								</div>
			
							</div> <!-- row -->
			
							<form:input id="day" type="hidden" path="day" />
							<form:input id="itinnum" type="hidden" path="itinnum" />
							<form:input id="masteractid" type="hidden" path="masteractid" />
							<form:input id="version" type="hidden" path="version" />
							<form:input id="tzoffset" type="hidden" path="tzoffset" />
							<form:input id="activityid" type="hidden" path="activityid" />
							<form:input id="groupnum" type="hidden" path="groupnum" />
							
							<div id="formgroupall">
						        <div class="row">									    																					    										
									<div class='col-xs-2'>	
									    <div class="form-group" style="margin-left:6px;">
									        <div class="clearfix">
										        <label for="code">PAX</label>
								    				<form:input id="pax" class="col-sm-11" path="pax" type="text" style="width:90%" value="${activitymaster.pax}" maxlength="5" />												
											</div>
										</div>							        
									</div>

									<div class='col-xs-5'>										    																					    
									    <div class="form-group" style="margin-left:6px;">
									        <div class="clearfix">
												<label for="vesselno">Flight/Train/Bus Number</label>
							    				<form:input id="vesselno" class="col-sm-11" style="width:90%" value="${activitymaster.vesselno}" path="vesselno" type="text"  maxlength="15" />												
											</div>
										</div>
									</div>
									
									<div class='col-xs-5'>										    																					    
										<div class="form-group"  style="margin-left:-8px;">
									        <div class="clearfix">
												<label for="vesselconame">Travel Company</label>
							    				<form:input id="vesselconame" class="col-sm-11" path="vesselconame" value="${activitymaster.vesselconame}" type="text" style="width:93%;"  maxlength="20" />												
											</div>
						    			</div>
						    		</div>
								
								</div>											
	
								<div id="bookinggroup">								
							        <div class="row">
										<div class='col-xs-2'>										    																					    
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
													<label for="bookingno">Booking Code</label>
								    				<form:input id="bookingno" class="col-sm-11" style="width:90%;" value="${activitymaster.bookingno}" path="bookingno" type="text"  maxlength="10" />	
								    			</div>
								    		</div>
								    	</div>	
				
										<div class='col-xs-2'>										    																					    
										    <div class="form-group" style="margin-left:5px;">
										        <div class="clearfix">
													<label for="bookingclass">Booking Class</label>
								    				<form:input id="bookingclass" class="col-sm-11" path="bookingclass" value="${activitymaster.bookingclass}" type="text" style="width:93%;"  maxlength="10" />
								    			</div>
								    		</div>												
										</div>

										<div class='col-xs-4'>										    																					    
											<div class="form-group" style="margin-left:6px;width:90%">
												<div class="clearfix">
						                    		<label for ="depdatetime">Departure Date and Time</label>
										            <div class='input-group'>
														<span class="input-group-addon">
															<i class="fa fa-calendar bigger-110"></i>
														</span>					            
										                <input type='text' id="depdatetimestr" name="depdatetimestr" class="form-control col-sm-11"
										                	value="${travelactivity.depdatetimestr}" style="z-index:0;width:90%;" />
										                <form:input type='hidden' id="depdatetimelong" name="depdatetimelong" path="depdatetimelong" />
										       		</div>
										 		</div>
								        	</div>
										</div>
				
										<div class='col-xs-4'>										    																					    
									        <div class="form-group" style="margin-left:-35px;">
					                    		<label for ="arrdatetime">Arrival Date and Time</label>
									            <div class='input-group'>
													<span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>					            
									                <input type='text' id="arrdatetimestr" name="arrdatetimestr" class="form-control col-sm-11"
									                	value="${travelactivity.arrdatetimestr}" style="z-index:0;width:90%;" />
									                <form:input type='hidden' id="arrdatetimelong" name="arrdatetimelong" path="arrdatetimelong" />
									            </div>
									        </div>
										</div>
									</div>									        
									
							        <div class="row">
										<div class='col-xs-4'>										    																					    
											<div class="form-group" style="margin-left:6px;">
												<div class="clearfix">
					                        		<label for="depstation">Departure Station</label>
									                <form:input type='text' path="depstation" id="depstation" style="width:90%;" name="depstation" class="col-sm-11" 
									                	value="${travelactivity.depstation}"  maxlength="15" />
												</div>
											</div>
										</div>
										<div class='col-xs-4'>										    																					    									        
									        <div class="form-group" style="margin-left:5px;">
						                        <div class="clearfix">
					                        		<label for="arrstation">Arrival Station</label>
									                <form:input type='text' path="arrstation" id="arrstation" name="arrstation" class="col-sm-11" 
									                	value="${travelactivity.arrstation}" style="width:93%;"  maxlength="15" />
												</div>
									        </div>
							        	</div>	

										<div class='col-xs-2'>										    																					    
											<div class="form-group" style="margin-left:6px;">
												<div class="clearfix">
													<label for="cost">Cost</label>
								    				<form:input id="cost" path="cost" value="${travelactivity.cost}" style="width:120%;" type="text" class="col-sm-11"  maxlength="10" />												
												</div>
											</div>
										</div>
												
										<div class='col-xs-2'>										    																					    
											<div class="form-group" style="margin-left:25px;">
												<div class="clearfix">
													<label for="costmarkup">Markup</label>
								    				<form:input id="costmarkup" path="costmarkup" value="${travelactivity.costmarkup}" type="text" class="col-sm-11" style="width:75%;"  maxlength="3"/>												
												</div>
											</div>
										</div>
									</div>
								</div> <!-- bookinggroup -->
																
						        <div id="asstreqgroup">		

							        <div class="row">									    																					    										
								
										<div class='col-xs-3'>	
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
											        <label for="code">From Location</label>
									    				<form:input id="pikupdroplocfrom" class="col-sm-11" path="pikupdroplocfrom" type="text" style="width:85%" value="${activitymaster.pikupdroplocfrom}" maxlength="30" />												
												</div>
											</div>							        
										</div>
	
										<div class='col-xs-3'>	
										    <div class="form-group">
										        <div class="clearfix">
											        <label for="code">To Location</label>
									    				<form:input id="pikupdroplocto" class="col-sm-11" path="pikupdroplocto" type="text" style="width:85%" value="${activitymaster.pikupdroplocto}" maxlength="30" />												
												</div>
											</div>							        
										</div>
									
	
										<div class='col-xs-3'>										    																					    
											<div class="form-group">
												<div class="clearfix">
						                    		<label for ="pickdroptimestr">Date and Time</label>
										            <div class='input-group'>
														<span class="input-group-addon">
															<i class="fa fa-calendar bigger-110"></i>
														</span>					            
										                <input type='text' id="pikupdropdatetimestr" name="pikupdropdatetimestr" class="form-control col-sm-11"
										                	value="${travelactivity.pikupdropdatetimestr}" style="z-index:0;width:85%;" />
										                <form:input type='hidden' id="pikupdropdatetimelong" name="pikupdropdatetimelong" path="pikupdropdatetimelong" />
										       		</div>
										 		</div>
								        	</div>
										</div>
	
	
										<div class='col-xs-2'>										    																					    
											<div class="form-group">
												<div class="clearfix">
													<label for="asstcost">Assistance Fee</label>
								    				<form:input id="asstcost" path="asstcost" value="${travelactivity.asstcost}" style="width:75%;" class="col-sm-11" type="text"  maxlength="10" />												
												</div>
											</div>
										</div>
				
										<div class='col-xs-1'>										    																					    
											<div class="form-group" style="margin-left:-35px;">
												<div class="clearfix">
													<label for="asstcostmarkup">Markup</label>
								    				<form:input id="asstcostmarkup" path="asstcostmarkup" value="${travelactivity.asstcostmarkup}" style="width:72%;" type="text"  maxlength="3" />												
												</div>
											</div>
										</div>
									</div>
								</div> <!-- asstreqgroup -->
									
						        <div class="row" id="pikupdropgroup">	
									<div class='col-xs-6'>										    																					    
										<div class="form-group" style="margin-left:6px;">														
											<div class="clearfix">
												<label for="vehdetails">Vehicle Details</label>
							    				<form:input id="vehdetails" path="vehdetails" value="${travelactivity.vehdetails}" style="width:105%;" type="text" class="col-sm-11"  maxlength="45" />												
											</div>
										</div>
									</div>
								
									<div class='col-xs-3'>										    																					    
										<div class="form-group" style="margin-left:45px;">
											<div class="clearfix">
												<label for="pikupdropcost">Vehicle Fee</label>
							    				<form:input id="pikupdropcost" path="pikupdropcost" value="${travelactivity.pikupdropcost}" type="text" style="width:130%;"  maxlength="10" />												
											</div>
										</div>
									</div>
			
									<div class='col-xs-3'>										    																					    
										<div class="form-group" style="margin-left:60px;">
											<div class="clearfix">
												<label for="pikupdropcostmarkup">Markup</label>
							    				<form:input id="pikupdropcostmarkup" path="pikupdropcostmarkup" value="${travelactivity.pikupdropcostmarkup}" type="text" style="width:82%;"  maxlength="3" />												
											</div>
										</div>
									</div>
								</div> <!-- pikupdropgroup -->
												
						        <div class="row">									    																					    
									<div class='col-xs-11' style="width:96%;">	
									    <div class="form-group" style="margin-left:6px;">
									        <div class="clearfix">
												<label for="comments">Comments</label>
												<form:textarea class="form-control limited" id="comments" path="comments" value="${travelactivity.comments}" style="width:101%;" maxlength="100" />
											</div>
										</div>
									</div>
								</div>
					
						        <div class="row">									    																					    
									<div class='col-xs-7' >	
								    	<button type="submit" style="margin-left=20px;" id="travelactivitysave" class="btn btn-purple" > Save </button>
									</div>
								</div>
								</form:form>
							</div> <!-- formgroupall -->
						</div> <!-- widget body -->	
					</div> <!-- widget main -->	
				</div> <!-- widget box -->
			
			</div><!-- /.page-content-area -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content --			
	
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

	<!-- ace scripts -->
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">

		function loadActivityCodes (activitytype) {
	
			var code = "${travelactivity.code}";
			if (code.length > 0) {
				$('#travelcodes').val(code);

				var code_data="<option value=" + code + ">" + code + "</option>";
				// This should be changed to a global var for optimization
        		$(code_data).appendTo('#' + activitytype + 'codes'); 					  	
				$('#' + activitytype + 'codes').trigger('change');
				return;
			}
			
			var request = $.ajax({type: 'GET', url: "/app/activity/getactivitycodes?" + "query=" + activitytype });
			request.done(function( data ) {
				  $('#' + activitytype + 'codes').html('');
				  var first_entry = "<option value=" +  ""+ ">" +  "Pick travel code..."+ "</option>";
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

				
		$('#travelcodes').change(function() {

		    if ( $(this).val() === '' ) {
				$('#formgroupall').hide();
				window.parent.adjustModalHeight(195);
				return;
			}
						
			$('#formgroupall').show();
						
			window.parent.adjustModalHeight(570);						

		    if ( $(this).val() === 'T_BOOK') {
				$('#bookinggroup').show();
				$('#asstreqgroup').hide();
				$('#pikupdropgroup').hide();
		    }

		    if ( $(this).val() === 'T_PIKUPDRP') {
				$('#bookinggroup').hide();
				$('#asstreqgroup').show();
				$('#pikupdropgroup').show();
		    }
		    
		});		
						
		$(":submit").live('click', function() {
            var startdate = GetDate($('#depdatetimestr').val());
            var enddate = GetDate($('#arrdatetimestr').val());
            var pikupdate = GetDate($('#pikupdropdatetimestr').val());
            
            $('#depdatelong').val(startdate.getTime());
            $('#arrdatelong').val(enddate.getTime());
            $('#pikupdropdatetimelong').val(pikupdate.getTime());
            
            if($('#radioind').is(':checked'))
				$('#masteractid').val(0);
				
			$('#day').val(0);
				
			var str = $("#travelactivityform").serialize();
			
			var request = $.ajax({
			    type:"post",
			    data: str,
			    url:"/app/travelactivity/save",
			    dataType: "json"
			});
			request.done(function( msg ) {
		   		console.log(msg);
		   		console.log(msg.name);
			});			
		    request.fail(function( jqXHR, textStatus ) {
			});
			
			return false;		
            
		});

		$(function() {
		
			$('#formgroupall').hide();
		    loadActivityCodes('travel');	    	
		
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
           var startdate = GetDate($('#depdatetimestr').val());
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
                     
		
		function toggle_edit (element) {
			if ( $(element).prop('disabled') )
				$(element).prop('disabled', false);
			else
				$(element).prop('disabled', true);			
		}
		
		function Manage() {					
			var token = $('#csrfToken').val();
			var header = $('#csrfHeader').val();
			$('input[name="_csrf"]').val(token);
		}
													
		jQuery(function($) {
				
			$('#itinnum').val(${travelactivity.itinnum});
			$('#version').val(${travelactivity.version});
			$('#activityid').val(${travelactivity.activityid});
			$('#groupnum').val(${travelactivity.groupnum});
			$('#tzoffset').val(${travelactivity.tzoffset});
			$('#masteractid').val(${travelactivity.masteractid});
			
			if ($('#masteractid').val() == 0)
				$( "#radioind" ).prop( "checked", true );
			else {
				$( "#radiopom" ).prop( "checked", true );
			  	var masteractspan = "<span>" +  "Master activity dates (" + window.parent.getMasterActDates($('#masteractid').val(), window.parent.masteractarr) + ")"+ "</span>";
        	  	$(masteractspan).appendTo('#masteractdates');			  				
			}
							
			$("form input:radio").change(function () {
			    if ($(this).val() == "0") {
					$('#masteractdates').hide();
			    } else {
					$('#masteractdates').show();
			    }
			});				
		
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
				$('#depdatetimestr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
		
				$('#arrdatetimestr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				
				$('#pikupdropdatetimestr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});				
			});
			
		})
	</script>
		
</body>
