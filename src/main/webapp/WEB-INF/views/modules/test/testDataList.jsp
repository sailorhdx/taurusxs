<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/test/testData/" class="ajaxify">单表列表</a>
            </div>
            <div class="actions">
	            <shiro:hasPermission name="test:testData:edit">
	                <a href="${ctxAdmin}/test/testData/form" class="btn ajaxify">
	                	<i class="fa fa-pencil"></i> 单表添加 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM-->   
			<div id="searchBox">
				<form:form id="searchForm" modelAttribute="testData" action="${ctxAdmin}/test/testData/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">归属用户</label>
							<div class="col-md-8">
								<sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
									title="用户" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">归属部门</label>
							<div class="col-md-8">
								<sys:treeselect id="office" name="office.id" value="${testData.office.id}" labelName="office.name" labelValue="${testData.office.name}"
									title="部门" url="/sys/office/treeData?type=2" allowClear="true" notAllowSelectParent="true"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">归属区域</label>
							<div class="col-md-8">
								<sys:treeselect id="area" name="area.id" value="${testData.area.id}" labelName="area.name" labelValue="${testData.area.name}"
									title="区域" url="/sys/area/treeData" allowClear="true" notAllowSelectParent="true"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">名称</label>
							<div class="col-md-8">
								<form:input path="name" htmlEscape="false" maxlength="100" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">性别</label>
							<div class="col-md-8">
								<form:select path="sex" class="mt-multiselect btn btn-default" data-label="left" data-select-all="true" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:option value="" label="全部"/>
									<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">加入日期</label>
							<div class="col-md-8">
								<form:input id="beginInDate" path="beginInDate" type="text" readonly="true" maxlength="20" class="form-control"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/> - 
								<form:input id="endInDate" path="endInDate" type="text" readonly="true" maxlength="20" class="form-control"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
							</div>
						</div>
					</div>
					<div class="row">
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
							<th>归属用户</th>
							<th>归属部门</th>
							<th>归属区域</th>
							<th>名称</th>
							<th>性别</th>
							<th>更新时间</th>
							<th>备注信息</th>
							<shiro:hasPermission name="test:testData:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/test/testData/form?id={{row.id}}" class="ajaxify">
								{{row.user.name}}
							</a></td>
							<td>
								{{row.office.name}}
							</td>
							<td>
								{{row.area.name}}
							</td>
							<td>
								{{row.name}}
							</td>
							<td>
								{{dict.sex}}
							</td>
							<td>
								{{row.updateDate}}
							</td>
							<td>
								{{row.remarks}}
							</td>
							<shiro:hasPermission name="test:testData:edit">
							<td>
			    				<a href="${ctxAdmin}/test/testData/form?id={{row.id}}"  class="ajaxify">修改</a>
								<a href="${ctxAdmin}/test/testData/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该单表吗？', url:this.href, action:'delete'})">删除</a>
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
					searchPostJson({funcParam:{callback:"searchCallback"}});
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		
			// 页面打开初始化执行查询操作
			$("#searchForm").submit();
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
           
   			$("#pageTableList").append(Mustache.render(param.tpl, {
            	dict: {
					sex: getDictLabel(${fns:toJson(fns:getDictList('sex'))}, item.sex)
				}, 
				pid: (param.root?0:param.pid), 
				row: item
            }));
		};
		
	</script>