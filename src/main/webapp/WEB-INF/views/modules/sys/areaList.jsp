<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treetable.jsp" %>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				区域列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:user:edit">
	                <a href="${ctxAdmin}/sys/area/form" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 区域添加 </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        	<!-- BEGIN FORM-->
       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/area/listData" method="post" class="form-horizontal">
			</form:form>
       		<!-- END FORM-->
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox">			
				<table id="treeTable" class="table table-striped table-bordered ">
					<thead>
						<tr>
							<th>区域名称</th>
							<th>区域编码</th>
							<th>区域类型</th>
							<th>备注</th>
							<shiro:hasPermission name="sys:area:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="treeTableList"></tbody>
					<script type="text/template" id="treeTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td><a href="${ctxAdmin}/sys/area/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td>{{row.code}}</td>
							<td>{{dict.type}}</td>
							<td>{{row.remarks}}</td>
							<shiro:hasPermission name="sys:area:edit"><td>
								<a href="${ctxAdmin}/sys/area/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/sys/area/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'要删除该区域及所有子区域项吗？', url:this.href});">删除</a>
								<a href="${ctxAdmin}/sys/area/form?parent.id={{row.id}}" class="ajaxify">添加下级区域</a> 
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
					// 页面初始化默认提交查询表单
					searchPostJson({form:"#searchForm", callback:'searchCallback', tableType:"tree"});
				}
			});
			
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
			var item = param.item;
			$("#treeTableList").append(Mustache.render(param.tpl, {
				dict: {
					type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, item.type)
				}, 
				pid: (param.root?0:param.pid), 
				row: item
			}));
		}

	</script>