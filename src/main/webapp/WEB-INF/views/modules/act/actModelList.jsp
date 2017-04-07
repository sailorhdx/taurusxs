<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/model/" class="ajaxify">模型列表</a>
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/act/model/create"  class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 新建模型
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" action="${ctxAdmin}/act/model" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">模型分类</label>
							<div class="col-md-8">
								<select id="category" name="category" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<option value="">全部分类</option>
									<c:forEach items="${fns:getDictList('act_category')}" var="dict">
										<option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
									</c:forEach>
								</select>
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
				<table class="table table-striped table-bordered table-nowrap">
					<thead>
						<tr>
							<th>流程分类</th>
							<th>模型信息</th>
							<th>版本号</th>
							<th>创建时间</th>
							<th>最后更新时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="model">
							<tr>
								<td><a href="javascript:updateCategory('${model.id}', '${model.category}')" title="设置分类">${fns:getDictLabel(model.category,'act_category','无分类')}</a>
								<td>
									模型ID：${model.id}<br>
									模型标识：${model.key}<br>
									模型名称：${model.name}
								</td>
								<td><b title='流程版本号'>V: ${model.version}</b></td>
								<td><fmt:formatDate value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${model.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/act/process-editor/modeler.jsp?modelId=${model.id}" target="_blank">编辑</a>
									<a href="${ctxAdmin}/act/model/deploy?id=${model.id}" onclick="return confirmGetHtml({mess:'确认要部署该模型吗？', url:this.href});">部署</a>
									<a href="${ctxAdmin}/act/model/export?id=${model.id}" target="_blank">导出</a>
				                    <a href="${ctxAdmin}/act/model/delete?id=${model.id}" onclick="return confirmGetJson({mess:'确认要删除该模型吗？', url:this.href});">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">${page}</div>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
    <!-- BEGIN UPDATE CATEGORY MODAL-->
    <div id="updateCategoryModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">设置分类</h4>
                </div>
                <div class="modal-body">
                    <form id="categoryForm" action="${ctxAdmin}/act/model/updateCategory" methon="post"  enctype="multipart/form-data" class="form-horizontal"><br/>
					<input id="categoryBoxId" type="hidden" name="id" value="" class="form-control"/>
					<div class="form-group">
						<div class="col-md-6">
							<select id="categoryBoxCategory" name="category"  class="form-control">
								<option value="">无分类</option>
								<c:forEach items="${fns:getDictList('act_category')}" var="dict">
									<option value="${dict.value}">${dict.label}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-offset-2 col-md-4">	
							<input id="categorySubmit" class="btn btn-primary" type="submit" value="保存"/>
							<input data-dismiss="modal" class="btn dark" type="button" value="关闭"/>
						</div>
					</div>　　
					</form>
                </div>
            </div>
        </div>
    </div>
    <!-- END UPDATE CATEGORY MODAL-->

	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#searchForm").validate({
				submitHandler: function(form){
					page();
				}
			});	
			
			$("#categoryForm").validate({
				submitHandler: function(form){
					ajaxFormSubmit('#categoryForm', $("#categoryForm").attr("action"));
					$('#updateCategoryModal').modal('hide');
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
			
		});
			
		function updateCategory(id, category){
			$('#updateCategoryModal').modal('show');
			//$.jBox($("#categoryBox").html(), {title:"设置分类", buttons:{"关闭":true}, submit: function(){}});
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
		}
	</script>
