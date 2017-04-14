<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="<c:url value='${fns:getAdminPath()}/cms/link/form?id=${link.id}&category.id=${link.category.id}'><c:param name='category.name' value='${link.category.name}'/></c:url>" class="ajaxify">
                	链接<shiro:hasPermission name="cms:link:edit">${not empty link.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:link:edit">查看</shiro:lacksPermission>
                </a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/cms/link/?category.id=${link.category.id}" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 链接列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="link" action="${ctxAdmin}/cms/link/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">归属栏目</label>
					<div class="col-md-6">
		                <sys:treeselect id="category" name="category.id" value="${link.category.id}" labelName="category.name" labelValue="${link.category.name}"
							title="栏目" url="/cms/category/treeData" module="link" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">名称</label>
					<div class="col-md-6">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">颜色</label>
					<div class="col-md-6">
						<form:select path="color" class="bs-select form-control">
							<form:option value="" label="默认"/>
							<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">链接图片</label>
					<div class="col-md-6">
						<form:hidden path="image" htmlEscape="false" maxlength="255" class="form-control"/>
						<sys:ckfinder input="image" type="Images" uploadPath="/cms/link" selectMultiple="false"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">链接地址</label>
					<div class="col-md-6">
						<form:input path="href" htmlEscape="false" maxlength="255" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">权重</label>
					<div class="col-md-4">
						<form:input path="weight" htmlEscape="false" maxlength="200" class="form-control required digits"/>
					</div>
					<div class="col-md-4">
						<label class="mt-checkbox mt-checkbox-outline">
							<input id="weightTop" type="checkbox" onclick="$('#weight').val(this.checked?'999':'0')">
							置顶
							<span></span>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">过期时间</label>
					<div class="col-md-6">
						<input id="weightDate" name="weightDate" type="text" readonly="readonly" maxlength="20" class="form-control"
							value="<fmt:formatDate value="${link.weightDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
						<span class="help-inline">数值越大排序越靠前，过期时间可为空，过期后取消置顶。</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control"/>
					</div>
				</div>
				<shiro:hasPermission name="cms:article:audit">
					<div class="form-group">
						<label class="control-label col-md-4">发布状态</label>
						<div class="col-md-6">
							<form:select path="delFlag" class="bs-select form-control">
								<form:options items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</shiro:hasPermission>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/cms/link/?category.id=${link.category.id}');"/>
						<shiro:hasPermission name="cms:link:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>
						</shiro:hasPermission>
					</div>
				</div>
			</form:form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->
    <script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				},errorPlacement: function(error, element) {
					jqueryValidateErrorPlacement(error, element);
				}
			});
			
			// 初始化Bootstrap Select控件
			ComponentsBootstrapSelect.init();
		});
	</script>