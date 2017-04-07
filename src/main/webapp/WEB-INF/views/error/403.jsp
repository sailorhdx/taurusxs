<%
response.setStatus(403);

//获取异常类
Throwable ex = Exceptions.getThrowable(request);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
		out.print(StringUtils.replace(ex.getMessage(), "msg:", ""));
	}else{
		out.print("操作权限不足.");
	}
	
}

//输出异常信息页面
else {
%>
<%@page import="com.thinkgem.jeesite.common.web.Servlets"%>
<%@page import="com.thinkgem.jeesite.common.utils.Exceptions"%>
<%@page import="com.thinkgem.jeesite.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>403 - 操作权限不足</title>
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
         <div class="col-md-12 page-500">
            <div class="number"> 403 </div>
            <div class="details">
                <h3>Oops! Forbidden.</h3>
                <p> Subject does not have permission<br/></p>
            </div>
        </div>
    </div>	
</body>
</html>
<%
}
%>