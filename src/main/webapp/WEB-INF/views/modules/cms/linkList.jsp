<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

    <!-- BEGIN PAGE TITLE-->
    <h1 class="page-title"> 
    </h1>
    <!-- END PAGE TITLE-->
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/cms/link/?category.id=${link.category.id}" class="ajaxify">
					链接列表
				</a>
            </div>
            <div class="actions">
            	<shiro:hasPermission name="cms:link:edit">
            		<a href="<c:url value='${fns:getAdminPath()}/cms/link/form?id=${link.id}&category.id=${link.category.id}'><c:param name='category.name' value='${link.category.name}'/></c:url>"  class="btn ajaxify">
            			<i class="fa fa-pencil"></i> 链接添加
            		</a>
            	</shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="link" action="${ctxAdmin}/cms/link/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">栏目</label>
							<div class="col-md-8">
								<sys:treeselect id="category" name="category.id" value="${link.category.id}" labelName="category.name" labelValue="${link.category.name}"
									title="栏目" url="/cms/category/treeData" module="link" notAllowSelectRoot="false"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">名称</label>
							<div class="col-md-8">
								<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">状态</label>
							<div class="col-md-8">
								<form:select path="delFlag" class="select2 form-control" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:options items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
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
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>栏目</th>
							<th>名称</th>
							<th>权重</th>
							<th>发布者</th>
							<th>更新时间</th>
							<shiro:hasPermission name="cms:link:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="link">
						<tr>
							<td><a href="javascript:" onclick="$('#categoryId').val('${link.category.id}');$('#categoryName').val('${link.category.name}');$('#searchForm').submit();return false;">${link.category.name}</a></td>
							<td><a href="${ctxAdmin}/cms/link/form?id=${link.id}" title="${link.title}">${fns:abbr(link.title,40)}</a></td>
							<td>${link.weight}</td>
							<td>${link.user.name}</td>
							<td><fmt:formatDate value="${link.updateDate}" type="both"/></td>
							<shiro:hasPermission name="cms:link:edit">
							<td>
			    				<a href="${ctxAdmin}/cms/link/form?id=${link.id}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/cms/link/delete?id=${link.id}${link.delFlag ne 0?'&isRe=true':''}&categoryId=${link.category.id}" onclick="return confirmGetJson({mess:'确认要${link.delFlag ne 0?'发布':'删除'}该链接吗？', url:this.href})" >${link.delFlag ne 0?'发布':'删除'}</a>
							</td>
							</shiro:hasPermission>
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
	<script type="text/javascript">
		$(document).ready(function() {
			// 查询表单校验
			$("#searchForm").validate({
				submitHandler: function(form){
					page();
				}
			});
			
			// 初始化Select2控件
			ComponentsSelect2.init();
		});
	</script>			