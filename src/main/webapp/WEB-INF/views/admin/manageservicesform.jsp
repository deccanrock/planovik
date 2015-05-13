<%@ include file="header.jsp" %>
	<%@ include file="../app/nav.jsp" %>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>
<script src="/resources/js/jquery.validate.min.js"> ></script>
<script src="/resources/js/chosen.jquery.min.js"></script>	
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.gritter.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />	

	<c:set var="activetab" value="" scope="request"/>
	<!-- /section:basics/sidebar -->
	<%@ include file="../app/sidebar.jsp" %>
		
<!-- /section:basics/sidebar -->
<div class="main-content">
	<div class="page-content">
		<!-- /section:settings.box -->
		<div class="page-content-area">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
                <div class="space-6"></div>								
				<div class="col-xs-6" style="margin-left:300px;">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title">
		                    	<c:choose>
		                    		<c:when test="${user.mode == 'Create'}">
										<span>Create Service: </span><span style="font-size:14px;">${serviceprovider.typestr} - <i>${serviceprovider.servicename}</i></span>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<span>Edit Service: </span><span style="font-size:14px;">${serviceprovider.typestr} - <i>${serviceprovider.servicename}</i></span>
		                        	</c:otherwise>	
		                    	</c:choose>		                        							
							</h4>
						</div>				
	                	<div class="space-4"></div>								
						<div class="widget-body">
							<div class="widget-main no-padding">				

								<c:if test="${not empty serviceerror}">
									<div class="error">${serviceerror}</div>
								</c:if>
								<c:if test="${not empty servicemsg}">
									<div class="msg">${servicemsg}</div>
								</c:if>

				                <div class="space-6"></div>														
					            <form:form id="manageservices-form" class="horizontal" method="post" action="/admin/manageservices" modelAttribute="serviceprovider" name="serviceprovider">
       								<div class="row" style="margin-left:10px;">
					                	<div class='col-xs-4'>       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="servicename">Service Name</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.servicename}">
						                        			<form:input type="text" path="servicename" id="servicename" class="col-xs-11"  
						                        			value="${serviceprovider.servicename}" maxlength="60" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="servicename" id="servicename" class="col-xs-11"  maxlength="60" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>

					                	<div class='col-xs-4'>       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="city">City</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.city}">
						                        			<form:input type="text" path="city" id="city" class="col-xs-11"  
						                        			value="${serviceprovider.city}"  maxlength="45" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="city" id="city" class="col-xs-11"  maxlength="45" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>

					                	<div class='col-xs-4'>       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="country">Country</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.country}">
						                        			<form:input type="text" path="country" id="country" class="col-xs-11"  
						                        			value="${serviceprovider.country}" maxlength="45" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="country" id="country" class="col-xs-11" maxlength="45" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>
									</div>
									<div class="space-2"></div>	

       								<div class="row" style="margin-left:10px;">
					                	<div class='col-xs-3'>       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="travelmodelist">Contact Name</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.contactname}">
						                        			<form:input type="text" name="contactname" path="contactname" id="contactname" class="col-xs-11"  
						                        			value="${serviceprovider.contactname}" maxlength="45" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" name="contactname" path="contactname" id="contactname" class="col-xs-11" maxlength="45" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>

					                	<div class='col-xs-3' style="margin-left:-20px;">       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="travelmodelist">Contact Phone</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.contactphone}">
						                        			<form:input type="text" path="contactphone" id="contactphone" class="col-xs-11"  
						                        			value="${serviceprovider.contactphone}" maxlength="30" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="contactphone" id="contactphone" class="col-xs-11" maxlength="30" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>

					                	<div class='col-xs-3' style="margin-left:-20px;">       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="travelmodelist">Contact Email</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.contactemail}">
						                        			<form:input type="text" path="contactemail" id="contactemail" class="col-xs-13"  
						                        			value="${serviceprovider.contactemail}" maxlength="120" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="contactemail" id="contactemail" class="col-xs-13" maxlength="120" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>

					                	<div class='col-xs-3'>       							
							                <div class="form-group">
							                    <div class="clearfix">
							                    	<label for="travelmodelist">Contact Website</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.contactwebsite}">
						                        			<form:input type="text" path="contactwebsite" id="contactwebsite" class="col-xs-15"  
						                        			value="${serviceprovider.contactwebsite}"  style="width:120%;" maxlength="120" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="contactwebsite" id="contactwebsite" class="col-xs-15"  style="width:120%;" maxlength="120" />                                	
														</c:otherwise>
						                    		</c:choose>
						                    	</div>
							                </div>
							        	</div>
									</div>
									<div class="space-2"></div>

									<c:if test="${serviceprovider.type == 0}">					
       								<div class="row" style="margin-left:10px;">					                
					                	<div class='col-xs-4'>
					                		<div class="form-group">
					                    		<div class="clearfix">
						                    		<label for = "email">IATA Code (AI, 6E, 9W..)</label>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.iatacode}">
						                        			<form:input type="text" path="iatacode" id="iatacode" class="col-xs-9"  
						                        			value="${serviceprovider.iatacode}" maxlength="3" />
						                        	    </c:when>
														<c:otherwise>
						                    				<form:input type="text" path="iatacode" id="iatacode" class="col-xs-9" maxlength="3" />                                	
														</c:otherwise>
						                    		</c:choose>
												</div>
					                    	</div>
										</div>
					                
					                	<div class='col-xs-4'>
					                		<div class="form-group">
					                    		<div class="clearfix">
													<label for = "fullserviceinput">Full Service</label><br>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.fullservice}">
		                									<c:if test="${serviceprovider.fullservice == 0}">
																<label>
																	<input name="fullserviceinput" id="fullserviceinput" class="ace ace-switch ace-switch-2" type="checkbox" />
																	<span class="lbl"></span>
																</label>
															</c:if>
		                									<c:if test="${serviceprovider.fullservice == '1'}">
																<label>
																	<input name="fullserviceinput" id="fullserviceinput" class="ace ace-switch ace-switch-2" type="checkbox" checked />
																	<span class="lbl"></span>
																</label>
															</c:if>
														</c:when>
														<c:otherwise>
															<input  name="fullserviceinput" id="fullserviceinput" class="ace ace-switch ace-switch-2" type="checkbox" />
															<span class="lbl"></span>														
														</c:otherwise>
													</c:choose>
												</div>
					                    	</div>
										</div>
					                
					                	<div class='col-xs-4'>
					                		<div class="form-group">
					                    		<div class="clearfix">
													<label for = "domesticonlyinput">Domestic only</label><br>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.domesticonly}">
		                									<c:if test="${serviceprovider.domesticonly == 0}">
																<label>
																	<input  name="domesticonlyinput" id="domesticonlyinput" class="ace ace-switch ace-switch-2" type="checkbox" />
																	<span class="lbl"></span>
																</label>
															</c:if>
		                									<c:if test="${serviceprovider.domesticonly == '1'}">
																<label>
																	<input name="domesticonlyinput" id="domesticonlyinput" class="ace ace-switch ace-switch-2" type="checkbox" checked />
																	<span class="lbl"></span>
																</label>
															</c:if>
														</c:when>
														<c:otherwise>
															<input  name="domesticonlyinput" id="domesticonlyinput" class="ace ace-switch ace-switch-2" type="checkbox" />
															<span class="lbl"></span>														
														</c:otherwise>
													</c:choose>
												</div>
					                    	</div>
										</div>

					                </div>
					                </c:if>

									<c:if test="${serviceprovider.type == 2}">					
       								<div class="row">
					                	<div class='col-xs-9' style="margin-left:20px;">
					                		<div class="control-group">
						                    		<label for = "email">Coverage</label><br>
						                    		<c:choose>
						                    			<c:when test="${not empty serviceprovider.coverage}">						                    			
															<div class="radio">
															<c:if test="${serviceprovider.coverage == 0}">
																<label>
																	<form:radiobutton path="coverage" name="coverage" value="0" selected="selected" class="ace" />
																	<span class="lbl"> City Transfers only</span>
																</label>
																<label style="margin-left:30px;">
																	<form:radiobutton path="coverage" name="coverage" value="1" class="ace" />
																	<span class="lbl"> City and inter city</span>
																</label>
															</c:if>
															<c:if test="${serviceprovider.coverage == 1}">
																<label>
																	<form:radiobutton path="coverage" name="coverage" value="0" class="ace" />
																	<span class="lbl"> City Transfers only</span>
																</label>
																<label  style="margin-left:30px;">
																	<form:radiobutton path="coverage" name="coverage" value="1" selected="selected" class="ace"  style="margin-left:20px;" />
																	<span class="lbl"> City and inter city</span>
																</label>
															</c:if>
															</div>
						                        	    </c:when>
														<c:otherwise>
															<label>
																<form:radiobutton path="coverage" name="coverage" value="0" class="ace" />
																<span class="lbl"> City Transfers ony</span>
															</label>
															<label  style="margin-left:30px;">
																<form:radiobutton path="coverage" name="coverage" value="1" class="ace" />
																<span class="lbl"> City and inter city</span>
															</label>
														</c:otherwise>
						                    		</c:choose>
												</div>
					                    	</div>
										</div>
									</div>
									<div class="space-10"></div>	
					                </c:if>
			
									<c:if test="${serviceprovider.type == 3}">					
       								<div class="row" style="margin-left:10px;">
					                	<div class='col-xs-9'>
					                		<div class="control-group">
					                    		<label for = "description">Description (Max 120 Chars)</label>
					                    		<c:choose>
					                    			<c:when test="${not empty serviceprovider.description}">						                    			
														<form:textarea class="form-control limited" id="description" name="description" rows="1" path="description" 
														value="${serviceprovider.description}" maxlength="120" />					         
					                        		</c:when>
													<c:otherwise>
														<form:textarea class="form-control limited" id="description" name="description" rows="1" path="description" 
														maxlength="120" />					         
													</c:otherwise>
					                        	</c:choose>
					                        </div>
					               		</div>
					               	</div>
									<div class="space-10"></div>	
									</c:if>
									
									
       								<div class="row" style="margin-left:10px;">
					                	<div class='col-xs-9'>
					                		<div class="control-group">
					                    		<label for = "desc">Additional Information (Max 200 chars)</label>
					                    		<c:choose>
					                    			<c:when test="${not empty serviceprovider.addlinfo}">						                    			
														<form:textarea class="form-control limited" id="addlinfo" name="addlinfo" rows="1" path="desc" 
														value="${serviceprovider.desc}" maxlength="200" />					         
					                        		</c:when>
													<c:otherwise>
														<form:textarea class="form-control limited" id="addlinfo" name="addlinfo" rows="1" path="addlinfo" 
														maxlength="200" />					         
													</c:otherwise>
					                        	</c:choose>
					                        </div>
					                	</div>
					                	<div class='col-xs-2' style="margin-left:20px;">
					                		<div class="control-group">
					                    		<label for = "desc">Rating (0-5)</label>
					                    		<c:choose>
					                    			<c:when test="${not empty serviceprovider.rating}">						                    			
														<form:input type="text" class="input-mini" id="rating" path="rating" value="${serviceprovider.rating}"/>					                        		
													</c:when>
													<c:otherwise>
														<form:input type="text" class="input-mini" id="rating" path="rating" />					                        		
													</c:otherwise>
					                        	</c:choose>
					                        </div>
					                	</div>
									</div>
									
									<form:input type="hidden" path="type" value="${serviceprovider.type}" />
									<form:input type="hidden" id="id" path="id" value="${serviceprovider.id}" />
									<form:input type="hidden" id="mode" path="mode" value="${serviceprovider.mode}" />
									<form:input type="hidden" id="domesticonly" path="domesticonly" value="${serviceprovider.domesticonly}" />
									<form:input type="hidden" id="fullservice" path="fullservice" value="${serviceprovider.fullservice}" />

									<div style="margin-top:20px;">
					                    <!-- #section:plugins/fuelux.wizard.buttons -->
					            		<c:choose>
					            			<c:when test="${serviceprovider.mode == 'Create'}">
					                        	<input type="submit" id="manageservicescreate" name="manageservicescreate" class="btn btn-large btn-primary" style="margin-left:200px;" value="Create" />
					                    	</c:when>
											<c:otherwise>
						                        <input type="submit" id="manageservicesedit" name="manageservicesedit" class="btn btn-large btn-primary" style="margin-left:200px;" value="Save" />
											</c:otherwise>
					            		</c:choose>				                    
				                        <input type="submit" id="manageservicescancel" name="manageservicescancel" class="btn btn-grey btn-primary" style="margin-left:50px;" value="Cancel" />
									</div>
									
			                    </form:form>
								<div class="space-6"></div>								
											                
				        	</div>
			        	</div> <!-- widget body -->
					</div>
		        </div> <!-- .col-xs-12 -->
			</div><!-- row -->
		</div><!-- /.page-content-area -->
	</div><!-- /.page-content -->
</div><!-- /.main-content -->

<%@ include file="footer.jsp" %>

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
<script src="<c:url value='/resources/js/jquery-ui.custom.min.js'/>"</script>
<script src="<c:url value='/resources/js/additional-methods.min.js'/>" ></script>
<script src="<c:url value='/resources/js/bootbox.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery.maskedinput.min.js'/>" ></script>
<script src="<c:url value='/resources/js/select2.min.js'/>" ></script>

<!-- ace scripts -->
<script src="<c:url value='/resources/js/ace-elements.min.js'/>" ></script>
<script src="<c:url value='/resources/js/ace.min.js'/>" ></script>
<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery.gritter.min.js'/>" ></script>
<script src="<c:url value='/resources/js/fuelux/fuelux.spinner.min.js'/>" ></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(document).ready(function($) {
    
    	var image;
		$('#rating').ace_spinner({value:0,min:0,max:5,step:1, on_sides: true, icon_up:'ace-icon fa fa-plus smaller-75', icon_down:'ace-icon fa fa-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});    	
    
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
    

        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^\d{10}$/.test(value);
        }, "Enter a valid phone number with 10 digits.");

        jQuery.validator.addMethod("contactphone", function (value, element) {
            return this.optional(element) || /^\d{10}$/.test(value);
        }, "Enter a valid phone number with 10 digits.");

        jQuery.validator.addMethod("username", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]*$/.test(value).test(value);
        }, "Enter a valid username. Alphanumeric only!");
        
        jQuery.validator.addMethod("contactname", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]*$/.test(value).test(value);
        }, "Enter a valid username. Alphanumeric only!");

        jQuery.validator.addMethod("servicename", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]*$/.test(value).test(value);
        }, "Enter a valid username. Alphanumeric only!");

        jQuery.validator.addMethod("pass", function (value, element) {
            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
        }, "Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, min 1 upper case, min one special character.");
        
		jQuery.validator.addMethod("email", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");                

		jQuery.validator.addMethod("contactemail", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");                

        $('#manageusers-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: 'required'
                },
                phone: {
                    required: true,
                    phone: 'required'
                },
                pass: {
                    required: true,
                    pass: 'required'
                },
                designation: {
                    required: true,
                    minlength: 2
                },
                username: {
                    required: true
                },
                reportstousername: {
                    required: true
                },
            },
            messages: {

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
                
        $('#manageservices-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                servicename: {
                    required: true
                },
                city: {
                    required: true
                },
                country: {
                    required: true
                },
                contactname: {
                    required: true
                },
                contactphone: {
                    required: true
                },
                contactemail: {
                    required: true
                },
                contactwebsite: {
                    required: true
                }
            },
            messages: {

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


        $(":submit").live('click', function() {

			if ($('#fullserviceinput').is(':checked'))
				$('#fullservice').val("1");
			else
				$('#fullservice').val("0");		
			
			
			if ($('#domesticonlyinput').prop('checked'))
				$('#domesticonly').val("1");
			else
				$('#domesticonly').val("0");

		    if (this.id === 'manageservicesedit') {
		    
				if ($("#accountlockunlock").prop("checked")) {
					$('#togglelock').val(1);
				}
				if ($("#credentialsexpired").prop("checked"))
					$("#iscredentialsexpired").val(1);
	
	            return;		    
		    }

			if (this.id === 'manageservicescreate') {
	            var d = new Date();
	            $('#tzoffset').val(d.getTimezoneOffset());
				$('#id').val("0");	
	            return;			
			}
			            
			if (this.id === 'manageservicescancel') {
	            $(location).attr('href', "/admin/index");	
			}
			

            return false;					
		});
	});       		       
        
</script>

</body>
</html>
