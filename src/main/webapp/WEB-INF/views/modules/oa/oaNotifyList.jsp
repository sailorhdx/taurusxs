<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				通知列表
            </div>
            <div class="actions">
            	<c:if test="${!oaNotify.self}">
	            <shiro:hasPermission name="oa:oaNotify:edit">
	            	<a href="${ctxAdmin}/oa/oaNotify/form"  class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 通知添加 
	            	</a>
	            </shiro:hasPermission>
	            </c:if>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="oaNotify" action="${ctxAdmin}/oa/oaNotify/${oaNotify.self?'self':'list'}/pageData/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="form-group">
						<label class="control-label col-md-2">标题</label>
						<div class="col-md-4">
							<form:input path="title" htmlEscape="false" maxlength="200" class="form-control"/>
						</div>
						<label class="control-label col-md-2">类型</label>
						<div class="col-md-4">
							<form:select path="type" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:option value="" label="全部"/>
								<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<c:if test="${!oaNotify.self}">
						<label class="control-label col-md-2">状态</label>
						<div class="col-md-4">
							<form:select path="status" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:option value="" label="全部"/>
								<form:options items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>							
						</div>
						</c:if>
						<c:if test="${oaNotify.self}">
							<form:input path="status" type="hidden"/>
						</c:if>
						<div class="col-md-offset-2 col-md-4">				
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
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
							<th>标题</th>
							<th>类型</th>
							<th>状态</th>
							<th>查阅状态</th>
							<th>更新时间</th>
							<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><th>操作</th></shiro:hasPermission></c:if>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="${ctxAdmin}/oa/oaNotify/{{^scopeSelf}}form{{/scopeSelf}}{{#scopeSelf}}view{{/scopeSelf}}?id={{row.id}}" class="ajaxify">
								{{abbr.title}}
							</a></td>
							<td>
								{{dict.type}}
							</td>
							<td>
								{{dict.status}}
							</td>
							<td>
								{{#scopeSelf}}
									{{dict.readFlag}}
								{{/scopeSelf}}
								{{^scopeSelf}}
									{{num.read}} / {{num.sum}}
								{{/scopeSelf}}
							</td>
							<td>
								{{row.updateDate}}
							</td>
							{{^scopeSelf}}
							<shiro:hasPermission name="oa:oaNotify:edit">
								<td>
			    					<a href="${ctxAdmin}/oa/oaNotify/form?id={{row.id}}" class="ajaxify">修改</a>
									<a href="${ctxAdmin}/oa/oaNotify/delete?id={{row.id}}" onclick="return confirmGetJson({mess:'确认要删除该通知吗？', url:this.href})">删除</a>
								</td>
							</shiro:hasPermission>
							{{/scopeSelf}}
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
            var scopeSelf = ${oaNotify.self};
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item,
               	abbr: {
               		title: abbr(item.title,50)
               	},
               	dict: {
               		type: getDictLabel(${fns:toJson(fns:getDictList('oa_notify_type'))}, item.type),
               		status: getDictLabel(${fns:toJson(fns:getDictList('oa_notify_status'))}, item.status),
               		readFlag: getDictLabel(${fns:toJson(fns:getDictList('oa_notify_read'))}, item.readFlag),
               	},
               	num: {
               		read: isNullOrEmpty(item.readNum) ? '0' : item.readNum,
               		unRead: isNullOrEmpty(item.unReadNum) ? '0' : item.unReadNum,
       				sum: parseInt(isNullOrEmpty(item.readNum) ? '0':item.readNum) + parseInt(isNullOrEmpty(item.unReadNum) ? '0':item.unReadNum)
               	},
               	status: {
               		status0: item.status == "0" ? item.status : "",
               		status1: item.status == "1" ? item.status : ""
               	},
               	scopeSelf: (isTrue(scopeSelf) ? scopeSelf : "")
            }));
		};
	</script>