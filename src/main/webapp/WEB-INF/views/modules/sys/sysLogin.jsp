<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
    	<meta charset="utf-8" />
        <title>${fns:getConfig('productName')} 登录</title>
        <c:set var="layoutStyleOption" value="${empty cookie.layoutStyleOption.value ? 'square' : cookie.layoutStyleOption.value}"/>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=8,IE=9,IE=10">
		
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-store">
		
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <!-- 
        <link href="${ctxStatic}/css/googleapis.css" rel="stylesheet" type="text/css" />
         -->
        <link href="${globalPluginsPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${globalPluginsPath}/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
        <script src="${globalPluginsPath}/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${globalAssetsPath}/css/components${layoutStyleOption eq 'square' ? '' : '-rounded'}.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${globalAssetsPath}/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${ctxStatic}/common/login.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
       
    </head>
    <!-- END HEAD -->

    <body class="login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="${ctxAdmin}">
                <img src="${layoutAssetsPath}/img/logo-big.png" alt="" /> </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form id="loginForm" class="login-form" action="${ctxAdmin}/login" method="post">
                <h3 class="form-title font-green">登录</h3>
                <h3 class="form-title font-green">${fns:getConfig('productName')}</h3>
                <div id="messageBox" class="alert alert-danger ${empty message ? 'hide' : ''}">
                	<button class="close" data-close="alert"></button>
					<span>${message}</span>
				</div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Username</label>
                    <div class="input-icon input-icon-lg">
	                    <i class="fa fa-user"></i>
	                    <input id="username" class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username" value="${username }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Password</label>
                    <div class="input-icon input-icon-lg">
	                    <i class="fa fa-lock"></i>
	                  	<input id="password" class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password" />
                  	</div>
                </div>
	            <c:if test="${isValidateCodeLogin}">
					<sys:validateCode name="validateCode"/>
				</c:if>
                <div class="form-actions">
                    <button type="submit" class="btn green uppercase">登录</button>
                    <label class="rememberme check mt-checkbox mt-checkbox-outline">
                        <input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} />自动登录
                        <span></span>
                    </label>
                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码</a>
                </div>
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="index.html" method="post">
                <h3 class="font-green">Forget Password ?</h3>
                <p> Enter your e-mail address below to reset your password. </p>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn green btn-outline">Back</button>
                    <button type="submit" class="btn btn-success uppercase pull-right">Submit</button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
        </div>
        <div class="copyright"> ${fns:getConfig('copyrightInfo')} </div>
        <!--[if lt IE 9]>
<script src="${ctxStatic}/metronic/assets/global/plugins/respond.min.js"></script>
<script src="${ctxStatic}/metronic/assets/global/plugins/excanvas.min.js"></script> 
<script src="${ctxStatic}/metronic/assets/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="${globalPluginsPath}/jquery.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/js.cookie.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${globalPluginsPath}/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${globalPluginsPath}/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${globalAssetsPath}/scripts/app.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${ctxStatic}/common/login.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
        
        <script type="text/javascript">
        	// 如果在框架或在对话框中，则弹出提示并跳转到首页
			if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jBox').length > 0){
				//alert('未登录或登录超时。请重新登录，谢谢！');
				top.location = "${ctxAdmin}";
			} 
        	
			$(document).ready(function() {
				Login.init("${pageContext.request.contextPath}");
			});
		</script> 
    </body>
</html>