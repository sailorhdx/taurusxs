<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				审批列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="oa:testAudit:edit">
	            	<a href="${ctxAdmin}/oa/testAudit/form"  class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 审批申请流程 
	            	</a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="testAudit" action="${ctxAdmin}/oa/testAudit/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">姓名</label>
							<div class="col-md-8">
								<sys:treeselect id="user" name="user.id" value="${testAudit.user.id}" labelName="user.name" labelValue="${testAudit.user.name}" 
									title="用户" url="/sys/office/treeData?type=3" cssStyle="width:150px" allowClear="true" notAllowSelectParent="true"/>
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
							<th>姓名</th>
							<th>部门</th>
							<th>岗位职级</th>
							<th>调整原因</th>
							<th>申请时间</th>
							<shiro:hasPermission name="oa:testAudit:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="testAudit">
						<tr>
							<td><a href="${ctxAdmin}/oa/testAudit/form?id=${testAudit.id}">${testAudit.user.name}</a></td>
							<td>${testAudit.office.name}</td>
							<td>${testAudit.post}</td>
							<td>${testAudit.content}</td>
							<td><fmt:formatDate value="${testAudit.createDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<shiro:hasPermission name="oa:testAudit:edit"><td>
			    				<a href="${ctxAdmin}/oa/testAudit/form?id=${testAudit.id}" class="ajaxify">详情</a>
								<a href="${ctxAdmin}/oa/testAudit/delete?id=${testAudit.id}" onclick="return confirmGetJson({mess:'确认要删除该审批吗？', url:this.href})">删除</a>
							</td></shiro:hasPermission>
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
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					page();
				}
			});	
		});
	</script>
