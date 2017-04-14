<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>留言板</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="TaurusXS ${site.description}" />
	<meta name="keywords" content="TaurusXS ${site.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
			<c:if test="${not empty message}">alert("${message}");</c:if>
			$("#inputForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					content: {required: "请填写留言内容"},
					validateCode: {remote: "验证码不正确"}
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
		});
		function page(n,s){
			location="${ctxFront}/guestbook?pageNo="+n+"&pageSize="+s;;
		}
	</script>
</head>
<body>
	<div class="row">
		<div class="portlet light ">
	        <div class="portlet-title">
	            <div class="caption caption-md">
	                <i class="icon-bar-chart font-dark hide"></i>
	                <span class="caption-subject font-green-steel bold uppercase">公共留言</span>
	            </div>
	        </div>
	        <div class="portlet-body">
                <div class="general-item-list">
	                <c:forEach items="${page.list}" var="guestbook">
						<div class="item">
	                        <div class="item-head">
	                            <div class="item-details">
	                            	姓名: ${guestbook.name}
	                            	<span class="item-label">时间：<fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	                            </div>
	                        </div>
	                        <div class="item-body">
	                        	内容：${guestbook.content}
	                        	<h6>回复人：${guestbook.reUser.name} 时间：<fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></h6>
								<div>回复内容：${guestbook.reContent}</div>
	                        </div>
	                    </div>
					</c:forEach>
					<c:if test="${fn:length(page.list) eq 0}">
						<div class="item">
	                        <div class="item-body">暂时还没有留言</div>
	                    </div>
					</c:if>
            	</div>
            	
            	<div class="dataTables_wrapper">
            		<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>名称</th>
							<th>标题</th>
							<th>描述</th>
							<th>关键字</th>
							<th>主题</th>
						</tr>
					</thead>
					</table>
            		<div class="row">${page}</div>
            	</div>
          	</div>
		</div>
	</div>
	
	<div class="row">
		<div class="portlet light ">
	        <div class="portlet-title">
	            <div class="caption caption-md">
	                <i class="icon-bar-chart font-dark hide"></i>
	                <span class="caption-subject font-green-steel bold uppercase">我要留言</span>
	            </div>
	        </div>
	        <div class="portlet-body">
				<form:form id="inputForm" action="${ctxFront}/guestbook" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-md-4">名称:</label>
						<div class="col-md-6">
							<input type="text" name="name" maxlength="11" class="form-control required" style="width:300px;"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">邮箱:</label>
						<div class="col-md-6">
							<input type="text" name="email" maxlength="50" class="form-control required email" style="width:300px;"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">电话:</label>
						<div class="col-md-6">
							<input type="text" name="phone" maxlength="50" class="form-control required phone" style="width:300px;"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">单位:</label>
						<div class="col-md-6">
							<input type="text" name="workunit" maxlength="50" class="form-control  required" style="width:300px;"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">留言分类:</label>
						<div class="col-md-6">
							<select name="type" class="form-control txt required" style="width:100px;">
								<option value="">请选择</option>
								<c:forEach items="${fns:getDictList('cms_guestbook')}" var="type">
									<option value="${type.value}">${type.label}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">留言内容:</label>
						<div class="col-md-6">
							<textarea name="content" rows="4" maxlength="200" class="form-control required" style="width:400px;"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">验证码:</label>
						<div class="col-md-6">
							<sys:validateCode name="validateCode" />
						</div>
					</div>
					<div class="form-group">
	               		<div class="col-md-offset-4 col-md-6">
							<button id="btn" type="submit" class="btn red">提 交</button>
						</div>
					</div>
					<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
				</form:form>	            
           </div>
       </div>
	</div>

</body>
</html>