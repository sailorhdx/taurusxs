<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/task/historic" class="ajaxify">已办任务</a>
            </div>
            <div class="actions">
              	<a href="${ctxAdmin}/act/task/todo" class="btn ajaxify"><i class="fa fa-clone"></i>代办任务</a>
	            <a href="${ctxAdmin}/act/task/process"  class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 新建任务 </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="act" action="${ctxAdmin}/act/task/historic" method="get" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">起始时间</label>
							<div class="col-md-8">
								<input id="beginDate"  name="beginDate"  type="text" readonly="readonly" maxlength="20" class="form-control" 
									value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>" 
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
							</div>
						</div>
						<div class="form-group col-md-6">						
							<label class="control-label col-md-4">截止时间</label>
							<div class="col-md-8">
								<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="form-control"
									value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">流程类型</label>
							<div class="col-md-8">
								<form:select path="procDefKey" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:option value="" label="全部流程"/>
									<form:options items="${fns:getDictList('act_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group col-md-6">
							<div class="col-md-offset-4 col-md-8">				
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
							</div>
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
							<th>标题</th>
							<th>当前环节</th><%--
							<th>任务内容</th> --%>
							<th>流程名称</th>
							<th>流程版本</th>
							<th>完成时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="act">
							<c:set var="task" value="${act.histTask}" />
							<c:set var="vars" value="${act.vars}" />
							<c:set var="procDef" value="${act.procDef}" /><%--
							<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
							<c:set var="status" value="${act.status}" />
							<tr>
								<td>
									<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" class="ajaxify">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
								</td>
								<td>
									<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a><%--
									<a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">${task.name}</a>
									<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">${task.name}</a> --%>
								</td><%--
								<td>${task.description}</td> --%>
								<td>${procDef.name}</td>
								<td><b title='流程版本号'>V: ${procDef.version}</b></td>
								<td><fmt:formatDate value="${task.endTime}" type="both"/></td>
								<td>
									<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" class="ajaxify">详情</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="pagination" class="row">${page }</div>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	

	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					page();
				}
			});	
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
			
		});
	</script>