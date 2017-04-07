<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/sys/role/" class="ajaxify">角色列表</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:dict:edit">
	                <a href="${ctxAdmin}/sys/role/form" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 角色添加 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        	<!-- BEGIN FORM-->
			<div id="searchBox">       		
	       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/role/listData" method="post" class="form-horizontal">
				</form:form>
			</div>
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox">			
				<table id="listTable" class="table table-striped table-bordered ">
					<thead>
						<tr>
							<th>角色名称</th>
							<th>英文名称</th>
							<th>归属机构</th>
							<th>数据范围</th>
							<shiro:hasPermission name="sys:role:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="listTableList"></tbody>
					<script type="text/template" id="listTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/sys/role/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td><a href="${ctxAdmin}/sys/role/form?id={{row.id}}" class="ajaxify">{{row.enname}}</a></td>
							<td>{{officename}}</td>
							<td>{{dict.dataScope}}</td>
							<shiro:hasPermission name="sys:role:edit"><td>
								<a  href="${ctxAdmin}/sys/role/assign?id={{row.id}}" class="ajaxify">分配</a>
								{{#editable}}
									<a href="${ctxAdmin}/sys/role/form?id={{row.id}}" class="ajaxify">修改</a>
								{{/editable}}
								<a href="${ctxAdmin}/sys/role/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该角色吗？', url:this.href});" class="dark">删除</a>
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
					searchPostJson({form:"#searchForm",callback:"searchCallback", tableType:"list"});		
				}
			});
			
		});
		
		$("#searchForm").submit();
		
		// 提交查询表单回调方法
    	function searchCallback(param) {
            var item = param.item;
           	var editable = false;
           	if ((item.sysData == ${fns:getDictValue('是', 'yes_no', '1')} && ${fns:getUser().admin}) || item.sysData != ${fns:getDictValue('是', 'yes_no', '1')}) {
           		editable = true;        		
           	}
           	$("#listTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	officename: item.office.name,
               	dict: {
               		dataScope : getDictLabel(${fns:toJson(fns:getDictList('sys_data_scope'))}, item.dataScope)          	
               	},
           		editable: editable
            }));
		}
		
	</script>