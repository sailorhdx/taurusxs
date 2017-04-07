<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				区域<shiro:hasPermission name="sys:area:edit">${not empty area.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:area:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/area/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 区域列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="area" action="${ctxAdmin}/sys/area/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">上级区域</label>
					<div class="col-md-6">
						<sys:treeselect id="area" name="parent.id" value="${area.parent.id}" labelName="parent.name" labelValue="${area.parent.name}"
							title="区域" url="/sys/area/treeData" extId="${area.id}" cssClass="" allowClear="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">区域名称</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">区域编码</label>
					<div class="col-md-6">
						<form:input path="code" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">区域类型</label>
					<div class="col-md-6">
						<form:select path="type" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="true" data-action-onchange="true">
							<form:options items="${fns:getDictList('sys_area_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>							
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
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/sys/area');"/>
						<shiro:hasPermission name="sys:area:edit">
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
					editPostHtml({form:"#inputForm"});
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
	</script>