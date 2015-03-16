<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="/resources/js/chosen.jquery.min.js"></script>	
		<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />	

		<c:set var="activetab" value='Manage' scope="request"/>
		<!-- /section:basics/sidebar -->
		<%@ include file="sidebar.jsp" %>
		
		<div class="main-content">
			<div class="page-content">
				<div class="page-header" style="min-height:38px;">
						<div style="width:50%;float:left;">
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
						</div>
						<div style="width:40%;float:left;">
							<select class="chosen-select" id="dayselect" data-placeholder="Pick a day...">
								<option value="">  </option>
								<c:forEach var="i" begin="1" end="${activitymaster.numtourdays}">								
								<option value="${i}">Day ${i}</option>								
		  						</c:forEach>								
							</select>
						</div>
				</div><!-- /.page-header -->

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
    					<div class="col-xs-12" style="margin-top:-170px;">
    					
							<form:form id="activitymanageform" method="post" action="" modelAttribute="travelactivity">
							<div class="col-sm-6">
								<div class="col-sm-2" style="margin-top:15px;margin-left:5px;">
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
								<form:input id="itinnum" type="hidden" path="itinnum" value="${activitymaster.itinnum}" />
								<form:input id="version" type="hidden" path="version" value="${activitymaster.version}" />
								<form:input id="activityid" type="hidden" path="activityid" value="${travelactivity.activityid}" />
								<form:input id="groupnum" type="hidden" path="groupnum" value="${activitymaster.groupnum}" />
								<form:input id="tzoffset" type="hidden" path="tzoffset" value="${activitymaster.tzoffset}" />								
                 		        </form:form>            
								
								<iframe id="traveliFrame" data-src="travelactivitymanage" frameborder="0" scrolling="no" seamless src="about:blank" height="900" width="600"></iframe>


							</div><!-- col-sm-6 -->

							<div class="col-sm-6" style="margin-top:-10px;">    					
								<h3 class="row header smaller lighter blue">
									<span class="col-xs-6"> Day wise activity preview </span><!-- /.col -->
								</h3>
								<!-- #section:elements.accordion -->
								<div id="accordion" class="accordion-style1 panel-group" >
									<c:forEach var="i" begin="1" end="${activitymaster.numtourdays}">
										<div class="panel panel-default">
											<div class="panel-heading">
													<a class="accordion-toggle collapsed" id="accortoggle${i}" data-toggle="collapse" data-parent="#accordion" href="#collapse${i}">
														<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
														&nbsp;Day ${i}
													</a>
												</h4>
											</div>

											<div class="panel-collapse collapse" id="collapse${i}">

											<div class="panel-body">
												<div class="widget-box collapsed" style="border-color:#A7C9A1;">
													<!-- #section:custom/widget-box.options.collapsed -->
													<div class="widget-header widget-header-small" style="color:black;">
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
	        	
		
		function resetactivityform(activityformname, widgetname, arrowname)	{
	 		$(".error").html('');
			$(".error").removeClass("error");
	    	$('#' + activityformname).trigger('reset');
	    	$('#' + widgetname).hide();
	    	$('#' + arrowname).hide();
	    	$('#traveliFrame').hide();	    	
		}
		
				
		$("button").click(function() {

			// Check if day was selected
			if ($('#dayselect').val() == "")
				return false;
				
			var iframe = $("#traveliFrame");
						
    		iframe.attr("src", iframe.data("src") + "?activityid=" + $('#activityid').val()); 				
			$("#traveliFrame").show();
			
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
	    	
	    	return false;
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
		
		function Manage() {					
			var token = $('#csrfToken').val();
			var header = $('#csrfHeader').val();
			$('input[name="_csrf"]').val(token);
		}
					
		jQuery(function($) {
		
			$('#traveliFrame').hide();
		
			$('#dayselect').change(function() {
				$('#' + 'accortoggle' + $(this).val()).click();			    
			});		

		})
	</script>

</body>
</html>