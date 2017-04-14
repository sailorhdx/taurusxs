<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				留言列表
            </div>
            <div class="actions">
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox">       		
				<form:form id="searchForm" modelAttribute="guestbook" action="${ctxAdmin}/cms/guestbook/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">分类</label>
							<div class="col-md-8">
								<form:select path="type" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:option value="" label="全部"/>
									<form:options items="${fns:getDictList('cms_guestbook')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">内容</label>
							<div class="col-md-8">
								<form:input path="content" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">状态</label>
							<div class="col-md-8">
								<form:select path="delFlag" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:options items="${fns:getDictList('cms_del_flag')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group col-md-6">
							<div class="col-md-offset-4 col-md-8">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
							</div>
						</div>
					</div>
				</form:form>
			</div>
       		<!-- END FORM-->
       		<sys:message content="${message}"/>
       		<!-- BEGIN TABLE-->
       		<div id="tableBox" class="dataTables_wrapper">
	   			<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>留言分类</th>
							<th>留言内容</th>
							<th>留言人</th>
							<th>留言时间</th>
							<th>回复人</th>
							<th>回复内容</th>
							<th>回复时间</th>
							<shiro:hasPermission name="cms:guestbook:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td>{{dict.type}}</td>
							<td><a href="${ctxAdmin}/cms/guestbook/form?id={{row.id}}" class="ajaxify">{{abbr.content}}</a></td>
							<td>{{row.name}}</td>
							<td>{{row.createDate}}</td>
							<td>{{reUserName}}</td>
							<td>{{abbr.reContent}}</td>
							<td>{{row.reDate}}</td>
							<shiro:hasPermission name="cms:guestbook:edit">
							<td>
								<a href="${ctxAdmin}/cms/guestbook/delete?id={{row.id}}&delFlag={{#delFlag.eq0}}1{{/delFlag.eq0}}{{#delFlag.eq1}}2{{/delFlag.eq1}}" 
									onclick="return confirmGetJson({mess:'确认要{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复审核{{/delFlag.eq1}}该留言吗？', url:this.href})">
									{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复审核{{/delFlag.eq1}}
								</a>
								{{#delFlag.eq2}}
								<a href="${ctxAdmin}/cms/guestbook/form?id={{row.id}}" class="ajaxify">审核</a>
								{{/delFlag.eq2}}
							</td>
							</shiro:hasPermission>
						</tr>
					</script>
				</table>
				<div id="pagination" class="row"></div>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({funcParam:{callback:"searchCallback"}});
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
			
			// 页面打开初始化执行查询操作
			$("#searchForm").submit();
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
           	console.log(item);
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	dict: {
               		type: getDictLabel(${fns:toJson(fns:getDictList('cms_guestbook'))}, item.type)
               	},
               	abbr: {
               		content: abbr(item.content,40),
               		reContent: abbr(item.reContent,40),
               	},
               	reUserName: (isNullOrEmpty(item.reUser)? "": item.reUser.name),
               	delFlag: {
                   	eq0: (item.delFlag == "0"? item.delFlag: ""),
                   	eq1: (item.delFlag == "1"? item.delFlag: ""),
                   	eq2: (item.delFlag == "2"? item.delFlag: ""),
               	}
               }));
		};
	</script>