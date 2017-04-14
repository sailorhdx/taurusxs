<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="TaurusXS ${site.description}" />
	<meta name="keywords" content="TaurusXS ${site.keywords}" />
</head>
<body>
	<div class="row">
		<div class="portlet light ">
	        <div class="portlet-body">
               <div class="hero-unit" style="padding-bottom:35px;margin:10px 0;">
			      <c:set var="article" value="${fnc:getArticle('2')}"/>
			      <h1>${fns:abbr(article.title,28)}</h1><p></p>
			      <p>${fns:abbr(fns:replaceHtml(article.articleData.content),260)}</p>
			      <p><a href="${article.url}" class="btn btn-primary btn-large">&nbsp;&nbsp;&nbsp;查看详情 &raquo;&nbsp;&nbsp;&nbsp;</a></p>
			    </div>
          	</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 col-xs-12 col-sm-12">
			<div class="portlet light ">
		        <div class="portlet-title">
		            <div class="caption caption-md">
		                <i class="icon-bar-chart font-dark hide"></i>
		                <span class="caption-subject font-green-steel bold uppercase">
							<h4><small><a href="${ctxFront}/list-2${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>组织机构</h4>
						</span>
		            </div>
		        </div>
		        <div class="portlet-body">
	             	<ul><c:forEach items="${fnc:getArticleList(site.id, 2, 8, '')}" var="article">
						<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
					</c:forEach></ul>
	          	</div>
			</div>
		</div>
		<div class="col-md-4 col-xs-12 col-sm-12">
			<div class="portlet light ">
		        <div class="portlet-title">
		            <div class="caption caption-md">
		                <i class="icon-bar-chart font-dark hide"></i>
		                <span class="caption-subject font-green-steel bold uppercase">
		                	<h4> <small><a href="${ctxFront}/list-6${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>质量监督</h4>
						</span>
		            </div>
		        </div>
		        <div class="portlet-body">
					<ul><c:forEach items="${fnc:getArticleList(site.id, 6, 8, '')}" var="article">
						<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
					</c:forEach></ul>
	          	</div>
			</div>
		</div>
		<div class="col-md-4 col-xs-12 col-sm-12">
			<div class="portlet light ">
		        <div class="portlet-title">
		            <div class="caption caption-md">
		                <i class="icon-bar-chart font-dark hide"></i>
		                <span class="caption-subject font-green-steel bold uppercase">
		                	<h4><small><a href="${ctxFront}/list-10${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>政策法规</h4>
						</span>
		            </div>
		        </div>
		        <div class="portlet-body">
					<ul><c:forEach items="${fnc:getArticleList(site.id, 10, 8, '')}" var="article">
						<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
					</c:forEach></ul>
	          	</div>
			</div>
		</div>
	</div>
    
</body>
</html>