<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>jqGrid - Ace Admin</title>

		<meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="<c:url value='/resources/images/planovik_fav.png'/>" type="image/x-icon" />

    <!--Application CSS Files-->
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" />

    <!-- page specific plugin styles -->
	<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/css/datepicker.css'/>" />		
    <link rel="stylesheet" href="<c:url value='/resources/css/ui.jqgrid.css'/>" />    

    <!-- text fonts -->
    <link rel="stylesheet" href="<c:url value='/resources/css/ace-fonts.css'/>" />

    <!-- ace styles -->
    <link rel="stylesheet" href="<c:url value='/resources/css/ace.min.css'/>" id="main-ace-style" />

	<link rel="stylesheet" href="<c:url value='/resources/css/ace-skins.min.css'/>" id="main-ace-style" />
	<link rel="stylesheet" href="<c:url value='/resources/css/ace-rtl.min.css'/>" id="main-ace-style" />
	

   	<script src="<c:url value='/resources/js/ace-extra.min.js'/>" ></script>

	</head>
	<body class="no-skin">
		<div class="navbar_signup navbar-inverse1 navbar-fixed-top">
		    <div class="loggedout_menubar">
		        <div class="navbar-header pull-left">
		            <a href="#">
		                <div class="img_logo">
		                    <img src="<c:url value='/resources/images/planovik_fav_new.png'/>" />
		                </div>
		            </a>
		        </div>
		        <div class="navbar-header navbar-toggle-admin-header">
						<H3>
							<div class="light-red">
								<%= request.getAttribute("header")%>
							</div>
						</H3>
		        </div>
		    </div>
		</div>
		<%@ include file="../app/nav.jsp" %>

			<!-- /section:basics/sidebar -->
			<div class="main-content">

				<div class="page-content">

					<div class="page-content-area">

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<table id="grid-table"></table>
								<div id="grid-pager"></div>

								<script type="text/javascript">
									var $path_base = "..";//in Ace demo this will be used for editurl parameter
								</script>

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

	   	<script src="<c:url value='/resources/js/jquery.min.js'/>" ></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	   	<script src="<c:url value='/resources/js/bootstrap.min.js'/>" ></script>

		<!-- page specific plugin scripts -->
	   	<script src="<c:url value='/resources/js/date-time/bootstrap-datepicker.min.js'/>" ></script>
	   	<script src="<c:url value='/resources/js/jqGrid/jquery.jqGrid.min.js'/>" ></script>		
	   	<script src="<c:url value='/resources/js/jqGrid/i18n/grid.locale-en.js'/>" ></script>		

		<!-- ace scripts -->
	   	<script src="<c:url value='/resources/js/ace-elements.min.js'/>" ></script>		
	   	<script src="<c:url value='/resources/js/jqGrid/i18n/grid.locale-en.js'/>" ></script>		

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
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
					height: $("#container").height(),				

				height: $("#container").height(),
				colNames:[' ', 'Id', 'CC*', 'City*', 'Hotel*', 'Stars', 'OR', 'Room*', 'From*', 'To*', 'Oper Days*', 'ConvCode', 'Grp', 'EP Sngl', 'EP Dbl', 
						  'CP Sngl', 'CP Dbl', 'MAP Sngl', 'MAP Dbl', 'AP Sngl', 'AP Dbl', 'EB', 'Mealbf', 'Mealln', 'Mealdn', 
						  'JP Sngl', 'JP Dbl', 'MJP Sngl', 'MJP Dbl', 'Remarks', 'CurCode', 'Rate', 'Misc', 'AI Sngl', 'AI Dbl', 
						  'NoTitle1', 'NoTitle2', 'NoTitle3'],
				colModel:[
					{name:'myac',index:'', width:80, fixed:true, search:false, sortable:false, resize:false,
						formatter:'actions', 
						formatoptions:{ 
							keys:true,
							//delbutton: false,//disable delete button
							
							delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
							//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
						}
					},				
					{name:'id',index:'id', width:50, search:false, sortable:false, editable: false},
					{name:'citycode',index:'citycode', search:false, width:50, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'cityname',index:'cityname', search:true, searchoptions:{sopt: ['eq','cn'] }, width:100, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'hotel',index:'hotel', search:true, searchoptions:{sopt: ['eq','cn'] }, width:200, editable:false, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'hotelstar',index:'hotelstar', search:true, searchoptions:{sopt: ['eq','cn'] }, width:60, sortable:false, editable: true},
					{name:'ourrating',index:'ourrating',width:60, search:false, sortable:false, editable: true},
					{name:'room',index:'room',width:80, search:true, searchoptions:{sopt: ['eq','cn'] }, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},
					{name:'fromdate',index:'fromdate', search:true, searchoptions:{sopt: ['eq','cn'] }, width:65, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},					
					{name:'todate',index:'todate', search:true, searchoptions:{sopt: ['eq','cn'] }, width:65, sortable:false, editable: true, editrules: {custom: true, custom_func: myCustomCheck}},					
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
			
					viewrecords : true,
					rowNum:15,
					rowList:[15,30,60],
					pager : pager_selector,
					altRows: true,					
					multiselect: true,
			        multiboxonly: true,
					shrinkToFit:false,
					forceFit:true,		
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
					
					gridComplete : function(){ 
						// Set datatype to be local and toggle based on action
					},					
			
					url: '/admin/manageserviceinfo?servicetype=${servicename}',			
					editurl: '/admin/manageserviceinfo/edit?service=${servicename}',
					datatype: 'json',
    				loadonce: false,					
					afterSubmit : function(response, postdata) {
						console.log(reponse);
						alert(response);
					}, 				
					caption:  "${servicename} information view",
						
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
			
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
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,
						editicon : 'ace-icon fa fa-pencil blue',
						add: true,
						addicon : 'ace-icon fa fa-plus-circle purple',
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
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
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
					        var needBeDisabled = $(this).find(".columns").length >= 4;
					        $(this).find(".add-rule,.add-group").each(function() {
					            $(this).prop("disabled", needBeDisabled);
					        });							
						},
						multipleSearch: true,						
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

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
	</body>
</html>
