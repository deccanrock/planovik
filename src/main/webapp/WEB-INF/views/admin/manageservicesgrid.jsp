<%@ include file="header.jsp" %>
	<%@ include file="../app/nav.jsp" %>

		<div class="main-content">
			<!-- #section:basics/content.breadcrumbs -->

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content" style="padding: 6px 5px 0px;">
				<!-- #section:settings.box -->

				<!-- /section:settings.box -->
				<div class="page-content-area">

					<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
					<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
					
					<form style="display: hidden" action="/app/tasks/manage" method="POST" id="managepost">
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
						<div class="col-xs-12">
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

	<script src="/resources/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="/resources/js/jqGrid/i18n/grid.locale-en.js"></script>


	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		var grid_data;
		var selectedrow;
		
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

			function GetLastRowId() {
				var lastrow = $(grid_selector).find(">tbody>tr.jqgrow").filter(":last");
				var lastrowid = lastrow.attr('Id');
				if (typeof lastrowid == 'undefined') {
					 alert("undefined");
					 lastrowid = 20;
				}
				else {
					lastrowid = lastrow.attr('Id');
					alert(lastrowid);
				}				
				
				return lastrowid;					
			}
					
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
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
				caption: "${servicename} information view",
				url: '/admin/manageserviceinfo?servicetype=${servicename}',			
				editurl: '/admin/manageserviceinfo/edit?service=${servicename}',
				datatype: 'json',
				beforeSubmit : function(response, postdata) {
					console.log(reponse);
					alert(response);
				}, 				
				afterSubmit : function(response, postdata) {
					console.log(reponse);
					alert(response);
				}, 				
				height: $("#container").height(),
				colNames:['Id', 'CC*', 'City*', 'Hotel*', 'Stars', 'OR', 'Room*', 'From*', 'To*', 'Oper Days*', 'ConvCode', 'Grp', 'EP Sngl', 'EP Dbl', 
						  'CP Sngl', 'CP Dbl', 'MAP Sngl', 'MAP Dbl', 'AP Sngl', 'AP Dbl', 'EB', 'Mealbf', 'Mealln', 'Mealdn', 
						  'JP Sngl', 'JP Dbl', 'MJP Sngl', 'MJP Dbl', 'Remarks', 'CurCode', 'Rate', 'Misc', 'AI Sngl', 'AI Dbl', 
						  'NoTitle1', 'NoTitle2', 'NoTitle3'],
				colModel:[
					{name:'id',index:'id', width:50, search:false, sortable:false, editable: false},
					{name:'citycode',index:'citycode', search:false, width:50, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'cityname',index:'cityname', searchoptions:{sopt: ['eq','cn'] }, width:100, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'hotel',index:'hotel', searchoptions:{sopt: ['eq','cn'] }, width:200, editable:false, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'stars',index:'stars',width:60, search:false, sortable:false, editable: true},
					{name:'or',index:'or',width:60, search:false, sortable:false, editable: true},
					{name:'room',index:'room',width:80, search:false, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'fromdate',index:'fromdate', search:false, width:65, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},					
					{name:'todate',index:'todate', search:false, width:65, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},					
					{name:'operdays',index:'operdays', search:false, width:50, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},					
					{name:'convcode',index:'convcode', search:false, width:40, sortable:false, editable: true},					
					{name:'grp',index:'grp', search:false, width:40, sortable:false, editable: true},					
					{name:'epsngl',index:'epsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'epdbl',index:'epdbl', search:false, width:60, sortable: false, editable: true},					
					{name:'cpsngl',index:'cpsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'cpdbl',index:'cpdbl', search:false, width:60, sortable: false, editable: true},					
					{name:'mapsngl',index:'mapsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'mapdbl',index:'mapdbl', search:false, width:60, sortable: false, editable: true},					
					{name:'apsngl',index:'apsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'apdbl',index:'apdbl', search:false, width:60, sortable: false, editable: true},				
					{name:'eb',index:'eb', search:false, width:60, sortable: false, editable: true},				
					{name:'mealbf',index:'mealbf', search:false, width:60, sortable: false, editable: true},				
					{name:'mealln',index:'mealln', search:false, width:60, sortable: false, editable: true},				
					{name:'mealdn',index:'mealdn', search:false, width:60, sortable: false, editable: true},				
					{name:'jpsngl',index:'jpsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'jpdbl',index:'jpdbl', search:false, width:60, sortable: false, editable: true},				
					{name:'mjpsngl',index:'mjpsngl', search:false, width:60, sortable: false, editable: true},					
					{name:'mjpdbl',index:'mjpdbl', search:false, width:60, sortable: false, editable: true},				
					{name:'spnoting',index:'spnoting', search:false, width:300, sortable:false, editable: true,edittype:"textarea", editoptions:{rows:"1",cols:"28"}}, 
					{name:'currcode',index:'currcode', search:false, width:40, sortable: false, editable: true},				
					{name:'rate',index:'rate', search:false, width:40, sortable: false, editable: true},				
					{name:'misc',index:'misc', search:false, width:40, sortable: false, editable: true},				
					{name:'aisngl',index:'aisngl', search:false, width:60, sortable: false, editable: true},					
					{name:'aidbl',index:'aidbl', search:false, width:60, sortable: false, editable: true},				
					{name:'notitle1',index:'notitle1', search:false, width:50, sortable: false, editable: true},				
					{name:'notitle2',index:'notitle2', search:false, width:50, sortable: false, editable: true},				
					{name:'notitle3',index:'notitle3', search:false, width:50, sortable: false, editable: true}				
				], 
		
				rowNum:15,
				rowList:[15,30,60],
				pager : pager_selector,
			    autoencode: true,
			    sortable: true,
			    sortname: "id",
			    altRows: true,
				//toppager: true,
				viewrecords: true,
				multipleSearch:true,
				multiselect: false,
				//multikey: "ctrlKey",
		        multiboxonly: true,
		        closeAfterAdd: true,
		        closeAfterEdit: true,
				checkOnSubmit: true,
				loadComplete : function() {
					var table = this;

					var postdata = $(grid_selector).jqGrid('getGridParam','postData');
					postdata._search = 'false';
					//postdata.searchField = "";
					//postdata.searchOper = "";
					//postdata.searchString = "";
    				
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
				
				shrinkToFit:false,
				forceFit:true,		
		
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
					add: true,
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
					width: 500,
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
						alert("Delete clicked");
					}
				},
				{
					//search form
					recreateForm: true,
					beforeShowSearch: function(e){
						var form = $(e[0]);
				        $('.ui-search',form).click(function(){
				            alert("in onSearch");
				        });
				        $('.ui-reset',form).click(function(){
				            alert("in onReset");
				        });					
					},					
					afterShowSearch: function(e){
			            alert("afterShowSearch");
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
			
			function myCustomCheck (value, colname) {		
                    // validate the fields here
                if (colname === "CC*"  || colname === "City*" || colname === "Hotel*"  || colname === "Room*"  || colname === "From*" || 
                	colname === "To*"  || colname === "Oper Days*" ) {

                	if  (value === "")
						return [false, "Fields marked * cannot be left blank."];
	            } 
	            else
    	            return [true];
    	            
    	        return [true];
                
                // return [false, "Fields cannot be left blank."];
			}
			
			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
			}
			

			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.end().find('input[name=grp]')
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

</body>
</html>