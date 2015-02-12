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

    <div class="col-xs-9" style="margin-left:150px;">

       <div class="col-xs-6">
            <div class="widget-box" style="border:none;margin-top:20px;">
        		<h4 class="block green">Manage user</h4>            
                <div class="widget-body">

					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>

                    <form:form id="manageusers-form" method="post" action="manageusersform" modelAttribute="user" name="user">

                        <div class="form-group">
                            <div class="clearfix">
                                <form:input type="text" path="username" placeholder="Enter username (email)" id="username" class="col-sm-11" />
                                <div class="pull-right center spinner-preview" id="spinnerusername" class="col-sm-1"></div>
                            </div>
                        </div>

                        <div class="space-2"></div>
	                        <form:input type="hidden" id="mode" path="mode" />
	
	                        <!-- #section:plugins/fuelux.wizard.buttons -->
                        <input type="submit" id="manageuserscreate" path="manageuserscreate" class="btn btn-large btn-primary" value="Create" />	                    
                        <input type="submit" id="manageusersedit" path="manageusersedit" class="btn btn-large btn-primary" value="Edit" />
                        <input type="submit" id="manageusersdelete" path="manageusersdelete" class="btn btn-large btn-primary" value="Disable" />
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

        jQuery.validator.addMethod("username", function (value, element) {
            return this.optional(element) || /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/.test(value);
        }, "Enter a valid email address.");

        $('#manageusers-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                username: {
                    required: true,
                    username: 'required'
                },
            },
            messages: {
                username: {
                    required: "Please specify an email address.",
                    username: "Please provide a valid email address."
                },
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

		    $('#mode').val($(this).val());
		});       		       
       
    })
</script>

</body>
</html>
