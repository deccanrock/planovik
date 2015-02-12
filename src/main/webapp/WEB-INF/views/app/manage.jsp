<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

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
					<a id="dash" href="/app/dash">
						<i class="menu-icon fa fa-tachometer"></i>
						<span class="menu-text"> Dashboard </span>
					</a>

					<b class="arrow"></b>
				</li>


				<li>
					<a id="tasks" href="/app/itineraries" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i>
						<span class="menu-text"> Itineraries </span>
					</a>
				</li>
				
				<li  class="active">
					<a id="manage" href="/app/manage" class="dropdown-toggle">
						<i class="menu-icon fa fa-pencil-square-o"></i>
						<span class="menu-text"> Manage </span>
					</a>
				</li>				

				<li class="">
					<a id="support" href="/app/support" class="dropdown-toggle">
						<i class="menu-icon fa fa-desktop"></i>
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
							Itinerary
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								manage
							</small>
						</h1>
						
						<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
						<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
						
					</div><!-- /.page-header -->
					<c:if test="${not empty error}">
						<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
							</button>
							<strong><i class="ace-icon fa fa-times"></i></strong>
							${error}
						</div>										
					</c:if>			

					<div class="row" style="width:35%;margin-left:30px;margin-top:30px;" \>
						<div class="widget-box"> 
								<div class="widget-header">
									<h4 class="widget-title">Create itinerary, Enter name:</h4>
									<span style="font-size:small;">(15 characters or less)</span>
								</div>																		
								<div class="widget-body">
									<div class="widget-main no-padding">
										<form:form id="manageitin-form" action="/app/manage" method="POST" modelAttribute="itinerary" name="itinerary" onsubmit="Manage()">
										<input type="hidden" name="_csrf" value="token" /> 
											<fieldset>
												<div id="remote">
													<form:input path="name" type="text" name="name" style="width:100%" />
												</div>
												<form:input type="hidden" id="mode" path="mode" />
												<form:input type="hidden" id="tzoffset" path="tzoffset"/>			
											</fieldset>
												<div style="margin-left:60%;margin-bottom:2%;">
													<input type="submit" id="itincreate" path="itincreate" name="submit" value="Create" class="btn btn-sm btn-success" />
												</div>
										</form:form>
									</div>
								 </div>
						</div>
						
						<div class="space-12"></div>

						<div class="widget-box"> 
								<div class="widget-header">
									<h4 class="widget-title">Edit itinerary, Enter name or number:</h4>
								</div>																		
								<div class="widget-body">
									<div class="widget-main no-padding">
										<form:form id="manageitin-form" action="/app/manage" method="POST" modelAttribute="itinerary" name="itinerary" onsubmit="Manage()">
										<input type="hidden" name="_csrf" value="token" /> 
											<fieldset>
												<div id="remote">
													<form:input path="name" class="typeahead scrollable" type="text" id="name" name="name" style="width:100%" />
												</div>			
												<form:input type="hidden" id="mode" path="mode" />
											</fieldset>
												<div style="margin-left:60%;margin-bottom:2%;">
													<input type="submit" id="itinedit" path="itinedit" name="submit" value="Edit" class="btn btn-sm btn-success" />
												</div>
										</form:form>
									</div>
								 </div>
						</div>

						</div>					
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
	        	
		$(":submit").live('click', function() {
		    $('#mode').val($(this).val());
            var d = new Date();
            $('#tzoffset').val(d.getTimezoneOffset());  
		}); 
			
		$("#itineraries").click(function(e){
		    window.location = "/app/itineraries";
		});	

		$("#dash").click(function(e){
		    window.location = "/app/dash";
		});	
		
		$("#support").click(function(e){
		    window.location = "/app/support";
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
		var itinlist = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
		   	remote: {
		        url: '/app/getItinList?query=%QUERY',
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
		
		itinlist.initialize();			
						
		$('#remote .typeahead').typeahead(null, {
		    displayKey: 'value',
		    source: itinlist.ttAdapter()
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
			  $('#itineraries').on('touchstart', function(e){
				var li = $(e.target).closest('#tasks li');
				if(li.length == 0)return;
				var label = li.find('label.inline').get(0);
				if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
			});
		
			$('#itineraries').sortable({
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
			$('#itineraries').disableSelection();
			$('#itineraries input:checkbox').removeAttr('checked').on('click', function(){
				if(this.checked) $(this).closest('li').addClass('selected');
				else $(this).closest('li').removeClass('selected');
			});
		
		
			//show the dropdowns on top or bottom depending on window height and menu position
			$('#itineraries-tab .dropdown-hover').on('mouseenter', function(e) {
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