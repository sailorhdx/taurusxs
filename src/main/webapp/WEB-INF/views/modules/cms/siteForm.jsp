<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				站点<shiro:hasPermission name="cms:site:edit">${not empty site.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:site:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/cms/site" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 站点列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="site" action="${ctxAdmin}/cms/site/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">站点名称:</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">站点标题:</label>
					<div class="col-md-6">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">站点Logo:</label>
					<div class="col-md-6">
						<form:hidden path="logo" htmlEscape="false" maxlength="255"  class="form-control"/>
						<sys:ckfinder input="logo" type="Images" uploadPath="/cms/site"/>
						<span class="help-inline">建议Logo大小：1000 × 145（像素）</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">描述:</label>
					<div class="col-md-6">
						<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200"  class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">关键字:</label>
					<div class="col-md-6">
						<form:input path="keywords" htmlEscape="false" maxlength="200"  class="form-control"/>
						<span class="help-inline">填写描述及关键字，有助于搜索引擎优化</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">默认主题:</label>
					<div class="col-md-6">
						<form:select path="theme"  class="form-control select2">
							<form:options items="${fns:getDictList('cms_theme')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">版权信息:</label>
					<div class="col-md-8">
						<form:textarea id="copyright" htmlEscape="true" path="copyright" rows="4" maxlength="200" class="form-control"/>
						<sys:ckeditor replace="copyright" uploadPath="/cms/site" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">自定义首页视图:</label>
					<div class="col-md-6">
						<form:input path="customIndexView" htmlEscape="false" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
	               	<div class="col-md-offset-4 col-md-6">
	               		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/cms/site');"/>
						<shiro:hasPermission name="cms:site:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存" onClick="CKupdate();"/>
						</shiro:hasPermission>
					</div>
				</div>
			</form:form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- BEGIN PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
			
			// 初始化Select2控件
			ComponentsSelect2.init();
		});
		
		function CKupdate(){
			for ( instance in CKEDITOR.instances )
			  CKEDITOR.instances[instance].updateElement();
		}		
	</script>