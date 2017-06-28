<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
	<head>
		<meta charset="utf-8" />
		<title>${fns:getConfig('productName')} - Powered By DouBao</title>
		<c:set var="themeColor" value="${not empty cookie.theme.value ? cookie.theme.value : 'default'}"/>
		<c:set var="theme" value="${not empty cookie.theme.value ? cookie.theme.value : 'default'}"/>
		<c:set var="navbarMenuOption" value="${empty cookie.navbarMenuOption.value ? 'default' : cookie.navbarMenuOption.value}"/>
		<c:set var="tabmode" value="${empty cookie.tabmode.value ? '0' : cookie.tabmode.value}"/>
		<c:set var="userOption" value="${empty cookie.userOption.value ? 'default' : cookie.userOption.value}"/>
		<c:set var="searchOption" value="${empty cookie.searchOption.value ? 'default' : cookie.searchOption.value}"/>
		<c:set var="favoriteOption" value="${empty cookie.favoriteOption.value ? 'default' : cookie.favoriteOption.value}"/>
		<c:set var="layoutStyleOption" value="${empty cookie.layoutStyleOption.value ? 'square' : cookie.layoutStyleOption.value}"/>
		<c:set var="layoutOption" value="${empty cookie.layoutOption.value ? 'fluid' : cookie.layoutOption.value}"/>
		<c:set var="headerOption" value="${empty cookie.headerOption.value ? 'default' : cookie.headerOption.value}"/>
		<c:set var="headerTopDropdownStyle" value="${empty cookie.headerTopDropdownStyle.value ? 'light' : cookie.headerTopDropdownStyle.value}"/>
		<c:set var="sidebarOption" value="${empty cookie.sidebarOption.value ? 'default' : cookie.sidebarOption.value}"/>
		<c:set var="sidebarMenuOption" value="${empty cookie.sidebarMenuOption.value ? 'accordion' : cookie.sidebarMenuOption.value}"/>
		<c:set var="sidebarStyleOption" value="${empty cookie.sidebarStyleOption.value ? 'default' : cookie.sidebarStyleOption.value}"/>
		<c:set var="sidebarPosOption" value="${empty cookie.sidebarPosOption.value ? 'left' : cookie.sidebarPosOption.value}"/>
		<c:set var="footerOption" value="${empty cookie.footerOption.value ? 'default' : cookie.footerOption.value}"/>
		
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=8,IE=9,IE=10">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta content="DouBao" name="author" />
		
		<meta name="renderer" content="webkit">
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-store">
		
		<!-- BEGIN GLOBAL MANDATORY STYLES -->
		<!-- 
		<link href="${ctxAdminStatic}/common/googleapis.css" rel="stylesheet" type="text/css" />
		 -->
		<link href="${globalPluginsPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
		<!-- END GLOBAL MANDATORY STYLES -->
		
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/jquery-notific8/jquery.notific8.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
        
        <link href="${globalPluginsPath}/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/bootstrap-multiselect/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        			
		<!-- BEGIN THEME GLOBAL STYLES -->
		<link href="${globalAssetsPath}/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
		<link href="${globalAssetsPath}/css/plugins.min.css" rel="stylesheet" type="text/css" />
		<!-- END THEME GLOBAL STYLES -->
		
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link href="${globalPluginsPath}/jquery-jbox/2.3/Skins/Bootstrap/jbox.css" rel="stylesheet" />
		<c:if test="${tabmode eq '1'}">
			<link href="${globalPluginsPath}/jerichotab/css/jquery.jerichotab.css" rel="stylesheet" type="text/css" />
    	</c:if>
		<!-- END PAGE LEVEL STYLES -->
		
		<!-- BEGIN THEME LAYOUT STYLES -->
		<link href="${layoutAssetsPath}/css/layout.css" rel="stylesheet" type="text/css" />
		<link href="${layoutAssetsPath}/css/custom.css" rel="stylesheet" type="text/css" />
		<link href="${layoutAssetsPath}/css/themes/${themeColor}.css" rel="stylesheet" type="text/css" id="style_color" />
		<link href="${layoutAssetsPath}/css/themes/${themeColor}.custom.css" rel="stylesheet" type="text/css" id="custom_color"/>
		<!-- END THEME LAYOUT STYLES -->
		
		<link rel="shortcut icon" href="favicon.ico" /> 
	</head>
	<!-- END HEAD -->
	<body class="page-sidebar-closed-hide-logo page-container-bg-solid page-content-white">
        <div class="page-wrapper">
            <!-- BEGIN HEADER -->
            <div class="page-header navbar navbar-fixed-top">
                <!-- BEGIN HEADER INNER -->
                <div class="page-header-inner ">
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="${ctxAdmin}">
                            <img src="${layoutAssetsPath}/img/manage_logo180X38_site.png" alt="logo" class="logo-default" /> 
                        </a>
                        
                        <div class="menu-toggler sidebar-toggler">
                            <span></span>
                        </div>
                    </div>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                        <span></span>
                    </a>
                    <!-- END RESPONSIVE MENU TOGGLER -->

                    <!-- BEGIN MEGA MENU -->
                    <div class="hor-menu   hidden-sm hidden-xs">
                    </div>
                    <!-- END MEGA MENU -->
                    <!-- BEGIN THEME PANEL -->
	                    
                    <!-- END THEME PANEL -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
						<ul class="nav navbar-nav" id="menubar">
                        </ul>                    
                        <ul class="nav navbar-nav pull-right">
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <li class="dropdown dropdown-user"  style="display:none">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                	<c:if test="${!empty fns:getUser().photo }">
                                    	<img alt="" class="img-circle" src="${fns:getUser().photo}" />
                                    </c:if>
                                    <c:if test="${empty fns:getUser().photo }">
                                    	<img alt="" class="img-circle" src="${layoutAssetsPath}/img/avatar.png" />
                                    </c:if>
                                    <span class="username username-hide-on-mobile"> ${fns:getUser().name} </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">                
                                    <li>
                                        <a href="${ctxAdmin}/logout">
                                            <i class="fa fa-sign-out"></i> 退出 </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                            <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-quick-sidebar-toggler">
                                <a href="javascript:;" class="dropdown-toggle">
                                    <i class="icon-logout"></i>
                                </a>
                            </li>
                            <!-- END QUICK SIDEBAR TOGGLER -->
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END HEADER INNER -->
            </div>
            <!-- END HEADER -->
            <!-- BEGIN HEADER & CONTENT DIVIDER -->
            <div class="clearfix"> </div>
            <!-- END HEADER & CONTENT DIVIDER -->
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    <!-- BEGIN SIDEBAR -->
                    <div id="left" class="page-sidebar navbar-collapse collapse">
                    	<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 5px; display: block">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <li class="sidebar-toggler-wrapper hide">
                                <div class="sidebar-toggler">
                                    <span></span>
                                </div>
                            </li>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                            <!-- BEGIN SIDEBAR USER  -->
                            <li class="sidebar-user-wrapper" style="display:none">
                                <div class="pull-left image">
						          	<c:if test="${!empty fns:getUser().photo }">
                                  		<img alt="" class="img-circle" src="${fns:getUser().photo}" />
                                 	 </c:if>
                                  	<c:if test="${empty fns:getUser().photo }">
                                  		<img alt="" class="img-circle" src="${layoutAssetsPath}/img/avatar.png" />
                                 	</c:if>
						        </div>
						        <div class="pull-left info">
						          <p>${fns:getUser().name}</p>
						          <a href="${ctxAdmin}/logout"><i class="fa fa-sign-out text-success"></i> 退出 </a>
						        </div>
                            </li>
                            <!-- END SIDEBAR USER -->
   	                        <li class="sidebar-search-wrapper" style="display:none">
                                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                                <form class="sidebar-search  " action="#" method="POST">
                                    <a href="javascript:;" class="remove">
                                        <i class="icon-close"></i>
                                    </a>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <span class="input-group-btn">
                                            <a href="javascript:;" class="btn submit">
                                                <i class="icon-magnifier"></i>
                                            </a>
                                        </span>
                                    </div>
                                </form>
                                <!-- END RESPONSIVE QUICK SEARCH FORM -->
                            </li>
						</ul>
                    </div>
                    <!-- END SIDEBAR -->
                </div>
                <!-- END SIDEBAR -->
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <c:if test="${tabmode eq '0'}"> 
	                    <div id="right" class="page-content">
	                    	<!-- BEGIN PAGE BAR -->
	                        <div id="page-bar" class="page-bar">
	                            <ul class="page-breadcrumb">
	                            	<li><a href="${ctxAdmin }">首页</a></li>
	                            </ul>
	                        </div>
	                        <!-- END PAGE BAR -->
    						<!-- BEGIN CONTENT BODY -->
	                        <div class="page-content-body">
	                        	<c:if test="${!empty fns:getConfig('web.view.dashboard') }">
	                        		
	                        	</c:if>
	                        </div>
	                        <!-- END CONTENT BODY -->                   	
	                    </div>
                    </c:if>
                    <c:if test="${tabmode eq '1'}"> 
	                    <div class="divRight page-content" style="min-height: 36px;">
					  		
					  	</div>
                    </c:if>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
                <!-- BEGIN QUICK SIDEBAR -->
                <a href="javascript:;" class="page-quick-sidebar-toggler">
                    <i class="icon-login"></i>
                </a>
                <div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
                    <div class="page-quick-sidebar">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> Settings
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;" data-target="#quick_sidebar_tab_2" data-toggle="tab"> Users
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> More
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li>
                                        <a href="javascript:;" data-target="#quick_sidebar_tab_3" data-toggle="tab">
                                            <i class="icon-info"></i> Notifications </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="${ctxAdmin}/logout">
                                            <i class="fa fa-sign-out"></i> 退出 </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active page-quick-sidebar-settings" id="quick_sidebar_tab_1">
                                <div class="page-quick-sidebar-settings-list">
                                    <h3 class="list-heading">System Settings</h3>
                                    <ul class="list-items borderless">
                                    	<li class="color-${dict.value}">THEME COLOR
	                                    	<select id="themeColor" name="themeColor" class="form-control input-inline input-sm input-small">
			                                    <c:forEach items="${fns:getDictList('themecolor')}" var="dict">
			                                    	<option class="color-${dict.value}" value="${dict.value}" ${themeColor eq dict.value? 'selected' :'' }>${dict.label}</option>
			                                    </c:forEach>
		                                    </select>
                                		</li>
                                		<li> TOP MENU MODE
                                        	<select id="navbarMenuOption" name="navbarMenuOption" class="form-control input-inline input-sm input-small">
                                                <option value="closed" ${navbarMenuOption eq 'closed'? 'selected' :'' }>closed</option>
                                        		<option value="default" ${navbarMenuOption ne 'closed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>
                                		<li> USER
                                        	<select id="userOption" name="userOption" class="form-control input-inline input-sm input-small">
                                                <option value="side" ${userOption eq 'side'? 'selected' :'' }>side</option>
                                        		<option value="default" ${userOption ne 'side'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>                                        
                                		<li> SEARCH
                                        	<select id="searchOption" name="searchOption" class="form-control input-inline input-sm input-small">
                                                <option value="closed" ${searchOption eq 'closed'? 'selected' :'' }>closed</option>
                                        		<option value="default" ${searchOption ne 'closed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>                                        
                                		<li> FAVORITE
                                        	<select id="favoriteOption" name="favoriteOption" class="form-control input-inline input-sm input-small">
                                                <option value="closed" ${favoriteOption eq 'closed'? 'selected' :'' }>closed</option>
                                        		<option value="default" ${favoriteOption ne 'closed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>                                        
                                        <li> 页签模式
                                        	<select id="tabmode" name="tabmode" class="form-control input-inline input-sm input-small">
                                                <option value="1" ${tabmode eq '1'? 'selected' :'' }>开启</option>
                                        		<option value="0" ${tabmode ne '1'? 'selected' :'' }>关闭</option>
                                            </select>
                                        </li>
                                    	<li> THEME STYLE
                                        	<select id="layoutStyleOption" name="layoutStyleOption" class="form-control input-inline input-sm input-small">
                                                <option value="square" ${layoutStyleOption eq 'square'? 'selected' :'' }>Square corners</option>
                                        		<option value="rounded" ${layoutStyleOption ne 'square'? 'selected' :'' }>Rounded corners</option>
                                            </select>
                                        </li>
                                        <li> LAYOUT
                                        	<select id="layoutOption" name="layoutOption" class="form-control input-inline input-sm input-small">
                                                <option value="boxed" ${layoutOption eq 'boxed'? 'selected' :'' }>boxed</option>
                                                <option value="fluid" ${layoutOption ne 'boxed'? 'selected' :'' }>fluid</option>
                                            </select>
                                        </li>
                                        <li> HEADER
                                            <select id="headerOption" name="headerOption" class="form-control input-inline input-sm input-small">
                                                <option value="fixed" ${headerOption eq 'fixed'? 'selected' :'' }>fixed</option>
                                                <option value="default" ${headerOption ne 'fixed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>
                                        <li> TOP MENU DROPDOWN
                                            <select id="headerTopDropdownStyle" name="headerTopDropdownStyle" class="form-control input-inline input-sm input-small">
                                                <option value="light" ${headerTopDropdownStyle eq 'light'? 'selected' :'' }>light</option>
                                                <option value="dark" ${headerTopDropdownStyle ne 'light'? 'selected' :'' }>dark</option>
                                            </select>
                                        </li>
                                        <li> SIDEBAR MODE
                                            <select id="sidebarOption" name="sidebarOption" class="form-control input-inline input-sm input-small">
                                                <option value="fixed" ${sidebarOption eq 'fixed'? 'selected' :'' }>fixed</option>
                                                <option value="default" ${sidebarOption ne 'fixed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>
                                        <li> SIDEBAR MENU
                                            <select id="sidebarMenuOption" name="sidebarMenuOption" class="form-control input-inline input-sm input-small">
                                                <option value="accordion" ${sidebarMenuOption eq 'accordion'? 'selected' :'' }>accordion</option>
                                                <option value="hover" ${sidebarMenuOption ne 'accordion'? 'selected' :'' }>hover</option>
                                            </select>
                                        </li>                                        
                                        <li> SIDEBAR STYLE
                                            <select id="sidebarStyleOption" name=sidebarStyleOption class="form-control input-inline input-sm input-small">
                                                <option value="light" ${sidebarStyleOption eq 'light'? 'selected' :'' }>light</option>
                                                <option value="default" ${sidebarStyleOption ne 'light'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>
                                        <li> SIDEBAR POSITION
                                            <select id="sidebarPosOption" name=sidebarPosOption class="form-control input-inline input-sm input-small">
                                                <option value="left" ${sidebarPosOption eq 'left'? 'selected' :'' }>left</option>
                                                <option value="right" ${sidebarPosOption ne 'left'? 'selected' :'' }>right</option>
                                            </select>
                                        </li>                                        
                                        <li> FOOTER
                                            <select id="footerOption" name=footerOption class="form-control input-inline input-sm input-small">
                                                <option value="fixed" ${footerOption eq 'fixed'? 'selected' :'' }>fixed</option>
                                                <option value="default" ${footerOption ne 'fixed'? 'selected' :'' }>default</option>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane page-quick-sidebar-alerts" id="quick_sidebar_tab_2">
                                <div class="tab-pane page-quick-sidebar-chat">
                                	<div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list" data-height="626" data-initialized="1" style="overflow: hidden; width: auto; height: 626px;">
	                                    <h3 class="list-heading">Staff</h3>
	                                    <ul class="media-list list-items">
	                                        <li class="media">
	                                            <div class="media-status">
	                                                <span class="badge badge-success">8</span>
	                                            </div>
	                                            <c:if test="${!empty fns:getUser().photo }">
			                                  		<img alt="" class="media-object" src="${fns:getUser().photo}" />
			                                 	 </c:if>
			                                  	<c:if test="${empty fns:getUser().photo }">
			                                  		<img alt="" class="media-object" src="${layoutAssetsPath}/img/avatar.png" />
			                                 	</c:if>
	                                            <div class="media-body">
	                                                <h4 class="media-heading">${fns:getUser().name}</h4>
	                                            </div>
	                                        </li>
	                                    </ul>
	                                </div>
                                </div>
                            </div>
                            <div class="tab-pane page-quick-sidebar-settings" id="quick_sidebar_tab_3">
                                <div class="page-quick-sidebar-settings-list">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END QUICK SIDEBAR -->                
            </div>
            <!-- END CONTAINER -->
            
                        
            <!-- BEGIN FOOTER -->
            <div id="footer" class="page-footer">
                <div class="page-footer-inner"> ${fns:getConfig('copyrightInfo')} </div>
                <div class="scroll-to-top">
                    <i class="icon-arrow-up"></i>
                </div>
            </div>
            <!-- END FOOTER -->
        </div>
        
		
		<!--[if lt IE 9]>
		<script src="${globalPluginsPath}/respond.min.js"></script>
		<script src="${globalPluginsPath}/excanvas.min.js"></script> 
		<script src="${globalPluginsPath}/ie8.fix.min.js"></script> 
		<![endif]-->
		
		<!-- BEGIN CORE PLUGINS -->
		<script src="${globalPluginsPath}/jquery.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/js.cookie.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery.blockui.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
		<!-- END CORE PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script src="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-growl/jquery.bootstrap-growl.min.js" type="text/javascript"></script>
		
		<script src="${globalPluginsPath}/bootstrap-tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>

		<script src="${globalAssetsPath}/scripts/datatable.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
		
		<script src="${globalPluginsPath}/bootstrap-multiselect/js/bootstrap-multiselect.js" type="text/javascript"></script>
    	<script src="${globalPluginsPath}/select2/js/select2.full.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
		
		<script src="${globalPluginsPath}/jstree/dist/jstree.js" type="text/javascript"></script>
	    <script src="${globalPluginsPath}/jquery-jbox/2.3/jquery.jBox-2.3.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/mustache/mustache.min.js" type="text/javascript"></script>	
		
		<c:if test="${tabmode eq '1'}">
	    	<script src="${globalPluginsPath}/jerichotab/js/jquery.jerichotab.js" type="text/javascript"></script>
    	</c:if>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN THEME GLOBAL SCRIPTS -->
		<script src="${globalAssetsPath}/scripts/app.js" type="text/javascript"></script>
		<!-- END THEME GLOBAL SCRIPTS -->
		
		<!-- BEGIN COMMON SCRIPTS -->
		<script src="${ctxStatic}/common/taurusxsite.js" type="text/javascript"></script>
		<!-- END COMMON SCRIPTS -->
		
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<!-- END PAGE LEVEL SCRIPTS -->
		
		<!-- BEGIN THEME LAYOUT SCRIPTS -->
		<script src="${layoutAssetsPath}/scripts/layout.js" type="text/javascript"></script>
		<script src="${layoutGlobalAssetsPath}/scripts/quick-sidebar.min.js" type="text/javascript"></script>
		<script src="${layoutGlobalAssetsPath}/scripts/quick-nav.min.js" type="text/javascript"></script>
		<!-- END THEME LAYOUT SCRIPTS -->
      	<script type="text/javascript">
			$(document).ready(function() {
				var menulist = '${fns:toJson(fns:getMenuList())}';
				AppMetronicTheme.init("${ctxAdmin}", JSON.parse(menulist));
			});
		</script> 		
	</body>
</html>