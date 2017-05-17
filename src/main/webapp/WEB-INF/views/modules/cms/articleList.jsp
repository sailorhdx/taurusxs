<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				文章列表
            </div>
            <div class="actions">
	            <shiro:hasPermission name="cms:article:edit">
	            	<a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>"  class="btn ajaxify">
	            		<i class="fa fa-pencil"></i> 文章发布 
	            	</a>
	            </shiro:hasPermission>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
       		<div id="searchBox">
				<form:form id="searchForm" modelAttribute="article" action="${ctxAdmin}/cms/article/pageData" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<input id="funcName" name="funcName" type="hidden" value="${page.funcName}"/>
					<input id="funcParam" name="funcParam" type="hidden" value="${page.funcParam}"/>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">栏目</label>
							<div class="col-md-8">
								<sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
									title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" allowClear="true"  cssClass="required"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">标题</label>
							<div class="col-md-8">
								<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">状态</label>
							<div class="col-md-8">
								<form:select path="delFlag" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
									<form:options items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group col-md-6">
							<div class="col-md-offset-4 col-md-8">				
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
							</div>
						</div>
					</div>
				</form:form>
			</div>
       		<!-- END FORM-->
       		<sys:message content="${message}"/>
       		<!-- BEGIN TABLE-->
       		<div id="tableBox" class="dataTables_wrapper">
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>栏目</th>
							<th>标题</th>
							<th>权重</th>
							<th>点击数</th>
							<th>发布者</th>
							<th>更新时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="pageTableList"></tbody>
					<script type="text/template" id="pageTableTpl">
						<tr>
							<td><a href="javascript:" onclick="$('#categoryId').val('{{categoryId}}');$('#categoryName').val('{{categoryName}}');$('#searchForm').submit();return false;">{{categoryName}}</a></td>
							<td><a href="${ctxAdmin}/cms/article/form?id={{row.id}}" title="{{row.title}}" class="ajaxify">{{title}}</a></td>
							<td>{{row.weight}}</td>
							<td>{{row.hits}}</td>
							<td>{{username}}</td>
							<td>{{row.updateDate}}</td>
							<td>
								<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-{{categoryId}}-{{row.id}}${fns:getUrlSuffix()}" target="_blank">访问</a>
								<shiro:hasPermission name="cms:article:edit">
									{{#allowComment}}
										<shiro:hasPermission name="cms:comment:view">
										<a href="${ctxAdmin}/cms/comment/?module=article&contentId={{row.id}}&delFlag=2" onclick="return viewComment(this.href);">评论</a>
										</shiro:hasPermission>
									{{/allowComment}}
				    				<a href="${ctxAdmin}/cms/article/form?id={{row.id}}" class="ajaxify">修改</a>
				    				<shiro:hasPermission name="cms:article:audit">
										<a href="${ctxAdmin}/cms/article/delete?id={{row.id}}{{#delFlag}}&isRe=true{{/delFlag}}&categoryId={{categoryId}}" onclick="return confirmGetJson({mess:'确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', url:this.href, action:'delete'})" >{{#delFlag}}发布{{/delFlag}}{{^delFlag}}删除{{/delFlag}}</a>
									</shiro:hasPermission>
								</shiro:hasPermission>
							</td>
						</tr>
					</script>
				</table>
				<div id="pagination" class="row"></div>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->

	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({funcParam:{callback:"searchCallback"}});
				},
				errorPlacement: function(error, element) {
					jqueryValidateErrorPlacement(error, element);
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();			
			
			// 页面打开初始化执行查询操作
			//$("#searchForm").submit();
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
   			$("#pageTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	title: abbr(item.title,40),
               	username: item.user.name,
               	categoryId: item.category.id,
               	categoryName: item.category.name,
               	delFlag: (item.delFlag != "0"? item.delFlag: ""), //delFlag == "0" 表示已发布，审核状态delFlag == "2"，删除状态delFlag == "1"
               	allowComment: (item.category.allowComment == "1"? item.category.allowComment:"") 
               }));
		};
		
	</script>	
	<script type="text/javascript">
		function viewComment(href){
			top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-120,{
				buttons:{"关闭":true},
				loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
					$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
					$("body", h.find("iframe").contents()).css("margin","10px");
				}
			});
			return false;
		}
	</script>