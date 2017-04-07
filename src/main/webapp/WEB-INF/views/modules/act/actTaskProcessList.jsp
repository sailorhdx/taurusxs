<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/task/process/" class="ajaxify">新建任务</a>
            </div>
            <div class="actions">
              	<a href="${ctxAdmin}/act/task/todo" class="btn ajaxify">
              		<i class="fa fa-clone"></i> 代办任务
              	</a>
	            <a href="${ctxAdmin}/act/task/historic/" class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 已办任务 
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->  
       		<div id="searchBox">      
				<form id="searchForm" action="${ctxAdmin}/act/task/process" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">流程分类</label>
							<div class="col-md-8">
								<select id="category" name="category" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<option value="">全部分类</option>
									<c:forEach items="${fns:getDictList('act_category')}" var="dict">
										<option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group col-md-6">						
							<div class="col-md-offset-4 col-md-8">				
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
							</div>
						</div>
					</div>
				</form>
			</div>
       		<!-- END FORM-->
       		<sys:message content="${message}"/>
       		<!-- BEGIN TABLE-->
       		<div id="tableBox" class="dataTables_wrapper">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>流程分类</th>
							<th>流程标识</th>
							<th>流程名称</th>
							<th>流程图</th>
							<th>流程版本</th>
							<th>更新时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="object">
							<c:set var="process" value="${object[0]}" />
							<c:set var="deployment" value="${object[1]}" />
							<tr>
								<td>${fns:getDictLabel(process.category,'act_category','无分类')}</td>
								<td><a href="${ctx}/act/task/form?procDefId=${process.id}" class="ajaxify">${process.key}</a></td>
								<td>${process.name}</td>
								<td><a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${process.id}">${process.diagramResourceName}</a><%--
									<a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=image">${process.diagramResourceName}</a>--%></td>
								<td><b title='流程版本号'>V: ${process.version}</b></td>
								<td><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<a href="${ctx}/act/task/form?procDefId=${process.id}" class="ajaxify">启动流程</a>
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