<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				栏目<shiro:hasPermission name="cms:category:edit">${not empty category.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:category:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
            	<a href="${ctxAdmin}/cms/category/" class="btn ajaxify">
            		<i class="fa fa-pencil"></i> 栏目列表 
            	</a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="category" action="${ctxAdmin}/cms/category/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">归属机构</label>
					<div class="col-md-6">
		                <sys:treeselect id="office" name="office.id" value="${category.office.id}" labelName="office.name" labelValue="${category.office.name}"
							title="机构" url="/sys/office/treeData" cssClass="required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">上级栏目</label>
					<div class="col-md-6">
		                <sys:treeselect id="category" name="parent.id" value="${category.parent.id}" labelName="parent.name" labelValue="${category.parent.name}"
							title="栏目" url="/cms/category/treeData" extId="${category.id}" cssClass="required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">栏目模型</label>
					<div class="col-md-6">
						<form:select path="module" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:option value="" label="公共模型"/>
							<form:options items="${fns:getDictList('cms_module')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>							
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">栏目名称</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">缩略图</label>
					<div class="col-md-6">
						<form:hidden path="image" htmlEscape="false" maxlength="255" class="form-control"/>
						<sys:ckfinder input="image" type="thumb" uploadPath="/cms/category"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">链接</label>
					<div class="col-md-6">
						<form:input path="href" htmlEscape="false" maxlength="200" class="form-control"/>
						<span class="help-inline">栏目超链接地址，优先级“高”</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">目标</label>
					<div class="col-md-6">
						<form:input path="target" htmlEscape="false" maxlength="200" class="form-control"/>
						<span class="help-inline">栏目超链接打开的目标窗口，新窗口打开，请填写：“_blank”</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">描述</label>
					<div class="col-md-6">
						<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">关键字</label>
					<div class="col-md-6">
						<form:input path="keywords" htmlEscape="false" maxlength="200" class="form-control"/>
						<span class="help-inline">填写描述及关键字，有助于搜索引擎优化</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">排序</label>
					<div class="col-md-6">
						<form:input path="sort" htmlEscape="false" maxlength="11" class="form-control required digits"/>
						<span class="help-inline">栏目的排列次序</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">在导航中显示</label>
					<div class="col-md-6">
						<form:select path="inMenu" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline">是否在导航中显示该栏目</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">在分类页中显示列表</label>
					<div class="col-md-6">
						<form:select path="inList" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline">是否在分类页中显示该栏目的文章列表</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4" title="默认展现方式：有子栏目显示栏目列表，无子栏目显示内容列表。">展现方式</label>
					<div class="col-md-6">
						<form:select path="showModes" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('cms_show_modes')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">是否允许评论</label>
					<div class="col-md-6">
						<form:select path="allowComment" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">是否需要审核</label>
					<div class="col-md-6">
						<form:select path="isAudit" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>							
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">自定义列表视图</label>
					<div class="col-md-6">
						<form:select path="customListView" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:option value="" label="默认视图"/>
							<form:options items="${listViewList}" htmlEscape="false"/>
						</form:select>							
		                <span class="help-inline">自定义列表视图名称必须以"${category_DEFAULT_TEMPLATE}"开始</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">自定义内容视图</label>
					<div class="col-md-6">
						<form:select path="customContentView" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:option value="" label="默认视图"/>
							<form:options items="${contentViewList}" htmlEscape="false"/>
						</form:select>							
		                <span class="help-inline">自定义内容视图名称必须以"${article_DEFAULT_TEMPLATE}"开始</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">自定义视图参数</label>
					<div class="col-md-6">
		                <form:input path="viewConfig" htmlEscape="true" class="form-control"/>
		                <span class="help-inline">视图参数例如: {count:2, title_show:"yes"}</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/cms/category/');"/>
						<shiro:hasPermission name="cms:category:edit">
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
</body>
</html>