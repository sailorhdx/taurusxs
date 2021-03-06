<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/oa/testAudit/form?id=${testAudit.id}" class="ajaxify">审批详情</a>
            </div>
            <div class="actions">
            	<a href="${ctxAdmin}/oa/testAudit" class="btn ajaxify">
            		<i class="fa fa-pencil"></i> 审批列表 </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form class="form-horizontal">
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">姓名</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.user.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">部门</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.office.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">岗位职级</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.post}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">调整原因</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.content}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">薪酬档级（调整前）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.olda}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">薪酬档级（调整后）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.newa}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月工资额（调整前）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.oldb}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月工资额（调整后）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.newb}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">年薪金额（调整前）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.oldc}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">年薪金额（调整后）</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.newc}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">月增资</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.addNum}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">执行时间</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.exeDate}</p>
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
					<label class="control-label col-md-4">集团主要领导意见</label>
					<div class="col-md-6">
						<p class="form-control-static">${testAudit.mainLeadText}</p>
					</div>
				</div>
				<div class="form-group">
	               	<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/oa/testAudit');"/>
					</div>
				</div>
				<act:histoicFlow procInsId="${testAudit.act.procInsId}" />
			</form:form>
			<!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
