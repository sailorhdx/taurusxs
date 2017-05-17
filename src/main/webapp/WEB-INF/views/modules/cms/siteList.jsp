<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				站点列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="cms:site:edit">
	            	<a href="${ctxAdmin}/cms/site/form" class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 站点添加 
	            	</a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox">       		
				<form:form id="searchForm" modelAttribute="site" action="${ctxAdmin}/cms/site/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">名称</label>
							<div class="col-md-8">
								<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">状态</label>
							<div class="col-md-8">
								<form:select path="delFlag" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>名称</th>
							<th>标题</th>
							<th>描述</th>
							<th>关键字</th>
							<th>主题</th>
							<shiro:hasPermission name="cms:site:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/cms/site/form?id={{row.id}}" title="{{row.name}}" class="ajaxify">{{abbr.siteName}}</a></td>
							<td>{{abbr.siteTitle}}</td>
							<td>{{abbr.siteDescription}}</td>
							<td>{{abbr.siteKeywords}}</td>
							<td>{{row.theme}}</td>
							<shiro:hasPermission name="cms:site:edit">
							<td>
			    				<a href="${ctxAdmin}/cms/site/form?id={{row.id}}" class="ajaxify">修改</a>
								<a href="${ctxAdmin}/cms/site/delete?id={{row.id}}&delFlag={{#delFlag.eq0}}1{{/delFlag.eq0}}{{#delFlag.eq1}}0{{/delFlag.eq1}}" onclick="return confirmGetJson({mess:'确认要{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复{{/delFlag.eq1}}该站点吗？', url:this.href})">
									{{#delFlag.eq0}}删除{{/delFlag.eq0}}{{#delFlag.eq1}}恢复{{/delFlag.eq1}} 
								</a>
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
			
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
		function searchCallback(param) {
            var item = param.item;
            var userIds = "," + item.userIds + ",";
            console.log(userIds);
            console.log(item.currentUser);
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item,
               	abbr: {
               		siteName:abbr(item.name,40),
               		siteTitle:abbr(item.title,40),
               		siteDescription:abbr(item.description,40),
               		siteKeywords:abbr(item.keywords,40)
               	},
               	delFlag: {
               		eq0: (item.delFlag == "0"? item.delFlag:""),
               		eq1: (item.delFlag == "1"? item.delFlag:""),
               		eq2: (item.delFlag == "2"? item.delFlag:"")
               	}
            }));
		};
	</script>		
