<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/act/process/deploy/" class="ajaxify">部署流程</a>
            </div>
            <div class="actions">
              	<a href="${ctxAdmin}/act/process/" class="btn ajaxify">
              		<i class="fa fa-clone"></i> 流程列表
              	</a>
	            <a href="${ctxAdmin}/act/process/running/"  class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 运行中的流程 
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<sys:message content="${message}"/>
			<form id="inputForm" action="${ctxAdmin}/act/process/deploy" method="post" enctype="multipart/form-data" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-md-4 required">流程分类：</label>
					<div class="col-md-6">
						<select id="category" name="category" class="form-control required">
							<c:forEach items="${fns:getDictList('act_category')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">流程文件：</label>
					<div class="col-md-6">
						<input type="file" id="file" name="file" class="form-control required"/>
						<span class="help-inline">支持文件格式：zip、bar、bpmn、bpmn20.xml</span>
					</div>
				</div>
				<div class="form-group">
	               <div class="col-md-offset-4 col-md-6">			
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/act/process/')"/>
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"/>
					</div>
				</div>
			</form>
			<!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function(){
			$("#inputForm").validate({
				submitHandler: function(form){
					ajaxFormSubmit('#inputForm', $("#inputForm").attr("action"));
				}
			});
		});
	</script>