<%@ include file="header.jsp" %>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>


<!-- /section:basics/sidebar -->
<div class="main-content">
<!-- #section:basics/content.breadcrumbs -->
<!-- /section:basics/content.breadcrumbs -->
<div class="page-content">

<!-- /section:settings.box -->
<div class="page-content-area">


<!-- PAGE CONTENT BEGINS -->
<div class="row">

    <div class="col-xs-8" style="margin-left:120px;">

	<c:if test="${not empty error}">
		<div class="error">${error}</div>
	</c:if>
	<c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
	</c:if>

	<div class="widget-box">          
		<div class="widget-header">          		
			<span style="font-size:14px;">Number: <i>${itinerary.id}</i></span>&nbsp;&nbsp;
			<span style="font-size:14px;">Version: <i>${itinerary.version}</i></span>&nbsp;&nbsp;
			<span style="font-size:14px;">Status: <i>${itinerary.status}</i></span>&nbsp;&nbsp;
			<span style="font-size:14px;">Currency: <i>${itinerary.currency}</i></span>				
        </div>
                            
	    <div class="widget-body">
	    	<div class="widget-main">
	            <form:form id="manageitinerarysave-form" method="post" action="manageitinerary" modelAttribute="itinerary" name="itinerary">
		        <div class="row">
					<div class='col-md-6'>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="name">Name (less than 50 chars)</label>
	                    		<form:input type="text" path="name" id="name" class="col-sm-12" value="${itinerary.name}" />
	                        </div>
	                    </div>
                    </div>
                    
                    <div class='col-md-6'>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="touroperator">Tour Operator (Direct or referral company)</label>
	                    		<form:input type="text" path="touroperator" id="touroperator" name="touroperator" class="col-sm-12" value="${itinerary.touroperator}" />
	                        </div>
	                    </div>
                    </div>
				</div>                    
                <div class="space-2"></div>	                    		                    

		        <div class="row">
					<div class='col-md-6'>
	                    <div class="form-group">
	                        <div class="clearfix">
	                        	<label for="grouphead">Group Head</label>
	                    		<c:choose>
	                    			<c:when test="${itinerary.mode == 'Create'}">
										<form:input type="text" path="grouphead" name="grouphead" id="grouphead" class="col-sm-12" />                                		
	                        	    </c:when>
									<c:otherwise>
										<form:input type="text" path="grouphead" name="grouphead" id="grouphead" class="col-sm-12" 
	                            			value="${itinerary.grouphead}" />                                		
									</c:otherwise>
	                    		</c:choose>
	                        </div>
	                    </div>
                    </div>
                    
                    <div class='col-md-6'>
	                    <div class="form-group">
	                        <div class="clearfix">
	                        	<label for="numtravellers">PAX Count (including group head)</label>
	                    		<c:choose>
	                    			<c:when test="${itinerary.mode == 'Create'}">
										<form:input type="text" path="numtravellers" name="numtravellers" id="numtravellers" class="col-sm-12" />                                		
	                        	    </c:when>
									<c:otherwise>
										<form:input type="text" path="numtravellers" name="numtravellers" id="numtravellers" class="col-sm-12" 
	                            			value="${itinerary.numtravellers}" />                                		
									</c:otherwise>
	                    		</c:choose>
	                        </div>
	                    </div>
	            	</div>
				</div>                    
                <div class="space-2"></div>	
	                    	                    	                                                            
		        <div class="row">
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
	                    		<label for ="startdate">Arrival Date and Time</label>
					            <div class='input-group'>
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>					            
					                <form:input type='text' id="startdatetimepicker" name="startdatetimepicker" path="startdatestr" class="form-control" />
					            </div>
							</div>
				        </div>
				    </div>
                    
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
	                    		<label for ="enddate">Departure Date and Time</label>
					            <div class='input-group'>
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>					            
					                <form:input type='text' id="enddatetimepicker" name="enddatetimepicker" path="enddatestr" class="form-control" />
					            </div>
							</div>
				        </div>
				    </div>
				</div>                    
                <div class="space-2"></div>	
	                
		        <div class="row">
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
                        		<label for="arrivalcity">Arrival City</label>
				                <form:input type='text' path="arrivalcity" id="arrivalcity" name="arrivalcity" class="col-sm-12" />
							</div>
				        </div>
				    </div>
                    
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
                        		<label for="depcity">Departure City</label>
				                <form:input type='text' path="depcity" id="depcity" name="depcity" class="col-sm-12" />
							</div>
				        </div>
				    </div>
				</div>                    
                <div class="space-2"></div>	                       
	                                        
		        <div class="row">
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
                        		<label for="quotecurrency">Client Quote Currency</label>
		                		<c:choose>
		                			<c:when test="${itinerary.mode == 'Create'}">
										<form:input type="text" path="quotecurrency" id="quotecurrency" name="quotecurrency" class="col-sm-12" />                                		
		                    	    </c:when>
									<c:otherwise>
										<form:input type="text" path="quotecurrency" id="quotecurrency" name="quotecurrency" class="col-sm-12" 
		                        			value="${itinerary.quotecurrency}" />                                		
									</c:otherwise>
		                		</c:choose>
							</div>
				        </div>
				    </div>
                    
				    <div class='col-md-6'>
				        <div class="form-group">
	                        <div class="clearfix">
                        		<label for="convcode">Currency Conversion Code</label>
		                		<c:choose>
		                			<c:when test="${itinerary.mode == 'Create'}">
										<form:input type="text" path="convcode" id="convcode" name="convcode" class="col-sm-12" />                                		
		                    	    </c:when>
									<c:otherwise>
										<form:input type="text" path="convcode" id="convcode" name="convcode" class="col-sm-12" 
		                        			value="${itinerary.convcode}" />                                		
									</c:otherwise>
		                		</c:choose>
							</div>
				        </div>
				    </div>
				    <div class="space-2"></div>
				</div>                    
                       
	                                        
                <div class="space-2"></div>
                    <form:input type="hidden" id="tzoffset" path="tzoffset"/>
                    <form:input type="hidden" id="mode" path="mode" value="${itinerary.mode}"/>

                    <!-- #section:plugins/fuelux.wizard.buttons -->
            		<c:choose>
            			<c:when test="${itinerary.mode == 'Create'}">
                        	<input type="submit" id="manageitinerarycreate" class="btn btn-large btn-primary" value="Save" style="margin-left:43%" />
                    	</c:when>
						<c:otherwise>
	                        <input type="submit" id="manageitineraryedit" class="btn btn-large btn-primary" value="Save" style="margin-left:43%;" />
						</c:otherwise>
            		</c:choose>
                    
                    </form:form>
	        	</div>
			</div><!-- /.widget-main -->
        </div><!-- /.widget-body -->
    </div><!-- /.widget-box -->
</div><!-- row -->
</div><!-- /.page-content-area -->
</div><!-- /.page-content -->
</div><!-- /.main-content -->

<%@ include file="../footer.jsp" %>

</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src=\"<c:url value='/resources/js/jquery.min.js'/>\" >" + "<" + "/script>");
</script>
<!-- <![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src=\"<c:url value='/resources/js/jquery1x.min.js'/>\" >" + "<" + "/script>");
</script>
<!-- <![endif]-->


<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src=\"<c:url value='/resources/js/jquery.mobile.custom.min.js'/>\" >" +"<"+"/script>");
</script>

<script src="<c:url value='/resources/js/bootstrap.min.js'/>" ></script>

<!-- page specific plugin scripts -->
<script src="<c:url value='/resources/js/jquery.validate.min.js'/>" ></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'/>" ></script>
<script src="<c:url value='/resources/js/bootbox.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery.maskedinput.min.js'/>" ></script>
<script src="<c:url value='/resources/js/select2.min.js'/>" ></script>

<!-- ace scripts -->
<script src="<c:url value='/resources/js/ace-elements.min.js'/>" ></script>
<script src="<c:url value='/resources/js/ace.min.js'/>" ></script>
<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery.gritter.min.js'/>" ></script>

<script src="<c:url value='/resources/js/date-time/moment.min.js'/>" ></script>
<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
<script src="<c:url value='/resources/js/date-time/bootstrap-timepicker.min.js'/>" ></script>
<script src="<c:url value='/resources/js/date-time/daterangepicker.min.js'/>" ></script>
<script src="<c:url value='/resources/js/date-time/bootstrap-datetimepicker.min.js'/>" ></script>


<!-- inline scripts related to this page -->
<script type="text/javascript">

    $(function () {
		$('#startdatetimepicker').datetimepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
		});

		$('#enddatetimepicker').datetimepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
	
    jQuery(function($) {
        
		jQuery.validator.addMethod("greaterThanZero", function(value, element) {
		return this.optional(element) || (parseInt(value) > 0);
		}, "Pax count must be greater than zero.");
		
		jQuery.validator.addMethod("enddategtstartdate", function(value, element){
           var startdate = GetDate($('#startdatetimepicker').val());
           var enddate = GetDate(value);
            return startdate <= enddate;
     	}, 'Departure date/time should be greater than equal to arrival date/time.');   
        
        //documentation : http://docs.jquery.com/Plugins/Validation/validate
        $('#manageitinerarysave-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                name: {
                    required: true
                },
                touroperator: {
                    required: true
                },
                grouphead: {
                    required: true
                },
                numtravellers: {
                    required: true,
                    greaterThanZero: 'required'
                },
                startdatestr: {
                    required: true
                },
                enddatestr: {
                    required: true,
                    enddategtstartdate: 'required'
                },
                arrivalcity: {
                    required: true
                },
                depcity: {
                    required: true
                },
                quotecurrency: {
                    required: true
                },
                convcode: {
                    required: true
                },
            },
            messages: {

                name: {
                    required: "Please specify a relevant itinerary name."
                },
                touroperator: {
                    required: "Please provide tour operator information - \'Direct Query\' or operator name."
                },
                grouphead: {
                    required: "Please provide name of the group head."
                },
                numtravellers: {
                    required: "Please provide PAX count."
                },
                startdatestr: {
                    required: "Please provide travel start date and time."
                },
                enddatestr: {
                    required: "Please provide travel end date and time."
                },
                arrivalcity: {
                    required: "Please provide travel start city."
                },
                depcity: {
                    required: "Please provide travel end city."
                },                
                quotecurrency: {
                    required: "Please provide the currency to raise final invoice for customer."
                },
                convcode: {
                    required: "Please select a currency conversion code to help provide custom conversion rates to customer."
                }
            },


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

		$(":submit").live('click', function() {
		    $('#mode').val($(this).val());

		});       
       
    })
</script>

</body>
</html>
