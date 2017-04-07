<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				站点切换
            </div>
            <div class="actions">
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        	<!-- BEGIN FORM-->
	       	<form:form id="searchForm" modelAttribute="site" action="${ctxAdmin}/cms/site/pageData" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
				<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
			</form:form>
			<!-- END FORM-->
			<!-- BEGIN TABLE-->
       		<div id="tableBox" class="dataTables_wrapper">
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>名称</th>
							<shiro:hasPermission name="cms:view"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
					<tr>
						<td><a href="${ctxAdmin}/cms/site/select?id={{row.id}}" class="ajaxify">{{row.name}}</a> {{#isCurrentSite}}<font color="red">[当前站点]</font>{{/isCurrentSite}}</td>
						<shiro:hasPermission name="cms:view"><td>
		    				<a href="${ctxAdmin}/cms/site/select?id={{row.id}}" class="ajaxify">切换</a>
						</td></shiro:hasPermission>
					</tr>
					</script>
				</table>
				<div id="pagination" class="row"></div>
			<!-- END TABLE-->
			</div>
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
			// 打开页面默认点击查询按钮，初始化table数据
			$("#searchForm").submit();
		});
		
		function searchCallback(param) {
			var currentId = "${fnc:getCurrentSiteId()}";
	        var item = param.item;
				$("#pageTableList").append(Mustache.render(param.tpl, {
	           	row: item,
	           	isCurrentSite: currentId == item.id ? "true":"" 
	        }));
		};
	</script>    	
