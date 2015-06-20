<%@ include file="header.jsp" %>
	<%@ include file="../app/nav.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		
		<c:set var="activetab" value="" scope="request"/>
		<!-- /section:basics/sidebar -->
		<%@ include file="../app/sidebar.jsp" %>

		<div class="main-content">
			<!-- #section:basics/content.breadcrumbs -->

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<!-- #section:settings.box -->

				<!-- /section:settings.box -->
				<div class="page-content-area">

					<div class="row">
						<div class="col-xs-5" style="margin-left:10px;margin-top:30px;">
							<div class="widget-box"  id="manageuserswidget"> 
						
								<div class="widget-header">
									<h5 class="widget-title">Manage Users</h5>
									<div class="widget-toolbar">
										<a href="#" data-action="reload" style="visibility:hidden;">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
	
										<a id="widgetcollapsemanageusers" href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-down"></i>
										</a>
									</div>
								</div>																		
						
								<div class="widget-body">
									<div class="widget-main no-padding">
										<c:if test="${not empty usererror}">
											<div class="error">${usererror}</div>
										</c:if>
										<c:if test="${not empty msg}">
											<div class="msg">${usermsg}</div>
										</c:if>
					
					                    <form:form id="manageusers-form" method="post" action="admin/manageusersform" modelAttribute="user" name="user">				
					                        <div class="form-group">
					                            <div class="clearfix">
					                                <form:input type="text" path="username" placeholder="Enter username" id="username" class="col-sm-11" style="margin-left:10px;margin-top:20px;"/>
					                            </div>
					                        </div>
					                        <form:input type="hidden" id="usersmode" path="mode" />
	
					                        <div class="form-group" style="margin-top:20px;margin-left:20px;">
						                        <input type="submit" id="manageuserscreate" path="manageuserscreate" class="btn btn-large btn-primary" value="Create" />	                    
						                        <input type="submit" id="manageusersedit" path="manageusersedit" class="btn btn-large btn-primary" value="Edit" />
						                        <input type="submit" id="manageusersdelete" path="manageusersdelete" class="btn btn-large btn-primary" value="Disable" />
											</div>
										</form:form>
									</div>
								</div> <!-- widgetbody -->
							</div> <!-- widgetbox -->
						</div>
				
						<div class="col-xs-5" style="margin-left:10px;margin-top:30px;">
					
							<div class="widget-box" id="manageserviceswidget"> 
						
								<div class="widget-header">
									<h5 class="widget-title">Manage Services</h5>								
									<div class="widget-toolbar">
										<a href="#" data-action="reload" style="visibility:hidden;">
											<i class="ace-icon fa fa-refresh"></i>
										</a>
	
										<a href="#" id="widgetcollapsemanageservices" data-action="collapse">
											<i class="ace-icon fa fa-chevron-down"></i>
										</a>
									</div>
								</div>																		
						
								<div class="widget-body">
									<div class="widget-main no-padding">
										<c:if test="${not empty serviceerror}">
											<div class="error">${serviceerror}</div>
										</c:if>
										<c:if test="${not empty servicemsg}">
											<div class="msg">${servicemsg}</div>
										</c:if>
					
					                    <form:form id="manageservices-form" method="post" action="admin/manageservicesform" modelAttribute="serviceprovider" name="serviceprovider">				
					                        <div class="form-group" style="margin-left:10px;margin-top:10px;">
					                            <div class="clearfix">
													<form:select class="col-sm-6 hideearrow selectof" path="types" name="types" id="types" multiple="">
											            <option value="">Pick Service Type..</option>
													<c:forEach items="${serviceprovider.types}" var="servicetype">
											            <option value="${servicetype}"><c:out value="${servicetype}" /></option>
													</c:forEach>																				
													</form:select>							                                
												</div>
											</div>
					                        <div class="form-group">
					                            <div class="clearfix">
					                                <form:input type="text" path="servicename" placeholder="Enter service name" id="servicename" class="col-sm-11" 
					                                style="margin-left:10px;width:90%" disabled="disabled" />
					                            </div>
					                        </div>
	
					                        <form:input type="hidden" id="servicesmode" path="mode" />
					                        <form:input type="hidden" id="typestr" path="typestr" />

					                        <div class="form-group" style="margin-top:20px;margin-left:20px;">
						                        <input type="submit" id="manageservicescreate" path="manageservicescreate" class="btn btn-primary" value="Create" disabled />	                    
						                        <input type="submit" id="manageservicesedit" path="manageservicesedit" class="btn btn-primary" value="Edit" disabled />
											</div>
										</form:form>
									</div>
								</div> <!-- widgetbody -->
							</div> <!-- widgetbox -->
						</div>
					</div> <!-- row -->					
				
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
<script src="<c:url value='/resources/js/jquery.gritter.min.js'/>" ></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {

        jQuery.validator.addMethod("username", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]*$/.test(value);
        }, "Enter a valid username, alphanumeric only.");

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
                    required: "Please specify a username.",
                    username: "Please provide a username. Alphanumeric characters only!"
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
			var btnid = $(this).attr('id');
			if (btnid == 'manageservicescreate' || btnid == 'manageservicesedit') {
			    $('#servicesmode').val($(this).val());
			    $('#typestr').val($('#types').val());
			} 
			else {
			    $('#usersmode').val($(this).val());					
			}
			
		}); 
		
		$("a").click(function(e){
		
		    if ($(this).attr('id') == "widgetcollapsemanageusers") {
			    $("#manageusers-form").find('input:text, input:password, input:file, select, textarea').val('');
			    $("#manageusers-form").find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
		    	$("div").remove('.error');
		    	$("div").remove('.help-block');
		    }

		    if ($(this).attr('id') == "widgetcollapsemanageservices") {
			    $("#manageservices-form").find('input:text, input:password, input:file, select, textarea').val('');
			    $("#manageservices-form").find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
				$("#manageserviceswidget").find('.has-error').removeClass();
				$("#manageserviceswidget").find('.error').removeClass();
		    }

		});		   

		$('#types').change(function() {
			if ($('#types').val() ==  '') {
				$('#servicename').prop( "disabled", true );
				$('#manageservicesedit').prop( "disabled", true );
				$('#manageservicescreate').prop( "disabled", true );			
			}
			else {
				$('#manageservicesedit').prop( "disabled", false );
				$('#manageservicescreate').prop( "disabled", false );			
				$('#servicename').prop( "disabled", false );			
			}
		});		   
       
    })
</script>

</body>
</html>
