<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				审批申请
            </div>
            <div class="actions">
            	<a href="${ctxAdmin}/oa/testAudit" class="btn ajaxify">
            		<i class="fa fa-pencil"></i> 审批列表 
            	</a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="testAudit" action="${ctxAdmin}/oa/testAudit/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<form:hidden path="act.taskId"/>
				<form:hidden path="act.taskName"/>
				<form:hidden path="act.taskDefKey"/>
				<form:hidden path="act.procInsId"/>
				<form:hidden path="act.procDefId"/>
				<form:hidden id="flag" path="act.flag"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">姓名</label>
					<div class="col-md-6">
						<sys:treeselect id="user" name="user.id" value="${testAudit.user.id}" labelName="user.name" labelValue="${testAudit.user.name}" 
							title="用户" url="/sys/office/treeData?type=3" cssClass="required recipient" cssStyle="width:150px" 
							allowClear="true" notAllowSelectParent="true" smallBtn="false"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">部门</label>
					<div class="col-md-6">
						<sys:treeselect id="office" name="office.id" value="${testAudit.office.id}" labelName="office.name" labelValue="${testAudit.office.name}" 
							title="用户" url="/sys/office/treeData?type=2" cssClass="required recipient" cssStyle="width:150px" 
							allowClear="true" notAllowSelectParent="true" smallBtn="false"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">岗位职级</label>
					<div class="col-md-6">
						<form:input path="post" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">调整原因</label>
					<div class="col-md-6">
						<form:textarea path="content" class="form-control required" rows="5" maxlength="200"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">薪酬档级（调整前）</label>
					<div class="col-md-6">
						<form:input path="olda" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">薪酬档级（调整后）</label>
					<div class="col-md-6">
						<form:input path="newa" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月工资额（调整前）</label>
					<div class="col-md-6">
						<form:input path="oldb" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月工资额（调整后）</label>
					<div class="col-md-6">
						<form:input path="newb" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">年薪金额（调整前）</label>
					<div class="col-md-6">
						<form:input path="oldc" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">年薪金额（调整后）</label>
					<div class="col-md-6">
						<form:input path="newc" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月增资</label>
					<div class="col-md-6">
						<form:input path="addNum" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">执行时间</label>
					<div class="col-md-6">
						<form:input path="exeDate" htmlEscape="false" maxlength="50" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">人力资源部意见</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.hrText}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">分管领导意见</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.leadText}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">集团主要领导意见 </label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.mainLeadText}</p>
					</div>
				</div>
				<div class="form-group">
	               	<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/oa/testAudit');"/>
						<shiro:hasPermission name="oa:testAudit:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请" onclick="$('#flag').val('yes')"/>&nbsp;
							<c:if test="${not empty testAudit.id}">
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('no')"/>&nbsp;
							</c:if>
						</shiro:hasPermission>
					</div>
				</div>
				<c:if test="${not empty testAudit.id}">
					<act:histoicFlow procInsId="${testAudit.act.procInsId}" />
				</c:if>
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
