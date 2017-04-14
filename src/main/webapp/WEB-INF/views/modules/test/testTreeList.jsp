<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/test/testTree/" class="ajaxify">树结构列表</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="test:testTree:edit">
	                <a href="${ctxAdmin}/test/testTree/form" class="btn ajaxify">
	                	<i class="fa fa-pencil"></i> 树结构添加 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM-->   
			<div id="searchBox">
				<form:form id="searchForm" modelAttribute="testTree" action="${ctxAdmin}/test/testTree/listData" method="post" class="form-horizontal">
					<div class="form-group col-md-6">
						<label class="control-label col-md-4">名称</label>
						<div class="col-md-8">
							<form:input path="name" htmlEscape="false" maxlength="100" class="form-control"/>
						</div>
					</div>
					<div class="form-group col-md-6">
						<div class="col-md-offset-4 col-md-8">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
						</div>
					</div>
				</form:form>
			</div>
			<!-- END FORM-->			
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox">
				<table id="treeTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>名称</th>
							<th>排序</th>
							<th>更新时间</th>
							<th>备注信息</th>
							<shiro:hasPermission name="test:testTree:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="treeTableList"></tbody>
					<script type="text/template" id="treeTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td><a href="${ctxAdmin}/test/testTree/form?id={{row.id}}" class="ajaxify">
								{{row.name}}
							</a></td>
							<td>
								{{row.sort}}
							</td>
							<td>
								{{row.updateDate}}
							</td>
							<td>
								{{row.remarks}}
							</td>
							<shiro:hasPermission name="test:testTree:edit"><td>
				   				<a href="${ctxAdmin}/test/testTree/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/test/testTree/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该树结构及所有子树结构吗？', url:this.href, action:'delete'})">删除</a>
								<a href="${ctxAdmin}/test/testTree/form?parent.id={{row.id}}" class="ajaxify">添加下级树结构</a> 
							</td></shiro:hasPermission>
						</tr>
					</script>		
				</table>
			</div>
			<!-- END TABLE-->
        </div>
    </div>	
    <!-- END PORTLET--> 
       	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({form:"#searchForm", tableType:"tree"});
				}
			});
				
			
			// 查询数据表单
			$("#searchForm").submit();
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
           
   			$("#treeTableList").append(Mustache.render(param.tpl, {
               dict: {
				}, 
				pid: (param.root?0:param.pid), 
				row: item
               }));
		};
		
	</script>