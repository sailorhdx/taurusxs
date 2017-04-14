<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/process/running/" class="ajaxify">运行中的流程</a>
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/act/process/"  class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 流程列表 
	            </a>
              	<a href="${ctxAdmin}/act/process/deploy/" class="btn ajaxify">
              		<i class="fa fa-clone"></i> 部署流程 
              	</a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form id="searchForm" action="${ctxAdmin}/act/process/running/" method="post" class="form-horizontal">
					<div class="form-group col-md-6">
						<label class="control-label col-md-4">流程实例ID</label>
						<div class="col-md-8">
							<input type="text" id="procInsId" name="procInsId" value="${procInsId}" class="form-control"/>
						</div>
					</div>
					<div class="form-group col-md-6">						
						<label class="control-label col-md-4">流程定义Key</label>
						<div class="col-md-8">
							<input type="text" id="procDefKey" name="procDefKey" value="${procDefKey}" class="form-control"/>
						</div>
					</div>
					<div class="form-group col-md-6">
						<div class="col-md-offset-4 col-md-8">	
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
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
							<th>流程ID</th>
							<th>当前环节</th>
							<th>是否挂起</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="procIns">
							<tr>
								<td>
									执行ID：${procIns.id}<br>
									实例ID：${procIns.processInstanceId}<br>
									定义ID：${procIns.processDefinitionId}
								</td>
								<td>${procIns.activityId}</td>
								<td>${procIns.suspended}</td>
								<td>
									<shiro:hasPermission name="act:process:edit">
										<a href="${ctxAdmin}/act/process/deleteProcIns?procInsId=${procIns.processInstanceId}&reason=管理员删除" onclick="return confirmGetJson({mess:'删除流程',url:this.href});">删除流程</a>
									</shiro:hasPermission>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">${page}</div>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function(){
			$("#searchForm").validate({
				submitHandler: function(form){
					page();
				}
			});	
		});
	</script>