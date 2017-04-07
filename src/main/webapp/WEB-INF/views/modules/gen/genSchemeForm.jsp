<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/gen/genScheme/form?id=${genScheme.id}" class="ajaxify">生成方案<shiro:hasPermission name="gen:genScheme:edit">${not empty genScheme.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gen:genScheme:edit">查看</shiro:lacksPermission></a>
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/gen/genScheme/" class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 生成方案添加 </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM-->   
			<form:form id="inputForm" modelAttribute="genScheme" action="${ctxAdmin}/gen/genScheme/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<form:hidden path="flag"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">方案名称</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">模板分类</label>
					<div class="col-md-6">
						<form:select path="category" class="mt-multiselect btn btn-default required" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
							<form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline">
							生成结构：{包名}/{模块名}/{分层(dao,entity,service,web)}/{子模块名}/{java类}
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">生成包路径</label>
					<div class="col-md-6">
						<form:input path="packageName" htmlEscape="false" maxlength="500" class="form-control required"/>
						<span class="help-inline">建议模块包：com.thinkgem.jeesite.modules</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">生成模块名</label>
					<div class="col-md-6">
						<form:input path="moduleName" htmlEscape="false" maxlength="500" class="form-control required"/>
						<span class="help-inline">可理解为子系统名，例如 sys</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">生成子模块名</label>
					<div class="col-md-6">
						<form:input path="subModuleName" htmlEscape="false" maxlength="500" class="form-control"/>
						<span class="help-inline">可选，分层下的文件夹，例如 </span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">生成功能描述</label>
					<div class="col-md-6">
						<form:input path="functionName" htmlEscape="false" maxlength="500" class="form-control required"/>
						<span class="help-inline">将设置到类描述</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">生成功能名</label>
					<div class="col-md-6">
						<form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="form-control required"/>
						<span class="help-inline">用作功能提示，如：保存“某某”成功</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">生成功能作者</label>
					<div class="col-md-6">
						<form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="form-control required"/>
						<span class="help-inline">功能开发者</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">业务表名</label>
					<div class="col-md-6">
						<form:select path="genTable.id" class="mt-multiselect btn btn-default required" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
							<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
						</form:select>
						<span class="help-inline">生成的数据表，一对多情况下请选择主表。</span>
					</div>
				</div>
				<div class="form-group hide">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">替换现有文件</label>
					<div class="col-md-6">
						<form:select path="replaceFile" class="mt-multiselect btn btn-default" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
	            	<div class="col-md-offset-4 col-md-6">
	            		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/gen/genScheme/');"/>
						<shiro:hasPermission name="gen:genScheme:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存方案" onclick="$('#flag').val('0');"/>
							<input id="btnSubmit" class="btn btn-danger" type="submit" value="保存并生成代码" onclick="$('#flag').val('1');"/>
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
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
	</script>    			
</body>
</html>
