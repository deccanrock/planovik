<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>
	<script src="/resources/js/bootstrap-tag.min.js"></script>
	<script src="/resources/js/typeahead.bundle.min.js"></script>		
	<script src="/resources/js/bootbox.min.js"></script>	
	
	<c:set var="activetab" value='Manage' scope="request"/>
	<!-- /section:basics/sidebar -->
	<%@ include file="sidebar.jsp" %>


	<!-- /section:basics/sidebar -->
	<div class="main-content">
	<!-- #section:basics/content.breadcrumbs -->
	<!-- /section:basics/content.breadcrumbs -->
	<div class="page-content">
	
	<div class="page-content-area">
		<div class="page-header">
			<h1 style="display:inline-block;margin-right:10px; width:600px;">
				Itinerary
				<small>
					<i class="ace-icon fa fa-angle-double-right"></i>
					edit &nbsp;&nbsp;&nbsp;
					<span style="font-size:14px;color:black;">Number: <i>${itinerary.id}</i></span>&nbsp;&nbsp;
					<span style="font-size:14px;color:black;">Version: <i>${itinerary.version}</i></span>&nbsp;&nbsp;
				    <span style="font-size:14px;color:black;">Status: <i>
				    <c:choose>
				        <c:when test="${itinerary.status == 0}">Initial</c:when>
				        <c:when test="${itinerary.status == 1}">Draft</c:when>
				        <c:when test="${itinerary.status == 2}">Final</c:when>
				        <c:when test="${itinerary.status == 3}">Closed</c:when>
				    </c:choose>
				    </i></span>&nbsp;&nbsp;	
					<span style="font-size:14px;color:black;">Currency: <i>${itinerary.currency}</i></span>						
					</small>
			</h1>
			
			<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
			<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
			
		</div><!-- /.page-header -->

		<!-- PAGE CONTENT BEGINS -->
		<div class="row">
		
		    <div class="col-xs-9" style="margin-left:20px;">
		
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg">${msg}</div>
			</c:if>
		
			<div class="widget-box">          	                            
			    <div class="widget-body">
			    	<div class="widget-main">
			            <form:form id="manageitinerarysave-form" method="post" action="/app/manage/save" modelAttribute="itinerary" name="itinerary">
				        <div class="row">
							<div class='col-md-4'>
			                    <div class="form-group">
			                        <div class="clearfix">
			                            <label for="name">Name (less than 50 chars)</label>
			                    		<form:input type="text" path="name" id="name" class="col-sm-12" value="${itinerary.name}" />
			                        </div>
			                    </div>
		                    </div>
		                    
		                    <div class='col-md-4'>
			                    <div class="form-group">
			                        <div class="clearfix">
			                            <label for="touroperator">Tour Operator</label>
			                    		<form:input type="text" path="touroperator" id="touroperator" name="touroperator" class="col-sm-12" value="${itinerary.touroperator}" />
			                        </div>
			                    </div>
		                    </div>
	
							<div class='col-md-4'>
			                    <div class="form-group">
			                        <div class="clearfix">
			                        	<label for="grouphead">Group Head</label>
											<form:input type="text" path="grouphead" name="grouphead" id="grouphead" class="col-sm-12" 
			                            			value="${itinerary.grouphead}" />                                		
			                        </div>
			                    </div>
		                    </div>
	
						</div>                    
		                <div class="space-6"></div>	                    		                    
		
				        <div class="row">
		                    <div class='col-md-4'>
			                    <div class="form-group">
			                        <div class="clearfix">
			                        	<label for="numtravellers">PAX Count (incl group head)</label>
											<form:input type="text" path="numtravellers" name="numtravellers" id="numtravellers" class="col-sm-12" 
			                            			value="${itinerary.numtravellers}" />                                		
			                        </div>
			                    </div>
			            	</div>
	
						    <div class='col-md-4'>
						        <div class="form-group">
			                        <div class="clearfix">
			                    		<label for="quotecurrency">Client Quote Currency</label>
			                    		<div id="remote">
											<input type="text" class="typeahead scrollable" id="quotecurrency" name="quotecurrency" style="width:149px;" />                                		
							                <form:input type='hidden' id="quotecurrencystr" path="quotecurrencystr" name="quotecurrencystr" 
							                	value="${itinerary.quotecurrencystr}" />
										</div>
									</div>
						        </div>
						    </div>	                    					    
	
						    <div class='col-md-4'>
						        <div class="form-group">
				                    <div class="clearfix">
				                		<label for="convcodes">Currency Conversion Code</label>
										<a class="btn btn-minier btn-purple" style="float:right; margin-top:2px;" id="btnnewconvcode">New</a>
						        		<div class="form-group">
						        			<div id="remote">
												<input type="text" class="typeahead scrollable" id="convcodes" name="convcodes"  
						                        		style="width:149px;" />                                		
												<form:input type="hidden" id="convcodestr" path="convcodestr" name="convcodestr"  
						                        	value="${itinerary.convcodestr}" />                                		
											</div>
										</div>
									</div>
						        </div>
						    </div>
						</div>
		                
		                <div class="space-2"></div>	                     
				        <div class="row">
						    <div class='col-md-3'>
						        <div class="form-group">
			                        <div class="clearfix">
		                        		<label for="arrivalcity">Arrival City</label>
						                <form:input type='text' path="arrivalcity" id="arrivalcity" name="arrivalcity" class="col-sm-12" 
						                	value="${itinerary.arrivalcity}" />
									</div>
						        </div>
						    </div>
	
						    <div class='col-md-3'>
						        <div class="form-group">
			                        <div class="clearfix">
		                        		<label for="depcity">Departure City</label>
						                <form:input type='text' path="depcity" id="depcity" name="depcity" class="col-sm-12" 
						                	value="${itinerary.depcity}" />
									</div>
						        </div>
						    </div>
			                    	                    	                                                            
						    <div class='col-md-3'>
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
		                    
						    <div class='col-md-3'>
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
		                <div class="space-8"></div>	                     
	
		                    <form:input type="hidden" id="tzoffset" path="tzoffset"/>
		                    <form:input type="hidden" id="id" path="id" value="${itinerary.id}"/>
		                    <form:input type="hidden" id="mode" path="mode" value="${itinerary.mode}"/>
		                    <form:input type="hidden" id="version" path="version" value="${itinerary.version}"/>
		                    <form:input type="hidden" id="status" path="status" value="${itinerary.status}"/>
		                    <form:input type="hidden" id="postbutton" path="postbutton" />
		
							<button class="btn btn-large btn-success" style="margin-left:33%;" id="manageitinerarybtn">Save</button>
							<button class="btn btn-large btn-primary" style="margin-left:6%;" id="activitybtn">Activities</button>					
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
	
	<form id="newconvcodeform" method="post" class="form-horizontal" style="display: none;">
	    <div class="form-group">
	        <label class="col-xs-3 control-label">From</label>
	        <div class="col-xs-6">
	        	<div id="remote">
	            	<input type="text" class="typeahead scrollable form-control" id="fromcurr" name="fromcurr" style="min-width:188%;" />
				</div>
	        </div>
	    </div>
	
	    <div class="form-group">
	        <label class="col-xs-3 control-label">To</label>
	        <div class="col-xs-6">
	        	<div id="remote">
	            	<input type="text" class="typeahead scrollable form-control" id="tocurr" name="tocurr" style="min-width:188%;" />
				</div>
	        </div>
	    </div>
	
	    <div class="form-group">
	        <label class="col-xs-3 control-label">Unit Rate</label>
	        <div class="col-xs-7">
	            <input type="text" class="form-control" name="unitrate" id="unitrate" />
	        </div>
	    </div>

	    <div class="form-group">
	        <div class="col-xs-5 col-xs-offset-3">
	            <button type="submit" id="newconvcodeformsubmit" class="btn btn-purple">Create new</button>
	        </div>
	    </div>
	</form>

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

		$("#manageitinerarybtn").attr('disabled','disabled');
	      			
		$( "#btnnewconvcode" ).click(function() {
	        bootbox
	            .dialog({
	                title: 'Create new conversion code',
	                message: $('#newconvcodeform'),
	                show: false
	            })
	            .on('shown.bs.modal', function() {
	                $('#newconvcodeform')
	                    .show()
	            })
	            .on('hide.bs.modal', function(e) {
	                $('#newconvcodeform').hide().appendTo('body');
	            })          
	            .modal('show');	
	    });
	    
	    $('#newconvcodeform').on('success.form.bv', function(e) {
	        // Prevent form submission
	        e.preventDefault();
	
	        var $form     = $(e.target);
	
	        // Hide the modal containing the form
	        $form.parents('.bootbox').modal('hide');
	
	        // Show the welcome dialog
	        bootbox.alert('Welcome back, ' + fromcurr);
	    });	    
	    		
		$('#startdatetimepicker').val($('#startdatestr').val());
	    $('#enddatetimepicker').val($('#enddatestr').val());	
	    $('#quotecurrency').val($('#quotecurrencystr').val());	
	    $('#convcodes').val($('#convcodestr').val());
	   
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
		return this.optional(element) || (parseInt(value) > 0);
		}, "Pax count must be greater than zero.");
		
		jQuery.validator.addMethod("enddategtstartdate", function(value, element){
           var startdate = GetDate($('#startdatetimepicker').val());
           var enddate = GetDate(value);
            return startdate <= enddate;
     	}, 'Departure date/time should be greater than equal to arrival date/time.');   

		jQuery.validator.addMethod("matchingquotecurrconvcode", function(value, element){
           var currstr =  $('#quotecurrency').val();
           // USD - United States Dollar
           var currency = currstr.substring(0, currstr.search(" -"));
           var convcodestr = $('#convcodes').val();

           // 2 - USD to INR  Rate: 62.5
           var start = convcodestr.search("- ")+2;
		   var end = convcodestr.search("- ")+5;
           var convcode = convcodestr.substring(start, end);
            return currency == convcode;
     	}, 'Conversion Code curency should match quote currency!');   
        
        //documentation : http://docs.jquery.com/Plugins/Validation/validate
        $('#manageitinerarysave-form').validate({
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
                convcodes: {
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
                convcodes: {
                    required: "Please provide currency conversion code."
                }
            }
        });        

		jQuery.validator.addMethod("samecurrconvcodes", function(value, element){
            return ($('#fromcurr').val() != $('#tocurr').val());
     	}, 'Conversion Code currencies should be different!');   

		jQuery.validator.addMethod("numbersdecimal", function(value, element){
            return ($('#unitrate').val().match(/^\d+\.\d{0,2}$/));
     	}, 'Unit rate should contain digits and a single decimal only!');   
     	
        $('#newconvcodeform').validate({
            rules: {
                fromcurr: {
                    required: true
                },
                tocurr: {
                    required: true,
                    samecurrconvcodes: 'required'
                },
                unitrate: {
                    required: true,
                    numbersdecimal: 'required'
                }
            },
            messages: {

                fromcurr: {
                    required: "Conversion currency code is required."
                },
                tocurr: {
                    required: "Conversion currency code is required."
                },
                unitrate: {
                    required: "Conversion unit rate is required."
                }
            }
        });	
	
	})
	
	$( "#newconvcodeformsubmit" ).click(function() {
		var request = 
				$.ajax({type: 'GET',
						url: "/app/createcurrconvcode?" + "fromcurr=" + $('#fromcurr').val() + "&tocurr=" + $('#tocurr').val()
							 + "&unitrate=" + $('#unitrate').val()
					});
		request.done(function( msg ) {
			$('.bootbox-close-button')[0].click();
			$('#convcodes').val(msg);

		}); 
	    request.fail(function( jqXHR, textStatus ) {
		});
		
		return false;		

	});
	
	var isocurrlist = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
	   	remote: {
	        url: '/app/getISOCurrList?query=%QUERY',
	        replace: function(url, query) {

	        	if (document.activeElement.id == 'quotecurrency' || document.activeElement.id == 'fromcurr' 
	        		|| document.activeElement.id == 'tocurr')
	        		url = "/app/getISOCurrList?";
	        	else if (document.activeElement.id == 'convcodes')
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
		
		$("#manageitinerarysave-form :input").change(function() {
			$("#activitybtn").attr('disabled','disabled');
			$("#manageitinerarybtn").removeAttr('disabled');
		})

        $(":submit").live('click', function() {

		    if (this.id === 'newconvcodeformsubmit')
		    	return true;

		    $('#mode').val($(this).val());
           
            var startdate = GetDate($('#startdatetimepicker').val());
            var enddate = GetDate($('#enddatetimepicker').val());
            
            $('#startdatelong').val(startdate.getTime());
            $('#enddatelong').val(enddate.getTime());

            $('#quotecurrencystr').val($('#quotecurrency').val());            
            $('#convcodestr').val($('#convcodes').val());                        
            
		    if (this.id === 'manageitinerarybtn') 
            	$('#postbutton').val('manageitinerary');
            	
            if (this.id === 'activitybtn') {
            	$('#postbutton').val('activity');
            	return true;                        
            }
            	            
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
       
</script>

</body>
</html>
