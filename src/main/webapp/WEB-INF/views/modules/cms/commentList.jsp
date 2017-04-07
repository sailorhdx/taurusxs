<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				评论列表
            </div>
            <div class="actions">
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="comment" action="${ctxAdmin}/cms/comment/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">文档标题</label>
							<div class="col-md-8">
								<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">状态</label>
							<div class="col-md-8">
								<form:select path="delFlag" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:options items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
					</div>
					<div class="row">
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
				<table id="contentTable" class="table table-bordered">
					<thead>
						<tr>
							<th>评论内容</th>
							<th>文档标题</th>
							<th>评论人</th>
							<th>评论IP</th>
							<th>评论时间</th>
							<th nowrap="nowrap">操作</th>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="javascript:" onclick="$('#c_{{row.id}}').toggle()">{{abbr.content}}</a></td>
							<td><a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-{{categoryId}}-{{row.contentId}}${fns:getUrlSuffix()}" title="{{row.title}}" target="_blank">{{abbr.title}}</a></td>
							<td>{{row.name}}</td>
							<td>{{row.ip}}</td>
							<td>{{row.createDate}}</td>
							<td>
								<shiro:hasPermission name="cms:comment:edit">
									<a href="${ctxAdmin}/cms/comment/delete?id={{row.id}}&delFlag={{#delFlag.eq0}}1{{/delFlag.eq0}}{{#delFlag.eq1}}2{{/delFlag.eq1}}{{#delFlag.eq2}}0{{/delFlag.eq2}}" 
										onclick="return confirmGetJson({mess:'确认要{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复审核{{/delFlag.eq1}}{{#delFlag.eq2}}审核通过{{/delFlag.eq2}}该评论吗？', url:this.href})">
										{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复审核{{/delFlag.eq1}}{{#delFlag.eq2}}审核通过{{/delFlag.eq2}}
									</a>
								</shiro:hasPermission>
							</td>
						</tr>
						<tr id="c_{{row.id}}" style="background:#fdfdfd;display:none;">
							<td colspan="6">{{content}}</td>
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
           	var content = item.content;
   			if (!isNullOrEmpty(content)) { 
   				content = content.replace(/\n/g, "<br/>").replace(/\t/g,"&nbsp; &nbsp; ");
   			}
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	abbr: {
               		content: abbr(item.content,40),
               		title: abbr(item.title,40),
               	},
               	categoryId: item.category.id,
               	categoryName: item.category.name,
               	delFlag: {
                   	eq0: (item.delFlag == "0"? item.delFlag: ""),
                   	eq1: (item.delFlag == "1"? item.delFlag: ""),
                   	eq2: (item.delFlag == "2"? item.delFlag: ""),
               	},
               	content: content 
            }));
		};
	</script>