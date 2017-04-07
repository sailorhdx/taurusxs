<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="${ctxAdmin}/test/testTree/form?id=${testTree.id}&parent.id=${testTreeparent.id}" class="ajaxify">
					树结构<shiro:hasPermission name="test:testTree:edit">${not empty testTree.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:testTree:edit">查看</shiro:lacksPermission>
				</a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/test/testTree/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 树结构列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="testTree" action="${ctxAdmin}/test/testTree/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				<div class="form-group">
					<label class="control-label col-md-4">父级编号</label>
					<div class="col-md-6 required">
						<sys:treeselect id="parent" name="parent.id" value="${testTree.parent.id}" labelName="parent.name" labelValue="${testTree.parent.name}"
							title="父级编号" url="/test/testTree/treeData" extId="${testTree.id}" cssClass="" allowClear="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">名称</label>
					<div class="col-md-6 required">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">排序</label>
					<div class="col-md-6 required">
						<form:input path="sort" htmlEscape="false" maxlength="10" class="form-control required digits"/>
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
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/test/testTree/');"/>
						<shiro:hasPermission name="test:testTree:edit">
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
			
		});
	</script>