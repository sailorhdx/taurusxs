<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treeview.jsp" %>	

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<shiro:hasPermission name="sys:role:edit">角色分配</shiro:hasPermission>
				<shiro:lacksPermission name="sys:role:edit">人员列表</shiro:lacksPermission>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:dict:edit">
	                <a href="${ctxAdmin}/sys/role/" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 角色列表 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
			<div class="container-fluid breadcrumb">
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">角色名称：</label>
					<div class="col-md-8">
						<b>${role.name}</b>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">归属机构：</label>
					<div class="col-md-8">
						${role.office.name}
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">英文名称：</label>
					<div class="col-md-8">
						${role.enname}
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">角色类型：</label>
					<div class="col-md-8">
						${role.roleType}
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">数据范围：</label>
					<div class="col-md-8">
						<c:set var="dictvalue" value="${role.dataScope}" scope="page" />
						${fns:getDictLabel(dictvalue, 'sys_data_scope', '')}
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4"></label>
					<div class="col-md-8">
						<form id="assignRoleForm" action="${ctxAdmin}/sys/role/assignrole" method="post" class="hide">
							<input id="id" type="hidden" name="id" value="${role.id}"/>
							<input id="idsArr" type="hidden" name="idsArr" value=""/>
						</form>
						<input id="assignButton" class="btn btn-primary" type="button" value="分配角色"/>
					</div>
				</div>
			</div>
			<!-- BEGIN FORM-->
       		<div id="assignRoleFormBox" style="display: none;">
				<form id="importForm" action="${ctxAdmin}/sys/user/import" method="post" enctype="multipart/form-data" class="breadcrumb form-horizontal"><br/>
					<div class="form-group">
		                <div class="col-md-4">
		                	所在部门
		                </div>
		                <div class="col-md-4">
		                	待选人员
		                </div>
		                <div class="col-md-4">
		                	已选人员
		                </div>
	           		</div>
					<div class="form-group">
		                <div id="officeTree" class="col-md-4 ztree">
		                
		                </div>
		                <div id="userTree" class="col-md-4 ztree">
		                
		                </div>
		                <div id="selectedTree" class="col-md-4 ztree">
		                
		                </div>
	           		</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-6">
							<input id="btnAssignSubmit" class="btn btn-primary" type="button" value="确定分配"/>
							<input id="btnAssignClear" class="btn btn-primary" type="button" value="清除新选"/>
							<input id="btnAssignClose" class="btn btn-primary" type="button" value="关闭"/>
						</div>
					</div>
				</form>	
			</div>		
       		<!-- END FORM-->    
			<sys:message content="${message}"/>
			<!-- BEGIN TABLE-->
			<div id="tableBox">			
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>归属公司</th>
							<th>归属部门</th>
							<th>登录名</th>
							<th>姓名</th>
							<th>电话</th>
							<th>手机</th>
							<shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${userList}" var="user">
						<tr>
							<td>${user.company.name}</td>
							<td>${user.office.name}</td>
							<td><a href="${ctxAdmin}/sys/user/form?id=${user.id}" class="ajaxify">${user.loginName}</a></td>
							<td>${user.name}</td>
							<td>${user.phone}</td>
							<td>${user.mobile}</td>
							<shiro:hasPermission name="sys:role:edit"><td>
								<a href="${ctxAdmin}/sys/role/outrole?userId=${user.id}&roleId=${role.id}" 
									onclick="return confirmGetHtml({mess:'确认要将用户[${user.name}]从[${role.name}]角色中移除吗？', url:this.href})">移除</a>
							</td></shiro:hasPermission>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- END TABLE-->			
		</div>
    </div>
    <!-- BEGIN PORTLET-->	
    
    <script type="text/javascript">
	
		var officeTree;
		var selectedTree;//zTree已选择对象
		
		// 初始化
		$(document).ready(function(){
			$("#assignButton").click(function(){
				$.ajax({
	                type: "GET",
	                cache: false,
			        url: "${ctxAdmin}/sys/role/assign?id=${role.id}",
			        dataType: "html",
			        success: function (res) {    
			        	officeTree = $.fn.zTree.init($("#officeTree"), setting, officeNodes);
						selectedTree = $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
			        },
			        error: function (res, ajaxOptions, thrownError) {
			        }
			    });
				
				if ($("#assignRoleFormBox").is(":hidden")){
					$("#assignRoleFormBox").show();					
				} else {
					$("#assignRoleFormBox").hide();	
				}
			});
			
			$("#btnAssignSubmit").click(function(){
				// 删除''的元素
				if(ids[0]==''){
					ids.shift();
					pre_ids.shift();
				}
				if(pre_ids.sort().toString() == ids.sort().toString()){
					top.$.jBox.tip("未给角色【${role.name}】分配新成员！", 'info');
					return false;
				};
		    	// 执行保存
		    	var idsArr = "";
		    	for (var i = 0; i<ids.length; i++) {
		    		idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
		    	}
		    	$('#idsArr').val(idsArr);
		    	editPostHtml({form:"#assignRoleForm"});
			});
			
			$("#btnAssignClear").click(function(){
				clearAssign();
			});
			
			$("#btnAssignClose").click(function(){
				$("#assignRoleFormBox").hide();
			});
			
		});

		var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false,dblClickExpand:false},
				data: {simpleData: {enable: true}},
				callback: {onClick: treeOnClick}};
		
		var officeNodes=[
	            <c:forEach items="${officeList}" var="office">
	            {id:"${office.id}",
	             pId:"${not empty office.parent?office.parent.id:0}", 
	             name:"${office.name}"},
	            </c:forEach>];
	
		var pre_selectedNodes =[
   		        <c:forEach items="${userList}" var="user">
   		        {id:"${user.id}",
   		         pId:"0",
   		         name:"<font color='red' style='font-weight:bold;'>${user.name}</font>"},
   		        </c:forEach>];
		
		var selectedNodes =[
		        <c:forEach items="${userList}" var="user">
		        {id:"${user.id}",
		         pId:"0",
		         name:"<font color='red' style='font-weight:bold;'>${user.name}</font>"},
		        </c:forEach>];
		
		var pre_ids = "${selectIds}".split(",");
		var ids = "${selectIds}".split(",");
		
		//点击选择项回调
		function treeOnClick(event, treeId, treeNode, clickFlag){
			$.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
			if("officeTree"==treeId){
				$.get("${ctxAdmin}/sys/role/users?officeId=" + treeNode.id, function(userNodes){
					$.fn.zTree.init($("#userTree"), setting, userNodes);
				});
			}
			if("userTree"==treeId){
				//alert(treeNode.id + " | " + ids);
				//alert(typeof ids[0] + " | " +  typeof treeNode.id);
				if($.inArray(String(treeNode.id), ids)<0){
					selectedTree.addNodes(null, treeNode);
					ids.push(String(treeNode.id));
				}
			};
			if("selectedTree"==treeId){
				if($.inArray(String(treeNode.id), pre_ids)<0){
					selectedTree.removeNode(treeNode);
					ids.splice($.inArray(String(treeNode.id), ids), 1);
				}else{
					top.$.jBox.tip("角色原有成员不能清除！", 'info');
				}
			}
		};
		
		function clearAssign(){
			var submit = function (v, h, f) {
			    if (v == 'ok'){
					var tips="";
					if(pre_ids.sort().toString() == ids.sort().toString()){
						tips = "未给角色【${role.name}】分配新成员！";
					}else{
						tips = "已选人员清除成功！";
					}
					ids=pre_ids.slice(0);
					selectedNodes=pre_selectedNodes;
					$.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
			    	top.$.jBox.tip(tips, 'info');
			    } else if (v == 'cancel'){
			    	// 取消
			    	top.$.jBox.tip("取消清除操作！", 'info');
			    }
			    return true;
			};
			tips="确定清除角色【${role.name}】下的已选人员？";
			top.$.jBox.confirm(tips, "清除确认", submit);
		};
	</script>