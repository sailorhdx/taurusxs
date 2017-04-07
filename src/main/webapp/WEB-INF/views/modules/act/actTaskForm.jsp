<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/task/form?taskId=${act.taskId}&taskName=${act.taskName}&taskDefKey=${act.taskDefKey}&procInsId=${act.procInsId}&procDefId${act.procDefId}">${empty act.procInsId?"新建任务":"任务处理"}</a>
            </div>
            <div class="actions">
              	<a href="${ctxAdmin}/act/task/todo" class="btn"><i class="fa fa-clone"></i>代办任务</a>
	            <a href="${ctxAdmin}/act/task/historic/" class="btn"><i class="fa fa-pencil"></i> 已办任务 </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->      
			<form:form method="post" class="form-horizontal">
			<sys:message content="${message}"/><%--
				<legend>表单信息</legend> --%>
				<div id="formContent">
					<iframe id="reportFrame" src="${formUrl}" width="100%" height="500" style="border:0;" noresize="noresize"></iframe>
				</div>
				<act:histoicFlow procInsId="${procInsId}" />
			</form:form>
			<!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {/*
			loading('正在加载表单，请稍等...');
			$.get("${formUrl}", function(data){
				top.$.jBox.closeTip();
				$("#formContent").html(data==""?"<h4>没有找到表单数据。</h4><br/>表单地址：${formUrl}<br/>":data);
			}).fail(function() {
				top.$.jBox.closeTip();
				$("#formContent").html("<h4>加载表单失败！</h4>表单地址：${formUrl}<br/>");
			});*/
		});
	</script>
