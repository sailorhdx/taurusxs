<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>
                <a href="${ctxAdmin}/sys/user/info" class="ajaxify"> 个人信息 </a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/user/modifyPwd" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 修改密码 
                </a>
                <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
			<!-- BEGIN FORM-->
            <form:form id="inputForm" modelAttribute="user" action="${ctxAdmin}/sys/user/info" method="post" class="form-horizontal">
	            <sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">头像</label>
					<div class="col-md-6">
						<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="Images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属公司</label>
					<div class="col-md-6">
						<p class="form-control-static">${user.company.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属部门</label>
					<div class="col-md-6">
						<p class="form-control-static">${user.office.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">姓名</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control" readonly="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">邮箱</label>
					<div class="col-md-6">
						<form:input path="email" htmlEscape="false" maxlength="50" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">电话</label>
					<div class="col-md-6">
						<form:input path="phone" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">手机</label>
					<div class="col-md-6">
						<form:input path="mobile" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">用户类型</label>
					<div class="col-md-6">
						<p class="form-control-static">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">用户角色</label>
					<div class="col-md-6">
						<p class="form-control-static">${user.roleNames}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">上次登录</label>
					<div class="col-md-6">
						<p class="form-control-static">IP: ${user.oldLoginIp},时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></p>
					</div>
				</div>
	            <div class="form-group">
	               <div class="col-md-offset-4 col-md-6">
	                  <button id="btnReset" type="reset" class="btn default">取消</button>
	                  <button id="btnSubmit" type="submit" class="btn red">保存</button>
	               </div>
	            </div>
            </form:form>
            <!-- END FORM-->
		</div>
    </div>
    <!-- END PORTLET-->
   
 	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
		});
	</script>                               