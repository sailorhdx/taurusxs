<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="验证码输入框名称"%>
<%@ attribute name="inputCssStyle" type="java.lang.String" required="false" description="验证框样式"%>
<%@ attribute name="imageCssStyle" type="java.lang.String" required="false" description="验证码图片样式"%>
<%@ attribute name="buttonCssStyle" type="java.lang.String" required="false" description="看不清按钮样式"%>
<div class="form-group validateCode">
	<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
    <label class="control-label visible-ie8 visible-ie9">ValidateCode ,<a href="javascript:" onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());" class="${name}Refresh" style="${buttonCssStyle}">Click Refresh</a></label>
	<div class="input-group input-icon input-icon-lg">
        <input type="text" id="${name}" name="${name}" maxlength="4" class="form-control required" style="font-weight:bold;font-size:20px;" placeholder="验证码"/>
		<span class="input-group-btn">
			<button class="btn" style="padding:0px 0px">
			<img src="${pageContext.request.contextPath}/servlet/validateCodeServlet" onclick="$('.${name}Refresh').click();" class="ckimg ${name}" style="${imageCssStyle}" alt="点击刷新验证码"/>
			</button>
		</span>	        
	</div>
</div>
                


