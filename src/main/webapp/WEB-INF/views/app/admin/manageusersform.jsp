<%@ include file="../header.jsp" %>

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

    <div class="col-xs-9" style="margin-left:300px;">
        <div class="col-xs-5">
            <div class="widget-box" style="border:none;">          
                <div class="widget-body">

					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>

                    <form:form id="manageusers-form" method="post" action="manageusers" modelAttribute="user" name="user">

                        <div class="form-group">
                            <div class="clearfix">
                            	<c:choose>
                            		<c:when test="${user.mode == 'Create'}">
										<span style="font-size:14px;">Create Account for User: ${user.username}</span>
                                	</c:when>
                                	<c:otherwise>
                                		<span style="font-size:14px;">Edit Account for User: ${user.username}</span>
                                	</c:otherwise>	
                            	</c:choose>
                                
                                <div class="pull-right center spinner-preview" id="spinnerusername" class="col-sm-1"></div>
                            </div>
                        </div>

                        <div class="space-2"></div>

                        <div class="form-group">
                            <div class="clearfix">
                            	<div>
                            	<span>Full Name</span>
                            		<c:choose>
                            			<c:when test="${not empty user.fullname}">
                                			<form:input type="text" path="fullname" id="fullname" class="col-sm-11"  
                                			value="${user.fullname}" />
                                	    </c:when>
    									<c:otherwise>
                            				<form:input type="text" path="fullname" id="fullname" class="col-sm-11" />                                	
    									</c:otherwise>
                            		</c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="space-2"></div>

                        <c:if test="${user.mode == 'Create'}">
                        	<div class="form-group">
                            	<div class="clearfix">
                            		<span>Temporary Password</span>
		                        	<form:input type="text" path="pass" name="pass" class="col-sm-11" />
                            	</div>
                        	</div>
                        	<div class="space-2"></div>
                       	</c:if>                            

                        <div class="form-group">
                            <div class="clearfix">
                                <span>Designation</span>
                        		<c:choose>
                        			<c:when test="${not empty user.designation}">
                                		<form:input type="text" path="designation" name="designation" class="col-sm-11" 
                                			value="${user.designation}" />
                            	    </c:when>
									<c:otherwise>
                        				<form:input type="text" path="designation" name="designation" class="col-sm-11" />                                	
									</c:otherwise>
                        		</c:choose>
                            </div>
                        </div>
                        <div class="space-2"></div>
                        
                        <div class="form-group">
                            <div class="clearfix">
                            	<span>Level (1 to 5)</span>
                        		<c:choose>
                        			<c:when test="${user.mode == 'Create'}">
										<form:input type="text" path="level" maxlength="1" name="level" class="col-sm-11" />                                		
                            	    </c:when>
									<c:otherwise>
										<form:input type="text" path="level" maxlength="1" name="level" class="col-sm-11" 
                                			value="${user.level}" />                                		
									</c:otherwise>
                        		</c:choose>
                            </div>
                        </div>
                        <div class="space-2"></div>

                        <div class="form-group">
                            <div class="clearfix">
                            	<span>Reporting Manager</span>
                        		<c:choose>
                        			<c:when test="${not empty user.reportstoemail}">
		                                <form:input type="text" path="reportstoemail" name="reportstoemail" id="reportstoemail" class="col-sm-11" 
                                			value="${user.reportstoemail}" />
                            	    </c:when>
									<c:otherwise>
		                                <form:input type="text" path="reportstoemail" name="reportstoemail" id="reportstoemail" class="col-sm-11" />
									</c:otherwise>
                        		</c:choose>
                                <div class="pull-right center spinner-preview" id="spinnerreportingmanager" class="col-sm-1"></div>
                            </div>
                        </div>
                        <div class="space-2"></div>

                        <div class="form-group">
                        	<span>Phone</span>
                            <div class="input-group">
                				<span class="input-group-addon">
                    				${phonecode}
                				</span>
                				
                        		<c:choose>
                        			<c:when test="${not empty user.phone}">
		                                <form:input type="tel" name="phone" path="phone" class="signup-col-phone" value="${user.phone}" />
                            	    </c:when>
									<c:otherwise>
		                                <form:input type="tel" name="phone" path="phone" class="signup-col-phone" />
									</c:otherwise>
                        		</c:choose>
                            </div>
                        </div>
                        <div class="space-2"></div>
	                        <form:input type="hidden" id="tzoffset" path="tzoffset"/>
	                        <form:input type="hidden" id="username" path="username" value="${user.username}"/>
	                        <form:input type="hidden" id="mode" path="mode" value="${user.mode}"/>
	
	                        <!-- #section:plugins/fuelux.wizard.buttons -->
                    		<c:choose>
                    			<c:when test="${user.mode == 'Create'}">
		                        	<input type="submit" id="manageuserscreate" class="btn btn-large btn-primary" value="Create" />
	                        	</c:when>
								<c:otherwise>
			                        <input type="submit" id="manageusersedit" class="btn btn-large btn-primary" value="Save" />
								</c:otherwise>
                    		</c:choose>
	                        
		                    </form:form>
                </div>
            </div><!-- /.widget-body -->
        </div>
            
    </div>
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

        //documentation : http://docs.jquery.com/Plugins/Validation/validate
        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^\d{10}$/.test(value);
        }, "Enter a valid phone number with 10 digits.");

        jQuery.validator.addMethod("username", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");
        
        jQuery.validator.addMethod("pass", function (value, element) {
            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
        }, "Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, min 1 upper case, min one special character.");        

        $('#manageusers-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                fullname: {
                    required: true
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
                    required: true,
                    username: 'required'
                },
                reportstoemail: {
                    required: true,
                    username: 'required'
                },
            },
            messages: {
                username: {
                    required: "Please specify an email address.",
                    username: "Please provide a valid email address."
                },
                fullname: {
                    required: "Please specify full name."
                },
                designation: {
                    required: "Please enter designation."
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

        $('#manageusers-form').on('submit', function () {
            var d = new Date();
            $('#tzoffset').val(d.getTimezoneOffset());
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
	   	
       	$('#reportstoemail').blur(function() {
       		if ($('#reportstoemail').val() != '')
		    	checkname($('#reportstoemail').val(), 'checknotexists', '#reportstoemail');
	   	});

		$(":submit").live('click', function() {
		    $('#mode').val($(this).val());
		});       
       
    })
</script>

</body>
</html>
