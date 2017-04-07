<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				字典列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:dict:edit">
	                <a href="${ctxAdmin}/sys/dict/form?sort=10" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> 字典添加 
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox">       		
	       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/dict/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="form-group">
						<label class="control-label col-md-2">类型</label>
						<div class="col-md-4">
							<form:select id="type" path="type" class="form-control select2-allow-clear">
								<form:option value="" label="全部"/>
								<form:options items="${typeList}" htmlEscape="false"/>
							</form:select>
						</div>
						<label class="control-label col-md-2">描述</label>
						<div class="col-md-4">
							<form:input id="description" path="description" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-4 col-md-8">			
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
							<th>键值</th>
							<th>标签</th>
							<th>类型</th>
							<th>描述</th>
							<th>排序</th>
							<shiro:hasPermission name="sys:dict:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td>{{row.value}}</td>
							<td><a href="${ctxAdmin}/sys/dict/form?id={{row.id}}" class="ajaxify">{{row.label}}</a></td>
							<td><a href="javascript:" onclick="$('#type').val('{{row.type}}');$('#searchForm').submit();return false;">{{row.type}}</a></td>
							<td>{{row.description}}</td>
							<td>{{row.sort}}</td>
							<shiro:hasPermission name="sys:dict:edit">
							<td nowrap>
			    				<a href="${ctxAdmin}/sys/dict/form?id={{row.id}}" class="btn btn-outline green btn-xs ajaxify">
	                              	<i class="fa fa-edit"></i>修改
	                            </a>
	                            <a href="${ctxAdmin}/sys/dict/pageDelete?id={{row.id}}&type={{row.type}}" onclick="return confirmGetJson({mess:'确认要删除该字典吗？', url:this.href});" class="btn btn-outline dark btn-xs">
	                               	<i class="fa fa-trash-o"></i>删除
	                            </a>
	                            <a href="${ctxAdmin}/sys/dict/form?type={{row.type}}&sort={{nextsort}}{{#row.description}}&description={{row.description}}{{/row.description}}" class="btn btn-outline red btn-xs ajaxify">
	                               	<i class="fa fa-share"></i>添加键值
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
			$("#description").focus();
			
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({pageSize:10,funcParam:{callback:"searchCallback"}});
				}
			});
			
			// 初始化Select2控件
			ComponentsSelect2.init();
			
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
		function searchCallback(param) {
            var item = param.item;
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item,
               	nextsort: item.sort + 10
            }));
		};
		
	</script>