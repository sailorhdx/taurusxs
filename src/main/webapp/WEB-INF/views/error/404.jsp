<%
response.setStatus(404);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print("file not found.");
}
//输出异常信息页面
else {
%>
<%@page import="com.taurusx.xsite.common.web.Servlets"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
	<link href="${layoutAssetsPath}/css/custom.css" rel="stylesheet" type="text/css" />
	<script src="${globalPluginsPath}/jquery.min.js" type="text/javascript"></script>
</head>
<body>
    <!-- BEGIN PAGE TITLE-->
    <h1 class="page-title">
    </h1>
    <!-- END PAGE TITLE-->
    <!-- END PAGE HEADER-->
    <div class="row">
        <div class="col-md-12 page-404">
            <div class="number"> 404 </div>
            <div class="details">
                <h3>Oops! You're lost.</h3>
                <p> We can not find the page you're looking for. <br/></p>
            </div>
        </div>
    </div>
</body>
</html>
<%
}
%>