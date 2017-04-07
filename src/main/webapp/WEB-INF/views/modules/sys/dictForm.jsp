<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				字典<shiro:hasPermission name="sys:dict:edit">${not empty dict.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:dict:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/dict/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 字典列表
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="dict" action="${ctxAdmin}/sys/dict/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">键值</label>
					<div class="col-md-6">
						<form:input path="value" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">标签</label>
					<div class="col-md-6">
						<form:input path="label" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">类型</label>
					<div class="col-md-6">
						<form:input path="type" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">描述</label>
					<div class="col-md-6">
						<form:input path="description" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">排序</label>
					<div class="col-md-6">
						<form:input path="sort" htmlEscape="false" maxlength="11" class="form-control equired digits"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
	               <div class="col-md-offset-4 col-md-6">
	               		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/sys/dict');"/>
						<shiro:hasPermission name="sys:dict:edit">
							<input id="btnSubmit" class="btn red" type="submit" value="保存"/>
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
			$("#value").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
		});
	</script>