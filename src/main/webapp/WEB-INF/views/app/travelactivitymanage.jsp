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
									<div class='col-xs-3'>	
									    <div class="form-group" style="margin-left:6px;">
									        <div class="clearfix">
										        <label for="code">Travel Code</label>
													<form:select class="form-control col-sm-11 hideearrow" path="code" name="travelcodes" id="travelcodes" />
											</div>
										</div>							        
									</div>
									<div class='col-xs-4'>	
									    <div class="form-group" style="margin-left:5px;width:95%;">
									        <div class="clearfix">
										        <label for="actname">Specify a name for activity</label>
								    				<form:input id="actname" path="actname" name="actname" class="col-sm-11" value= "${travelactivity.actname}" type="text" style="width:92%;" maxlength="45" />												
											</div>
											<div class="customerror" id="actnameerr"></div>			
										</div>							        
									</div>
									
									<div class='col-xs-1'>	
									    <div class="form-group" style="margin-left:-30px;">
									        <div class="clearfix">
										        <label for="pax">PAX</label>
								    				<form:input id="pax" path="pax" name="pax" class="col-sm-11" type="text" style="width:90%" value="${activitymaster.pax}" maxlength="5" />												
											</div>
											<div class="customerror" id="paxerr"></div>			
										</div>							        
									</div>

									<div class='col-xs-1'>	
									    <div class="form-group" style="margin-left:-4px;">
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
									
									<div class='col-xs-3'>										    																					    
										<div class="form-group"  style="margin-left:-8px;">
									        <div class="clearfix">
												<label for="vesselconame">Travel Company</label>
							    				<form:input id="vesselconame" path="vesselconame" name="vesselconame" class="col-sm-11" value="${activitymaster.vesselconame}" type="text" style="width:90%;"  maxlength="20" />												
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
								<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
								<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
									
								<div id="formgroupall">
								
									<div id="T_BOOK_ONEWAY">								
								        <div class="row">
	
											<div class='col-xs-2'>										    																					    
											    <div class="form-group" style="margin-left:6px;">
											        <div class="clearfix">
														<label for="bookingno">Booking Code</label>
									    				<form:input id="bookingno" name="bookingno" class="col-sm-11" value="${activitymaster.bookingno}" path="bookingno" type="text"  maxlength="10" />	
									    			</div>
													<div class="customerror" id="bookingnoerr"></div>			
									    		</div>
									    	</div>	
					
											<div class='col-xs-2'>										    																					    
											    <div class="form-group" style="margin-left:0px;">
											        <div class="clearfix">
														<label for="bookingclass">Booking Class</label>
									    				<form:input id="bookingclass" name="bookingclass" class="col-sm-11" path="bookingclass" value="${activitymaster.bookingclass}" type="text"  maxlength="10" />
									    			</div>
									    		</div>												
											</div>
	
											<div class='col-xs-2'>										    																					    
												<div class="form-group" style="margin-left:-2px;">
													<div class="clearfix">
														<label for="cost">Cost</label>
									    				<form:input id="cost" name="cost" path="cost" value="${travelactivity.cost}" style="width:90%;" type="text" class="col-sm-11"  maxlength="10" />												
													</div>
													<div class="customerror" id="costerr"></div>												       		
												</div>
											</div>
													
											<div class='col-xs-1'>										    																					    
												<div class="form-group" style="margin-left:0px;">
													<div class="clearfix">
														<label for="costmarkup">Markup</label>
									    				<form:input id="costmarkup" name="costmarkup" path="costmarkup" value="${travelactivity.costmarkup}" type="text" class="col-sm-11" style="width:110%;"  maxlength="3"/>												
													</div>
													<div class="customerror" id="costmarkuperr"></div>												       		
												</div>
											</div>
	
											<div class='col-xs-2'>										    																					    
												<div class="form-group" style="margin-left:20px;">
													<div class="clearfix">
						                        		<label for="depstation">Departure Station</label>
										                <form:input type='text' id="depstation" path="depstation" style="width:130%;" name="depstation" class="col-sm-11" 
										                	value="${travelactivity.depstation}"  maxlength="15" />
													</div>
													<div class="customerror" id="depstationerr"></div>												       		
												</div>
											</div>

											<div class='col-xs-2'>										    																					    									        
										        <div class="form-group" style="margin-left:40px;">
							                        <div class="clearfix">
						                        		<label for="arrstation">Arrival Station</label>
										                <form:input type='text' path="arrstation" id="arrstation" name="arrstation" class="col-sm-11" 
										                	value="${travelactivity.arrstation}" style="width:155%;"  maxlength="15" />
													</div>
													<div class="customerror" id="arrstationerr"></div>												       		
										        </div>
								        	</div>	

										</div>

										<div class="space-3"></div>
																					
										<div class="row" style="margin-left:5px;margin-right:7px;border-style:solid;border-width:1px; border-color:#E2E2E2;">										
											<div class='col-xs-3'>										    																					    
											    <div class="form-group" style="margin-left:15px;">
											        <div class="clearfix">
														<label for="vesselnoon">Flight/Train/Bus No</label>
														
														<c:choose>
														    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeretlong > 0 }">
												    			<form:input id="vesselnoon" path="vesselnoon" name="vesselnoon" class="col-sm-11" style="width:127%" type="text"  maxlength="15" disabled = "true"  value="" />												
														    </c:when>
														    <c:otherwise>
											    				<form:input id="vesselnoon" path="vesselnoon" name="vesselnoon" class="col-sm-11" style="width:127%" value="${activitymaster.vesselnoon}" type="text"  maxlength="15" />												
														    </c:otherwise>
														</c:choose>															
														
													</div>
													<div class="customerror" id="vesselnoonerr"></div>			
												</div>
											</div>
											
											<div class='col-xs-4'>										    																					    
												<div class="form-group" style="margin-left:60px;width:100%">
													<div class="clearfix">
							                    		<label for ="depdatetimestrret">Departure Date and Time</label>
											            <div class='input-group'>
															<span class="input-group-addon">
																<i class="fa fa-calendar bigger-110"></i>
															</span>					            
															<c:choose>
															    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeretlong > 0 }">
													                <input type='text' id="depdatetimeonstr" name="depdatetimeonstr" class="form-control col-sm-11"
												                	style="z-index:0;width:100%;" disabled  value="" />
															    </c:when>
															    <c:otherwise>
													                <input type='text' id="depdatetimeonstr" name="depdatetimeonstr" class="form-control col-sm-11"
												                	style="z-index:0;width:100%;" value="${travelactivity.depdatetimeonstr}" />
															    </c:otherwise>
															</c:choose>															
											                <form:input type='hidden' id="depdatetimeonlong" name="depdatetimeonlong" path="depdatetimeonlong" />
											       		</div>
														<div class="customerror" id="depdatetimeonstrerr"></div>												       		
											 		</div>
									        	</div>
											</div>
					
											<div class='col-xs-4'>										    																					    
										        <div class="form-group" style="margin-left:50px;">
						                    		<label for ="arrdatetimeonstr">Arrival Date and Time</label>
										            <div class='input-group'>
														<span class="input-group-addon">
															<i class="fa fa-calendar bigger-110"></i>
														</span>					            
															<c:choose>
															    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeretlong > 0 }">
													                <input type='text' id="arrdatetimeonstr" name="arrdatetimeonstr" class="form-control col-sm-11"
												                	style="z-index:0;width:125%;" disabled  value="" />
															    </c:when>
															    <c:otherwise>
													                <input type='text' id="arrdatetimeonstr" name="arrdatetimeonstr" class="form-control col-sm-11"
												                	value="${travelactivity.arrdatetimeonstr}" style="z-index:0;width:125%;" />
															    </c:otherwise>
															</c:choose>															
											                <form:input type='hidden' id="arrdatetimeonlong" name="arrdatetimeonlong" path="arrdatetimeonlong" />
										            </div>
													<div class="customerror" id="arrdatetimeonstrerr"></div>												       		
										        </div>
											</div>
										</div>
									</div> <!-- T_BOOK_ONEWAY -->
										
									<div class="space-4"></div>

									<div id="T_BOOK_RETURN">
										<span style="margin-left:5px;"><i>Return Segment: </i></span>
										<div class="row" style="margin-left:5px;margin-right:7px;border-style:solid;border-width:1px; border-color:#E2E2E2;">
										
											<div class='col-xs-3'>										    																					    
											    <div class="form-group" style="margin-left:15px;">
											        <div class="clearfix">
														<label for="vesselnoon">Flight/Train/Bus No</label>
														
														<c:choose>
														    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeonlong > 0 }">
												    			<form:input id="vesselnoret" path="vesselnoret" name="vesselnoret" class="col-sm-11" style="width:127%" type="text"  maxlength="15" disabled = "true"  value="" />												
														    </c:when>
														    <c:otherwise>
											    				<form:input id="vesselnoret" path="vesselnoret" name="vesselnoret" class="col-sm-11" style="width:127%" value="${activitymaster.vesselnoret}" type="text"  maxlength="15" />												
														    </c:otherwise>
														</c:choose>															
														
													</div>
													<div class="customerror" id="vesselnoreterr"></div>			
												</div>
											</div>
											
											<div class='col-xs-4'>										    																					    
												<div class="form-group" style="margin-left:60px;width:100%">
													<div class="clearfix">
							                    		<label for ="depdatetimestrret">Departure Date and Time</label>
											            <div class='input-group'>
															<span class="input-group-addon">
																<i class="fa fa-calendar bigger-110"></i>
															</span>					            
															<c:choose>
															    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeonlong > 0 }">
													                <input type='text' id="depdatetimeretstr" name="depdatetimeretstr" class="form-control col-sm-11"
												                	style="z-index:0;width:100%;" disabled  value="" />
															    </c:when>
															    <c:otherwise>
													                <input type='text' id="depdatetimeretstr" name="depdatetimeretstr" class="form-control col-sm-11"
												                	style="z-index:0;width:100%;" value="${travelactivity.depdatetimeretstr}" />
															    </c:otherwise>
															</c:choose>															
											                <form:input type='hidden' id="depdatetimeretlong" name="depdatetimeretlong" path="depdatetimeretlong" />
											       		</div>
														<div class="customerror" id="depdatetimeretstrerr"></div>												       		
											 		</div>
									        	</div>
											</div>
					
											<div class='col-xs-4'>										    																					    
										        <div class="form-group" style="margin-left:50px;">
						                    		<label for ="arrdatetimeretstr">Arrival Date and Time</label>
										            <div class='input-group'>
														<span class="input-group-addon">
															<i class="fa fa-calendar bigger-110"></i>
														</span>					            
															<c:choose>
															    <c:when test="${travelactivity.activityid > 0 && travelactivity.code == 'T_BOOK_RETURN' && travelactivity.depdatetimeonlong > 0 }">
													                <input type='text' id="arrdatetimeretstr" name="arrdatetimeretstr" class="form-control col-sm-11"
												                	style="z-index:0;width:125%;" disabled  value="" />
															    </c:when>
															    <c:otherwise>
													                <input type='text' id="arrdatetimeretstr" name="arrdatetimeretstr" class="form-control col-sm-11"
												                	value="${travelactivity.arrdatetimeretstr}" style="z-index:0;width:125%;" />
															    </c:otherwise>
															</c:choose>															
											                <form:input type='hidden' id="arrdatetimeretlong" name="arrdatetimeretlong" path="arrdatetimeretlong" />
										            </div>
													<div class="customerror" id="arrdatetimeretstrerr"></div>												       		
										        </div>
											</div>
										</div>
										<div class="space-8"></div>
									</div> <!-- T_BOOK_RETURN -->
																	
							        <div id="T_PIKUPDRP">		
	
								        <div class="row">									    																					    										
	
											<div class='col-xs-3'>										    																					    
											    <div class="form-group" style="margin-left:6px;">
											        <div class="clearfix">
														<label for="vesselnoon">Flight/Train/Bus No</label>
									    				<form:input id="vesselnoon" path="vesselnoon" name="vesselnoon" class="col-sm-11" style="width:99%" value="${activitymaster.vesselnoon}" type="text"  maxlength="15" />												
													</div>
													<div class="customerror" id="vesselnoonpikupdrperr"></div>			
												</div>
											</div>
									
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
											                	value="${travelactivity.pikupdropdatetimestr}" style="z-index:0;width:87%;" />
											                <form:input type='hidden' id="pikupdropdatetimelong" name="pikupdropdatetimelong" path="pikupdropdatetimelong" />
											       		</div>
											 		</div>
													<div class="customerror" id="pikupdropdatetimestrerr"></div>												       		
									        	</div>
											</div>
										</div>		
		
								        <div class="row">									    																					    										
										
											<div class='col-xs-2' style="margin-left:20px;">										    																					    
												<div class="form-group">
													<div class="clearfix">
														<label for="asstcost">Assistance Fee</label>
									    				<form:input id="asstcost" name="asstcost" path="asstcost" value="${travelactivity.asstcost}" style="width:85%;" class="col-sm-11" type="text"  maxlength="10" />												
													</div>
													<div class="customerror" id="asstcosterr"></div>												       		
												</div>
											</div>
					
											<div class='col-xs-1'>										    																					    
												<div class="form-group" style="margin-left:-25px;">
													<div class="clearfix">
														<label for="asstcostmarkup">Markup</label>
									    				<form:input id="asstcostmarkup" name="asstcostmarkup" path="asstcostmarkup" value="${travelactivity.asstcostmarkup}" style="width:72%;" type="text"  maxlength="3" />												
													</div>
													<div class="customerror" id="asstcostmarkuperr"></div>												       		
												</div>
											</div>

											<div class='col-xs-5'>										    																					    
												<div class="form-group" style="margin-left:-12px;">														
													<div class="clearfix">
														<label for="vehdetails">Vehicle Details</label>
									    				<form:input id="vehdetails" name="vehdetails" path="vehdetails" value="${travelactivity.vehdetails}" style="width:106%;" type="text" class="col-sm-11"  maxlength="45" />												
													</div>
													<div class="customerror" id="vehdetailserr"></div>												       		
												</div>
											</div>
										
											<div class='col-xs-2'>										    																					    
												<div class="form-group" style="margin-left:35px;">
													<div class="clearfix">
														<label for="pikupdropcost">Vehicle Fee</label>
									    				<form:input id="pikupdropcost" name="pikupdropcost" path="pikupdropcost" value="${travelactivity.pikupdropcost}" type="text" style="width:125%;"  maxlength="10" />												
													</div>
													<div class="customerror" id="pikupdropcosterr"></div>												       		
												</div>
											</div>
					
											<div class='col-xs-1'>										    																					    
												<div class="form-group" style="margin-left:20px;">
													<div class="clearfix">
														<label for="pikupdropcostmarkup">Markup</label>
									    				<form:input id="pikupdropcostmarkup" name="pikupdropcostmarkup" path="pikupdropcostmarkup" value="${travelactivity.pikupdropcostmarkup}" type="text" style="width:170%;"  maxlength="3" />												
													</div>
													<div class="customerror" id="pikupdropcostmarkuperr"></div>												       		
												</div>
											</div>
										</div> <!-- row -->
	
									</div> <!-- T_PIKUPDRP -->
													
							        <div class="row">									    																					    
										<div class='col-xs-6'>	
										    <div class="form-group" style="margin-left:6px;">
										        <div class="clearfix">
													<label for="commentsinternal">Comments (internal)</label>
													<form:textarea class="form-control limited" id="commentsinternal" name="commentsinternal" rows="1" path="commentsinternal" value="${travelactivity.commentsinternal}" maxlength="200" style="width:94%;"/>
												</div>
											</div>
										</div>
										<div class='col-xs-6'>	
										    <div class="form-group">
										        <div class="clearfix">
													<label for="commentsexternal">Comments (for public display)</label>
													<form:textarea class="form-control limited" id="commentsexternal" name="commentsexternal" rows="1" path="commentsexternal" value="${travelactivity.commentsexternal}" maxlength="200"  style="width:95%;" />
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
								</div><!-- formgroupall -->
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
					window.parent.adjustModalHeight(170);
				else
					window.parent.adjustModalHeight(150);

				modalheight = window.parent.parentModalHeight();

				return;
			}
						
			$('#formgroupall').show();
			
		    if ( $(this).val() === 'T_BOOK_RETURN') {
				if ($("#masteractid").val() > 0)
					window.parent.adjustModalHeight(540);						
				else
					window.parent.adjustModalHeight(500);								
			}
			else {				
				if ($("#masteractid").val() > 0)
					window.parent.adjustModalHeight(460);						
				else
					window.parent.adjustModalHeight(430);						
			}
			
			modalheight = window.parent.parentModalHeight();
			
		    if ( $(this).val() === 'T_BOOK_ONEWAY') {
				$('#T_BOOK_ONEWAY').show();
				$('#T_BOOK_RETURN').hide();
				$('#T_PIKUPDRP').hide();

				// For new activity only
				if (${travelactivity.activityid} == 0 || ${travelactivity.eventdrop} == 1) {
					$('#depdatetimeonstr').val(window.parent.activitystartdate);
					$('#arrdatetimeonstr').val(window.parent.activitystartdate);				
				}
		    }

		    if ( $(this).val() === 'T_BOOK_RETURN') {
				$('#T_BOOK_ONEWAY').show();
				$('#T_BOOK_RETURN').show();
				$('#T_PIKUPDRP').hide();

				// For new activity only
				if (${travelactivity.activityid} == 0 || ${travelactivity.eventdrop} == 1) {
				
					if (${travelactivity.activityid} > 0 && ${travelactivity.eventdrop} == 1) {
						if (${travelactivity.depdatetimeretlong} > 0) {
							$('#depdatetimeretstr').val(window.parent.activitystartdate);
							$('#arrdatetimeretstr').val(window.parent.activitystartdate);									
						}
						else {
							$('#depdatetimeonstr').val(window.parent.activitystartdate);
							$('#arrdatetimeonstr').val(window.parent.activitystartdate);														
						}
					}
					else {
							$('#depdatetimeonstr').val(window.parent.activitystartdate);
							$('#arrdatetimeonstr').val(window.parent.activitystartdate);																			
							$('#depdatetimeretstr').val(window.parent.activitystartdate);
							$('#arrdatetimeretstr').val(window.parent.activitystartdate);									
					}
				}
		    }

		    if ( $(this).val() === 'T_PIKUPDRP') {
				$('#T_BOOK_ONEWAY').hide();
				$('#T_BOOK_RETURN').hide();
				$('#T_PIKUPDRP').show();
				// For new activity only
				if ($('#pikupdropdatetimestr').val() == "" || ${travelactivity.eventdrop} == 1)
					$('#pikupdropdatetimestr').val(window.parent.activitystartdate);
		    }
		    
		});
		
		$("#travelactivitysave").click(function(e) {
		
		    e.preventDefault();
		
			//if (!$("#travelactivityform").isChanged())
			//   return true;
			//else
			//	return false;	
				
			if ($('#travelcodes').val() == "T_PIKUPDRP") {
	            var pikupdate;
	            if ($('#pikupdropdatetimestr').val() == "")
	            	pikupdate = 0;
	            else
	            	pikupdate = GetDate($('#pikupdropdatetimestr').val());
	            
	            if (pikupdate == 0)
	            	$('#pikupdropdatetimelong').val(0);
				else            
	            	$('#pikupdropdatetimelong').val(pikupdate.getTime());			
			}
			else if ($('#travelcodes').val() == "T_BOOK_ONEWAY" || $('#travelcodes').val() == "T_BOOK_RETURN") {
	            var startdateon;
	            var depdatetimestr = $('#depdatetimeonstr').val();
	            console.log(depdatetimestr);
	            if (depdatetimestr == "")
	            	startdateon = 0;
	            else
	            	startdateon = GetDate(depdatetimestr);
	
	            if (startdateon == 0)
	            	$('#depdatetimeonlong').val(0);
				else            
	            	$('#depdatetimeonlong').val(startdateon.getTime());

	            var enddateon;
	            var arrdatetimestr = $('#arrdatetimeonstr').val();
	            console.log(arrdatetimestr);
	            if (arrdatetimestr == "")
	            	enddateon = 0;
	            else
	            	enddateon = GetDate(arrdatetimestr);
	
	            if (enddateon == 0)
	            	$('#arrdatetimeonlong').val(0);
				else            
	            	$('#arrdatetimeonlong').val(enddateon.getTime());
	
				if ($('#travelcodes').val() == "T_BOOK_RETURN") {
		            var startdateret;
		            if ($('#depdatetimeretstr').val() == "")
		            	startdateret = 0;
		            else
		            	startdateret = GetDate($('#depdatetimeretstr').val());
		
		            if (startdateret == 0)
		            	$('#depdatetimeretlong').val(0);
					else            
		            	$('#depdatetimeretlong').val(startdateret.getTime());
	
		            var enddateret;
		            if ($('#arrdatetimeretstr').val() == "")
		            	enddateret = 0;
		            else
		            	enddateret = GetDate($('#arrdatetimeretstr').val());
		
		            if (enddateret == 0)
		            	$('#arrdatetimeretlong').val(0);
					else            
		            	$('#arrdatetimeretlong').val(enddateret.getTime());				
				}
			
			}
                        
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
			            if (${travelactivity.activityid} == 0)
				            window.parent.incrActivityCnt();
			            if (data.code == "T_BOOK_RETURN")
				            window.parent.incrActivityCnt();			            
			            	
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

						
		$(function() {
		
			$('#formgroupall').hide();
		    loadActivityCodes('travel');	    	
		
//            $("#depstation").suggest({
//                key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
//                filter:'(any type:/location/citytown)'
//            })
//			.bind("fb-select", function(e, data) {

//			});  
					
 //           $("#arrstation").suggest({
 //               key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
 //               filter:'(any type:/location/citytown)'
 //           })
//			.bind("fb-select", function(e, data) {

//			});                      

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
			
		    if ( $('#travelcodes').val() === 'T_BOOK_RETURN') {
				if ($("#masteractid").val() > 0)
					window.parent.adjustModalHeight(540);						
				else
					window.parent.adjustModalHeight(500);								
			}
			else {				
				if ($("#masteractid").val() > 0)
					window.parent.adjustModalHeight(460);						
				else
					window.parent.adjustModalHeight(430);						
			}
						
			if ($('#actname').val() == "") {
				validated = false;
				$("#actnameerr").append("<p>Input required.</p>");
				window.parent.adjustModalHeightDelta($("#actnameerr").height());
				$("#actnameerr").show();
			}

			if ($('#pax').val() == "") {
				validated = false;
				$("#paxerr").append("<p>Input required.</p>");
				window.parent.adjustModalHeightDelta($("#paxerr").height());
				$("#paxerr").show();
			}
			else {
				var paxval = $('#pax').val();
				if (/^[1-9]*$/.test(paxval) === false) {
					validated = false;
					$("#paxerr").append("<p>PAX must be a number greater than 0.</p>");
					window.parent.adjustModalHeightDelta($("#paxerr").height());
					$("#paxerr").show();					
				}
			}

			if ($("#T_BOOK_ONEWAY").is(':visible') || $("#T_BOOK_RETURN").is(':visible')) {

				var deptimeonlong = GetDate($('#depdatetimeonstr').val());
				var arrtimeonlong = GetDate($('#arrdatetimeonstr').val());
				
				if ( $('#vesselnoon').is(':enabled') ) {
					var vesselno = $('#vesselnoon').find(':visible');
					if (vesselno.val() == "") {
						validated = false;
						
						$("#vesselnoonbookerr").append("<p>Input required.</p>");
						window.parent.adjustModalHeightDelta($("#vesselnoonbookerr").height());
						$("#vesselnoonbookerr").show();
					}								
				}
				
				if ($('#bookingnoon').val() == "") {
					validated = false;
					$("#bookingnoonerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#bookingnoonerr").height());
					$("#bookingnoonerr").show();
				}

				if ( $('#depdatetimeonstr').is(':enabled') ) {
				
					if ($('#depdatetimeonstr').val() == "") {
						validated = false;
						$("#depdatetimeonstrerr").append("<p>Input required.</p>");
						window.parent.adjustModalHeightDelta($("#depdatetimeonstrerr").height());
						$("#depdatetimeonstrerr").show();
					}
					else {
						var masteractid = $('#masteractid').val();
						
						if (masteractid == 0) {
							if (window.parent.checkActivityInItinRange(deptimeonlong.getTime(), masteractid, window.parent.masteractarr) == false) {
								validated = false;
								$("#depdatetimeonstrerr").append("<p>Specified date/time should be within itinerary date/time periods.</p>");
								window.parent.adjustModalHeightDelta($("#depdatetimeonstrerr").height());
								$("#depdatetimeonstrerr").show();																		
							}
						}										
						else {
							if (window.parent.checkDateWithinMasteractRange(masteractid, deptimeonlong, window.parent.masteractarr) == false) {
								validated = false;					
								$("#depdatetimeonstrerr").append("<p>Specified date/time should be within master activity date/time periods.</p>");
								window.parent.adjustModalHeightDelta($("#depdatetimeonstrerr").height());
								$("#depdatetimeonstrerr").show();
							}			
						}				
					}
				}
				
				if ( $('#arrdatetimeonstr').is(':enabled') ) {
					if ($('#arrdatetimeonstr').val() == "") {
						validated = false;
						$("#arrdatetimeonstrerr").append("<p>Input required.</p>");
						window.parent.adjustModalHeightDelta(10);
						$("#arrdatetimeonstrerr").show();
					}
					else {
						var masteractid = $('#masteractid').val();
						
						var deptimeonlong = GetDate($('#depdatetimeonstr').val());
	
						if (arrtimeonlong.getTime() < deptimeonlong.getTime()) {
							validated = false;
							$("#arrdatetimeonstrerr").append("<p>Arrival date/time should be greater than departure date/time.</p>");
							window.parent.adjustModalHeightDelta($("#arrdatetimeonstrerr").height());
							$("#arrdatetimeonstrerr").show();																		
						
						}					
						else {
							if (masteractid == 0) {
								if (window.parent.checkActivityInItinRange(arrtimeonlong.getTime(), masteractid, window.parent.masteractarr ) == false) {
									validated = false;					
									$("#arrdatetimeonstrerr").append("<p>Specified date/time should be within itinerary date/time periods.</p>");
									window.parent.adjustModalHeightDelta($("#arrdatetimeonstrerr").height());
									$("#arrdatetimeonstrerr").show();																		
								}
							}										
							else {
								if (window.parent.checkDateWithinMasteractRange(masteractid, arrtimeonlong, window.parent.masteractarr) == false) {
									validated = false;				
									$("#arrdatetimeonstrerr").append("<p>Specified date/time should be within master activity date/time periods.</p>");
									window.parent.adjustModalHeightDelta($("#arrdatetimeonstrerr").height());
									$("#arrdatetimeonstrerr").show();
								}			
							}				
						}
					}
				}				

				if ($('#depstation').val() == "") {
					validated = false;
					$("#depstationerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#depstationerr").height());
					$("#depstationerr").show();
				}

				if ($('#arrstation').val() == "") {
					validated = false;
					$("#arrstationerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta(10);
					$("#arrstationerr").show();
				}
				else {
					if ( ($('#arrstation').val()).toUpperCase() === ($('#depstation').val()).toUpperCase() ) {
						validated = false;
						$("#arrstationerr").append("<p>Departure and Arrival stations should be different.</p>");
						window.parent.adjustModalHeightDelta($("#arrstationerr").height());
						$("#arrstationerr").show();																		
					}	
				}
				
				if ($('#cost').val() == "") {
					validated = false;
					$("#costerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#costerr").height());
					$("#costerr").show();
				}
				else {
					var cost = $('#cost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	            
						$("#costerr").append("<p>Cost should contain digits and upto two decimals.</p>");
						window.parent.adjustModalHeightDelta($("#costerr").height());
					}
	            }
				
				if ($('#costmarkup').val() == "") {
					validated = false;
					$("#costmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#costmarkuperr").height());
					$("#costmarkuperr").show();
				}
				else {
					var costmarkup = $('#costmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						$("#costmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta($("#costmarkuperr").height());
						$("#costmarkuperr").show();
					
					}
				}
				
				if ($("#T_BOOK_RETURN").is(':visible')) {

					if ( $('#vesselnoret').is(':enabled') ) {
						if ($('#vesselnoret').val() == "") {
							validated = false;
							$("#vesselnoreterr").append("<p>Input required.</p>");
							window.parent.adjustModalHeightDelta($("#vesselnoreterr").height());
							$("#vesselnoreterr").show();
						}
					}
														
					if ( $('#depdatetimeretstr').is(':enabled') ) {
						if ($('#depdatetimeretstr').val() == "") {
							validated = false;
							$("#depdatetimeretstrerr").append("<p>Input required.</p>");
							window.parent.adjustModalHeightDelta($("#vesselnoreterr").height());
							$("#depdatetimeretstrerr").show();
						}
						else {
							var deptimeretlong = GetDate($('#depdatetimeretstr').val());
							var masteractid = $('#masteractid').val();
	
							
							if (masteractid == 0) {
								if (window.parent.checkActivityInItinRange(deptimeonlong.getTime(), masteractid, window.parent.masteractarr) == false) {
									validated = false;
									$("#depdatetimeretstrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
									window.parent.adjustModalHeightDelta($("#depdatetimeretstrerr").height());
									$("#depdatetimeretstrerr").show();																		
								}
							}										
							else {
								if (window.parent.checkDateWithinMasteractRange(masteractid, deptimeretlong, window.parent.masteractarr) == false) {
									validated = false;					
									$("#depdatetimeretstrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
									window.parent.adjustModalHeightDelta($("#depdatetimeretstrerr").height());
									$("#depdatetimeretstrerr").show();
								}			
							}
							
							if (deptimeretlong.getTime() <=  arrtimeonlong.getTime() || deptimeretlong.getTime() <=  deptimeonlong.getTime()) {
								validated = false;					
								$("#depdatetimeretstrerr").append("<p>Specified date/time should be greater than onward travel date/time.</p>");
								window.parent.adjustModalHeightDelta($("#depdatetimeretstrerr").height());
								$("#depdatetimeretstrerr").show();						
							}
											
						}
	
					}

					if ( $('#arrdatetimeretstr').is(':enabled') ) {

						if ($('#arrdatetimeretstr').val() == "") {
							validated = false;
							$("#arrdatetimeretstrerr").append("<p>Input required.</p>");
							window.parent.adjustModalHeightDelta($("#arrdatetimeretstrerr").height());
							$("#arrdatetimeretstrerr").show();
						}
						else {
							var arrtimeretlong = GetDate($('#arrdatetimeretstr').val());
							var masteractid = $('#masteractid').val();
							
							var deptimeretlong = GetDate($('#depdatetimeretstr').val());
		
							if (arrtimeretlong.getTime() < deptimeretlong.getTime()) {
								validated = false;
								$("#arrdatetimeretstrerr").append("<p>Arrival date/time should be greater than departure date/time.</p>");
								window.parent.adjustModalHeightDelta($("#arrdatetimeretstrerr").height());
								$("#arrdatetimeretstrerr").show();																		
							
							}					
							else {
								if (masteractid == 0) {
									if (window.parent.checkActivityInItinRange(arrtimeretlong.getTime(), masteractid, window.parent.masteractarr) == false) {
										validated = false;					
										$("#arrdatetimeretstrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
										window.parent.adjustModalHeightDelta($("#arrdatetimeretstrerr").height());
										$("#arrdatetimeretstrerr").show();																		
									}
								}										
								else {
									if (window.parent.checkDateWithinMasteractRange(masteractid, arrtimeretlong, window.parent.masteractarr) == false) {
										validated = false;				
										$("#arrdatetimeretstrerr").append("<p>Specified date/time should be within itinerary or master activity date/time periods.</p>");
										window.parent.adjustModalHeightDelta($("#arrdatetimeretstrerr").height());
										$("#arrdatetimeretstrerr").show();
									}			
								}				
							}
						}
					}
				}
				
			}
			
			if ($("#T_PIKUPDRP").is(':visible')) {

				var vesselno = $('#vesselnoon').find(':visible');
				
				if (vesselno.val() == "") {
					validated = false;
					console.log("vessel no on");
					$("#vesselnoonpikupdrperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#vesselnoonpikupdrperr").height());
					$("#vesselnoonpikupdrperr").show();
				}
			

				if ($('#pikupdroplocfrom').val() == "") {
					validated = false;
					console.log("#pikupdroplocfrom");
					$("#pikupdroplocfromerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#pikupdroplocfromerr").height());
					$("#pikupdroplocfromerr").show();
				}

				if ($('#pikupdroplocto').val() == "") {
					validated = false;
					console.log("#pikupdroplocto");
					$("#pikupdroploctoerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#pikupdroplocfromerr").height());
					$("#pikupdroploctoerr").show();
				}
				else {
					if ( ($('#pikupdroplocto').val()).toUpperCase() === ($('#pikupdroplocfrom').val()).toUpperCase() ) {
						validated = false;
						console.log("#pikupdroplocto different");
						$("#pikupdroploctoerr").append("<p>'Pickup and drop points should be different.'</p>");
						window.parent.adjustModalHeightDelta($("#pikupdroploctoerr").height());
						$("#pikupdroploctoerr").show();																		
					}	
				}
				
				if ($('#pikupdropdatetimestr').val() == "") {
					validated = false;
					console.log("#pikupdropdatetimestr");					
					$("#pikupdropdatetimestrerr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#pikupdropdatetimestrerr").height());
					$("#pikupdropdatetimestrerr").show();
				}
				else {
					var pikuptimelong = GetDate($('#pikupdropdatetimestr').val());
					var masteractid = $('#masteractid').val();

					if (masteractid == 0) {
						if (window.parent.checkActivityInItinRange(pikuptimelong.getTime(), masteractid, window.parent.masteractarr) == false) {
							validated = false;					
							console.log("#pikupdropdatetimestr date/time");					
							$("#pikupdropdatetimestrerr").append("<p>Specified date/time should be within itinerary date/time periods.</p>");
							window.parent.adjustModalHeightDelta($("#pikupdropdatetimestrerr").height());
							$("#pikupdropdatetimestrerr").show();																		
						}
					}										
					else {
						if (window.parent.checkDateWithinMasteractRange(masteractid, pikuptimelong, window.parent.masteractarr) == false) {
							validated = false;				
							console.log("#pikupdropdatetimestr master");					
							$("#pikupdropdatetimestrerr").append("<p>Specified date/time should be within master activity date/time periods.</p>");
							window.parent.adjustModalHeightDelta($("#pikupdropdatetimestrerr").height());
							$("#pikupdropdatetimestrerr").show();
						}			
					}
				}				

				if ($('#asstcost').val() == "") {
					validated = false;
					console.log("#asstcost");										
					$("#asstcosterr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#asstcosterr").height());
					$("#asstcosterr").show();
				}
				else {
					var cost = $('#asstcost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	            
						console.log("#asstcost digits");										
						$("#asstcosterr").append("<p>Cost should contain digits and upto 2 decimals only.</p>");
						window.parent.adjustModalHeightDelta($("#asstcosterr").height());
						$("#asstcosterr").show();
					}
	            }
				
				if ($('#asstcostmarkup').val() == "") {
					validated = false;
					console.log("#asstcostmarkup");															
					$("#asstcostmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#asstcostmarkuperr").height());
					$("#asstcostmarkuperr").show();
				}
				else {
					var costmarkup = $('#asstcostmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						console.log("#asstcostmarkup digits");															
						$("#asstcostmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta($("#asstcostmarkuperr").height());
						$("#asstcostmarkuperr").show();
					
					}
				}
				
				if ($('#vehdetails').val() == "") {
					validated = false;
					console.log("#vehdetails");															
					$("#vehdetailserr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#vehdetailserr").height());
					$("#vehdetailserr").show();
				}

				if ($('#pikupdropcost').val() == "") {
					validated = false;
					console.log("#pikupdropcost");															
					$("#pikupdropcosterr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#pikupdropcosterr").height());
					$("#pikupdropcosterr").show();
				}
				else {
					var cost = $('#pikupdropcost').val();
					if ( /^\d+\.\d{1,2}$/.test(cost) === false) {
						validated = false;	   
						console.log("#pikupdropcost digits");																				         
						$("#pikupdropcosterr").append("<p>Cost should contain digits and upto 2 decimals only.</p>");
						window.parent.adjustModalHeightDelta($("#pikupdropcosterr").height());
						$("#pikupdropcosterr").show();
					}
		        }

				if ($('#pikupdropcostmarkup').val() == "") {
					validated = false;
					console.log("#pikupdropcostmarkup");																				
					$("#pikupdropcostmarkuperr").append("<p>Input required.</p>");
					window.parent.adjustModalHeightDelta($("#pikupdropcostmarkuperr").height());
					$("#pikupdropcostmarkuperr").show();
				}
				else {
					var costmarkup = $('#pikupdropcostmarkup').val();
					if (/^\d{0,3}$/.test(costmarkup) === false) {
						validated = false;
						console.log("#pikupdropcostmarkup digits");																				
						$("#pikupdropcostmarkuperr").append("<p>Cost markup should contain upto 3 digits only.</p>");
						window.parent.adjustModalHeightDelta($("#pikupdropcostmarkuperr").height());
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
			      alert("Form Changed");
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
			
			if (window.parent.masteractarr == undefined || window.parent.masteractarr.length == 0 || $('#masteractid').val() == 0)
				$( "#radiopom" ).prop( "disabled", true );
				
			if ($('#masteractid').val() > 0)
				$( "#radioind" ).prop( "disabled", true );

			if ($('#masteractid').val() == 0)
				$( "#radioind" ).prop( "checked", true );
			else {
				$( "#radiopom" ).prop( "checked", true );
			  	var masteractspan = "<span>" + window.parent.getMasterActDetails($('#masteractid').val(), window.parent.masteractarr) + "</span>";
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
		    					    
				$('#depdatetimeonstr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
									
				$('#arrdatetimeonstr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});

				$('#depdatetimeretstr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
									
				$('#arrdatetimeretstr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				
				$('#pikupdropdatetimestr').datetimepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
											
			});
			
		})
	</script>
		
</body>
