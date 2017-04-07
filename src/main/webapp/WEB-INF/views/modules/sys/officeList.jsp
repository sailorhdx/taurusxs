<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				机构列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:office:edit">
	                <a href="${ctxAdmin}/sys/office/form?parent.id=${office.id}" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 机构添加 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default" id="showhide"><i class="fa fa-wrench"></i></a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        <div class="row">
        	<div id="colLeft" class="col-md-3">
        		<div class="portlet box2 blue bordered" style="margin-top: 0px;">
			        <div class="portlet-title with-border">
		        	    <div class="caption">
                            <i class="fa fa-gift"></i>组织机构
                        </div>
                        <div class="tools">
                        </div>
                        <div class="actions">
                            <a id="btnRefreshTree" href="javascript:;" class="btn btn-default btn-xs">
                                <i class="icon-refresh"></i></a>
                        </div>
			        </div>
			        <div class="portlet-body">
	        			<div id="ztree" class="ztree"></div>
			        </div>
			    </div>
        	</div>
        	<div id="colRight" class="col-md-9">
	       		<!-- BEGIN FORM-->
	       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/office/listData" method="post" class="form-horizontal">
					<input id="id" name="id" type="hidden"  />
					<input id="parentIds" name="parentIds" type="hidden" />
				</form:form>
	       		<!-- END FORM-->
				<sys:message content="${message}"/>
	       		<!-- BEGIN TABLE-->
				<div id="tableBox">       		
					<table id="treeTable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>机构名称</th>
								<th>归属区域</th>
								<th>机构编码</th>
								<th>机构类型</th>
								<th>备注</th>
								<shiro:hasPermission name="sys:office:edit">
								<th>操作</th>
								</shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="treeTableList"></tbody>
					</table>
					<script type="text/template" id="treeTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td><a href="${ctxAdmin}/sys/office/form?id={{row.id}}" class="ajaxify">{{row.name}}</a></td>
							<td>{{row.area.name}}</td>
							<td>{{row.code}}</td>
							<td>{{dict.type}}</td>
							<td>{{row.remarks}}</td>
							<shiro:hasPermission name="sys:office:edit"><td>
								<a href="${ctxAdmin}/sys/office/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/sys/office/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'要删除该机构及所有子机构项吗？', url:this.href, callback:'deleteCallback'});">删除</a>
								<a href="${ctxAdmin}/sys/office/form?parent.id={{row.id}}" class="ajaxify">添加下级机构</a> 
							</td></shiro:hasPermission>
						</tr>
					</script>
				</div>
				<!-- END TABLE-->
			</div>
		</div>
		</div>
    </div>
    <!-- END PORTLET-->
    
	<script type="text/javascript">
		$(document).ready(function() {
			// 组织机构显示/隐藏按钮点击事件
			$("#btnShowHideTree").click(function(){
				if ($("#colLeft").hasClass("hide") === true) {
					$("#colLeft").removeClass("hide");
					$("#colRight").removeClass("col-md-12").addClass("col-md-9");
				} else {
					$("#colLeft").addClass("hide");
					$("#colRight").removeClass("col-md-9").addClass("col-md-12");
				} 
			});
			
			// 组织机构刷新按钮点击事件
			$("#btnRefreshTree").click(function(){
				refreshTree();
			});

			// 打开页面默认点击刷新组织机构树按钮，初始化组织机构树
			$("#btnRefreshTree").click();
		});
		
		function refreshTree(){
			var setting = {
					view:{expandSpeed:""},
					data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
       				callback:{onClick:function(event, treeId, treeNode){
       					var id = treeNode.pId == '0' ? '' :treeNode.pId;
						$("#id").val(id);
						$("#parentIds").val(treeNode.pIds);
						searchPostJson({form:"#searchForm", callback:'searchCallback',  tableType:"tree"});
       				}
       			}
       		};
			
   			$.getJSON("${ctxAdmin}/sys/office/treeData",function(data){
   				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
   				
   				// 初始化点击根节点
   				var zTree = $.fn.zTree.getZTreeObj("ztree");//获取ztree对象  
	            var node = zTree.getNodeByParam('id', 1);//获取id为1的点  
	            zTree.selectNode(node);//选择点  
	            zTree.setting.callback.onClick(null, zTree.setting.treeId, node);//调用事件  
   			});
   		}
 		
		// 提交查询表单回调方法
		function searchCallback(param) {
			var item = param.item;
			$("#treeTableList").append(Mustache.render(param.tpl, {
				dict: {
					type: getDictLabel(${fns:toJson(fns:getDictList('sys_office_type'))}, item.type)
				}, 
				pid: (param.root?0:param.pid), 
				row: item
			}));
		}

		// 删除操作回调函数
		function deleteCallback(res) {
			// 刷新组织机构树
			$("#btnRefreshTree").click();
			// 重新查询数据表单
			searchPostJson({form:"#searchForm", callback:"searchCallback",  tableType:"tree"});
		}
	</script>