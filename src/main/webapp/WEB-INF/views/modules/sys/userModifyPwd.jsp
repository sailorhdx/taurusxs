<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="${ctxAdmin}/sys/user/modifyPwd" class="ajaxify">修改密码</a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/user/info" class="btn btn-outline ajaxify">
                    <i class="fa fa-pencil"></i> 个人信息 
                </a>
                <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
            <form:form id="inputForm" modelAttribute="user"  action="${ctxAdmin}/sys/user/modifyPwd" method="post" class="form-horizontal">
				<form:hidden path="id"/>
	            <sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">旧密码</label>
					<div class="col-md-6">
						<input id="oldPassword" name="oldPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">密码</label>
					<div class="col-md-6">
						<input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">确认新密码</label>
					<div class="col-md-6">
						<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required" equalTo="#newPassword"/>
					</div>
				</div>
	            <div class="form-group">
	               <div class="col-md-offset-4 col-md-6">
	                  <button id="btnSubmit" type="submit" class="btn red">保存</button>
	               </div>
	            </div>
            </form:form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- BEGIN PORTLET-->

	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				messages: {
					confirmNewPassword: {equalTo: "请输入与上面相同的密码"}
				},
				submitHandler: function(form){
					editPostHtml();
				}
			});
		});
	</script>