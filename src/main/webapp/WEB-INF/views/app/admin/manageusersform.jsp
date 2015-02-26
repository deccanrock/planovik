<%@ include file="../header.jsp" %>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>
<script src="/resources/js/chosen.jquery.min.js"></script>	
<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css'/>" />	


<!-- /section:basics/sidebar -->
<div class="main-content">
	<div class="page-content">
		<!-- /section:settings.box -->
		<div class="page-content-area">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
                <div class="space-6"></div>								
				<div class="col-xs-5" style="margin-left:300px;">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title">
		                    	<c:choose>
		                    		<c:when test="${user.mode == 'Create'}">
										<span>Create Account for User: <i>${user.username}</i></span>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<span>Edit Account for User: <i>${user.username}</i></span>
		                        	</c:otherwise>	
		                    	</c:choose>		                        							
							</h4>
						</div>				
	                	<div class="space-4"></div>								
						<div class="widget-body">
							<div class="widget-main no-padding">				

								<c:if test="${not empty error}">
									<div class="error">${error}</div>
								</c:if>
								<c:if test="${not empty msg}">
									<div class="msg">${msg}</div>
								</c:if>
					
					            <form:form id="manageusers-form" class="horizontal" method="post" action="manageusers" modelAttribute="user" name="user">
				                <div class="space-6"></div>									
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="fullname">Full Name</label>
				                    		<c:choose>
				                    			<c:when test="${not empty user.fullname}">
				                        			<form:input type="text" path="fullname" id="fullname" class="col-xs-9 col-sm-7"  
				                        			value="${user.fullname}" />
				                        	    </c:when>
												<c:otherwise>
				                    				<form:input type="text" path="fullname" id="fullname" class="col-xs-9 col-sm-7" />                                	
												</c:otherwise>
				                    		</c:choose>
				                    	</div>
					                </div>
					                <div class="space-2"></div>
					
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="email">Email</label>
					                    		<c:choose>
					                    			<c:when test="${not empty user.email}">
					                        			<form:input type="text" path="email" id="email" class="col-xs-9 col-sm-7"  
					                        			value="${user.email}" />
					                        	    </c:when>
													<c:otherwise>
					                    				<form:input type="text" path="email" id="email" class="col-xs-9 col-sm-7" />                                	
													</c:otherwise>
					                    		</c:choose>
										</div>
					                </div>
			
		                    		<c:choose>
	                    				<c:when test="${user.mode == 'Create'}">
							                <div class="form-group">
							                    <div class="clearfix">

				                				<div class="space-2"></div>
						                    	<label class="col-sm-4 control-label no-padding-right" for ="email">Temporary Password</label>
					                        	<form:input type="text" path="pass" name="pass" class="col-xs-9 col-sm-7" />
								                <div class="space-2"></div>
												</div>
							                </div>
		                        	    </c:when>
		                    		</c:choose>
					
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="designation">Designation</label>
					                    		<c:choose>
					                    			<c:when test="${not empty user.designation}">
					                        			<form:input type="text" path="designation" id="designation" class="col-xs-9 col-sm-7"  
					                        			value="${user.designation}" />
					                        	    </c:when>
													<c:otherwise>
					                    				<form:input type="text" path="designation" id="designation" class="col-xs-9 col-sm-7" />                                	
													</c:otherwise>
					                    		</c:choose>
										</div>
					                </div>
					                <div class="space-2"></div>
			
					                
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="role">Role</label>
											<form:select class="chosen-select col-sm-6" style="width:200px;" path="role" name="role" id="role" data-placeholder="Pick a role...">
											<c:choose>
			                    				<c:when test="${user.mode == 'Create'}">
													<option value="">  </option>
													<c:forEach items="${user.rolelist}" var="i">								
													<option value="${i}">${i}</option>								
					          						</c:forEach>						
					          					</c:when>		
												<c:otherwise>
													<c:forEach items="${user.rolelist}" var="i">
					                					<c:if test="${i == user.role}">					                		
															<option value="${i}" selected>${i}</option>								
														</c:if>
					                					<c:if test="${i != user.role}">					                		
															<option value="${i}">${i}</option>																						
														</c:if>
					          						</c:forEach>						
												</c:otherwise>
											</c:choose>
											</form:select>
					                	</div>
					                </div>
					                <div class="space-2"></div>
					
			
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="reportstousername">Reporting Manager</label>
					                    		<c:choose>
					                    			<c:when test="${not empty user.reportstousername}">
					                        			<form:input type="text" path="reportstousername" id="reportstousername" class="col-xs-9 col-sm-7"  
					                        			value="${user.reportstousername}" />
					                        	    </c:when>
													<c:otherwise>
					                    				<form:input type="text" path="reportstousername" id="reportstousername" class="col-xs-9 col-sm-7" />                                	
													</c:otherwise>
					                    		</c:choose>
										</div>
					                </div>
					                <div class="space-2"></div>
			
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="phone">Phone</label>

				                    		<c:choose>
				                    			<c:when test="${not empty user.phone}">
				                        			<form:input type="text" path="phone" id="phone" class="col-xs-9 col-sm-7"  
				                        			value="${user.phone}" />
				                        	    </c:when>
												<c:otherwise>
				                    				<form:input type="text" path="phone" id="phone" class="col-xs-9 col-sm-7" />                                	
												</c:otherwise>
				                    		</c:choose>
										</div>
					                </div>
					                <div class="space-4"></div>
					
				                    <form:input type="hidden" id="tzoffset" path="tzoffset"/>
				                    <form:input type="hidden" id="username" path="username" value="${user.username}"/>
				                    <form:input type="hidden" id="mode" path="mode" value="${user.mode}"/>
				
				                    <!-- #section:plugins/fuelux.wizard.buttons -->
				            		<c:choose>
				            			<c:when test="${user.mode == 'Create'}">
				                        	<input type="submit" id="manageuserscreate" class="btn btn-large btn-primary" style="margin-left:200px;" value="Create" />
				                    	</c:when>
										<c:otherwise>
					                        <input type="submit" id="manageusersedit" class="btn btn-large btn-primary" style="margin-left:200px;" value="Save" />
										</c:otherwise>
				            		</c:choose>
				                    
			                    </form:form>
								<div class="space-6"></div>								
											                
				        	</div>
			        	</div>
					</div>
		        </div> <!-- .col-xs-12 -->
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

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
    
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

        jQuery.validator.addMethod("username", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]*$/.test(value).test(value);
        }, "Enter a valid username. Alphanumeric only!");
        
        jQuery.validator.addMethod("pass", function (value, element) {
            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
        }, "Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, min 1 upper case, min one special character.");
        

		jQuery.validator.addMethod("email", function (value, element) {
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

        $('#manageuserscreate').on('submit', function () {
            var d = new Date();
            $('#tzoffset').val(d.getTimezoneOffset());
            alert(d.getTimezoneOffset());
            return;
        });     
       
       	$('#username').blur(function() {
       		if ($('#username').val() != '')
		    	checkname($('#username').val(), 'checkexists', '#username');
	   	});
		
       	$('#usernameedit').blur(function() {
       		if ($('#usernameedit').val() != '')
		    	checkname($('#usernameedit').val(), 'checkexistsedit', '#usernameedit');
	   	});
	   	
       	$('#reportstousername').blur(function() {
       		if ($('##reportstousername').val() != '')
		    	checkname($('##reportstousername').val(), 'checknotexists', '#reportstousername');
	   	});

		$(":submit").live('click', function() {
		    $('#mode').val($(this).val());
		});       
       
    })
</script>

</body>
</html>
