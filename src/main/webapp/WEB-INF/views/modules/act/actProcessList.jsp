<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/process/" class="ajaxify">流程列表</a>
            </div>
            <div class="actions">
              	<a href="${ctxAdmin}/act/process/deploy/" class="btn ajaxify">
              		<i class="fa fa-clone"></i> 部署流程
              	</a>
	            <a href="${ctxAdmin}/act/process/running/"  class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 运行中的流程 
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" action="${ctxAdmin}/act/process" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">流程分类</label>
							<div class="col-md-8">
								<select id="category" name="category" class="bs-select form-control">
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
							<!-- <th>流程ID</th> -->
							<th>流程标识</th>
							<th>流程名称</th>
							<th>流程版本</th>
							<th>部署时间</th>
							<th>流程XML</th>
							<th>流程图片</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="object">
							<c:set var="process" value="${object[0]}" />
							<c:set var="deployment" value="${object[1]}" />
							<tr>
								<td><a href="javascript:updateCategory('${process.id}', '${process.category}')" title="设置分类">${fns:getDictLabel(process.category,'act_category','无分类')}</a></td>
								<!-- <td>${process.id}</td>-->
								<td>${process.key}</td>
								<td>${process.name}</td>
								<td><b title='流程版本号'>V: ${process.version}</b></td>
								<td><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><a target="_blank" href="${ctxAdmin}/act/process/resource/read?procDefId=${process.id}&resType=xml">${process.resourceName}</a></td>
								<td><a target="_blank" href="${ctxAdmin}/act/process/resource/read?procDefId=${process.id}&resType=image">${process.diagramResourceName}</a></td>
								<td>
									<c:if test="${process.suspended}">
										<a href="${ctxAdmin}/act/process/update/active?procDefId=${process.id}" onclick="return confirmGetHtml({mess:'确认要激活吗？', url:this.href})">激活</a>
									</c:if>
									<c:if test="${!process.suspended}">
										<a href="${ctxAdmin}/act/process/update/suspend?procDefId=${process.id}" onclick="return confirmGetHtml({mess:'确认挂起除吗？', url:this.href})">挂起</a>
									</c:if>
									<a href='${ctxAdmin}/act/process/delete?deploymentId=${process.deploymentId}' onclick="return confirmGetJson({mess:'确认要删除该流程吗？', url:this.href})">删除</a>
			                        <a href='${ctxAdmin}/act/process/convert/toModel?procDefId=${process.id}' onclick="return confirmGetHtml({mess:'确认要转换为模型吗？', url:this.href})">转换为模型</a>
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
                    <form id="categoryForm" action="${ctxAdmin}/act/process/updateCategory" method="post" enctype="multipart/form-data" class="form-horizontal"><br/>
						<input id="categoryBoxId" type="hidden" name="procDefId" value="" class="form-control"/>
						<div class="row">
							<div class="form-group">
								<div class="col-md-offset-1 col-md-5">
									<select id="categoryBoxCategory" name="category"  class="bs-select form-control">
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
			
			// 初始化Bootstrap Select控件
			ComponentsBootstrapSelect.init();
			
		});
		
		function updateCategory(id, category){
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
			$('#updateCategoryModal').modal('show');
		}
	</script>
