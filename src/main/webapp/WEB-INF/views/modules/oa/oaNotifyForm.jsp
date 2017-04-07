<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				通知<shiro:hasPermission name="oa:oaNotify:edit">${oaNotify.status eq '1' ? '查看' : not empty oaNotify.id ? '修改' : '添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:oaNotify:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/oa/oaNotify/${oaNotify.self?'self':''}" class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 通知列表 
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="oaNotify" action="${ctxAdmin}/oa/oaNotify/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">类型</label>
					<div class="col-md-6">
						<form:select path="type" class="mt-multiselect btn btn-default required" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>	
				<div class="form-group">
					<label class="control-label col-md-4 required">标题</label>
					<div class="col-md-6">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">内容</label>
					<div class="col-md-6">
						<form:textarea path="content" htmlEscape="false" rows="6" maxlength="2000" class="form-control required"/>
					</div>
				</div>
				<c:if test="${oaNotify.status ne '1'}">
					<div class="form-group">
						<label class="control-label col-md-4">附件</label>
						<div class="col-md-6">
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="form-control"/>
							<sys:ckfinder input="files" type="Files" uploadPath="/oa/notify" selectMultiple="true"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">状态</label>
						<div class="col-md-6">
							<form:select path="status" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:options items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>	
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4 required">接受人</label>
						<div class="col-md-6">
			                <sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds" value="${oaNotify.oaNotifyRecordIds}" labelName="oaNotifyRecordNames" labelValue="${oaNotify.oaNotifyRecordNames}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="input-xxlarge required" notAllowSelectParent="true" checked="true"/>
						</div>
					</div>
				</c:if>
				<c:if test="${oaNotify.status eq '1'}">
					<div class="form-group">
						<label class="control-label col-md-4">附件</label>
						<div class="col-md-6">
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="form-control"/>
							<sys:ckfinder input="files" type="Files" uploadPath="/oa/notify" selectMultiple="true" readonly="true" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">接受人</label>
						<div class="col-md-6">
							<table id="contentTable" class="table table-striped table-bordered table-condensed">
								<thead>
									<tr>
										<th>接受人</th>
										<th>接受部门</th>
										<th>阅读状态</th>
										<th>阅读时间</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${oaNotify.oaNotifyRecordList}" var="oaNotifyRecord">
									<tr>
										<td>
											${oaNotifyRecord.user.name}
										</td>
										<td>
											${oaNotifyRecord.user.office.name}
										</td>
										<td>
											${fns:getDictLabel(oaNotifyRecord.readFlag, 'oa_notify_read', '')}
										</td>
										<td>
											<fmt:formatDate value="${oaNotifyRecord.readDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							已查阅：${oaNotify.readNum} , 未查阅：${oaNotify.unReadNum} , 总共：${oaNotify.readNum + oaNotify.unReadNum}
						</div>
					</div>
				</c:if>
				<div class="form-group">
	               	<div class="col-md-offset-4 col-md-6">			
	               		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="Layout.loadAjaxContent('${ctxAdmin}/oa/oaNotify/${oaNotify.self?'self':''}?repage');"/>
						<c:if test="${oaNotify.status ne '1'}">
							<shiro:hasPermission name="oa:oaNotify:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>
							</shiro:hasPermission>
						</c:if>
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
				submitHandler: function(form){
					editPostHtml();
				},
				errorPlacement: function(error, element) {
					jqueryValidateErrorPlacement(error, element);
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
	</script>