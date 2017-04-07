<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${globalPluginsPath}/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/sys/user/list" class="ajaxify">
					用户列表
				</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:user:edit">
	                <a href="${ctxAdmin}/sys/user/form" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 用户添加 
	                </a>
	            </shiro:hasPermission>
	            <a id="btnShowHideTree" class="btn btn-icon-only btn-default"><i class="fa fa-wrench"></i></a>
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
	       		<div id="searchBox">
					<form:form id="searchForm" modelAttribute="user" action="${ctxAdmin}/sys/user/pageData" method="post" class="form-horizontal">
						<input id="searchFormFlag" name="searchFormFlag" type="hidden" value="search"/>
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
						<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
						<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="mustachePage();"/>
						<div class="form-group">
							<label class="control-label col-md-2">归属公司</label>
							<div class="col-md-4">
								<sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
									title="公司" url="/sys/office/treeData?type=1" allowClear="true"/>
							</div>
							<label class="control-label col-md-2">帐号</label>
							<div class="col-md-4">
								<form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2">归属部门</label>
							<div class="col-md-4">
								<sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
								title="部门" url="/sys/office/treeData?type=2" allowClear="true" notAllowSelectParent="true"/>
							</div>
							<label class="control-label col-md-2">姓名</label>
							<div class="col-md-4">
								<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">				
								<input id="btnSubmit" class="btn btn-primary" type="button" value="查询"/>
								<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
								<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
							</div>
						</div>
					</form:form>
				</div>
	            <!-- END FORM-->
	       		<!-- BEGIN FORM-->
	       		<div id="importBox" style="display: none;">
					<form id="importForm" action="${ctxAdmin}/sys/user/import" method="post" enctype="multipart/form-data" class="form-horizontal"><br/>
						<div class="row margin-bottom-5" >
			                <label class="control-label col-md-2">用户导入</label>
			                <div class="col-md-10">
			                    <div class="fileinput fileinput-new" data-provides="fileinput">
			                        <div class="input-group input-large">
			                            <div class="form-control uneditable-input input-fixed input-medium" data-trigger="fileinput">
			                                <i class="fa fa-file fileinput-exists"></i>&nbsp;
			                                <span class="fileinput-filename"> </span>
			                            </div>
			                            <span class="input-group-addon btn default btn-file">
			                                <span class="fileinput-new"> 选择文件 </span>
			                                <span class="fileinput-exists"> 更换文件 </span>
			                                <input id="uploadFile" type="file" name="file"> </span>
			                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput"> 移除文件 </a>
			                            <a id="btnImportSubmit" href="javascript:;" class="input-group-addon btn blue fileinput-exists"> 导入文件 </a>
			                        </div>
			                    </div>
			           		</div>
			           	</div>
			           	<div class="row margin-bottom-5">
							<div class="col-md-offset-2 col-md-4">
								<div class="fileinput">				
		                        <a href="${ctxAdmin}/sys/user/import/template" class="input-group-addon btn yellow"> 下载模版 </a>
		                        <a id="btnImportClose" href="javascript:;" class="input-group-addon btn purple"> 关闭导入 </a>
		                        </div>
							</div>
						</div>
					</form>	
				</div>		
	       		<!-- END FORM-->               
	            <sys:message content="${message}"/>
	            <!-- BEGIN TABLE-->
	            <div id="tableBox" class="dataTables_wrapper">
			        <table id="contentTable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>归属公司</th>
								<th>归属部门</th>
								<th>帐号</th>
								<th>姓名</th>
								<th>电话</th>
								<th>手机</th>
								<%--<th>角色</th> --%>
								<shiro:hasPermission name="sys:user:edit">
									<th>操作</th>
								</shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="pageTableList"></tbody>
						<script type="text/template" id="pageTableTpl">
							<tr>
								<td>{{row.company.name}}</td>
								<td>{{row.office.name}}</td>
								<td><a href="${ctxAdmin}/sys/user/form?id={{row.id}}" class="ajaxify">{{row.loginName}}</a></td>
								<td>{{row.name}}</td>
								<td>{{row.phone}}</td>
								<td>{{row.mobile}}</td>
								<shiro:hasPermission name="sys:user:edit">
								<td>
						  			<a href="${ctxAdmin}/sys/user/form?id={{row.id}}" class="btn btn-outline btn-xs purple ajaxify">
						  				<i class="fa fa-edit"></i>修改
						  			</a>
									<a href="${ctxAdmin}/sys/user/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该用户吗？', url:this.href, callback:'deleteCallback'});" class="btn btn-outline dark btn-xs black">
										<i class="fa fa-trash-o"></i>删除
									</a>
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
		</div>
    </div>
    <!-- END PORTLET-->
    
	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="${globalPluginsPath}/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    
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
			

			// 查询按钮点击事件
			$("#btnSubmit").click(function(){
				$("#searchForm").attr("action","${ctxAdmin}/sys/user/pageData");
				$("#searchFormFlag").val("search");
				$("#searchForm").submit();
			});
			
			// 查询用户表单校验
			$("#searchForm").validate({
				submitHandler: function(form){
					if ($("#searchFormFlag").val() === "export") {
						form.submit();
					} else {
						searchPostJson({pageSize:10});
					}
				}
			});
			
			// 导出按钮点击事件
			$("#btnExport").click(function(){
				$("#searchForm").attr("action","${ctxAdmin}/sys/user/export");
				$("#searchFormFlag").val("export");
				swal({
						title:'系统提示',
						text:'确认要导出用户数据吗？',
						type: 'warning',
						showConfirmButton: true,
			  			showCancelButton: true,
			  			confirmButtonText: "确认",
				  		cancelButtonText: "取消"
				  	}, function(isConfirm){
						if (isConfirm){
							$("#searchForm").submit();
						}
					});
			});
			
			// 导入按钮点击事件
			$("#btnImport").click(function(){
				if ($("#importBox").is(":hidden")){
					$("#importBox").show();					
				} else {
					$("#importBox").hide();	
				}
			});
			
			// 导入用户表单提交按钮点击事件
			$("#btnImportSubmit").click(function(){
				$("#importForm").submit();
			});
			
			// 导入用户表单关闭按钮点击事件
			$("#btnImportClose").click(function(){
				$("#importBox").hide();
			});
			
			// 打开页面默认点击刷新组织机构树按钮，初始化组织机构树
			$("#btnRefreshTree").click();
			// 打开页面默认点击查询按钮，初始化table数据
			$("#btnSubmit").click();
		});
		
		// 导入用户表单校验
		$("#importForm").validate({
			submitHandler: function(form){
				var pageContent = $('.page-content .page-content-body');
				var mess = "正在提交，请稍等...";
				var formData = new FormData($("#importForm")[0]); 
				App.startPageLoading({message: mess});
				$.ajax({
			        type: "post",
			        cache: false,
			        async: true,
			        url: $("#importForm").attr("action"),
			        data: formData,
			        contentType: false,  
			        processData: false,
			        success: function (res) {
			        	$("#importBox").hide();
			            App.stopPageLoading();
			            messageToastr(res.message, 'info');
			            var pageContent = $('.page-content .page-content-body');
			            pageContent.empty();
						pageContent.html(res);
			            Layout.fixContentHeight(); // fix content height
			            App.initAjax(); // initialize core stuff
			        },
			        error: function (res, ajaxOptions, thrownError) {
			        	$("#importBox").hide();
			            App.stopPageLoading();
			            messageToastr(res.message + " ERROR " + res.status, "error");
			        }
			    });
			}
		});
		
		// 刷新组织机构树
		function refreshTree(){
			var setting = {
					view:{expandSpeed:""},
					data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'},key:{title: 'type'}},
					
       				callback:{onClick:function(event, treeId, treeNode){
       					var id = treeNode.id == '0' ? '' :treeNode.id;
						$("#officeId").val(id);
						$("#officeName").val(treeNode.name);
						searchPostJson({pageSize:10});
       				}
       			}
       		};
			
   			$.getJSON("${ctxAdmin}/sys/office/treeData",function(data){
   				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
   			});
   		}
 		
		// 删除操作回调函数
		function deleteCallback(res) {
			// 重新查询数据表单
			$("#btnSubmit").click();
		}
		
	</script>