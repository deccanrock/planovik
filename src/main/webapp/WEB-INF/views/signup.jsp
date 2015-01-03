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

    <div class="col-xs-9" style="margin-left:100px;margin-top:30px;">

        <div class="col-xs-6">
            <span style="font-size:24px;font-weight:bold">Be part of a vibrant community to help combat fraud while you earn.</span>
            <span style="display:block;font-size:18px;margin-top:20px;"><b>Receive verification requests</b>  from other organizations.</span>
            <span style="display:block;font-size:18px;margin-top:20px;"><b>See detailed activity</b>  inside your account.</span>
            <span style="display:block;font-size:18px;margin-top:20px;"><b>Discover</b>  how to leverage your  idle data .</span>
            <img src="<c:url value='/resources/images/demo-logo-large.png'/>" alt="Verifyed Demo" height="200" width="320" style="margin-top:30px;" />
        </div>


        <div class="col-xs-5" style="left:5%;margin-top:-14px;">
            <div class="widget-box" style="border:none;">
                <div class="widget-body">

                    <h3 class="block green">Signup and start earning!</h3>

                    <form:form id="signup-form" method="post" action="signup" modelAttribute="organization" name="organization">

                        <div class="form-group">
                            <div class="clearfix">
                            	<div>
                                	<form:input type="text" path="name" placeholder="Organization" id="orgname" class="col-sm-11" />
                                	<div class="pull-right center spinner-preview" id="spinner" class="col-sm-1"></div>
                                </div>
                            </div>
                        </div>
                        <div class="space-2"></div>

                        <div class="form-group">
                            <div class="clearfix">
	                        	<!-- #section:plugins/input.chosen -->
    	                        <form:select path="contacttitle" name="ctitle" class="form-field-select-1" style="width:16%;">
        	                    <form:option value="">Title</form:option>
                                <form:option value="Mr">Mr</form:option>
                                <form:option value="Mrs">Mrs</form:option>
                                <form:option value="Ms">Ms</form:option>
                                <form:option value="Prof">Prof</form:option>
                                <form:option value="Dr.">Dr.</form:option>
                            	</form:select>                            
                            	<form:input type="text" path="contactfname" placeholder="First Name" name="cfname" class="signup-col-fname" />
                            	<form:input type="text" path="contactlname" placeholder="Last Name" name="lfname" class="signup-col-lname" />
                        	</div>
                        <div class="space-8"></div>

                        <div class="form-group">
                            <div class="clearfix">
                                <form:input type="text" path="contactemail" placeholder="Your Official Email" name="cemail" class="col-sm-11" />
                            </div>
                        </div>
                        <div class="space-2"></div>

                        <div class="form-group">
                            <div class="clearfix">
                                <form:input type="text" path="contactdesignation" placeholder="Your Official Designation" name="cdesignation" class="col-sm-11" />
                            </div>
                        </div>
                        <div class="space-2"></div>
                        
                        <div class="form-group">
                            <div class="input-group">
                				<span class="input-group-addon">
                    				${phonecode}
                				</span>
                                <form:input type="tel" name="cphone" path="contactphone" class="signup-col-phone" placeholder="Phone Number" />
                            </div>
                        </div>
                        <div class="space-2"></div>
                        
                        <form:input type="hidden" id="tzoffset" path="tzoffset"/>

                        <div class="form-group">
                            <form:label path="useragreement">
                                <span class="lbl"> By clicking Sign Up, you agree to Verifyed's User Agreement, Privacy Policy and Cookie Policy. </span>
                            </form:label>
                        </div>

                        <!-- #section:plugins/fuelux.wizard.buttons -->
                        <input type="submit" id="signupsubmit" class="btn btn-large btn-primary" value="Signup" />

                    </form:form>
                </div>
            </div><!-- /.widget-body -->
        </div>
    </div>

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
        jQuery.validator.addMethod("contactphone", function (value, element) {
            return this.optional(element) || /^\d{10}$/.test(value);
        }, "Enter a valid phone number with 10 digits.");

        jQuery.validator.addMethod("contactemail", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");

        $('#signup-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                contactemail: {
                    required: true,
                    contactemail:true
                },
                contacttitle: {
                    required:true
                },
                contactfname: {
                    required: true
                },
                contactlname: {
                    required: true
                },
                contactphone: {
                    required: true,
                    contactphone: 'required'
                },
                contactdesignation: {
                    required: true,
                    minlength: 2
                },
                name: {
                    required: true,
                    minlength: 2
                }
            },
            messages: {
                contactemail: {
                    required: "Please specify an email address.",
                    contactemail: "Please provide a valid email address."
                },
                contacttitle: {
                    required: "Please specify title."
                },
                contactfname: {
                    required: "Please enter your first name."
                },
                contactlname: {
                    required: "Please enter your last name."
                },
                name: {
                    required: "Please enter your organization name."
                },
                contactdesignation: {
                    required: "Please enter your designation."
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

        $('#signup-form').on('submit', function () {
            var d = new Date();
            $('#tzoffset').val(d.getTimezoneOffset());  
            return;
        });     
       
    })
</script>

</body>
</html>
