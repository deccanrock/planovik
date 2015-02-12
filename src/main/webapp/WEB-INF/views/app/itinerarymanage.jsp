<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<script src="/resources/js/bootstrap-tag.min.js"></script>
		<script src="/resources/js/typeahead.bundle.min.js"></script>		

		
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


	<!-- /section:basics/sidebar -->
	<div class="main-content">
	<!-- #section:basics/content.breadcrumbs -->
	<!-- /section:basics/content.breadcrumbs -->
	<div class="page-content">
	
	<!-- /section:settings.box -->
	<div class="page-content-area">
	
	
	<!-- PAGE CONTENT BEGINS -->
	<div class="row">
	
	    <div class="col-xs-8" style="margin-left:20px;">
	
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
		            <form:form id="manageitinerarysave-form" method="post" action="/app/manage/save" modelAttribute="itinerary" name="itinerary">
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
										<form:input type="text" path="grouphead" name="grouphead" id="grouphead" class="col-sm-12" 
		                            			value="${itinerary.grouphead}" />                                		
		                        </div>
		                    </div>
	                    </div>
	                    
	                    <div class='col-md-6'>
		                    <div class="form-group">
		                        <div class="clearfix">
		                        	<label for="numtravellers">PAX Count (including group head)</label>
										<form:input type="text" path="numtravellers" name="numtravellers" id="numtravellers" class="col-sm-12" 
		                            			value="${itinerary.numtravellers}" />                                		
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
					                <form:input type='text' path="arrivalcity" id="arrivalcity" name="arrivalcity" class="col-sm-12" 
					                	value="${itinerary.arrivalcity}" />
								</div>
					        </div>
					    </div>
	                    
					    <div class='col-md-6'>
					        <div class="form-group">
		                        <div class="clearfix">
	                        		<label for="depcity">Departure City</label>
					                <form:input type='text' path="depcity" id="depcity" name="depcity" class="col-sm-12" 
					                	value="${itinerary.depcity}" />
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
						                <input type='text' id="startdatetimepicker" name="startdatetimepicker" class="form-control" 
						                	value="${itinerary.startdatestr}" style="z-index:0;" />
						                <form:input type='hidden' id="startdatestr" path="startdatestr" name="startdatestr" value="${itinerary.startdatestr}" />
						                <form:input type='hidden' id="startdatelong" name="startdatelong" path="startdatelong" />
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
						                <input type='text' id="enddatetimepicker" name="enddatetimepicker" class="form-control"
						                	value="${itinerary.enddatestr}" style="z-index:0;" />
						                <form:input type='hidden' id="enddatestr" path="enddatestr" name="enddatestr" value="${itinerary.enddatestr}" />
						                <form:input type='hidden' id="enddatelong" name="enddatelong" path="enddatelong" />
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
		                    		<label for="quotecurrency">Client Quote Currency</label>
		                    		<div id="remote">
										<form:input type="text" class="typeahead scrollable" path="quotecurrencystr" id="quotecurrency" name="quotecurrency"  
				                        			value="${itinerary.quotecurrencystr}"  style="width:95%;" />                                		
									</div>
								</div>
					        </div>
					    </div>	                    
	
					    <div class='col-md-6'>
					        <div class="form-group">
			                    <div class="clearfix">
			                		<label for="convcode">Currency Conversion Code</label> <label style="font-size:small;"> (Enter 3 char currency code)</label>
					        		<div class="form-group">
					        			<div id="remote">
											<form:input type="text" class="typeahead scrollable" path="convcodestr" id="convcode" name="convcode"  
					                        			value="${itinerary.convcodestr}" style="width:95%;" />                                		
										</div>
									</div>
								</div>
					        </div>
					    </div>
					</div>                    
		    		<div class="space-2"></div>
	                       
		                                        
	                <div class="space-2"></div>
	                    <form:input type="hidden" id="tzoffset" path="tzoffset"/>
	                    <form:input type="hidden" id="id" path="id" value="${itinerary.id}"/>
	                    <form:input type="hidden" id="mode" path="mode" value="${itinerary.mode}"/>
	                    <form:input type="hidden" id="version" path="version" value="${itinerary.version}"/>
	                    <form:input type="hidden" id="status" path="status" value="${itinerary.status}"/>
	
	                    <!-- #section:plugins/fuelux.wizard.buttons -->						
						<div class="alert alert-danger" id="changeerror" style="display:none;">
							<button class="close" data-dismiss="alert" type="button">							
							    <i class="ace-icon fa fa-times"></i>
							</button>	    					
	    					<strong></strong>No Changes detected!
						</div>
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

	$(document).ready(function() {
		$('#startdatetimepicker').val($('#startdatestr').val());
	    $('#enddatetimepicker').val($('#enddatestr').val());	
	})

	var formchanged=false;

	var isocurrlist = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
	   	remote: {
	        url: '/app/getISOCurrList?query=%QUERY',
	        replace: function(url, query) {

	        	if (document.activeElement.id == 'quotecurrency')
	        		url = "/app/getISOCurrList?";
	        	else if (document.activeElement.id == 'convcode')
	        		url = "/app/getCurrConvCodes?";
				
				url = url + "query="  + document.activeElement.value;
	            return url;
	        },		        		        
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
	
	isocurrlist.initialize();			
					
	$('#remote .typeahead').typeahead(null, {
	    displayKey: 'value',
	    source: isocurrlist.ttAdapter()
	});		 
	

	
    $(function () {
		$('#startdatetimepicker').datetimepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});

		$('#enddatetimepicker').datetimepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
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
		
		$("#manageitinerarysave-form").trackChanges();        

		jQuery.validator.addMethod("greaterThanZero", function(value, element) {
		return this.optional(element) || (parseInt(value) > 0);
		}, "Pax count must be greater than zero.");
		
		jQuery.validator.addMethod("enddategtstartdate", function(value, element){
           var startdate = GetDate($('#startdatetimepicker').val());
           var enddate = GetDate(value);
            return startdate <= enddate;
     	}, 'Departure date/time should be greater than equal to arrival date/time.');   

		jQuery.validator.addMethod("matchingquotecurrconvcode", function(value, element){
           var currstr =  $('#quotecurrency').val();
           var currency = currstr.substring(0, currstr.search(" -"));
           var convcodestr = $('#convcode').val();
           var convode = convcodestr.substring(currstr.search("- "), currstr.search("- ")+3);
            return currency == convcode;
     	}, 'Conversion Code curency should match quote currency!');   
        
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
                startdatetimepicker: {
                    required: true
                },
                enddatetimepicker: {
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
                	required: true,
                	matchingquotecurrconvcode: 'required'
                }
            },
            messages: {

                name: {
                    required: "Please specify a relevant itinerary name."
                },
                touroperator: {
                    required: "Please provide tour operator details - \'Direct Query\' or operator name."
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
                    required: "Please provide currency code for customer billing."
                },
                convcode: {
                    required: "Please provide currency conversion code."
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
           
            var startdate = GetDate($('#startdatetimepicker').val());
            var enddate = GetDate($('#enddatetimepicker').val());
            
            $('#startdatelong').val(startdate.getTime());
            $('#enddatelong').val(enddate.getTime());
            
			if ($("#manageitinerarysave-form").isChanged())
			   return true;
			else
				return false;
		});
		
		$(function() {
		
            $("#depcity").suggest({
                key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
                filter:'(any type:/location/citytown)'
            })
			.bind("fb-select", function(e, data) {
  				checkname(data.name);
			});  
					
            $("#arrivalcity").suggest({
                key: "AIzaSyDG_gsufq_KCjQYGf4SeZ44znuHsA61_10",
                filter:'(any type:/location/citytown)'
            })
			.bind("fb-select", function(e, data) {
  				checkname(data.name);
			});                      

        }); 
       
</script>

</body>
</html>
