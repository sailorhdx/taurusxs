<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/gen/genScheme/" class="ajaxify">生成方案列表</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="gen:genScheme:edit">
	                <a href="${ctxAdmin}/gen/genScheme/form" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 生成方案添加 </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM-->   
     		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="genScheme" action="${ctxAdmin}/gen/genScheme/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">方案名称</label>
							<div class="col-md-8">
								<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
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
							<th>方案名称</th>
							<th>生成模块</th>
							<th>模块名</th>
							<th>功能名</th>
							<th>功能作者</th>
							<shiro:hasPermission name="gen:genScheme:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/gen/genScheme/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td>{{row.packageName}}</td>
							<td>{{row.moduleName}}{{#row.subModuleName}}.{{/row.subModuleName}}{{row.subModuleName}}</td>
							<td>{{row.functionName}}</td>
							<td>{{row.functionAuthor}}</td>
							<shiro:hasPermission name="gen:genScheme:edit">
							<td>
			    				<a href="${ctxAdmin}/gen/genScheme/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/gen/genScheme/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该生成方案吗？', url:this.href, action:'delete'})">删除</a>
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