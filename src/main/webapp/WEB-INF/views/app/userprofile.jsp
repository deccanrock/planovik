<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

    <link rel="stylesheet" href="<c:url value='/resources/css/jquery.gritter.css'/>" />	
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.custom.min.css'/>" />	
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-editable.css'/>" />	


	<c:set var="activetab" value='' scope="request"/>
	<!-- /section:basics/sidebar -->
	<%@ include file="sidebar.jsp" %>

			<div class="main-content">

				<div class="page-content">

					<div class="page-content-area">
						<div class="page-header">
							<h1>User Profile</h1>
						</div><!-- /.page-header -->

						<div class="row">
						
							<div class="col-xs-9">
								<!-- PAGE CONTENT BEGINS -->
								<c:if test="${not empty error}">
									<div class="error alert alert-danger">
										<button type="button" class="close" data-dismiss="alert">
											<i class="ace-icon fa fa-times"></i>
										</button>
										${error}
										<br />
									</div>							
								</c:if>
								<c:if test="${not empty msg}">
									<div class="msg alert alert-block alert-success"></div>
										<button type="button" class="close" data-dismiss="alert">
											<i class="ace-icon fa fa-times"></i>
										</button>
										${msg}
										<br />
									</div>							
								</c:if>								
								
								<div id="user-profile-3" class="user-profile row">
									<div class="col-sm-offset-1 col-sm-9">
										<form:form id="userprofile-form" class="horizontal" method="post" 
										action="userprofileupdate" modelAttribute="user" name="user">
		           						<div class="tabbable">
											<ul class="nav nav-tabs padding-16">
												<li class="active">
													<a data-toggle="tab" href="#edit-basic">
														<i class="green ace-icon fa fa-pencil-square-o bigger-125"></i>
														Basic Info
													</a>
												</li>
	
												<li>
													<a data-toggle="tab" href="#edit-password">
														<i class="blue ace-icon fa fa-key bigger-125"></i>
														Password
													</a>
												</li>
											</ul>
											<form:input type="hidden" id="id" path="id" value="${user.id}" />
											
											<div class="tab-content profile-edit-tab-content">
												<div id="edit-basic" class="tab-pane in active">
													<div class="space-10"></div>
													<div class="row">
														<div style="width:350px;height:166px;" class="col-xs-9" >
															<div class="row">
																<div class="col-sm-7">
																Username <span><i>${user.username}</i></span>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-7">
																Name <span><i>${user.fullname}</i></span>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-7">
																Email <span><i>${user.email}</i></span>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-7">
																Phone <span><i>${user.phone}</i></span>
																</div>
															</div>
														</div>
														
														<div class="col-xs-9 col-sm-4">
															<a href="#" class="btn btn-minier btn-purple" 
															style="margin-left:80px;margin-bottom:5px;display:none;" id="uploadfilesubmit">Upload</a>														
															<input type="file" id="id-input-file-3" />
														</div>															
														
													</div>
												</div> <!-- .edit-basic -->
	

												<div id="edit-password" class="tab-pane">
													<div class="space-10"></div>

													<div class="row">
	
														<div class="form-group">				
																<H6>Password length is 8 - 20. Must contain min 1 digit, min 1 lower case, 
																	min 1 upper case, min one special character.</H6>
														</div>
	
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right" for="pass">New Password</label>		
															<form:input type="password" path="pass" maxlength="20" id="pass" />
														</div>
		
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right" for="repass">Confirm Password</label>
															<form:input type="password" path="repass" maxlength="20" id="repass" />
														</div>
													</div>		
												</div> <!-- .edit-password -->
												
											</div> <!-- .tab-content -->
										</div> <!-- tababble -->
	
										<div class="clearfix form-actions">
											<div class="col-md-offset-3 col-md-9">
												<form:button type="submit" id="updateusersubmit" class="btn btn-info" >
													<i class="ace-icon fa fa-check bigger-110"></i>
													Save
												</form:button>				
																				
											</div>
										</div>
									</form:form>
									</div> <!-- .col -->
								</div><!-- /.user-profile -->
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
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
			window.jQuery || document.write("<script src='../assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src=\"<c:url value='/resources/js/jquery.mobile.custom.min.js'/>\" >" +"<"+"/script>");
		</script>
		<script src="<c:url value='/resources/js/bootstrap.min.js'/>" ></script>

		<!-- page specific plugin scripts -->


<!-- page specific plugin scripts -->
<script src="<c:url value='/resources/js/additional-methods.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery.maskedinput.min.js'/>" ></script>
<script src="<c:url value='/resources/js/select2.min.js'/>" ></script>


		<!--[if lte IE 8]>
			<script src="<c:url value='/resources/js/excanvas.min.js'/>" ></script>
		<![endif]-->
		<script src="<c:url value='/resources/js/jquery-ui.custom.min.js'/>"</script>
		<script src="<c:url value='/resources/js/jquery.ui.touch-punch.min.js'/>"</script>
		
		<script src="<c:url value='/resources/js/jquery.gritter.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/bootbox.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/jquery.easypiechart.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/jquery.hotkeys.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/bootstrap-wysiwyg.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/select2.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/fuelux/fuelux.spinner.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/x-editable/bootstrap-editable.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/x-editable/ace-editable.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/jquery.maskedinput.min.js'/>" ></script>
		
		<!-- ace scripts -->
		<script src="<c:url value='/resources/js/ace-elements.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/ace.min.js'/>" ></script>
		<script src="<c:url value='/resources/js/spin.min.js'/>" ></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
							
		    	var image;

		    	var opts = {
			        lines:8, length:5, width:3, radius:3, corners:1,
		        	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
		        	hwaccel:false, className:'spinner', zIndex:2e9
		    	};

				$("#pass").val("");				
				$("#repass").val("");				
			
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
		                location.reload();
					});
				
				});
				
		
				$('#id-input-file-3').ace_file_input({
					style:'well',			
					btn_choose:'Click to change your avatar image',
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
						btn_choose:'Click to change your avatar image',
						btn_change:null,
						no_icon:'ace-icon fa fa-cloud-upload',
						droppable:true,
						thumbnail:'large'
				});
			

		        $('#userprofile-form').validate({
		            errorElement: 'div',
		            errorClass: 'help-block',
		            focusInvalid: false,
		            rules: {
		                pass: {
		                    pass: 'required'
		                },
		                repass: {
		                    repass: 'required'
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
                
		        jQuery.validator.addMethod("pass", function (value, element) {
		            return this.optional(element) || /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})$/.test(value);
		        }, "Please provide a valid password!");

		        jQuery.validator.addMethod("repass", function (value, element) {
		            return ($('#pass').val() == $('#repass').val());
		     	}, 'Password values must match!');   

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
		<script src="/resources/js/jquery.validate.min.js"> ></script>

	</body>
</html>
