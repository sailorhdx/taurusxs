<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${ctxStatic}/metronic/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctxStatic}/metronic/assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="${ctxStatic}/metronic/assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <script type="text/javascript"  src="http://api.map.baidu.com/api?v=1.5&ak=FO2FQeSOoqNY2o8tSFsxGsbD6HP0C0uL&callback=initialize"></script>

    <!-- BEGIN PAGE TITLE-->
    <h1 class="page-title"> Admin Dashboard
        <small>statistics, charts, recent events and reports</small>
    </h1>
    <!-- END PAGE TITLE-->
    <!-- BEGIN DASHBOARD STATS 1-->
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-v2 blue" href="#">
                <div class="visual">
                    <i class="fa fa-comments"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <span data-counter="counterup" data-value="1349">0</span>
                    </div>
                    <div class="desc"> New Feedbacks </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-v2 red" href="#">
                <div class="visual">
                    <i class="fa fa-bar-chart-o"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <span data-counter="counterup" data-value="12,5">0</span>M$ </div>
                    <div class="desc"> Total Profit </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-v2 green" href="#">
                <div class="visual">
                    <i class="fa fa-shopping-cart"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <span data-counter="counterup" data-value="549">0</span>
                    </div>
                    <div class="desc"> New Orders </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number"> +
                        <span data-counter="counterup" data-value="89"></span>% </div>
                    <div class="desc"> Brand Popularity </div>
                </div>
            </a>
        </div>
    </div>
    <div class="clearfix"></div>
    <!-- END DASHBOARD STATS 1-->
    <div class="row">
   		<div class="col-lg-6 col-xs-12 col-sm-12">
   		 	<div class="portlet box2 blue bordered">
		        <div class="portlet-title with-border">
		            <div class="caption">
	                    <i class="icon-bar-chart"></i>Site Visits
	                    <span class="caption-helper">weekly stats...</span>
	                </div>
		            <div class="tools">
		                <a href="javascript:;" class="collapse"> </a>
		                <a href="#portlet-config" data-toggle="modal" class="config"> </a>
		                <a href="javascript:;" class="reload"> </a>
		                <a href="" class="fullscreen"> </a>
		                <a href="javascript:;" class="remove"> </a>
		            </div>
		            <div class="actions">
	                   <a href="javascript:;" class="btn btn-default btn-sm">
	                       <i class="fa fa-pencil"></i> Edit </a>
	                   <div class="btn-group">
	                       <a class="btn btn-default btn-sm" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
	                           <i class="fa fa-user"></i> User
	                           <i class="fa fa-angle-down"></i>
	                       </a>
	                       <ul class="dropdown-menu pull-right">
	                           <li>
	                               <a href="javascript:;">
	                                   <i class="fa fa-pencil"></i> Edit </a>
	                           </li>
	                           <li>
	                               <a href="javascript:;">
	                                   <i class="fa fa-trash-o"></i> Delete </a>
	                           </li>
	                           <li>
	                               <a href="javascript:;">
	                                   <i class="fa fa-ban"></i> Ban </a>
	                           </li>
	                           <li class="divider"> </li>
	                           <li>
	                               <a href="javascript:;"> Make admin </a>
	                           </li>
	                       </ul>
	                   </div>
	               </div>
		        </div>
		        <div class="portlet-body">
		          	<div id="site_statistics_loading">
	                  	<img src="${ctxStatic}/metronic/assets/global/img/loading.gif" alt="loading" /> </div>
              		<div id="site_statistics_content" class="display:none">
                  		<div id="site_statistics" class="chart" style="height: 300px;"> </div>
              		</div>
		        </div>
		    </div>
   		</div>
   		<div class="col-lg-6 col-xs-12 col-sm-12">
   			<div class="portlet box2 red">
		        <div class="portlet-title with-border">
		             <div class="caption">
	                    <i class="icon-share font-red-sunglo hide"></i>Revenue
	                    <span class="caption-helper">monthly stats...</span>
	                </div>
		            <div class="tools">
		                <a href="javascript:;" class="collapse"> </a>
		                <a href="#portlet-config" data-toggle="modal" class="config"> </a>
		                <a href="javascript:;" class="reload"> </a>
		                <a href="" class="fullscreen"> </a>
		                <a href="javascript:;" class="remove"> </a>
		            </div>
		            <div class="actions">
	                  <div class="btn-group">
	                      <a href="" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="false"> Filter Range
	                          <span class="fa fa-angle-down"> </span>
	                      </a>
	                      <ul class="dropdown-menu pull-right">
	                          <li>
	                              <a href="javascript:;"> Q1 2014
	                                  <span class="label label-sm label-default"> past </span>
	                              </a>
	                          </li>
	                          <li>
	                              <a href="javascript:;"> Q2 2014
	                                  <span class="label label-sm label-default"> past </span>
	                              </a>
	                          </li>
	                          <li class="active">
	                              <a href="javascript:;"> Q3 2014
	                                  <span class="label label-sm label-success"> current </span>
	                              </a>
	                          </li>
	                          <li>
	                              <a href="javascript:;"> Q4 2014
	                                  <span class="label label-sm label-warning"> upcoming </span>
	                              </a>
	                          </li>
	                      </ul>
	                  </div>
	              </div>
		        </div>
	        	<div class="portlet-body">
		        	<div id="site_activities_loading">
	                    <img src="${ctxStatic}/metronic/assets/global/img/loading.gif" alt="loading" /> </div>
	                <div id="site_activities_content" class="display:none">
	                    <div id="site_activities" style="height: 228px;"> </div>
	                </div>
	                <div style="margin: 20px 0 10px 30px">
	                    <div class="row">
	                        <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
	                            <span class="label label-sm label-success"> Revenue: </span>
	                            <h3>$13,234</h3>
	                        </div>
	                        <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
	                            <span class="label label-sm label-info"> Tax: </span>
	                            <h3>$134,900</h3>
	                        </div>
	                        <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
	                            <span class="label label-sm label-danger"> Shipment: </span>
	                            <h3>$1,134</h3>
	                        </div>
	                        <div class="col-md-3 col-sm-3 col-xs-6 text-stat">
	                            <span class="label label-sm label-warning"> Orders: </span>
	                            <h3>235090</h3>
	                        </div>
	                    </div>
	                </div>
	      		</div>
	     	</div>
   		</div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-xs-12 col-sm-12">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-share font-dark hide"></i>
                        <span class="caption-subject font-dark bold uppercase">Recent Activities</span>
                    </div>
                    <div class="actions">
                    	<div class="btn-group btn-group-devided" data-toggle="buttons">
                            <label class="btn red btn-outline btn-circle btn-sm active">
                                <input type="radio" name="options" class="toggle" id="option1">New</label>
                            <label class="btn red btn-outline btn-circle btn-sm">
                                <input type="radio" name="options" class="toggle" id="option2">Returning</label>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-sm blue btn-outline btn-circle" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Filter By
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                                <label class="mt-checkbox mt-checkbox-outline">
                                    <input type="checkbox" /> Finance
                                    <span></span>
                                </label>
                                <label class="mt-checkbox mt-checkbox-outline">
                                    <input type="checkbox" checked="" /> Membership
                                    <span></span>
                                </label>
                                <label class="mt-checkbox mt-checkbox-outline">
                                    <input type="checkbox" /> Customer Support
                                    <span></span>
                                </label>
                                <label class="mt-checkbox mt-checkbox-outline">
                                    <input type="checkbox" checked="" /> HR
                                    <span></span>
                                </label>
                                <label class="mt-checkbox mt-checkbox-outline">
                                    <input type="checkbox" /> System
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible="0">
                        <ul class="feeds">
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-info">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 4 pending tasks.
                                                <span class="label label-sm label-warning "> Take action
                                                    <i class="fa fa-share"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> Just now </div>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <div class="col1">
                                        <div class="cont">
                                            <div class="cont-col1">
                                                <div class="label label-sm label-success">
                                                    <i class="fa fa-bar-chart-o"></i>
                                                </div>
                                            </div>
                                            <div class="cont-col2">
                                                <div class="desc"> Finance Report for year 2013 has been released. </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col2">
                                        <div class="date"> 20 mins </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-danger">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 24 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-info">
                                                <i class="fa fa-shopping-cart"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> New order received with
                                                <span class="label label-sm label-success"> Reference Number: DR23923 </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 30 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-success">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 24 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-default">
                                                <i class="fa fa-bell-o"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> Web server hardware needs to be upgraded.
                                                <span class="label label-sm label-default "> Overdue </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 2 hours </div>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <div class="col1">
                                        <div class="cont">
                                            <div class="cont-col1">
                                                <div class="label label-sm label-default">
                                                    <i class="fa fa-briefcase"></i>
                                                </div>
                                            </div>
                                            <div class="cont-col2">
                                                <div class="desc"> IPO Report for year 2013 has been released. </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col2">
                                        <div class="date"> 20 mins </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-info">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 4 pending tasks.
                                                <span class="label label-sm label-warning "> Take action
                                                    <i class="fa fa-share"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> Just now </div>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <div class="col1">
                                        <div class="cont">
                                            <div class="cont-col1">
                                                <div class="label label-sm label-danger">
                                                    <i class="fa fa-bar-chart-o"></i>
                                                </div>
                                            </div>
                                            <div class="cont-col2">
                                                <div class="desc"> Finance Report for year 2013 has been released. </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col2">
                                        <div class="date"> 20 mins </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-default">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 24 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-info">
                                                <i class="fa fa-shopping-cart"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> New order received with
                                                <span class="label label-sm label-success"> Reference Number: DR23923 </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 30 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-success">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 24 mins </div>
                                </div>
                            </li>
                            <li>
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div class="label label-sm label-warning">
                                                <i class="fa fa-bell-o"></i>
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc"> Web server hardware needs to be upgraded.
                                                <span class="label label-sm label-default "> Overdue </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                    <div class="date"> 2 hours </div>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <div class="col1">
                                        <div class="cont">
                                            <div class="cont-col1">
                                                <div class="label label-sm label-info">
                                                    <i class="fa fa-briefcase"></i>
                                                </div>
                                            </div>
                                            <div class="cont-col2">
                                                <div class="desc"> IPO Report for year 2013 has been released. </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col2">
                                        <div class="date"> 20 mins </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="scroller-footer">
                        <div class="btn-arrow-link pull-right">
                            <a href="javascript:;">See All Records</a>
                            <i class="icon-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-12 col-sm-12">
            <div class="portlet light tasks-widget bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-share font-dark hide"></i>
                        <span class="caption-subject font-dark bold uppercase">Tasks</span>
                        <span class="caption-helper">tasks summary...</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group">
                            <a class="btn blue-oleo btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> More
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:;"> All Project </a>
                                </li>
                                <li class="divider"> </li>
                                <li>
                                    <a href="javascript:;"> AirAsia </a>
                                </li>
                                <li>
                                    <a href="javascript:;"> Cruise </a>
                                </li>
                                <li>
                                    <a href="javascript:;"> HSBC </a>
                                </li>
                                <li class="divider"> </li>
                                <li>
                                    <a href="javascript:;"> Pending
                                        <span class="badge badge-danger"> 4 </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;"> Completed
                                        <span class="badge badge-success"> 12 </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;"> Overdue
                                        <span class="badge badge-warning"> 9 </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="task-content">
                        <div class="scroller" style="height: 312px;" data-always-visible="1" data-rail-visible1="1">
                            <!-- START TASK LIST -->
                            <ul class="task-list">
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Present 2013 Year IPO Statistics at Board Meeting </span>
                                        <span class="label label-sm label-success">Company</span>
                                        <span class="task-bell">
                                            <i class="fa fa-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Hold An Interview for Marketing Manager Position </span>
                                        <span class="label label-sm label-danger">Marketing</span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> AirAsia Intranet System Project Internal Meeting </span>
                                        <span class="label label-sm label-success">AirAsia</span>
                                        <span class="task-bell">
                                            <i class="fa fa-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Technical Management Meeting </span>
                                        <span class="label label-sm label-warning">Company</span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Kick-off Company CRM Mobile App Development </span>
                                        <span class="label label-sm label-info">Internal Products</span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Prepare Commercial Offer For SmartVision Website Rewamp </span>
                                        <span class="label label-sm label-danger">SmartVision</span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Sign-Off The Comercial Agreement With AutoSmart </span>
                                        <span class="label label-sm label-default">AutoSmart</span>
                                        <span class="task-bell">
                                            <i class="fa fa-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group dropup">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Company Staff Meeting </span>
                                        <span class="label label-sm label-success">Cruise</span>
                                        <span class="task-bell">
                                            <i class="fa fa-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group dropup">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="last-line">
                                    <div class="task-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="checkboxes" value="1" />
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> KeenThemes Investment Discussion </span>
                                        <span class="label label-sm label-warning">KeenThemes </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="task-config-btn btn-group dropup">
                                            <a class="btn btn-sm default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                <i class="fa fa-cog"></i>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-check"></i> Complete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Cancel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <!-- END START TASK LIST -->
                        </div>
                    </div>
                    <div class="task-footer">
                        <div class="btn-arrow-link pull-right">
                            <a href="javascript:;">See All Records</a>
                            <i class="icon-arrow-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-xs-12 col-sm-12">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-cursor font-dark hide"></i>
                        <span class="caption-subject font-dark bold uppercase">General Stats</span>
                    </div>
                    <div class="actions">
                        <a href="javascript:;" class="btn btn-sm btn-circle red easy-pie-chart-reload">
                            <i class="fa fa-repeat"></i> Reload </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="easy-pie-chart">
                                <div class="number transactions" data-percent="55">
                                    <span>+55</span>% </div>
                                <a class="title" href="javascript:;"> Transactions
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="margin-bottom-10 visible-sm"> </div>
                        <div class="col-md-4">
                            <div class="easy-pie-chart">
                                <div class="number visits" data-percent="85">
                                    <span>+85</span>% </div>
                                <a class="title" href="javascript:;"> New Visits
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="margin-bottom-10 visible-sm"> </div>
                        <div class="col-md-4">
                            <div class="easy-pie-chart">
                                <div class="number bounce" data-percent="46">
                                    <span>-46</span>% </div>
                                <a class="title" href="javascript:;"> Bounce
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-12 col-sm-12">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-equalizer font-dark hide"></i>
                        <span class="caption-subject font-dark bold uppercase">Server Stats</span>
                        <span class="caption-helper">monthly stats...</span>
                    </div>
                    <div class="tools">
                        <a href="" class="collapse"> </a>
                        <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                        <a href="" class="reload"> </a>
                        <a href="" class="remove"> </a>
                        <a class="fullscreen" data-container="false" data-placement="bottom" href="javascript:;"> </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row" style="height:100%">
                        <div class="col-md-4">
                            <div class="sparkline-chart">
                                <div class="number" id="sparkline_bar5"></div>
                                <a class="title" href="javascript:;"> Network
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="margin-bottom-10 visible-sm"> </div>
                        <div class="col-md-4">
                            <div class="sparkline-chart">
                                <div class="number" id="sparkline_bar6"></div>
                                <a class="title" href="javascript:;"> CPU Load
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="margin-bottom-10 visible-sm"> </div>
                        <div class="col-md-4">
                            <div class="sparkline-chart">
                                <div class="number" id="sparkline_line"></div>
                                <a class="title" href="javascript:;"> Load Rate
                                    <i class="icon-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="row">
        <div class="col-lg-6 col-xs-12 col-sm-12">
                  <!-- BEGIN REGIONAL STATS PORTLET-->
             <div class="portlet light bordered">
                 <div class="portlet-title">
                     <div class="caption">
                         <i class="icon-share font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Regional Stats</span>
                     </div>
                     <div class="actions">
                         <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                             <i class="icon-cloud-upload"></i>
                         </a>
                         <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                             <i class="icon-wrench"></i>
                         </a>
                         <a class="btn btn-circle btn-icon-only btn-default fullscreen" data-container="false" data-placement="bottom" href="javascript:;"> </a>
                         <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                             <i class="icon-trash"></i>
                         </a>
                     </div>
                 </div>
                 <div class="portlet-body" style="height: 350px;">
                     <div id="mapContainer" style="height: 99%;"> </div>
                 </div>
             </div>
             <!-- END REGIONAL STATS PORTLET-->
         </div>
        <div class="col-lg-6 col-xs-12 col-sm-12">
             <!-- BEGIN PORTLET-->
             <div class="portlet light bordered">
                 <div class="portlet-title tabbable-line">
                     <div class="caption">
                         <i class="icon-globe font-dark hide"></i>
                         <span class="caption-subject font-dark bold uppercase">Feeds</span>
                     </div>
                     <ul class="nav nav-tabs">
                         <li class="active">
                             <a href="#tab_1_1" class="active" data-toggle="tab"> System </a>
                         </li>
                         <li>
                             <a href="#tab_1_2" data-toggle="tab"> Activities </a>
                         </li>
                     </ul>
                 </div>
                 <div class="portlet-body">
                     <!--BEGIN TABS-->
                     <div class="tab-content">
                         <div class="tab-pane active" id="tab_1_1">
                             <div class="scroller" style="height: 339px;" data-always-visible="1" data-rail-visible="0">
                                 <ul class="feeds">
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-success">
                                                         <i class="fa fa-bell-o"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> You have 4 pending tasks.
                                                         <span class="label label-sm label-info"> Take action
                                                             <i class="fa fa-share"></i>
                                                         </span>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> Just now </div>
                                         </div>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New version v1.4 just lunched! </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> 20 mins </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-danger">
                                                         <i class="fa fa-bolt"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> Database server #12 overloaded. Please fix the issue. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 24 mins </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 30 mins </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-success">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 40 mins </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-warning">
                                                         <i class="fa fa-plus"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New user registered. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 1.5 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-success">
                                                         <i class="fa fa-bell-o"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> Web server hardware needs to be upgraded.
                                                         <span class="label label-sm label-default "> Overdue </span>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 2 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-default">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 3 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-warning">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 5 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 18 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-default">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 21 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 22 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-default">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 21 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 22 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-default">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 21 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 22 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-default">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 21 hours </div>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-info">
                                                         <i class="fa fa-bullhorn"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> New order received. Please take care of it. </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 22 hours </div>
                                         </div>
                                     </li>
                                 </ul>
                             </div>
                         </div>
                         <div class="tab-pane" id="tab_1_2">
                             <div class="scroller" style="height: 290px;" data-always-visible="1" data-rail-visible1="1">
                                 <ul class="feeds">
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New order received </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> 10 mins </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <div class="col1">
                                             <div class="cont">
                                                 <div class="cont-col1">
                                                     <div class="label label-sm label-danger">
                                                         <i class="fa fa-bolt"></i>
                                                     </div>
                                                 </div>
                                                 <div class="cont-col2">
                                                     <div class="desc"> Order #24DOP4 has been rejected.
                                                         <span class="label label-sm label-danger "> Take action
                                                             <i class="fa fa-share"></i>
                                                         </span>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col2">
                                             <div class="date"> 24 mins </div>
                                         </div>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="javascript:;">
                                             <div class="col1">
                                                 <div class="cont">
                                                     <div class="cont-col1">
                                                         <div class="label label-sm label-success">
                                                             <i class="fa fa-bell-o"></i>
                                                         </div>
                                                     </div>
                                                     <div class="cont-col2">
                                                         <div class="desc"> New user registered </div>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div class="col2">
                                                 <div class="date"> Just now </div>
                                             </div>
                                         </a>
                                     </li>
                                 </ul>
                             </div>
                         </div>
                     </div>
                     <!--END TABS-->
                 </div>
             </div>
             <!-- END PORTLET-->
                 </div>
    </div>
	<div class="row">
       	<div class="col-md-4 ">
		 	<div class="portlet box2 blue">
		        <div class="portlet-title with-border tabbable-line">
		            <div class="caption">
	                    <i class="icon-bar-chart"></i>Site Visits
	                </div>
	                <ul class="nav nav-tabs">
                       <li class="active">
                           <a href="#portlet_tab3" data-toggle="tab" aria-expanded="true"> Tab 3 </a>
                       </li>
                       <li class="">
                           <a href="#portlet_tab2" data-toggle="tab" aria-expanded="false"> Tab 2 </a>
                       </li>
                       <li class="">
                           <a href="#portlet_tab1" data-toggle="tab" aria-expanded="false"> Tab 1 </a>
                       </li>
                   </ul>
	        	</div>
			        <div class="portlet-body">
			          	<div class="tab-content">
		                       <div class="tab-pane" id="portlet_tab1">
		                           <div class="scroller" style="height: 200px;" data-always-visible="1" data-rail-visible="0">
		                       <h4>Tab 1 Content</h4>
		                       <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
		                           luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
		                           erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
		                       <p> ADuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
		                           luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
		                           erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
		                   </div>
		               </div>
		               <div class="tab-pane" id="portlet_tab2">
		              		<div class="scroller" style="height: 200px;" data-always-visible="1" data-rail-visible="0">
		                       <h4>Tab 2 Content</h4>
		                       <p> Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
		                           et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
		                           labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo. </p>
		                       <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
		                           luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
		                           erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
		                   </div>
		               </div>
		               <div class="tab-pane active" id="portlet_tab3">
		                   <div class="scroller" style="height: 170px;" data-always-visible="1" data-rail-visible="0">
		                  <ul class="feeds">
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-info">
		                                          <i class="fa fa-check"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> You have 4 pending tasks.
		                                          <span class="label label-sm label-warning "> Take action
		                                              <i class="fa fa-share"></i>
		                                          </span>
		                                      </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> Just now </div>
		                          </div>
		                      </li>
		                      <li>
		                          <a href="javascript:;">
		                              <div class="col1">
		                                  <div class="cont">
		                                      <div class="cont-col1">
		                                          <div class="label label-sm label-success">
		                                              <i class="fa fa-bar-chart-o"></i>
		                                          </div>
		                                      </div>
		                                      <div class="cont-col2">
		                                          <div class="desc"> Finance Report for year 2013 has been released. </div>
		                                      </div>
		                                  </div>
		                              </div>
		                              <div class="col2">
		                                  <div class="date"> 20 mins </div>
		                              </div>
		                          </a>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-danger">
		                                          <i class="fa fa-user"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> You have 5 pending membership that requires a quick review. </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 24 mins </div>
		                          </div>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-info">
		                                          <i class="fa fa-shopping-cart"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> New order received with
		                                          <span class="label label-sm label-success"> Reference Number: DR23923 </span>
		                                      </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 30 mins </div>
		                          </div>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-default">
		                                          <i class="fa fa-user"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> You have 5 pending membership that requires a quick review. </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 24 mins </div>
		                          </div>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-info">
		                                          <i class="fa fa-shopping-cart"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> New order received with
		                                          <span class="label label-sm label-success"> Reference Number: DR23923 </span>
		                                      </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 30 mins </div>
		                          </div>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-success">
		                                          <i class="fa fa-user"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> You have 5 pending membership that requires a quick review. </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 24 mins </div>
		                          </div>
		                      </li>
		                      <li>
		                          <div class="col1">
		                              <div class="cont">
		                                  <div class="cont-col1">
		                                      <div class="label label-sm label-warning">
		                                          <i class="fa fa-bell-o"></i>
		                                      </div>
		                                  </div>
		                                  <div class="cont-col2">
		                                      <div class="desc"> Web server hardware needs to be upgraded.
		                                          <span class="label label-sm label-default "> Overdue </span>
		                                      </div>
		                                  </div>
		                              </div>
		                          </div>
		                          <div class="col2">
		                              <div class="date"> 2 hours </div>
		                          </div>
		                      </li>
		                      <li>
		                          <a href="javascript:;">
		                              <div class="col1">
		                                  <div class="cont">
		                                      <div class="cont-col1">
		                                          <div class="label label-sm label-info">
		                                              <i class="fa fa-briefcase"></i>
		                                          </div>
		                                      </div>
		                                      <div class="cont-col2">
		                                          <div class="desc"> IPO Report for year 2013 has been released. </div>
		                                      </div>
		                                  </div>
		                              </div>
		                              <div class="col2">
		                                  <div class="date"> 20 mins </div>
		                              </div>
		                          </a>
		                      </li>
		                  </ul>
		              </div>
		              <div class="scroller-footer">
		                  <div class="btn-arrow-link pull-right">
		                      <a href="javascript:;">See All Records</a>
		                      <i class="icon-arrow-right"></i>
		                  </div>
		              </div>
		                  </div>
		              </div>
		   		</div>
			</div>
        </div>
        <div class="col-md-4 ">
            	<!-- BEGIN Portlet PORTLET-->
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>Portlet </div>
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="#portlet_tab13" data-toggle="tab"> Tab 3 </a>
                        </li>
                        <li>
                            <a href="#portlet_tab12" data-toggle="tab"> Tab 2 </a>
                        </li>
                        <li class="active">
                            <a href="#portlet_tab11" data-toggle="tab"> Tab 1 </a>
                        </li>
                    </ul>
                </div>
                <div class="portlet-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="portlet_tab11">
                        	<div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible="1" data-rail-color="red" data-handle-color="green">
                            <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                                luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
                                volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
                            </div>
                        </div>
                        <div class="tab-pane" id="portlet_tab12">
                        	<div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible="1" data-rail-color="red" data-handle-color="green">
                            <p> Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et
                                ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
                                et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo. </p>
                            </div>
                        </div>
                        <div class="tab-pane" id="portlet_tab13">
                        	<div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible="1" data-rail-color="red" data-handle-color="green">
                            <p> Ut wisi enim ad btn-smm veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
                                consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Portlet PORTLET-->
        </div>
        <div class="col-md-4 ">
            <!-- BEGIN Portlet PORTLET-->
            <div class="portlet box yellow">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-gift"></i>Portlet3 </div>
                    <div class="actions">
                        <a href="javascript:;" class="btn btn-default btn-sm">
                            <i class="fa fa-pencil"></i> Edit </a>
                        <div class="btn-group">
                            <a class="btn btn-default btn-sm" href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-user"></i> User
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:;">
                                        <i class="fa fa-pencil"></i> Edit </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="fa fa-trash-o"></i> Delete </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <i class="fa fa-ban"></i> Ban </a>
                                </li>
                                <li class="divider"> </li>
                                <li>
                                    <a href="javascript:;"> Make admin </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible="1" data-rail-color="red" data-handle-color="green">
                        <strong>Scroll and rail are always visible</strong>
                        <br/> Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
                        eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus
                        sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi
                        erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras
                        mattis consectetur purus sit amet fermentum. </div>
                </div>
            </div>
            <!-- END Portlet PORTLET-->
        </div>
   	</div>
    <div class="row">
		<div class="col-md-6">
			<!-- BEGIN Portlet PORTLET-->
			<div class="portlet light">
				<div class="portlet-title tabbable-line">
                   <div class="caption">
                       <i class="icon-pin font-yellow-crusta"></i>
                       <span class="caption-subject bold font-yellow-crusta uppercase"> Tabs </span>
                       <span class="caption-helper">more samples...</span>
                   </div>
                   <ul class="nav nav-tabs">
                       <li>
                           <a href="#portlet_tab23" data-toggle="tab"> Tab 3 </a>
                       </li>
                       <li>
                           <a href="#portlet_tab22" data-toggle="tab"> Tab 2 </a>
                       </li>
                       <li class="active">
                           <a href="#portlet_tab21" data-toggle="tab"> Tab 1 </a>
                       </li>
                   </ul>
				</div>
				<div class="portlet-body">
                   <div class="tab-content">
                       <div class="tab-pane active" id="portlet_tab21">
                           <div class="scroller" style="height: 200px;">
                               <h4>Tab 1 Content</h4>
                               <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                                   luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
                                   erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
                               <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                                   luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
                                   erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
                           </div>
                       </div>
                       <div class="tab-pane" id="portlet_tab22">
                           <div class="scroller" style="height: 200px;">
                               <h4>Tab 2 Content</h4>
                               <p> Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
                                   et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
                                   labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo. </p>
                               <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                                   luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
                                   erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
                           </div>
                       </div>
                       <div class="tab-pane" id="portlet_tab23">
                           <div class="scroller" style="height: 200px;">
                               <h4>Tab 3 Content</h4>
                               <p> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent
                                   luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
                                   erat volutpat.ut laoreet dolore magna ut laoreet dolore magna. ut laoreet dolore magna. ut laoreet dolore magna. </p>
                               <p> Ut wisi enim ad m veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
                                   consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. </p>
                           </div>
                       </div>
                   </div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
		<div class="col-md-6">
			<!-- BEGIN Portlet PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
                   <div class="caption font-red-sunglo">
                       <i class="icon-share font-red-sunglo"></i>
                       <span class="caption-subject bold uppercase"> Portlet</span>
                       <span class="caption-helper">monthly stats...</span>
                   </div>
                   <div class="actions">
                       <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                           <i class="icon-cloud-upload"></i>
                       </a>
                       <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                           <i class="icon-wrench"></i>
                       </a>
                       <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                           <i class="icon-trash"></i>
                       </a>
                       <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;"> </a>
                   </div>
				</div>
				<div class="portlet-body">
                   <div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible="1" data-rail-color="red" data-handle-color="green">
                       <h4>Heading Text</h4>
                       <p> Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
                           eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
                           purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. consectetur purus sit amet fermentum.
                           Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. </p>
                       <p> nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.
                           Cras mattis consectetur purus sit amet fermentum. consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
                           purus sit amet fermentum. </p>
                   </div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
	</div>
                        
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="${ctxStatic}/metronic/assets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/horizontal-timeline/horizontal-timeline.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/metronic/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${ctxStatic}/metronic/assets/pages/scripts/dashboard.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    
	<script type="text/javascript">
		$(document).ready(function() {
			App.initCounterup();//调用metronic的App.js中的初始化方法
		});
		
		function initialize(){
			var map = new BMap.Map("mapContainer"); // 创建地图实例  
			var point = new BMap.Point(121.51681,38.856675); // 创建点坐标  
			map.addControl(new BMap.NavigationControl());  //给地图添加控件     
			map.addControl(new BMap.ScaleControl());       
			map.addControl(new BMap.OverviewMapControl());       
			map.addControl(new BMap.MapTypeControl());       
			map.setCurrentCity("大连");  //地区区域  
			map.centerAndZoom(point, 17); // 初始化地图，设置中心点坐标和地图级别  
			map.enableScrollWheelZoom(); //让鼠标滚轮可以放缩地图  
			var marker = new BMap.Marker(point);        // 创建标注       
			map.addOverlay(marker);  //在地图上添加标注
	    }
	</script>
