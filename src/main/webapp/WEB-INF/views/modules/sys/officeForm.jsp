<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				机构<shiro:hasPermission name="sys:office:edit">${not empty office.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:office:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/office/list?id=${office.parent.id}&parentIds=${office.parentIds}" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 机构列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="office" action="${ctxAdmin}/sys/office/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-body">	
					<legend>基本信息</legend>
					<div class="form-group">
						<label class="control-label col-md-4">上级机构</label>
						<div class="col-md-6">
			                <sys:treeselect id="office" name="parent.id" value="${office.parent.id}" labelName="parent.name" labelValue="${office.parent.name}"
								title="机构" url="/sys/office/treeData" extId="${office.id}" allowClear="${office.currentUser.admin}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4 required">归属区域</label>
						<div class="col-md-6">
			                <sys:treeselect id="area" name="area.id" value="${office.area.id}" labelName="area.name" labelValue="${office.area.name}"
								title="区域" url="/sys/area/treeData" cssClass="required"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4 required">机构名称</label>
						<div class="col-md-6">
							<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">机构简称</label>
						<div class="col-md-6">
							<form:input path="abbreviation" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">机构编码</label>
						<div class="col-md-6">
							<form:input path="code" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">机构类型</label>
						<div class="col-md-6">
							<form:select path="type" class="mt-multiselect btn btn-default" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
								<form:options items="${fns:getDictList('sys_office_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">机构级别</label>
						<div class="col-md-6">
							<form:select path="grade" class="mt-multiselect btn btn-default" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
								<form:options items="${fns:getDictList('sys_office_grade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">是否可用</label>
						<div class="col-md-6">
							<form:select path="useable" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline">“是”代表此机构允许使用，“否”则表示此机构不允许使用</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">备注</label>
						<div class="col-md-6">
							<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/>
						</div>
					</div>
					<legend>联系信息</legend>	
					<div class="form-group">
						<label class="control-label col-md-4">联系地址</label>
						<div class="col-md-6">
							<form:input path="address" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">邮政编码</label>
						<div class="col-md-6">
							<form:input path="zipCode" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">电话</label>
						<div class="col-md-6">
							<form:input path="phone" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">传真</label>
						<div class="col-md-6">
							<form:input path="fax" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">邮箱</label>
						<div class="col-md-6">
							<form:input path="email" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">负责人</label>
						<div class="col-md-6">
							<form:input path="master" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">负责人电话</label>
						<div class="col-md-6">
							<form:input path="masterPhone" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>					
					<div class="form-group">
						<label class="control-label col-md-4">联系人</label>
						<div class="col-md-6">
							<form:input path="contact" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">联系人电话</label>
						<div class="col-md-6">
							<form:input path="contactPhone" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<legend>管理信息</legend>					
					<div class="form-group">
						<label class="control-label col-md-4">主负责人</label>
						<div class="col-md-6">
							 <sys:treeselect id="primaryPerson" name="primaryPerson.id" value="${office.primaryPerson.id}" labelName="office.primaryPerson.name" labelValue="${office.primaryPerson.name}"
								title="用户" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
							<span class="help-inline">此为管理用户账号，登录后只能管理自己部门及子部门的数据</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">副负责人</label>
						<div class="col-md-6">
							 <sys:treeselect id="deputyPerson" name="deputyPerson.id" value="${office.deputyPerson.id}" labelName="office.deputyPerson.name" labelValue="${office.deputyPerson.name}"
								title="用户" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
							<span class="help-inline">此为管理用户账号，登录后只能管理自己部门及子部门的数据</span>
						</div>
					</div>
					<c:if test="${empty office.id}">
						<div class="form-group">
							<label class="control-label col-md-4">快速添加下级部门</label>
							<div class="col-md-6">
								<!--<form:checkboxes path="childDeptList" items="${fns:getDictList('sys_office_common')}" itemLabel="label" itemValue="value" htmlEscape="false"/>-->
								<form:select path="childDeptList" class="mt-multiselect btn btn-default" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
									<form:options items="${fns:getDictList('sys_office_common')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
					</c:if>
				</div>
				<div class="form-group">
	               <div class="col-md-offset-4 col-md-6">
	               		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/sys/office/list?id=&parentIds=');"/>				
						<shiro:hasPermission name="sys:office:edit">
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
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();			
		});
	</script>