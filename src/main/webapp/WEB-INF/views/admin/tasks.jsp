<%@ include file="adminheader.jsp" %>
	<%@ include file="adminnav.jsp" %>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

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


				<li class="active">
					<a id="tasks" href="/admin/tasks" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i>
						<span class="menu-text"> Tasks </span>
					</a>
				</li>
				
				<li class="">
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
						<h1>
							Organization
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								task management
							</small>
						</h1>
					</div><!-- /.page-header -->

					<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
					<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
					
					<form style="display: hidden" action="/admin/tasks/manage" method="POST" id="managepost">
					  <input type="hidden" id="id" name="id" value=""/>
					  <input type="hidden" id="subid" name="subid" value=""/>
					  <input type="hidden" id="lastupdate" name="lastupdate" value=""/>
					  <input type="hidden" id="orgidname" name="orgidname" value=""/>
					  <input type="hidden" id="status" name="status" value=""/>
					  <input type="hidden" id="code" name="code" value=""/>
					  <input type="hidden" id="assigned" name="assigned" value=""/>
					  <input type="hidden" id="remarks" name="remarks" value=""/>
					  <input type="hidden" id="remarks" name="remarks" value=""/>					  
					</form>
					
					<!--  Work area for admins-->
					<div class="row">
						<div class="col-xs-11">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
							<script type="text/javascript">
								var $path_base = "..";//in Ace demo this will be used for editurl parameter
							</script>
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

	<script src="/resources/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="/resources/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="/resources/js/jqGrid/i18n/grid.locale-en.js"></script>

	<!-- ace scripts -->
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>


	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		var grid_data;
		var URL = "/admin/tasks";
		var selectedrow;
		
		$("#tasks").click(function(e){
		    window.location = "/admin/tasks";
		});	

		$("#dash").click(function(e){
		    window.location = "/admin/dash";
		});	

		$("#manage").click(function(e){
		    window.location = "/admin/manage";
		});	
	
    			
		var subgrid_data = 
		[
		 {id:"1", name:"sub grid item 1", qty: 11},
		 {id:"2", name:"sub grid item 2", qty: 3},
		 {id:"3", name:"sub grid item 3", qty: 12},
		 {id:"4", name:"sub grid item 4", qty: 5},
		 {id:"5", name:"sub grid item 5", qty: 2},
		 {id:"6", name:"sub grid item 6", qty: 9},
		 {id:"7", name:"sub grid item 7", qty: 3},
		 {id:"8", name:"sub grid item 8", qty: 8}
		];
		
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
			
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
		    })
			//resize on sidebar collapse/expand
			var parent_column = $(grid_selector).closest('[class*="col-"]');
			$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
				if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
					//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
					setTimeout(function() {
						$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
					}, 0);
				}
		    })
		
		
		
			jQuery(grid_selector).jqGrid({
				//direction: "rtl",
		
				//subgrid options
				subGrid : false,
				//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
				//datatype: "xml",
				subGridOptions : {
					plusicon : "ace-icon fa fa-plus center bigger-110 blue",
					minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
					openicon : "ace-icon fa fa-chevron-right center orange"
				},
				//for this example we are using local data
				subGridRowExpanded: function (subgridDivId, rowId) {
					var subgridTableId = subgridDivId + "_t";
					$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
					$("#" + subgridTableId).jqGrid({
						datatype: 'local',
						data: subgrid_data,
						colNames: ['No','Item Name','Qty'],
						colModel: [
							{ name: 'id', width: 50 },
							{ name: 'name', width: 150 },
							{ name: 'qty', width: 50 }
						]
					});
				},
		
				caption: "Organization work view",
				url: URL,			
				editurl: URL + '/edit',
				datatype: 'json',
				jsonReader: { 
					repeatitems : false, 
					id: "0",
			      	root:"rows",
			      	page: "currpage",
			      	total: "totalpages",
			      	records: "totalrecords"					
				},
				afterSubmit : function(response, postdata) {
					alert(response);
				}, 				
				height: 290,
				colNames:['Id', 'SubId', 'Last Update','Org Id Name', 'Status', 'Code', 'Assigned','Remarks'],
				colModel:[
					{name:'id',index:'id', width:20, sorttype:"int", editable: false},
					{name:'subid',index:'subid', width:12, sorttype:"int", editable: false},
					{name:'lastupdate',index:'lastupdate',width:30, editable:false, sorttype:"date",unformat: pickDate},
					{name:'orgidname',index:'orgidname', width:80, sorttype:"text", editable: false},					
					{name:'status',index:'status', sorttype:"text", width:20, editable: true,edittype:"select",editoptions: {value:"0:Open;1:Closed;2:Locked"}},
					{name:'code',index:'code', sorttype:"text", width:30, editable: true, edittype:"select", editoptions: {value:"0:VERIFY_NEW_ORG;1:NEW_ORG_VERIFIED;2:ENABLE_ORG_FOR_ACTIVITY;3:AWAITING_ORG_CONFIRMATION;4:ORG_DETAILS_VERIFIED;5:ORG_SUSPENDED"}}, 
					{name:'assigned',index:'assigned', sorttype:"int", width:20, editable: true,editoptions:{size:"40",maxlength:"20"}},
					{name:'remarks',index:'remarks', width:60, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"1",cols:"28"}} 
				], 
		
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,30],
				pager : pager_selector,
				loadonce: true,
				altRows: true,
				//toppager: true,
				
				multiselect: false,
				//multikey: "ctrlKey",
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				},
				onSelectRow: function(rowid) {
  				  selectedrow = $(this).getLocalRow(rowid);
    			  // do something with row
				},
				
				//,autowidth: true,
		
		
				/**
				,
				grouping:true, 
				groupingView : { 
					 groupField : ['name'],
					 groupDataSorted : true,
					 plusicon : 'fa fa-chevron-down bigger-110',
					 minusicon : 'fa fa-chevron-up bigger-110'
				},
				caption: "Grouping"
				*/
		
			});
			$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
			
			
		
			//enable search/filter toolbar
			//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			//jQuery(grid_selector).filterToolbar({});
		
		
			//switch element when editing inline
			function aceSwitch( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			function pickDate( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=text]')
							.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
				}, 0);
			}
		
		
			//navButtons
			jQuery(grid_selector)		
			.jqGrid('navGrid',pager_selector,
				{ 	//navbar options
					add: false,
					addicon : 'ace-icon fa fa-plus-circle purple',			
					edit: true,
					editicon : 'ace-icon fa fa-pencil blue',
					del: true,
					delicon : 'ace-icon fa fa-trash-o red',
					search: true,
					searchicon : 'ace-icon fa fa-search orange',
					refresh: true,
					refreshicon : 'ace-icon fa fa-refresh green',
					view: true,
					viewicon : 'ace-icon fa fa-search-plus grey',
				},
				{
					//edit record form
					closeAfterEdit: true,
					width: 400,
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//delete record form
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						if(form.data('styled')) return false;
						
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_delete_form(form);
						
						form.data('styled', true);
					},
					onClick : function(e) {
						alert(1);
					}
				},
				{
					//search form
					recreateForm: true,
					afterShowSearch: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						style_search_form(form);
					},
					afterRedraw: function(){
						style_search_filters($(this));
					}
					,
					multipleSearch: true,
					/**
					multipleGroup:true,
					showQuery: true
					*/
				},
				{
					//view record form
					recreateForm: true,
					beforeShowForm: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					}
				}
			)
			.navButtonAdd(pager_selector,
				{
				   title:"Manage selected row",
				   caption:"",
				   buttonicon:"menu-icon fa fa-desktop", 
				   onClickButton: function(){ 
			          var grid = $(grid_selector);
			          var rowid = grid.jqGrid('getGridParam', 'selrow');
			          // window.location = grid.jqGrid('getCell', rowid, 'dataUrl');
			          if (rowid === null)
			          	custom_button_alrt();
			          else
			          	gotoManage();	   		   
				   }, 
				   position:"first"
				});
			
			// Required to support csrf    
		  	$.ajaxSetup({
        		beforeSend: function (jqXHR, settings) {
           		jqXHR.setRequestHeader(header, token);            
      	  	}});
			
			
			function gotoManage() {								 
				$("#id").val(selectedrow.id);
				$("#subid").val(selectedrow.subid);								 
				$("#lastupdate").val(selectedrow.lastupdate);
				$("#orgidname").val(selectedrow.orgidname);								 
				$("#status").val(selectedrow.status);
				$("#code").val(selectedrow.code);								 
				$("#assigned").val(selectedrow.assigned);
				$("#remarks").val(selectedrow.remarks);		       	
				
				var a=$('#managepost').serialize();
		         $.ajax({
		                url: '/admin/tasks/manage',
		                type: 'post',
					    data:a,
					    beforeSend:function (jqXHR, settings) {
			           		jqXHR.setRequestHeader(header, token);            
	  					},
	  					success: function(data) {
				       		window.location.href = '/admin/manage';
				       }  
		         });			    
			}
			
			
			function custom_button_alrt () {
				var alertIDs = {themodal:'alertmod',modalhead:'alerthd',modalcontent:'alertcnt'};
				if ($("#"+alertIDs.themodal).html() === null || $("#"+alertIDs.themodal).html() === undefined) {
				    $.jgrid.createModal(alertIDs,"<div>"+$.jgrid.nav.alerttext+
				        "</div><span tabindex='0'><span tabindex='-1' id='jqg_alrt'></span></span>",
				        {gbox:"#gbox_"+$.jgrid.jqID(grid_selector),jqModal:true,drag:true,resize:true,
				        caption:$.jgrid.nav.alertcap,
				        top:document.body.clientHeight/2,left:document.body.clientWidth/2,width:200,height: 80,closeOnEscape:true,
				        zIndex: null},"","",true);
				}
				$.jgrid.viewModal("#"+alertIDs.themodal,
				    {gbox:"#gbox_"+$.jgrid.jqID(grid_selector),jqm:true});
				$("#jqg_alrt").focus();			
			}
				
			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					.end().find('input[name=stock]')
						.addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
						   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
						  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
		
				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
				buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
				
				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').hide();
				buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
				buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
			}
		
			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
			}
			
			function style_search_filters(form) {
				form.find('.delete-rule').val('X');
				form.find('.add-rule').addClass('btn btn-xs btn-primary');
				form.find('.add-group').addClass('btn btn-xs btn-success');
				form.find('.delete-group').addClass('btn btn-xs btn-danger');
			}
			function style_search_form(form) {
				var dialog = form.closest('.ui-jqdialog');
				var buttons = dialog.find('.EditTable')
				buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
				buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
			}
			
			function beforeDeleteCallback(e) {
			
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			}
			
			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		
		
		
			//it causes some flicker when reloading or navigating grid
			//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
			//or go back to default browser checkbox styles for the grid
			function styleCheckbox(table) {
			/**
				$(table).find('input:checkbox').addClass('ace')
				.wrap('<label />')
				.after('<span class="lbl align-top" />')
		
		
				$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
				.find('input.cbox[type=checkbox]').addClass('ace')
				.wrap('<label />').after('<span class="lbl align-top" />');
			*/
			}
			
		
			//unlike navButtons icons, action icons in rows seem to be hard-coded
			//you can change them like this in here if you want
			function updateActionIcons(table) {
				/**
				var replacement = 
				{
					'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
					'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
					'ui-icon-disk' : 'ace-icon fa fa-check green',
					'ui-icon-cancel' : 'ace-icon fa fa-times red'
				};
				$(table).find('.ui-pg-div span.ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
				*/
			}
			
			//replace icons with FontAwesome icons like above
			function updatePagerIcons(table) {
				var replacement = 
				{
					'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
					'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
					'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
					'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
				};
				$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
			}
		
			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({container:'body'});
				$(table).find('.ui-pg-div').tooltip({container:'body'});
			}
		
			//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
		
			$(document).on('ajaxloadstart', function(e) {
				$(grid_selector).jqGrid('GridUnload');
				$('.ui-jqdialog').remove();
			});
		});
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