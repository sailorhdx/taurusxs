<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-warning">
	           	<!-- Default panel contents -->
	           	<div class="panel-heading">
	               <h3 class="panel-title">栏目列表</h3>
	           	</div>
	           	<!-- List group -->
	           	<ul class="list-group">
	           		<cms:frontCategoryList categoryList="${categoryList}"/>
	           	</ul>
	       	</div>
	       	
	       	<div class="panel panel-warning">
	           	<!-- Default panel contents -->
	           	<div class="panel-heading">
	               <h3 class="panel-title">推荐阅读</h3>
	           	</div>
	           	<!-- List group -->
	           	<ul class="list-group">
	           		<cms:frontArticleHitsTop category="${category}"/>
	           	</ul>
	       </div>
	   	</div>
		<div class="col-md-9">	   
      		<c:set var="index" value="1"/>
	  		<c:forEach items="${categoryList}" var="tpl">
				<c:if test="${tpl.inList eq '1' && tpl.module ne ''}">
					<c:set var="index" value="${index+1}"/>
					<!-- ${index % 2 eq 0 ? '<div class="row">':''} -->
					<div class="mt-element-list">
	                    <div class="mt-list-head list-news ext-1 font-white bg-yellow-crusta">
                            <div class="list-head-title-container">
                                <h4 class="list-title">${tpl.name}</h4>
                            </div>
                            <div class="list-count pull-right bg-yellow-saffron">
								<a href="${ctxFront}/list-${tpl.id}${urlSuffix}">更多&gt;&gt;</a>
                            </div>
                        </div>
	                    <div class="mt-list-container list-simple">
	                        <ul>
								<c:if test="${tpl.module eq 'article'}">
					    			<c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}" var="article">
										<li class="mt-list-item">
											<div class="list-icon-container done">
			                                    <i class="icon-check"></i>
			                                </div>
											<div class="list-datetime"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
											<div class="list-item-content">
			                                    <h5>
			                                        <a href="${ctxFront}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,40)}</a>
			                                    </h5>
			                                </div>
										</li>
									</c:forEach>
								</c:if>
								<c:if test="${tpl.module eq 'link'}">
					    			<c:forEach items="${fnc:getLinkList(site.id, tpl.id, 5, '')}" var="link">
										<li class="mt-list-item">
											<div class="list-icon-container done">
		                                    	<i class="icon-check"></i>
		                                	</div>
											<div class="list-datetime"><fmt:formatDate value="${link.updateDate}" pattern="yyyy.MM.dd"/></div>
											<div class="list-item-content">
			                                    <h5>
			                                        <a target="_blank" href="${link.href}" style="color:${link.color}">${fns:abbr(link.title,40)}</a>
			                                    </h5>
			                                </div>
										</li>
									</c:forEach>
								</c:if>	                            
	                        </ul>
	                    </div>
	                </div>
			    	<!-- ${index % 2 ne 0 ? '</div>':''} -->
				</c:if>
	  		</c:forEach>
	   	</div>
	</div>
</body>
</html>