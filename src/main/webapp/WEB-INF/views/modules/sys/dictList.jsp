<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				${mode eq '1' && not empty dict.description ? dict.description : '字典'}列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="sys:dict:edit">
	                <a href="${ctxAdmin}/sys/dict/form?sort=10&mode=${mode}&type=${mode eq '1'? dict.type : ''}&description=${mode eq '1'? dict.description : ''}" class="btn ajaxify">
	                    <i class="fa fa-pencil"></i> ${mode eq '1' && not empty dict.description ? dict.description : '字典'}添加
	                </a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox" ${mode eq "1" ? "style='display:none'": ""}>       		
	       		<form:form id="searchForm" modelAttribute="dict" action="${ctxAdmin}/sys/dict/pageData" method="post" class="form-horizontal">
	       			<input id="mode" name="mode" type="hidden" value="${mode}"/>
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
		        <table id="dataTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>键值</th>
							<th>标签</th>
							<th ${mode eq "1" ? "style='display:none'": ""}>类型</th>
							<th ${mode eq "1" ? "style='display:none'": ""}">描述</th>
							<th>排序</th>
							<shiro:hasPermission name="sys:dict:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="dataTableList"></tbody>
					<script type="text/template" id="dataTableTpl">
						<tr id="{{row.id}}" pId="{{pid}}">
							<td>{{row.value}}</td>
							<td><a href="${ctxAdmin}/sys/dict/form?id={{row.id}}&mode=${mode}" class="ajaxify">{{row.label}}</a></td>
							<td {{#display}}style="display:none{{/display}}"><a href="javascript:" onclick="$('#type').val('{{row.type}}'); $('#type').change();$('#searchForm').submit();return false;">{{row.type}}</a></td>
							<td {{#display}}style="display:none{{/display}}">{{row.description}}</td>
							<td>{{row.sort}}</td>
							<shiro:hasPermission name="sys:dict:edit">
							<td nowrap>
			    				<a href="${ctxAdmin}/sys/dict/form?id={{row.id}}&mode=${mode}" class="btn btn-outline green btn-xs ajaxify">
	                              	<i class="fa fa-edit"></i>修改
	                            </a>
	                            <a href="${ctxAdmin}/sys/dict/pageDelete?id={{row.id}}&type={{row.type}}&mode=${mode}" onclick="return confirmGetJson({mess:'确认要删除该{{#display}}{{row.description}}{{/display}}{{^display}}字典{{/display}}吗？', url:this.href});" class="btn btn-outline dark btn-xs">
	                               	<i class="fa fa-trash-o"></i>删除
	                            </a>
	                            <a href="${ctxAdmin}/sys/dict/form?type={{row.type}}&sort={{nextsort}}{{#row.description}}&description={{row.description}}{{/row.description}}{{#pid0}}&parent.id={{pid}}{{/pid0}}&mode=${mode}" class="btn btn-outline red btn-xs ajaxify">
	                               	<i class="fa fa-share"></i>添加键值
	                            </a>
								<a href="${ctxAdmin}/sys/dict/form?type={{row.type}}&sort={{nextsort}}{{#row.description}}&description={{row.description}}{{/row.description}}&parent.id={{row.id}}&mode=${mode}" class="btn btn-outline red btn-xs ajaxify">
	                               	<i class="fa fa-list"></i>添加子项
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
					if (isNullOrEmpty($("#type").val())) {
						$("#searchForm").attr("action","${ctxAdmin}/sys/dict/pageData");
						searchPostJson({pageSize:10,funcParam:{callback:"searchCallback", table:"#dataTable", tableTpl:"#dataTableTpl", tableList:"#dataTableList"}});
					} else {
						$("#pagination").empty();
						$("#searchForm").attr("action","${ctxAdmin}/sys/dict/listData");
						searchPostJson({form:"#searchForm", callback:'searchCallback', tableType:"tree", table:"#dataTable", tableTpl:"#dataTableTpl", tableList:"#dataTableList"});	
					}
					
				}
			});
			
			// 初始化Select2控件
			ComponentsSelect2.init();
			
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
		function searchCallback(param) {
            var item = param.item;
            var a = ${mode eq '1'};
   			$("#dataTableList").append(Mustache.render(param.tpl, {
               	row: item,
               	pid: (param.root?0:param.pid),
               	pid0: (param.root?'':param.pid),
               	nextsort: item.sort + 10,
               	display: (a ? 'none': '')
            }));
		};
		
	</script>