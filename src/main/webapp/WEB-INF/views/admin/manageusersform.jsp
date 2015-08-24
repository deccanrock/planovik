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
					
					            <form:form id="manageusers-form" class="horizontal" method="post" action="/admin/manageusers" modelAttribute="user" name="user">
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
					                    		<div class="pull-right center spinner-preview" id="spinnerreportsto" class="col-sm-1"></div>
					                    		
										</div>
					                </div>
					                <div class="space-2"></div>
			
					                <div class="form-group">
					                    <div class="clearfix">
					                    	<label class="col-sm-4 control-label no-padding-right" for="phone">Phone</label>
				                            <div class="input-group">
				                				<span class="input-group-addon" style="font-size:12px;" id="phonecodespn">
				                    				${phonecode}
				                				</span>
					                    		<c:choose>
					                    			<c:when test="${not empty user.phone}">
					                        			<form:input type="text" path="phone" id="phone" class="col-xs-9 col-sm-7"  
					                        			value="${user.phone}" style="width:86%;"/>
					                        	    </c:when>
													<c:otherwise>
					                    				<form:input type="text" path="phone" id="phone" class="col-xs-9 col-sm-7" style="width:86%;" />                                	
													</c:otherwise>
					                    		</c:choose>
				                            </div>
										</div>
					                </div>
					                <div class="space-4"></div>

				                    <form:input type="hidden" id="tzoffset" path="tzoffset"/>
				                    <form:input type="hidden" id="phonecode" path="phonecode"/>
				                    <form:input type="hidden" id="username" path="username" value="${user.username}"/>
				                    <form:input type="hidden" id="mode" path="mode" value="${user.mode}"/>
									<form:input type="hidden" id="islocked" path="islocked" value="${user.islocked}" />
									<form:input type="hidden" id="togglelock" path="togglelock" />
									<form:input type="hidden" id="iscredentialsexpired" path="iscredentialsexpired" value="${user.iscredentialsexpired}" />		                    		
				
		                    		<c:if test="${user.mode == 'Edit'}">
										<div class="col-xs-10" style="margin-left:30px;">
											<div class="widget-box collapsed">
												<!-- #section:custom/widget-box.header.options -->
												<div class="widget-header widget-header-small">
													<h5 class="widget-title">Additional User Settings</h5>
													<div class="widget-toolbar">

														<a href="#" data-action="reload" style="visibility:hidden;">
															<i class="ace-icon fa fa-refresh"></i>
														</a>
	
														<a href="#" data-action="collapse">
															<i class="ace-icon fa fa-chevron-down"></i>
														</a>
	
													</div>
												</div>
	
												<!-- /section:custom/widget-box.header.options -->
												<div class="widget-body">
													<div class="widget-main">
														<div class="row" style="margin-left:10px; width:95%;">
															<div class="col-xs-5">
		                    									<c:if test="${user.islocked == '0'}">
																	<label>Lock Account</label>
																	<label>
																		<input  name="switch-field-1" id="accountlockunlock" class="ace ace-switch ace-switch-2" type="checkbox" />
																		<span class="lbl"></span>
																	</label>
																</c:if>
		                    									<c:if test="${user.islocked == '1'}">
																	<label>Unlock Account</label>
																	<label>
																		<input name="switch-field-1" id="accountockunlock" class="ace ace-switch ace-switch-2" type="checkbox" />
																		<span class="lbl"></span>
																	</label>
																</c:if>
															</div>		
															<div class="col-xs-5">
		                    									<c:if test="${user.iscredentialsexpired == '0'}">
																	<label>Expire Password</label>
																	<label>
																		<input name="switch-field-1" id="credentialsexpired" class="ace ace-switch ace-switch-2" type="checkbox" />
																		<span class="lbl"></span>
																	</label>
																</c:if>		
															</div>		
														</div><!-- row -->
													</div>
												</div>
											</div>
										</div>
						                <div class="space-20"></div>
				             		</c:if>

									<div style="margin-top:30px;">
					                    <!-- #section:plugins/fuelux.wizard.buttons -->
					            		<c:choose>
					            			<c:when test="${user.mode == 'Create'}">
					                        	<input type="submit" id="manageuserscreate" name="manageuserscreate" class="btn btn-large btn-primary" style="margin-left:200px;" value="Create" />
					                    	</c:when>
											<c:otherwise>
						                        <input type="submit" id="manageusersedit" name="manageusersedit" class="btn btn-large btn-primary" style="margin-left:200px;" value="Save" />
											</c:otherwise>
					            		</c:choose>				                    
				                        <input type="submit" id="manageuserscancel" name="manageuserscancel" class="btn btn-grey btn-primary" style="margin-left:50px;" value="Cancel" />
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

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(document).ready(function($) {
    
    	var image;
    
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
                
        $(":submit").live('click', function() {
        
        	var phonecode = $('#phonecodespn').text();
        	phonecode = phonecode.replace(/\s/g, '');
        	alert(phonecode);
        	$('#phonecode').val(phonecode);
			alert($('#phonecode').val());

		    if (this.id === 'manageusersedit') {
		    
				if ($("#accountlockunlock").prop("checked")) {
					$('#togglelock').val(1);
				}
				if ($("#credentialsexpired").prop("checked"))
					$("#iscredentialsexpired").val(1);
	
	            return true;		    
		    }

			if (this.id === 'manageuserscreate') {
	            var d = new Date();
	            $('#tzoffset').val(d.getTimezoneOffset());
	            $('#tzoffset').val(d.getTimezoneOffset());
	            return true;			
			}
			            
			if (this.id === 'manageuserscancel') {
	            $(location).attr('href', "/admin/index");	
			}

            return false;					
		});       		       
        
		
       	$('#reportstousername').blur(function() {
       		if ($('#reportstousername').val() != '') {
		    	checkname($('#reportstousername').val(), 'none', 'reportstousername');
		    }
	   	});
       

    	var opts = {
	        lines:8, length:5, width:3, radius:3, corners:1,
        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
        	hwaccel:false, className:'spinner', zIndex:2e9
    	};

        function checkname(username, checktype, fieldid) {
        	
   			var target = document.getElementById('spinnerreportsto');
	   		var spinner = new Spinner(opts).spin(target);	
        	var request = $.ajax({url: "/checkusername", type: "GET", data: "username=" + username});
        	request.done(function( msg ) {
				spinner.stop();
				if (msg == checktype) {
					$.gritter.add({
						title: 'User not found!',
						text: 'Please provide a valid username.',
						image: '',
						sticky: true,
						time: '',
						// (function | optional) function called after it closes
						after_close: function(e, manual_close){
							$('#' + fieldid).val('');
							$('#' + fieldid).focus();
						},						
						class_name: 'gritter-error gritter-center gritter-dark'
					});
				}
			}); 
	        request.fail(function( jqXHR, textStatus ) {
				$('spinner').data('spinner').stop();;
			});		
			
    	}
                  
		$( "#uploadfilesubmit" ).click(function() {
			console.log(image);
			var fd = new FormData();
			fd.append('image', image); 
   			var target = document.getElementById('spinnerupload');
			var spinner = new Spinner(opts).spin(target);	
			
           //var fd = new FormData(image);
            $.ajax({
              url: "/app/uploadphoto",
              data: fd,
              type: "POST",
			  processData : false,
			  contentType : false,               
              enctype: 'multipart/form-data'
            }).done(function( data ) {
            	spinner.stop();
                console.log( data );
                				
		        $.gritter.add({
					title: 'File Upload Status',
					text: data,
					image: '',
					sticky: true,
					time: '',
					// (function | optional) function called after it closes
					after_close: function(e, manual_close) {
						$('.remove').trigger("click");
					},						
					class_name: 'gritter-info gritter-center gritter-light'
				});
			});
		
		});
		

		$('#id-input-file-3').ace_file_input({
			style:'well',			
			btn_choose:'Drop images here or click to choose',
			btn_change:null,
			no_icon:'ace-icon fa fa-picture-o',
			droppable:true,
			thumbnail:'small'//large | fit
			//,icon_remove:null//set null, to hide remove/reset button
			/**,before_change:function(files, dropped) {
				//Check an example below
				//or examples/file-upload.html
				return true;
			}*/
			/**,before_remove : function() {
				return true;
			}*/
			,
			preview_error : function(filename, error_code) {
				//name of the file that failed
				//error_code values
				//1 = 'FILE_LOAD_FAILED',
				//2 = 'IMAGE_LOAD_FAILED',
				//3 = 'THUMBNAIL_FAILED'
				//alert(error_code);
			}
	
		}).on('change', function(){
			//alert($(this).data('ace_input_files'));
			// Upload to server
			image = $(this).data('ace_input_files')[0];
			if (CheckFile(image) === false) {
					var file_input = $('#id-input-file-3');
					file_input.ace_file_input('reset_input');			 			 	
					return;
			}
			
			$('#uploadfilesubmit').show();			
			//console.log($(this).data('ace_input_method'));

		});		
							

		$('.remove').click(function(){		
			$('#uploadfilesubmit').hide();
		});    
		
		$('#modal-form input[type=file]').ace_file_input({
				style:'well',
				btn_choose:'Drop images here or click to choose',
				btn_change:null,
				no_icon:'ace-icon fa fa-cloud-upload',
				droppable:true,
				thumbnail:'large'
		});
    
    });
    
	function CheckFile(file) {
		fileTypeVals = ["application/jpeg", "application/jpg", "application/png", "application/bmp", 
						"application/gif", "jpeg", "jpg", "png", "gif", "bmp",
						"image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];		
	
		if (file.type === "")
			return false;
			
		if ($.inArray(file.type, fileTypeVals) === -1)
			return false;
				
		if (file.size > 300000)
			return false;
	}

</script>

</body>
</html>
