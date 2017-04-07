<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				日志列表
            </div>
            <div class="actions">
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        	<!-- BEGIN FORM-->
			<div id="searchBox">        	
	        	<form:form id="searchForm" modelAttribute="log" action="${ctxAdmin}/sys/log/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="form-group">
						<label class="control-label col-md-2">操作菜单</label>
						<div class="col-md-4">
							<form:input id="title" path="title" type="text" maxlength="50" class="form-control"/>
						</div>
						<label class="control-label col-md-2">用户ID</label>
						<div class="col-md-4">
							<form:input id="createBy.id" path="createBy.id" type="text" maxlength="50" class="form-control" />
						</div>
					</div>
					<div class="form-group">	
						<label class="control-label col-md-2">URI</label>
						<div class="col-md-4">
							<form:input id="requestUri" path="requestUri" type="text" maxlength="50" class="form-control"/>
						</div>
						<label class="control-label col-md-2">只查异常</label>
						<div class="col-md-4">
							<form:select path="type" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>	
						</div>
					</div>
					<div class="form-group">
			            <label class="control-label col-md-2">开始日期</label>
						<div class="col-md-4">
				            <form:input id="beginDate" path="beginDate" type="text" readonly="true" maxlength="20" class="form-control"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
				        </div>
			            <label class="control-label col-md-2">结束日期</label>
						<div class="col-md-4">
				            <form:input id="endDate" path="endDate" type="text" readonly="true" maxlength="20" class="form-control"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
				        </div>
				    </div>
				    <div class="form-group">
						<div class="col-md-offset-4 col-md-8">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
						</div>
					</div>
				</form:form>
			</div>
            <!-- END FORM-->
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox" class="dataTables_wrapper">			
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>操作菜单</th>
							<th>操作用户</th>
							<th>所在公司</th>
							<th>所在部门</th>
							<th>URI</th>
							<th>提交方式</th>
							<th>操作者IP</th>
							<th>操作时间</th>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td>{{row.title}}</td>
							<td>{{createUserName}}</td>
							<td>{{createUserCompanyName}}</td>
							<td>{{createUserOfficeName}}</td>
							<td><strong>{{row.requestUri}}</strong></td>
							<td>{{row.method}}</td>
							<td>{{row.remoteAddr}}</td>
							<td>{{row.createDate}}</td>
						</tr>
						{{#exception}}
						<tr>
							<td colspan="8" style="word-wrap:break-word;word-break:break-all;">
			<%-- 					用户代理: {{row.userAgent}<br/> --%>
			<%-- 					提交参数: ${fns:escapeHtml(log.params)} <br/> --%>
								异常信息: <br/>
								{{{exception}}}
							</td>
						</tr>
						{{/exception}}  
					</script>
				</table>
				<div id="pagination" class="row"></div>
			</div>
			<!-- END TABLE-->
		</div>
    </div>
    <!-- END PORTLET-->
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#title").focus();
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({pageSize:10,funcParam:{callback:"searchCallback"}});
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();	

			// 打开页面默认点击查询按钮，初始化table数据
			$("#btnSubmit").click();	
			
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
           	var exception = item.exception;
   			if (!isNullOrEmpty(exception)) { 
   				exception = exception.replace(/\n/g, "<br/>").replace(/\t/g,"&nbsp; &nbsp; ");
   			}
   			
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	createUserName: item.createBy.name,
               	createUserCompanyName: item.createBy.company.name,
               	createUserOfficeName: item.createBy.office.name,
               	exception: exception
               }));
		};
	</script>	