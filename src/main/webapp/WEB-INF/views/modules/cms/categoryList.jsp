<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				栏目列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="cms:category:edit">
	            	<a href="${ctxAdmin}/cms/category/form" class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 栏目添加 
	            	</a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox">       		
	       		<form:form id="searchForm" modelAttribute="category" action="${ctxAdmin}/cms/category/listData" method="post" class="form-horizontal">
				</form:form>
			</div>
       		<!-- END FORM-->
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox">
				<form id="listForm" action="${ctxAdmin}/cms/category/updateSort" method="post">
				<table id="treeTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>栏目名称</th>
							<th>归属机构</th>
							<th>栏目模型</th>
							<th style="text-align:center;">排序</th>
							<th title="是否在导航中显示该栏目">导航菜单</th>
							<th title="是否在分类页中显示该栏目的文章列表">栏目列表</th>
							<th>展现方式</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="treeTableList"></tbody>
					<script type="text/template" id="treeTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td><a href="${ctxAdmin}/cms/category/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td>{{officename}}</td>
							<td>{{dict.module}}</td>
							<td style="text-align:center;">
								<shiro:hasPermission name="cms:category:edit">
									<input type="hidden" name="ids" value="{{row.id}}"/>
									<input name="sorts" type="text" value="{{row.sort}}" style="width:50px;margin:0;padding:0;text-align:center;">
								</shiro:hasPermission>
								<shiro:lacksPermission name="cms:category:edit">
									{{row.sort}}
								</shiro:lacksPermission>
							</td>
							<td>{{dict.inMenu}}</td>
							<td>{{dict.inList}}</td>
							<td>{{dict.showModes}}</td>
							<td>
								<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/list-{{row.id}}${fns:getUrlSuffix()}" target="_blank">访问</a>
								<shiro:hasPermission name="cms:category:edit">
									<a href="${ctxAdmin}/cms/category/form?id={{row.id}}" class="ajaxify">修改</a>
									<a href="${ctxAdmin}/cms/category/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'要删除该栏目及所有子栏目项吗？', url:this.href, action:'delete'})">删除</a>
									<a href="${ctxAdmin}/cms/category/form?parent.id={{row.id}}" class="ajaxify">添加下级栏目</a>
								</shiro:hasPermission>
							</td>
						</tr>
					</script>
				</table>
				<shiro:hasPermission name="cms:category:edit">
					<div class="form-actions pagination-left">
						<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
					</div>
				</shiro:hasPermission>
				</form>
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
					type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, item.type),
					module:getDictLabel(item.module, 'cms_module', '公共模型'),
					inMenu:getDictLabel(item.inMenu, 'show_hide', '隐藏'),
					inList:getDictLabel(item.inList, 'show_hide', '隐藏'),
					showModes:getDictLabel(item.showModes, 'cms_show_modes', '默认展现方式')
			
				}, 
				officename: item.office.name,
				pid: (param.root?0:param.pid), 
				row: item
			}));
		}
		
    	function updateSort() {
    		editPostJson({form:"#listForm",callback:'updateSortCallback'});
    	}
    	
    	// 提交更新排序表单回调方法
    	function updateSortCallback(param) {
    		$("#searchForm").submit();
    	}
	</script>