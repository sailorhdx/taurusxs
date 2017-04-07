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
				<a href="${ctxAdmin}/act/model/create" class="ajaxify">新建模型</a>
            </div>
            <div class="actions">
	            <a href="${ctxAdmin}/act/model/"  class="btn ajaxify">
	            	<i class="fa fa-pencil"></i> 模型列表
	            </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<sys:message content="${message}"/>
			<form id="inputForm" action="${ctxAdmin}/act/model/create" target="_blank" method="post" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-md-4 required">流程分类</label>
					<div class="col-md-6">
						<select id="category" name="category" class="select2 form-control required">
							<c:forEach items="${fns:getDictList('act_category')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">模块名称</label>
					<div class="col-md-6">
						<input id="name" name="name" type="text" class="form-control required" />
						<span class="help-inline"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">模块标识</label>
					<div class="col-md-6">
						<input id="key" name="key" type="text" class="form-control required" />
						<span class="help-inline"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">模块描述</label>
					<div class="col-md-6">
						<textarea id="description" name="description" class="form-control required"></textarea>
					</div>
				</div>
				<div class="form-group">
	               <div class="col-md-offset-4 col-md-6">			
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/act/model/')"/>
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"/>
					</div>
				</div>
			</form>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
			$("#inputForm").validate({
				submitHandler: function(form){
					form.submit();
					setTimeout(locationHref('${ctxAdmin}/act/model/'), 1000);
				}
			});
			
			// 初始化Select2控件
			ComponentsSelect2.init();
		});
	</script>
