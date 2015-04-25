<%@ include file="headerlight.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="<c:url value='/resources/js/bootstrap.min.js'/>" ></script>
		<script src="/resources/js/typeahead.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>		
		<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>

		
		<div class="main-container" id="main-container" style="padding-top:0px;">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>		
								
			<div class="main-content">
				<div class="page-content">
		
					<div class="widget-box" id="travelactivitywidget" style="border-style:1px;border-color:#A7C9A1;">          
						<form:form id="travelactivityform" method="post" modelAttribute="travelactivity" name="travelactivityform" class="form-horizontal">
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
												<form:radiobutton id="radioind" path="masterorindradio" name="masterorindradio" value="0" class="ace" />
												<span class="lbl"> Independent</span>
											</label>
											<label>
												<form:radiobutton id="radiopom" path="masterorindradio" name="masterorindradio" class="ace" />
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
										        <label for="actname">Specify a name for activity</label>
								    				<form:input id="actname" path="actname" name="actname" class="col-sm-11" value= "${travelactivity.actname}" type="text" style="width:92%;" maxlength="45" />												
											</div>
											<div class="customerror" id="actnameerr"></div>			
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
								<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
								<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
							
								<div id="formgroupall">
		
									<div id="bookinggroup">								
								        <div class="row">
											<div class='col-xs-2'>										    																					    
											    <div class="form-group" style="margin-left:6px;">
											        <div class="clearfix">
														<label for="bookingno">Booking Code</label>
									    				<form:input id="bookingno" name="bookingno" class="col-sm-11" style="width:90%;" value="${activitymaster.bookingno}" path="bookingno" type="text"  maxlength="10" />	
									    			</div>
													<div class="customerror" id="bookingnoerr"></div>			
									    		</div>
									    	</div>	
					
											<div class='col-xs-2'>										    																					    
											    <div class="form-group" style="margin-left:5px;">
											        <div class="clearfix">
														<label for="bookingclass">Booking Class</label>
									    				<form:input id="bookingclass" name="bookingclass" class="col-sm-11" path="bookingclass" value="${activitymaster.bookingclass}" type="text" style="width:93%;"  maxlength="10" />
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
														<div class="customerror" id="depdatetimestrerr"></div>												       		
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
													<div class="customerror" id="arrdatetimestrerr"></div>												       		
										        </div>
											</div>
										</div>									        
										
								        <div class="row">
											<div class='col-xs-4'>										    																					    
												<div class="form-group" style="margin-left:6px;">
													<div class="clearfix">
						                        		<label for="depstation">Departure Station</label>
										                <form:input type='text' id="depstation" path="depstation" style="width:90%;" name="depstation" class="col-sm-11" 
										                	value="${travelactivity.depstation}"  maxlength="15" />
													</div>
													<div class="customerror" id="depstationerr"></div>												       		
												</div>
											</div>
											<div class='col-xs-4'>										    																					    									        
										        <div class="form-group" style="margin-left:5px;">
							                        <div class="clearfix">
						                        		<label for="arrstation">Arrival Station</label>
										                <form:input type='text' path="arrstation" id="arrstation" name="arrstation" class="col-sm-11" 
										                	value="${travelactivity.arrstation}" style="width:93%;"  maxlength="15" />
													</div>
													<div class="customerror" id="arrstationerr"></div>												       		
										        </div>
								        	</div>	
	
											<div class='col-xs-2'>										    																					    
												<div class="form-group" style="margin-left:6px;">
													<div class="clearfix">
														<label for="cost">Cost</label>
									    				<form:input id="cost" name="cost" path="cost" value="${travelactivity.cost}" style="width:120%;" type="text" class="col-sm-11"  maxlength="10" />												
													</div>
													<div class="customerror" id="costerr"></div>												       		
												</div>
											</div>
													
											<div class='col-xs-2'>										    																					    
												<div class="form-group" style="margin-left:25px;">
													<div class="clearfix">
														<label for="costmarkup">Markup</label>
									    				<form:input id="costmarkup" name="costmarkup" path="costmarkup" value="${travelactivity.costmarkup}" type="text" class="col-sm-11" style="width:75%;"  maxlength="3"/>												
													</div>
													<div class="customerror" id="costmarkuperr"></div>												       		
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
										    				<form:input id="pikupdroplocfrom" name="pikupdroplocfrom" class="col-sm-11" path="pikupdroplocfrom" type="text" style="width:85%" value="${activitymaster.pikupdroplocfrom}" maxlength="30" />												
													</div>
													<div class="customerror" id="pikupdroplocfromerr"></div>												       		
												</div>							        
											</div>
		
											<div class='col-xs-3'>	
											    <div class="form-group">
											        <div class="clearfix">
												        <label for="code">To Location</label>
										    				<form:input id="pikupdroplocto" name="pikupdroplocto" class="col-sm-11" path="pikupdroplocto" type="text" style="width:85%" value="${activitymaster.pikupdroplocto}" maxlength="30" />												
													</div>
													<div class="customerror" id="pikupdroploctoerr"></div>												       		
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
													<div class="customerror" id="pikupdropdatetimestrerr"></div>												       		
									        	</div>
											</div>
		
		
											<div class='col-xs-2'>										    																					    
												<div class="form-group">
													<div class="clearfix">
														<label for="asstcost">Assistance Fee</label>
									    				<form:input id="asstcost" name="asstcost" path="asstcost" value="${travelactivity.asstcost}" style="width:75%;" class="col-sm-11" type="text"  maxlength="10" />												
													</div>
													<div class="customerror" id="asstcosterr"></div>												       		
												</div>
											</div>
					
											<div class='col-xs-1'>										    																					    
												<div class="form-group" style="margin-left:-35px;">
													<div class="clearfix">
														<label for="asstcostmarkup">Markup</label>
									    				<form:input id="asstcostmarkup" name="asstcostmarkup" path="asstcostmarkup" value="${travelactivity.asstcostmarkup}" style="width:72%;" type="text"  maxlength="3" />												
													</div>
													<div class="customerror" id="asstcostmarkuperr"></div>												       		
												</div>
											</div>
										</div>
									</div> <!-- asstreqgroup -->
										
							        <div class="row" id="pikupdropgroup">	
										<div class='col-xs-6'>										    																					    
											<div class="form-group" style="margin-left:6px;">														
												<div class="clearfix">
													<label for="vehdetails">Vehicle Details</label>
								    				<form:input id="vehdetails" name="vehdetails" path="vehdetails" value="${travelactivity.vehdetails}" style="width:105%;" type="text" class="col-sm-11"  maxlength="45" />												
												</div>
												<div class="customerror" id="vehdetailserr"></div>												       		
											</div>
										</div>
									
										<div class='col-xs-3'>										    																					    
											<div class="form-group" style="margin-left:45px;">
												<div class="clearfix">
													<label for="pikupdropcost">Vehicle Fee</label>
								    				<form:input id="pikupdropcost" name="pikupdropcost" path="pikupdropcost" value="${travelactivity.pikupdropcost}" type="text" style="width:130%;"  maxlength="10" />												
												</div>
												<div class="customerror" id="pikupdropcosterr"></div>												       		
											</div>
										</div>
				
										<div class='col-xs-3'>										    																					    
											<div class="form-group" style="margin-left:60px;">
												<div class="clearfix">
													<label for="pikupdropcostmarkup">Markup</label>
								    				<form:input id="pikupdropcostmarkup" name="pikupdropcostmarkup" path="pikupdropcostmarkup" value="${travelactivity.pikupdropcostmarkup}" type="text" style="width:82%;"  maxlength="3" />												
												</div>
												<div class="customerror" id="pikupdropcostmarkuperr"></div>												       		
											</div>
										</div>
									</div> <!-- pikupdropgroup -->
													
							        <div class="row">									    																					    										
										<div class='col-xs-2'>	
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
											        <label for="pax">PAX</label>
									    				<form:input id="pax" path="pax" name="pax" class="col-sm-11" type="text" style="width:90%" value="${activitymaster.pax}" maxlength="5" />												
												</div>
												<div class="customerror" id="paxerr"></div>			
											</div>							        
										</div>
	
										<div class='col-xs-2'>	
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
											        <label for="travelmodelist">Mode</label>
													<form:select class="form-control col-sm-11 hideearrow" path="mode" name="mode" id="mode">
														<c:forEach items="${travelactivity.travelmodelist}" var="travelmode">
												            <option value="${travelmode}"><c:out value="${travelmode}" /></option>
														</c:forEach>																						
													</form:select>
												</div>											
												
												<div class="customerror" id="paxerr"></div>			
											</div>							        
										</div>

										<div class='col-xs-4'>										    																					    
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
													<label for="vesselno">Flight/Train/Bus Number</label>
								    				<form:input id="vesselno" path="vesselno" name="vesselno" class="col-sm-11" style="width:90%" value="${activitymaster.vesselno}" type="text"  maxlength="15" />												
												</div>
												<div class="customerror" id="vesselnoerr"></div>			
											</div>
										</div>
										
										<div class='col-xs-4'>										    																					    
											<div class="form-group"  style="margin-left:-8px;">
										        <div class="clearfix">
													<label for="vesselconame">Travel Company</label>
								    				<form:input id="vesselconame" path="vesselconame" name="vesselconame" class="col-sm-11" value="${activitymaster.vesselconame}" type="text" style="width:90%;"  maxlength="20" />												
												</div>
							    			</div>
							    		</div>
									
									</div>											
							        
							        
							        <div class="row">									    																					    
										<div class='col-xs-6'>	
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
													<label for="commentsinternal">Comments (internal)</label>
													<form:textarea class="form-control limited" id="commentsinternal" name="commentsinternal" path="commentsinternal" value="${travelactivity.commentsinternal}" maxlength="100" style="width:94%;"/>
												</div>
											</div>
										</div>
										<div class='col-xs-6'>	
										    <div class="form-group">
										        <div class="clearfix">
													<label for="commentsexternal">Comments (for public display)</label>
													<form:textarea class="form-control limited" id="commentsexternal" name="commentsexternal" path="commentsexternal" value="${travelactivity.commentsexternal}" maxlength="100"  style="width:94%;" />
												</div>
											</div>
										</div>
									</div>
						
							        <div class="row">									    																					    
										<div class='col-xs-7' >	
									    	<button type="submit" style="margin-left=20px;" id="travelactivitysave" name="travelactivitysave" class="btn btn-purple" > Save </button>
										</div>
									</div>
									</form:form>
								</div> <!-- formgroupall -->
							</div> <!-- widget body -->	
						</div> <!-- widget main -->	
					</div> <!-- widget box -->
				
				</div><!-- /.page-content-area -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->			
	</div><!-- /.main-container -->	
	<!-- basic scripts -->


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

			$(".customerror").empty();
			
		    if ( $(this).val() === '' ) {
				$('#formgroupall').hide();
				if ($("#masteractid").val() > 0)
					window.parent.adjustModalHeight(190);
				else
					window.parent.adjustModalHeight(170);

				return;
			}
						
			$('#formgroupall').show();
			
						
			if ($("#masteractid").val() > 0)
				window.parent.adjustModalHeight(570);						
			else
				window.parent.adjustModalHeight(540);						

		    if ( $(this).val() === 'T_BOOK') {
				$('#bookinggroup').show();
				$('#asstreqgroup').hide();
				$('#pikupdropgroup').hide();
				// For new activity only
				if ($('#depdatetimestr').val() == "" || ${travelactivity.eventdrop} == 1) {
					$('#depdatetimestr').val(window.parent.activitystartdate);
					$('#arrdatetimestr').val(window.parent.activitystartdate);				
				}
		    }

		    if ( $(this).val() === 'T_PIKUPDRP') {
				$('#bookinggroup').hide();
				$('#asstreqgroup').show();
				$('#pikupdropgroup').show();
				$('#mode').prop( "disabled", true );			
				// For new activity only
				if ($('#pikupdropdatetimestr').val() == "" || ${travelactivity.eventdrop} == 1)
					$('#pikupdropdatetimestr').val(window.parent.activitystartdate);
		    }
		    
		});
		
		$("#travelactivitysave").click(function(e) {
		
            var startdate;
            if ($('#depdatetimestr').val() == "")
            	startdate = 0;
            else
            	startdate = GetDate($('#depdatetimestr').val());

            if (startdate == 0)
            	$('#depdatetimelong').val(0);
			else            
            	$('#depdatetimelong').val(startdate.getTime());


            var enddate;
            if ($('#arrdatetimestr').val() == "")
            	enddate = 0;
            else
            	enddate = GetDate($('#arrdatetimestr').val());

            if (enddate == 0)
            	$('#arrdatetimelong').val(0);
			else            
            	$('#arrdatetimelong').val(enddate.getTime());

            var pikupdate;
            if ($('#pikupdropdatetimestr').val() == "")
            	pikupdate = 0;
            else
            	pikupdate = GetDate($('#pikupdropdatetimestr').val());
            
            if (pikupdate == 0)
            	$('#pikupdropdatetimelong').val(0);
			else            
            	$('#pikupdropdatetimelong').val(pikupdate.getTime());
            
            if($('#radioind').is(':checked'))
				$('#masteractid').val(0);
				
			$('#day').val(0);
			
			if (travelactivityformValidated()) {
				var str = $("#travelactivityform").serialize();
				
				console.log(str);			
				
				$.ajax({
					type:"post",
				    data: str,
				    url:"/app/manage/travelactivitymanage",
			        success:function(data, textStatus, jqXHR) {
			            // var actdata = JSON.parse(data);
			            window.parent.addUpdateActivity(data);
			            window.parent.modal.modal("hide");
			        },
			        error: function(jqXHR, textStatus, errorThrown) {
			            console.log(textStatus);    
			        }				    
				});
			    e.preventDefault();
															
				return true;
			}
							
			return false;				
		});

						
		$(":submit").live('click', function() {
			if (!$("#travelactivityform").isChanged())
			   return true;
			else
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
		
		function travelactivityformValidated () {
			var validated = true;
		
			$(".customerror").empty();
			if ($("#masteractid").val() > 0)
				window.parent.adjustModalHeight(600);						
			else
				window.parent.adjustModalHeight(570);			
			
			if ($('#actname').val() == "") {
				validated = false;
				$("#actnameerr").append("<p>Input required.</p>");
				window.parent.adjustModalHeightDelta(13);
				$("#actnameerr").show();
			}

			if ($('#pax').val() == "") {
				validated = false;
				$("#paxerr").append("<p>Input required.</p>");
				window.parent.adjustModalHeightDelta(13);
				$("#paxerr").show();
			}
			else {
				var paxval = $('#pax').val();
				if (/^[1-9]*$/.test(paxval) === false) {
					validated = false;
					$("#paxerr").append("<p>PAX must be a number greater than 0.</p>");
					window.parent.adjustModalHeightDelta(26);
					$("#paxerr").show();					
				}
			}

			if ($('#vesselno').val() == "") {
				validated = false;
				$("#vesselnoerr").append("<p>Input required.</p>");
				window.parent.adjustModalHeightDelta(13);
				$("#vesselnoerr").show();
			}
			
			if ($("#bookinggroup").is(':visible')) {
				
				if ($('#bookingno').val() == "") {
					validated = false;
					$("#bookingnoerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#bookingnoerr").show();
				}
				
				if ($('#depdatetimestr').val() == "") {
					validated = false;
					$("#depdatetimestrerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#depdatetimestrerr").show();
				}
				else {
					var deptimelong = GetDate($('#depdatetimestr').val());
					var masteractid = $('#masteractid').val();
					
					if (masteractid == 0) {
						if (window.parent.checkActivityInItinRange(deptimelong.getTime()) == false) {
							validated = false;
							$("#depdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
							window.parent.adjustModalHeightDelta(26);
							$("#depdatetimestrerr").show();																		
						}
					}										
					else {
						if (window.parent.checkDateWithinMasteractRange(masteractid, deptimelong, window.parent.masteractarr) == false) {
							validated = false;					
							$("#depdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
							window.parent.adjustModalHeightDelta(26);
							$("#depdatetimestrerr").show();
						}			
					}				
				}

				if ($('#arrdatetimestr').val() == "") {
					validated = false;
					$("#arrdatetimestrerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#arrdatetimestrerr").show();
				}
				else {
					var arrtimelong = GetDate($('#arrdatetimestr').val());
					var masteractid = $('#masteractid').val();
					
					var deptimelong = GetDate($('#depdatetimestr').val());

					if (arrtimelong.getTime() < deptimelong.getTime()) {
						validated = false;
						$("#arrdatetimestrerr").append("<p>Arrival date/time should be greater than departure date/time.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#arrdatetimestrerr").show();																		
					
					}					
					else {
						if (masteractid == 0) {
							if (window.parent.checkActivityInItinRange(arrtimelong.getTime()) == false) {
								validated = false;					
								$("#arrdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
								window.parent.adjustModalHeightDelta(26);
								$("#arrdatetimestrerr").show();																		
							}
						}										
						else {
							if (window.parent.checkDateWithinMasteractRange(masteractid, arrtimelong, window.parent.masteractarr) == false) {
								validated = false;				
								$("#arrdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
								window.parent.adjustModalHeightDelta(26);
								$("#arrdatetimestrerr").show();
							}			
						}				
					}
				}
				

				if ($('#depstation').val() == "") {
					validated = false;
					$("#depstationerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#depstationerr").show();
				}

				if ($('#arrstation').val() == "") {
					validated = false;
					$("#arrstationerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#arrstationerr").show();
				}
				else {
					if ( ($('#arrstation').val()).toUpperCase() === ($('#depstation').val()).toUpperCase() ) {
						validated = false;
						$("#arrstationerr").append("<p>Departure and Arrival stations should be different.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#arrstationerr").show();																		
					}	
				}
				
				if ($('#cost').val() == "") {
					validated = false;
					$("#costerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#costerr").show();
				}
				else {
					var cost = $('#cost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	            
						$("#costerr").append("<p>Cost should contain digits and upto two decimals.</p>");
						window.parent.adjustModalHeightDelta(26);
					}
	            }
				
				if ($('#costmarkup').val() == "") {
					validated = false;
					$("#costmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#costmarkuperr").show();
				}
				else {
					var costmarkup = $('#costmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						$("#costmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#costmarkuperr").show();
					
					}
				}
				
			}
			
			if ($("#asstreqgroup").is(':visible')) {

				if ($('#pikupdroplocfrom').val() == "") {
					validated = false;
					$("#pikupdroplocfromerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#pikupdroplocfromerr").show();
				}

				if ($('#pikupdroplocto').val() == "") {
					validated = false;
					$("#pikupdroploctoerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#pikupdroploctoerr").show();
				}
				else {
					if ( ($('#pikupdroplocto').val()).toUpperCase() === ($('#pikupdroplocfrom').val()).toUpperCase() ) {
						validated = false;
						$("#pikupdroploctoerr").append("<p>'Pickup and drop points should be different.'</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#pikupdroploctoerr").show();																		
					}	
				}
				
				if ($('#pikupdropdatetimestr').val() == "") {
					validated = false;
					$("#pikupdropdatetimestrerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#pikupdropdatetimestrerr").show();
				}
				else {
					var pikuptimelong = GetDate($('#pikupdropdatetimestr').val());
					var masteractid = $('#masteractid').val();

					if (masteractid == 0) {
						if (window.parent.checkActivityInItinRange(pikuptimelong.getTime()) == false) {
							validated = false;					
							$("#pikupdropdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
							window.parent.adjustModalHeightDelta(26);
							$("#pikupdropdatetimestrerr").show();																		
						}
					}										
					else {
						if (window.parent.checkDateWithinMasteractRange(masteractid, pikuptimelong, window.parent.masteractarr) == false) {
							validated = false;				
							$("#pikupdropdatetimestrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
							window.parent.adjustModalHeightDelta(26);
							$("#pikupdropdatetimestrerr").show();
						}			
					}
				}				

				if ($('#asstcost').val() == "") {
					validated = false;
					$("#asstcosterr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#asstcosterr").show();
				}
				else {
					var cost = $('#asstcost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	            
						$("#asstcosterr").append("<p>Cost should contain digits and upto 2 decimals only.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#asstcosterr").show();
					}
	            }
				
				if ($('#asstcostmarkup').val() == "") {
					validated = false;
					$("#asstcostmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#asstcostmarkuperr").show();
				}
				else {
					var costmarkup = $('#asstcostmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						$("#asstcostmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#asstcostmarkuperr").show();
					
					}
				}
				
				if ($('#vehdetails').val() == "") {
					validated = false;
					$("#vehdetailserr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#vehdetailserr").show();
				}

				if ($('#pikupdropcost').val() == "") {
					validated = false;
					$("#pikupdropcosterr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#pikupdropcosterr").show();
				}
				else {
					var cost = $('#pikupdropcost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	            
						$("#pikupdropcosterr").append("<p>Cost should contain digits and upto 2 decimals only.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#pikupdropcosterr").show();
					}
		        }

				if ($('#pikupdropcostmarkup').val() == "") {
					validated = false;
					$("#pikupdropcostmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(13);
					$("#pikupdropcostmarkuperr").show();
				}
				else {
					var costmarkup = $('#pikupdropcostmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						$("#pikupdropcostmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta(26);
						$("#pikupdropcostmarkuperr").show();					
					}
				}
				
			}

			return validated;
		}
													
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
				
			$('#itinnum').val(${travelactivity.itinnum});
			$('#version').val(${travelactivity.version});
			$('#activityid').val(${travelactivity.activityid});
			$('#groupnum').val(${travelactivity.groupnum});
			$('#tzoffset').val(${travelactivity.tzoffset});
			$('#masteractid').val(${travelactivity.masteractid});
			
			if (window.parent.masteractarr == undefined || window.parent.masteractarr.length == 0)
				$( "#radiopom" ).prop( "disabled", true );
				
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

	
			jQuery.validator.addMethod("greaterThanZero", function(value, element) {
			console.log(element);
			return this.optional(element) || (parseInt(value) > 0);
			}, "Pax count must be greater than zero.");
	
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
	
			jQuery.validator.addMethod("datewithinmasteractrange", function(value, element){
	            return window.parent.checkDateWithinMasteractRange($('#masteractid').val(), value, window.parent.masteractarr);
	     	}, 'Specified date/time should be within itinerary or master activity date/time periods.');   
	                
	                	                	                
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
