<%@ include file="adminheader.jsp" %>
	<%@ include file="adminnav.jsp" %>

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
					<a id="dash" href="/admin/dash">
						<i class="menu-icon fa fa-tachometer"></i>
						<span class="menu-text"> Dashboard </span>
					</a>

					<b class="arrow"></b>
				</li>


				<li>
					<a id="tasks" href="/admin/tasks" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i>
						<span class="menu-text"> Tasks </span>
					</a>
				</li>
				
				<li  class="active">
					<a id="manage" href="/admin/manage" class="dropdown-toggle">
						<i class="menu-icon fa fa-desktop"></i>
						<span class="menu-text"> Manage </span>
					</a>
				</li>				

				<li class="">
					<a id="support" href="/admin/support" class="dropdown-toggle">
						<i class="menu-icon fa fa-pencil-square-o"></i>
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

		<div class="main-content">
			<!-- #section:basics/content.breadcrumbs -->

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<!-- #section:settings.box -->

				<!-- /section:settings.box -->
				<div class="page-content-area">
					<div class="page-header">
						<h1 style="display:inline-block;margin-right:10px; width:350px;">
							Organization
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								management
							</small>
						</h1>
						
						<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
						<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
						
						<c:if test="${pageContext.request.getAttribute('orgidname') != null}">
							<h6 style="display:inline-block; width:400px;font-weight:bold;">
										<c:out value="${pageContext.request.getAttribute('orgidname')}" />
							</h6>
						</c:if>
					</div><!-- /.page-header -->

					<c:if test="${pageContext.request.getAttribute('orgidname') == null}">
						<div class="row" style="width:35%;margin-left:30px;margin-top:30px;" \>
							<div class="widget-box"> 
									<div class="widget-header">
										<h4 class="widget-title">Enter Organization Name:</h4>
									</div>																		
									<div class="widget-body">
										<div class="widget-main no-padding">
											<form action="/admin/tasks/manage" method="POST" onsubmit="Manage()">
											<input type="hidden" name="_csrf" value="token" /> 
											<input type="hidden" name="ispost" value="true" />
												<fieldset>
													<div id="remote">
														<input type="text" name="orgidname" class="typeahead scrollable" style="width:100%" />
													</div>			
												</fieldset>
													<div style="margin-left:80%;margin-bottom:2%;">
														<button type="submit" name="submit" class="btn btn-sm btn-success">
															Submit
														</button>
													</div>
											</form>
										</div>
									 </div>
							</div>
						</div>					
					</c:if>	

					<!--  Work area for admins-->										 
					 <c:if test="${pageContext.request.getAttribute('orgidname') != null}">
					 	<c:set var="orgdetails" value="${pageContext.request.getAttribute('orgdetails')}" />
						<div class="col-xs-12" style="width:100%;">
						
							<div class="widget-box">
							
								<!-- #section:custom/widget-box.options -->
								<div class="widget-header">
									<h4 class="widget-title">Details</h4>

									<!-- #section:custom/widget-box.toolbar -->
									<div class="widget-toolbar">
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>	
									</div>								
								</div>
	
								<!-- /section:custom/widget-box.options -->
								<div class="widget-body">
									<div class="widget-main">
									
										<div class="row">
											
											<div class="col-xs-12 col-sm-3">
												
												<div class="widget-box">
													<div class="widget-header">
														<h5 class="widget-title">Registration</h5>
	
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up"></i>
															</a>
	
															<a href="#" data-action="close">
																<i class="ace-icon fa fa-times"></i>
															</a>
														</div>
													</div>
	
													<div class="widget-body">
														<div class="widget-main">
															<div>
																<span style="width:90px;display:inline-block;">IP</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.ip}" /></span>
															</div>
	
															<div>
																<span style="width:90px;display:inline-block;">Country</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.countryname}" /></span>
															</div>
															
															<div>
																<span style="width:90px;display:inline-block;">Date</span>
																<span style="color:#669FC7;"><fmt:formatDate type="both" value="${orgdetails.datecreatedlocal}" pattern="yyyy-MM-dd HH:mm" /></span>
															</div>
															<div>
																<span style="width:90px;display:inline-block;">UTC Offset</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.localtoutcoff}" /></span>
															</div>
															
														</div>
													</div>
												</div>
											</div><!-- /.span -->																	
				
									
											<div class="col-xs-12 col-sm-3">
												<div class="widget-box">
													<div class="widget-header">
														<h5 class="widget-title">Activity</h5>
	
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up"></i>
															</a>
	
															<a href="#" data-action="close">
																<i class="ace-icon fa fa-times"></i>
															</a>
														</div>
													</div>
	
													<div class="widget-body">
														<div class="widget-main">
															<div>
																<span style="width:155px;display:inline-block;">Last Updated</span>
																<span style="color:#669FC7;"><fmt:formatDate type="both" value="${orgdetails.dateupdatedlocal}" pattern="yyyy-MM-dd HH:mm" /></span>
															</div>
	
															<div>
																<span style="width:155px;display:inline-block;">Vrf Request Count</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.vrfreqcnt}" /></span>
															</div>
															
															<div>
																<span style="width:155px;display:inline-block;">Vrf Processed Count</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.vrfproccnt}" /></span>
															</div>
															<div>
																<span style="width:155px;display:inline-block;">Alerts Pending Count</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.alrtpendingcnt}" /></span>
															</div>
															<div>
																<span style="width:155px;display:inline-block;">Message Unread Count</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.msgsunrdcnt}" /></span>
															</div>
															
														</div>
													</div>
												</div>
											</div><!-- /.span -->									


											<div class="col-xs-12 col-sm-3">
												<div class="widget-box">
													<div class="widget-header">
														<h5 class="widget-title">Account</h5>
	
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up"></i>
															</a>
	
															<a href="#" data-action="close">
																<i class="ace-icon fa fa-times"></i>
															</a>
														</div>
													</div>
	
													<div class="widget-body">
														<div class="widget-main">
															<div>
																<span style="width:140px;display:inline-block;">Account Balance</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.accntbal}" /></span>
															</div>
	
															<div>
																<span style="width:140px;display:inline-block;">Payout Balance</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.payoutbal}" /></span>
															</div>
															
															<div>
																<span style="width:140px;display:inline-block;">Vrf Processed Count</span>
																<span style="color:#669FC7;"><c:out value="${orgdetails.vrfproccnt}" /></span>
															</div>
															
															<div>
																<span style="width:140px;display:inline-block;">Last Payout Date</span>
																<span style="color:#669FC7;"><fmt:formatDate type="both" value="${orgdetails.payoutdatelocal}" pattern="yyyy-MM-dd HH:mm"/></span>
															</div>
															
															<div>
																<span style="width:140px;display:inline-block;">Payout History</span>
																<span style="color:#669FC7;"><i>NA</i></span>
															</div>
															
														</div>
													</div>
												</div>
											</div><!-- /.span -->
										
											<div class="col-xs-12 col-sm-3">
												<div class="widget-box">
													<div class="widget-header">
														<h5 class="widget-title">Contact</h5>
	
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up"></i>
															</a>
	
															<a href="#" data-action="close">
																<i class="ace-icon fa fa-times"></i>
															</a>
														</div>
													</div>
	
													<div class="widget-body">
														<div class="widget-main">
															<form action="/admin/tasks/save" method="POST" onsubmit="Manage()">
																<input type="hidden" name="_csrf" value="token" /> 
																<input type="hidden" name="group" value="contact" /> 
																<div class="form-group">
																<div class="form-group">
																	<span style="width:85px;display:inline-block;">Title</span>
																	<input id="contacttitle" name="contactitle" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contacttitle}" />' disabled />
																	<a href="#" id="contactnamelnk" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactname'))" style="display:inline-block;"></a>
																</div>																
																	<span style="width:85px;display:inline-block;">Full Name</span>
																	<input id="contactname" name="contactname" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contactname}" />' disabled />
																	<a href="#" id="contactnamelnk" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactname'))" style="display:inline-block;"></a>
																</div>
																<div class="form-group">
																	<span style="width:85px;display:inline-block;">Phone Office</span>
																	<input id="contactphoneoffice" name="contactphoneoffice" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contactphoneoffice}" />' disabled />
																	<a href="#" id="contactphoneofficelnk" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactphoneoffice'))" style="display:inline-block;"></a>
																</div>
																<div class="form-group">
																	<span style="width:85px;display:inline-block;">Phone Mobile</span>
																	<input id="contactphonemobile" name="contactphonemobile" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contactphonemobile}" />' disabled />
																	<a href="#" id="contactphonemobilelnk" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactphonemobile'))" style="display:inline-block;"></a>
																</div>
																<div class="form-group">
																	<span style="width:85px;display:inline-block;">Email</span>
																	<input id="contactemail" name="contactemail" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contactemail}" />' disabled />
																	<a href="#" id="contactemail" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactemail'))" style="display:inline-block;"></a>
																</div>
																<div class="form-group">
																	<span style="width:85px;display:inline-block;">Designation</span>
																	<input id="contactdesignation" name="contactdesignation" type="text" style="padding:1px 1px 2px;font-size:13px;" value='<c:out value="${orgdetails.contactdesignation}" />' disabled />
																	<a href="#" id="contactdesignation" class="ui-icon ace-icon fa fa-pencil blue" onclick="toggle_edit(document.getElementById('contactdesignation'))" style="display:inline-block;"></a>
																</div>
																<div>
																	<label style="width:85px;display:inline-block;">IP</label>
																	<span style="color:#669FC7;"><c:out value="${orgdetails.contactip}" /></span>
																</div>

																<button type="button" id="contactsave" class="btn btn-sm btn-success" style="margin-left:150px;">Save Changes</button>
																	
															</form>															
														</div>
													</div>
												</div>
											</div><!-- /.span -->

										</div> <!-- row -->									
									</div> <!-- widget main --> 
								</div> <!-- widget body -->
							</div> <!-- widget box -->
						</div><!-- /.span -->					
					</c:if>											
					
					
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
		window.jQuery || document.write("<script src='/resources/js/jquery.min.js'"+"<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/resources/js/jquery1x.min.js'"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='/resources/js/jquery.mobile.custom.min.js'>" + "<"+"/script>");
	</script>
	<script src="/resources/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
	  <script src="/resources/js/excanvas.min.js"></script>
	<![endif]-->
	<script src="/resources/js/jquery-ui.custom.min.js"></script>
	<script src="/resources/js/jquery.ui.touch-punch.min.js"></script>
	<script src="/resources/js/jquery.easypiechart.min.js"></script>
	<script src="/resources/js/jquery.sparkline.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.pie.min.js"></script>
	<script src="/resources/js/flot/jquery.flot.resize.min.js"></script>

	<!-- ace scripts -->
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
			
		$("#tasks").click(function(e){
		    window.location = "/admin/tasks";
		});	

		$("#dash").click(function(e){
		    window.location = "/admin/dash";
		});	
		
		$("#support").click(function(e){
		    window.location = "/admin/support";
		});
		
		function toggle_edit (element) {
			if ( $(element).prop('disabled') )
				$(element).prop('disabled', false);
			else
				$(element).prop('disabled', true);			
		}
		
		$("#contactnamelnk").click(function(ev) {
       		ev.preventDefault();
   		});

		$("#contactnamelnk").click(function(ev) {
       		ev.preventDefault();
   		});
				
		$("#contactphoneofficelnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		
		$("#contactphonemobilelnk").click(function(ev) {
       		ev.preventDefault();
   		});

		$("#contactemaillnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		
		$("#contactdesignationlnk").click(function(ev) {
       		ev.preventDefault();
   		});
   		   		
		function Manage() {					
			var token = $('#csrfToken').val();
			var header = $('#csrfHeader').val();
			$('input[name="_csrf"]').val(token);
		}
					
		// Instantiate the Bloodhound suggestion engine		
		var orglist = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
		   	remote: {
		        url: '/admin/getOrgList?query=%QUERY',
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
		
		orglist.initialize();			
						
		$('#remote .typeahead').typeahead(null, {
		    displayKey: 'value',
		    source: orglist.ttAdapter()
		});		 
				
				
        function checkandsavedata(orgname) {
       		var target = document.getElementById('spinner');
	    	var opts = {
    	        lines:8, length:5, width:3, radius:3, corners:1,
            	rotate:0, color:'#000', speed:1, trail:60, shadow:false,
            	hwaccel:false, className:'spinner', zIndex:2e9
        	};
       		var spinner = new Spinner(opts).spin(target);	
        	
        	var request = $.ajax({url: "/checkorgname", type: "GET", data: "orgname=" + orgname});
        	request.done(function( msg ) {
				spinner.stop();
				if (msg == 'exists') {
					$.gritter.add({
						title: 'Organization details already on file!',
						text: 'Required details for your Organization are already on file. We have sent email to your official id with further instructions.',
						image: '',
						sticky: true,
						time: '',
						// (function | optional) function called after it closes
						after_close: function(e, manual_close){
							var orgname = document.getElementById('orgname');
							$('#orgname').val('');
							$('#orgname').focus();
						},						
						class_name: 'gritter-error gritter-center' + (!$('#spinner').get(0).checked ? ' gritter-dark' : '')
					});
				}
			}); 
	        request.fail(function( jqXHR, textStatus ) {
				$('spinner').data('spinner').stop();;
			});		
			
        }
				
				
				
								
		jQuery(function($) {		
		
			$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('.tab-content')
				var off1 = $parent.offset();
				var w1 = $parent.width();
		
				var off2 = $source.offset();
				//var w2 = $source.width();
		
				if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
				return 'left';
			}
		
		
			$('.dialogs,.comments').ace_scroll({
				size: 300
		    });
			
			
			//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
			//so disable dragging when clicking on label
			var agent = navigator.userAgent.toLowerCase();
			if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
			  $('#tasks').on('touchstart', function(e){
				var li = $(e.target).closest('#tasks li');
				if(li.length == 0)return;
				var label = li.find('label.inline').get(0);
				if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
			});
		
			$('#tasks').sortable({
				opacity:0.8,
				revert:true,
				forceHelperSize:true,
				placeholder: 'draggable-placeholder',
				forcePlaceholderSize:true,
				tolerance:'pointer',
				stop: function( event, ui ) {
					//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
					$(ui.item).css('z-index', 'auto');
				}
				}
			);
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
				if(this.checked) $(this).closest('li').addClass('selected');
				else $(this).closest('li').removeClass('selected');
			});
		
		
			//show the dropdowns on top or bottom depending on window height and menu position
			$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
				var offset = $(this).offset();
		
				var $w = $(window)
				if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
					$(this).addClass('dropup');
				else $(this).removeClass('dropup');
			});
		
		})
	</script>

	<!-- the following scripts are used in demo only for onpage help and you don't need them -->
	<link rel="stylesheet" href="/resources/css/ace.onpage-help.css" />
	<link rel="stylesheet" href="/resources/docs/assets/js/themes/sunburst.css" />

	<script type="text/javascript"> ace.vars['base'] = '..'; </script>
	<script src="/resources/js/ace/elements.onpage-help.js"></script>
	<script src="/resources/js/ace/ace.onpage-help.js"></script>
	<script src="/resources/docs/assets/js/rainbow.js"></script>
	<script src="/resources/docs/assets/js/language/generic.js"></script>
	<script src="/resources/docs/assets/js/language/html.js"></script>
	<script src="/resources/docs/assets/js/language/css.js"></script>
	<script src="/resources/docs/assets/js/language/javascript.js"></script>
</body>
</html>