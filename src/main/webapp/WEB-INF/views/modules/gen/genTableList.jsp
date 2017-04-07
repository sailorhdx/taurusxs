<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/gen/genTable/" class="ajaxify">业务表列表</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="gen:genTable:edit">
	                <a href="${ctxAdmin}/gen/genTable/form" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 业务表添加 </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM-->   
     		<div id="searchBox">     
				<form:form id="searchForm" modelAttribute="genTable" action="${ctxAdmin}/gen/genTable/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="searchPostJson();"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">表名</label>
							<div class="col-md-8">
								<form:input path="nameLike" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">说明</label>
							<div class="col-md-8">
								<form:input path="comments" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">父表表名</label>
							<div class="col-md-8">
								<form:input path="parentTable" htmlEscape="false" maxlength="50" class="form-control"/>
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
							<th class="sort-column name">表名</th>
							<th>说明</th>
							<th class="sort-column class_name">类名</th>
							<th class="sort-column parent_table">父表</th>
							<shiro:hasPermission name="gen:genTable:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/gen/genTable/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td>{{row.comments}}</td>
							<td>{{row.className}}</td>
							<td title="点击查询子表"><a href="javascript:" onclick="$('#parentTable').val('{{row.parentTable}}');$('#searchForm').submit();">{{row.parentTable}}</a></td>
							<shiro:hasPermission name="gen:genTable:edit">
							<td>
			    				<a href="${ctxAdmin}/gen/genTable/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/gen/genTable/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该业务表吗？', url:this.href, action:'delete'})">删除</a>
							</td>
							</shiro:hasPermission>
						</tr>
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
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson();
				}
			});	
			
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
	</script>
</body>
</html>
