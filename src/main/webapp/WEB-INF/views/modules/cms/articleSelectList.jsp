<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
		<title>${fns:getConfig('productName')} - Powered By DouBao</title>
		<c:set var="themeColor" value="${not empty cookie.theme.value ? cookie.theme.value : 'default'}"/>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=8,IE=9,IE=10">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta content="DouBao" name="author" />
		
		<meta name="renderer" content="webkit">
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-store">
		
		<!-- BEGIN GLOBAL MANDATORY STYLES -->
		<link href="${ctxStatic}/common/googleapis.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="${globalPluginsPath}/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
		<!-- END GLOBAL MANDATORY STYLES -->
		
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/bootstrap-multiselect/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
	    <link href="${globalPluginsPath}/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        			
		<!-- BEGIN THEME GLOBAL STYLES -->
		<link href="${globalAssetsPath}/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
		<link href="${globalAssetsPath}/css/plugins.min.css" rel="stylesheet" type="text/css" />
		<!-- END THEME GLOBAL STYLES -->
		
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link href="${globalPluginsPath}/jquery-jbox/2.3/Skins/Bootstrap/jbox.css" rel="stylesheet" />
		<!-- END PAGE LEVEL STYLES -->
		
		<!-- BEGIN THEME LAYOUT STYLES -->
		<link href="${layoutAssetsPath}/css/layout.css" rel="stylesheet" type="text/css" />
		<link href="${layoutAssetsPath}/css/custom.css" rel="stylesheet" type="text/css" />
		<link href="${layoutAssetsPath}/css/themes/${themeColor}.min.css" rel="stylesheet" type="text/css" id="style_color" />
		<link href="${layoutAssetsPath}/css/themes/${themeColor}.custom.css" rel="stylesheet" type="text/css" id="custom_color"/>
		<!-- END THEME LAYOUT STYLES -->
		
		<script src="${globalPluginsPath}/jquery.min.js" type="text/javascript"></script>
				
		<link rel="shortcut icon" href="favicon.ico" /> 
</head>
<body class="page-content-white">
	<div class="page-content">
		<div class="page-content-body" style="padding:5px">
			<div id="searchBox">
				<form:form id="searchForm" modelAttribute="article" action="${ctxAdmin}/cms/article/selectList" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="form-group col-md-6">
						<label class="control-label col-md-4">栏目</label>
						<div class="col-md-8">
							<sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
								title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" allowClear="true"/>
						</div>
					</div>
					<div class="form-group col-md-6">
						<label class="control-label col-md-4">标题</label>
						<div class="col-md-8">
							<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
						</div>
					</div>
					<div class="form-group col-md-6">
						<div class="col-md-offset-4 col-md-8">				
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
						</div>
					</div>
				</form:form>
			</div>
			
			<div id="tableBox" class="dataTables_wrapper">	
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align:center;">选择</th>
							<th>栏目</th>
							<th>标题</th>
							<th>权重</th>
							<th>点击数</th>
							<th>发布者</th>
							<th>更新时间</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="article">
						<tr>
							<td style="text-align:center;"><input type="checkbox" name="id" value="${article.id}" view-title="${fns:abbr(article.title,40)}" view-category-id="${article.category.id}"/></td>
							<td><a href="javascript:" onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}</a></td>
							<td><a target="_blank" href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}" title="${article.title}">${fns:abbr(article.title,40)}</a></td>
							<td>${article.weight}</td>
							<td>${article.hits}</td>
							<td>${article.createBy.name}</td>
							<td><fmt:formatDate value="${article.updateDate}" type="both"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="row">${page}</div>
			</div>
		</div>
	</div>	
		<!--[if lt IE 9]>
		<script src="${globalPluginsPath}/respond.min.js"></script>
		<script src="${globalPluginsPath}/excanvas.min.js"></script> 
		<script src="${globalPluginsPath}/ie8.fix.min.js"></script> 
		<![endif]-->
		
		<!-- BEGIN CORE PLUGINS -->
		<script src="${globalPluginsPath}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/js.cookie.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery.blockui.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
		<!-- END CORE PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script src="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/bootstrap-multiselect/js/bootstrap-multiselect.js" type="text/javascript"></script>
    	<script src="${globalPluginsPath}/select2/js/select2.full.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jstree/dist/jstree.js" type="text/javascript"></script>
	    <script src="${globalPluginsPath}/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/jquery-jbox/2.3/jquery.jBox-2.3.js" type="text/javascript"></script>
		<script src="${globalPluginsPath}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN THEME GLOBAL SCRIPTS -->
		<script src="${globalAssetsPath}/scripts/app.js" type="text/javascript"></script>
		<!-- END THEME GLOBAL SCRIPTS -->
		
		<!-- BEGIN COMMON SCRIPTS -->
		<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>		
		<script src="${ctxStatic}/common/taurusxsite.js" type="text/javascript"></script>
		<!-- END COMMON SCRIPTS -->
		
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<script src="${layoutAssetsPath}/scripts/layout.js" type="text/javascript"></script>
		<!-- END PAGE LEVEL SCRIPTS -->
		
      	<script type="text/javascript">
	      	$(document).ready(function() {
				$("#searchForm").validate({
					submitHandler: function(form){
						ajaxFormSubmit('#searchForm', $("#searchForm").attr("action"));
					}
				});
				
				$("input[name=id]").each(function(){
					var articleSelect = null;
					articleSelect = top.articleSelect;
					for (var i=0; i<articleSelect.length; i++){
						if (articleSelect[i][0]==$(this).val()){
							this.checked = true;
						}
					}
					$(this).click(function(){
						console.log($(this));
						var id = $(this).val(), title = $(this).attr("view-title"), categoryId = $(this).attr("view-category-id");
						 
						top.articleSelectAddOrDel(id, title, categoryId);
					});
				});
			});
		</script> 		
	</body>
</html>