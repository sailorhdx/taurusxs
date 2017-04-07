<%
response.setStatus(500);

// 获取异常类
Throwable ex = Exceptions.getThrowable(request);
if (ex != null){
	LoggerFactory.getLogger("500.jsp").error(ex.getMessage(), ex);
}

// 编译错误信息
StringBuilder sb = new StringBuilder("错误信息：\n");
if (ex != null) {
	sb.append(Exceptions.getStackTraceAsString(ex));
} else {
	sb.append("未知错误.\n\n");
}

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print(sb);
}

// 输出异常信息页面
else {
%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.thinkgem.jeesite.common.web.Servlets"%>
<%@page import="com.thinkgem.jeesite.common.utils.Exceptions"%>
<%@page import="com.thinkgem.jeesite.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>500 - 系统内部错误</title>
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
            <div class="number"> 500 </div>
            <div class="details">
                <h3>Oops! Something went wrong.</h3>
                <p> We are fixing it! Please come back in a while. <br/></p>
				<div class="errorMessage">
					错误信息：<%=ex==null?"未知错误.":StringUtils.toHtml(ex.getMessage())%> <br/> <br/>
					请点击“查看详细信息”按钮，将详细错误信息发送给系统管理员，谢谢！<br/> <br/>
					<a href="javascript:" onclick="$('.errorMessage').toggle();" class="btn">查看详细信息</a>
				</div>
				<div class="errorMessage" style="display:none">
					<%=StringUtils.toHtml(sb.toString())%> <br/>
					<a href="javascript:" onclick="$('.errorMessage').toggle();" class="btn">隐藏详细信息</a>
					<br/> <br/>
				</div>                
            </div>
        </div>
    </div>	
</body>
</html>
<%
}
%>