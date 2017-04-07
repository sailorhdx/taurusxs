<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treetable.jsp" %>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                	<a href="${ctxAdmin}/sys/menu/" class="ajaxify">菜单列表
                </a> 
            </div>
            <div class="actions">
            	<a href="${ctxAdmin}/sys/menu/form" class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 菜单添加 
	            </a>
                <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>            
        <div class="portlet-body">
        	<!-- BEGIN FORM-->
       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/menu/listData" method="post" class="form-horizontal">
			</form:form>
       		<!-- END FORM-->
            <sys:message content="${message}"/>
            <!-- BEGIN TABLE-->
            <div id="tableBox">
            	<form id="listForm" action="${ctxAdmin}/sys/menu/updateSort" method="post">
				<table id="treeTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>名称</th>
							<th>链接</th>
							<th style="text-align:center;">排序</th>
							<th>可见</th>
							<!-- <th>权限标识</th>  -->
							<shiro:hasPermission name="sys:menu:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="treeTableList"></tbody>
					<script type="text/template" id="treeTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td nowrap style="vertical-align: middle !important;">
								<i class="fa fa-{{icon}}"></i>
								<a href="${ctxAdmin}/sys/menu/form?id={{row.id}}" class="ajaxify">{{row.name}}</a>	
							</td>
							<td title="{{row.href}}" style="vertical-align: middle !important;">{{href}}</td>
							<td style="text-align:center;">
								<shiro:hasPermission name="sys:menu:edit">
									<input type="hidden" name="ids" value="{{row.id}}"/>
									<input name="sorts" type="text" value="{{row.sort}}" class="form-control input-sm input-xsmall"  style="text-align:center;" >
								</shiro:hasPermission>
								<shiro:lacksPermission name="sys:menu:edit">
									{{row.sort}}
								</shiro:lacksPermission>
							</td>
							<td nowrap style="vertical-align: middle !important;">{{dict.isShow}}</td>
							<shiro:hasPermission name="sys:menu:edit">
							<td nowrap style="vertical-align: middle !important;">
								<a href="${ctxAdmin}/sys/menu/form?id={{row.id}}" class="btn btn-outline green btn-sm purple ajaxify">
	                            	<i class="fa fa-edit"></i>修改
	                           	</a>
	                            <a href="${ctxAdmin}/sys/menu/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'要删除该菜单及所有子菜单项吗？', url:this.href});" class="btn btn-outline dark btn-sm black">
	                            	<i class="fa fa-trash-o"></i>删除
	                            </a>
	                            <a href="${ctxAdmin}/sys/menu/form?parent.id={{row.id}}" class="btn btn-outline red btn-sm blue ajaxify">
	                            	<i class="fa fa-share"></i>添加下级 
	                            </a>
							</td>
							</shiro:hasPermission>
						</tr>
					</script>
				</table>
	            <shiro:hasPermission name="sys:menu:edit">
		            <div class="form-actions">
		              	<div class="row">
			               <div class="col-md-offset-3 col-md-9">
								<button id="btnSubmit" type="button" class="btn red" onclick="updateSort();">保存排序</button>
							</div>
						</div>
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
					searchPostJson({form:"#searchForm", callback:'searchCallback', expandLevel:"3", tableType:"tree"});
				}
			});
			
			$("#searchForm").submit();
		});

		// 提交查询表单回调方法
    	function searchCallback(param) {
			var item = param.item;
			$("#treeTableList").append(Mustache.render(param.tpl, {
				icon: (isNullOrEmpty(item.icon)? " hide":item.icon), 
				href: abbr(item.href,30),
				dict: {
					isShow: getDictLabel(${fns:toJson(fns:getDictList('show_hide'))}, item.isShow)
				}, 
				pid: (param.root?0:param.pid), 
				row: item
			}));
		}
    	
		// 提交更新排序表单
    	function updateSort() {
    		editPostJson({form:"#listForm",callback:'updateSortCallback'});
    	}
    	
    	// 提交更新排序表单回调方法
    	function updateSortCallback(param) {
    		$("#searchForm").submit();
    	}
    	
	</script>