<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

    <!-- BEGIN PAGE TITLE-->
    <h1 class="page-title"> 
    </h1>
    <!-- END PAGE TITLE-->
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				留言审核
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/cms/guestbook/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 留言列表 
                </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="guestbook" action="${ctxAdmin}/cms/guestbook/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<form:hidden path="delFlag"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-3">名称</label>
					<div class="col-md-6">
						<p class="form-control-static">${guestbook.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">邮箱</label>
					<div class="col-md-6">
						<p class="form-control-static">${guestbook.email}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">电话</label>
					<div class="col-md-6">
						<p class="form-control-static">${guestbook.phone}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">单位</label>
					<div class="col-md-6">
						<p class="form-control-static">${guestbook.workunit}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">留言分类</label>
					<div class="col-md-6">
						<span style="font-weight:bold;">
						<p class="form-control-static">${fns:getDictLabel(guestbook.type, 'cms_guestbook', '无')}</p>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">IP</label>
					<div class="col-md-6">
						<p class="form-control-static">${guestbook.ip}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">留言时间</label>
					<div class="col-md-6">
						<p class="form-control-static">
							<fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">留言内容</label>
					<div class="col-md-6">
						<form:textarea path="content" htmlEscape="false" rows="4" maxlength="200" class="form-control" disabled="true"/>
					</div>
				</div>
				<c:if test="${not empty guestbook.reUser}">
					<div class="form-group">
						<label class="control-label col-md-3">回复人</label>
						<div class="col-md-6">
							<p class="form-control-static">${guestbook.reUser.name}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">回复时间</label>
						<div class="col-md-6">
							<p class="form-control-static">
								<fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</p>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label class="control-label col-md-3">回复内容</label>
					<div class="col-md-6">
						<form:textarea path="reContent" htmlEscape="false" rows="4" maxlength="200" class="required form-control"/>
					</div>
				</div>
				<div class="form-group">
	               	<div class="col-md-offset-3 col-md-6">
	               		<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/cms/guestbook');"/>
						<c:if test="${guestbook.delFlag eq '2'}">
							<shiro:hasPermission name="cms:guestbook:edit">
								<input id="btnSubmit" class="btn btn-success" type="submit" value="通过" onclick="$('#delFlag').val('0')"/>
								<input id="btnSubmit" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#delFlag').val('1')"/>
							</shiro:hasPermission>
						</c:if>
					</div>
				</div>						
			</form:form>
			<!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#reContent").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
		});
	</script>