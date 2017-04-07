<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="${ctxAdmin}/test/testData/form?id=${testData.id}" class="ajaxify">
					单表<shiro:hasPermission name="test:testData:edit">${not empty testData.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:testData:edit">查看</shiro:lacksPermission>
				</a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/test/testData/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 单表列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="testData" action="${ctxAdmin}/test/testData/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				<div class="form-group">
					<label class="control-label col-md-4">归属用户</label>
					<div class="col-md-6 ">
						<sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属部门</label>
					<div class="col-md-6 ">
						<sys:treeselect id="office" name="office.id" value="${testData.office.id}" labelName="office.name" labelValue="${testData.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属区域</label>
					<div class="col-md-6 ">
						<sys:treeselect id="area" name="area.id" value="${testData.area.id}" labelName="area.name" labelValue="${testData.area.name}"
							title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">名称</label>
					<div class="col-md-6 ">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">性别</label>
					<div class="col-md-6 ">
						<form:select path="sex" class="mt-multiselect btn btn-default " data-label="left" data-select-all="true" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">加入日期</label>
					<div class="col-md-6 ">
						<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control "
							value="<fmt:formatDate value="${testData.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注信息</label>
					<div class="col-md-6 ">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/test/testData/');"/>
						<shiro:hasPermission name="test:testData:edit">
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
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
	</script>