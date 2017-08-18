<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="${ctxAdmin}/sys/user/form" class="ajaxify">
					用户<shiro:hasPermission name="sys:user:edit">${not empty user.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:user:edit">查看</shiro:lacksPermission>
				</a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/user/list" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 用户列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="user" action="${ctxAdmin}/sys/user/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">头像</label>
					<div class="col-md-6">
						<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="Images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">归属公司</label>
					<div class="col-md-6">
		                <sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
							title="公司" url="/sys/office/treeData?type=1" cssClass="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">归属部门</label>
					<div class="col-md-6">
		                <sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="required" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group in-line">
					<label class="control-label col-md-4 required">工号</label>
					<div class="col-md-6">
						<form:input path="no" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">姓名</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">登录名</label>
					<div class="col-md-6">
						<input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
						<form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 ${empty user.id? 'required':''}">密码</label>
					<div class="col-md-6">
						<input id="newPassword" name="newPassword" type="password" autocomplete="off" value="" maxlength="50" minlength="3" class="${empty user.id?'required':''} form-control"/>
						<c:if test="${not empty user.id}"><span class="help-block">若不修改密码，请留空。</span></c:if>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 ${empty user.id? 'required':''}">确认密码</label>
					<div class="col-md-6">
						<input id="confirmNewPassword" name="confirmNewPassword" type="password" autocomplete="off" value="" maxlength="50" minlength="3" equalTo="#newPassword"  class="${empty user.id?'required':''} form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">邮箱</label>
					<div class="col-md-6">
						<form:input path="email" htmlEscape="false" maxlength="100" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">电话</label>
					<div class="col-md-6">
						<form:input path="phone" htmlEscape="false" maxlength="100" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">手机</label>
					<div class="col-md-6">
						<form:input path="mobile" htmlEscape="false" maxlength="100" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">是否允许登录</label>
					<div class="col-md-6">
						<form:select path="loginFlag" class="select2" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true"  data-height="300">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>							
						<span class="help-block">“是”代表此账号允许登录，“否”则表示此账号不允许登录</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">用户类型</label>
					<div class="col-md-6">
		                <form:select path="userType" class="mt-multiselect btn btn-default" multiple="single" data-label="left" data-select-all="false" data-width="100%" data-filter="true" data-action-onchange="true"  data-height="300">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">用户角色</label>
					<div class="col-md-6">
						<form:select path="roleIdList" class="bs-select form-control required" multiple="multiple" data-actions-box="true">
                            <form:options items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false"/>
		                </form:select>						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200"  class="form-control"/>
					</div>
				</div>
				<c:if test="${not empty user.id}">
					<div class="form-group">
						<label class="control-label col-md-4">创建时间</label>
						<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">最后登陆</label>
						<div class="col-md-6">
							<p class="form-control-static">IP: ${user.loginIp},时间：<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/></p>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/sys/user/list');"/>
						<shiro:hasPermission name="sys:user:edit">
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
			$("#no").focus();
			$("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctxAdmin}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}
				},
				messages: {
					loginName: {remote: "用户登录名已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
				submitHandler: function(form){
					editPostHtml();
				},
				errorPlacement: function(error, element) {
					jqueryValidateErrorPlacement(error, element);
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
			// 初始化Select2控件
			ComponentsSelect2.init();
			// 初始化Bootstrap Select控件
			ComponentsBootstrapSelect.init();
		});
	</script>
</body>
</html>