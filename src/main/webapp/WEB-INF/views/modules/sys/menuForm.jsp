<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				菜单<shiro:hasPermission name="sys:menu:edit">${not empty menu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:menu:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/sys/menu/" class="btn ajaxify">
                	<i class="fa fa-pencil"></i> 菜单列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
            <form:form id="inputForm" modelAttribute="menu" action="${ctxAdmin}/sys/menu/save" method="post" class="form-horizontal">
           		<form:hidden path="id"/>
            	<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4">上级菜单</label>
					<div class="col-md-6">
		                <sys:treeselect id="menu" name="parent.id" value="${menu.parent.id}" labelName="parent.name" labelValue="${menu.parent.name}"
							title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">名称</label>
					<div class="col-md-6">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">链接</label>
					<div class="col-md-6">
						<form:input id="href" path="href" htmlEscape="false" maxlength="2000" class="form-control"/>
						<span class="help-inline">
							<span class="label label-danger"> '/' </span> 内部Controller，配置样例 /modules/controller/method
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'page://' </span> 内部无Controller页面，配置样例 page://modules/page
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'direct://' </span> 内部非module链接，配置样例 direct://url
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'http://' </span> 外部链接，配置样例 http://www.163.com
						</span><br>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">目标</label>
					<div class="col-md-6">
						<form:select id="target" path="target" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:option value="" label="默认"/>
							<form:options items="${fns:getDictList('sys_href_target')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline">
							<span class="label label-danger"> '/' </span> 默认(同content) / content / iframe / _blank
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'page://' </span> 默认(同content) / content / iframe / _blank
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'direct://' </span> 默认(同iframe) / iframe / _blank
						</span><br>
						<span class="help-inline">
							<span class="label label-danger"> 'http://' </span> 默认(同_blank) / _blank / iframe
						</span><br>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">图标</label>
					<div class="col-md-6">
						<sys:iconselect id="icon" name="icon" value="${menu.icon}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">排序</label>
					<div class="col-md-6">
						<form:input path="sort" htmlEscape="false" maxlength="50" class="form-control"/>
						<span class="help-inline">排列顺序，升序。</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">可见</label>
					<div class="col-md-6">
						<!--<form:checkbox path="isShow" value="1" itemLabel="label" itemValue="value" htmlEscape="false" class="make-switch"/>-->
						<form:select path="isShow" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
						<span class="help-inline">该菜单或操作是否显示到系统菜单中</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">个人中心</label>
					<div class="col-md-6">
						<form:select path="isUsercenter" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
						<span class="help-inline">该菜单到用户信息下拉菜单中</span>
					</div>
				</div>				
				<div class="form-group">
					<label class="control-label col-md-4">权限标识</label>
					<div class="col-md-6">
						<form:input path="permission" htmlEscape="false" maxlength="100" class="form-control"/>
						<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注</label>
					<div class="col-md-6">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/>
					</div>
				</div>
              	<div class="form-group">
	               <div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/sys/menu');"/>
	               		<shiro:hasPermission name="sys:menu:edit">
							<button id="btnSubmit" type="submit" class="btn red">保存</button>
						</shiro:hasPermission>
	               </div>
                 </div>
            </form:form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- BEGIN PORTLET-->
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					if ($("#href").val().indexOf("http://") == 0 && $("#target").val().indexOf("content") > -1){
                        messageMetronic('http://起始URL(外部链接)，可选\'默认(同_blank)/_blank/iframe\'', 'warning');
                    } else if ($("#href").val().indexOf("direct://") == 0 && $("#target").val().indexOf("content") > -1){
                        messageMetronic('direct://起始URL(内部非module链接)，可选\'默认(同iframe)/iframe/_blank\'', 'warning');
                    } else {
						editPostHtml();
                    }
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
	</script>
</body>
</html>