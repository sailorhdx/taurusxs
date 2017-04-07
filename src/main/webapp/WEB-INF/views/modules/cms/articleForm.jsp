<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				文章<shiro:hasPermission name="cms:article:edit">${not empty article.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:article:edit">查看</shiro:lacksPermission>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/cms/article/?category.id=${article.category.id}" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 文章列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="article" action="${ctxAdmin}/cms/article/save" method="post" class="form-horizontal form-row-seperated">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group">
					<label class="control-label col-md-4 required">归属栏目</label>
					<div class="col-md-6">
		                <sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
							title="栏目" url="/cms/category/treeData" module="article" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4"></label>
					<div class="col-md-6">
						<label class="mt-checkbox mt-checkbox-outline">
							<input id="url" type="checkbox" onclick="if(this.checked){$('#linkBody').show()}else{$('#linkBody').hide()}$('#link').val()">
							外部链接
							<span></span>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">标题</label>
					<div class="col-md-6">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">颜色</label>
					<div class="col-md-6">
						<form:select path="color" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true" data-height="300">
							<form:option value="" label="默认"/>
							<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
					</div>
				</div>
		        <div id="linkBody" class="form-group" style="display:none">
		            <label class="control-label col-md-4">外部链接</label>
		            <div class="col-md-6">
		                <form:input path="link" htmlEscape="false" maxlength="200" class="form-control"/>
		                <span class="help-inline">绝对或相对地址。</span>
		            </div>
		        </div>
				<div class="form-group">
					<label class="control-label col-md-4">关键字</label>
					<div class="col-md-6">
						<form:input path="keywords" htmlEscape="false" maxlength="200" class="form-control"/>
						<span class="help-inline">多个关键字，用空格分隔。</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">权重</label>
					<div class="col-md-4">
						<form:input path="weight" htmlEscape="false" maxlength="200" class="form-control required digits"/>
					</div>
					<div class="col-md-4">
						<label class="mt-checkbox mt-checkbox-outline">
							<input id="weightTop" type="checkbox" onclick="$('#weight').val(this.checked?'999':'0')">
							置顶
							<span></span>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">过期时间</label>
					<div class="col-md-6">
			            <input id="weightDate" name="weightDate" type="text" readonly="readonly" maxlength="20" class="form-control"
							value="<fmt:formatDate value="${article.weightDate}" pattern="yyyy-MM-dd"/>" 
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						<span class="help-inline">数值越大排序越靠前，过期时间可为空，过期后取消置顶。</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">摘要</label>
					<div class="col-md-6">
						<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">缩略图</label>
					<div class="col-md-6">
		                <input type="hidden" id="image" name="image" value="${article.imageSrc}" />
						<sys:ckfinder input="image" type="thumb" uploadPath="/cms/article" selectMultiple="false"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 required">正文</label>
					<div class="col-md-7">
						<form:textarea id="content" htmlEscape="true" path="articleData.content" class="required" maxlength="200" />
						<sys:ckeditor replace="content" uploadPath="/cms/article" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">附件</label>
					<div class="col-md-6">
						<form:hidden id="attachments" path="articleData.attachments" htmlEscape="false"
							maxlength="255" />
						<sys:ckfinder input="attachments" type="Files"
							uploadPath="/cms/article/attachments" selectMultiple="true" />
					</div>
				</div>		
				<div class="form-group">
					<label class="control-label col-md-4">来源</label>
					<div class="col-md-6">
						<form:input path="articleData.copyfrom" htmlEscape="false" maxlength="200" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">相关文章</label>
					<div class="col-md-6">
						<form:hidden id="articleDataRelation" path="articleData.relation" htmlEscape="false" maxlength="200" class="input-xlarge"/>
						<ol id="articleSelectList"></ol>
						<a id="relationButton" href="javascript:" class="btn">添加相关</a>
						<script type="text/javascript">
							var articleSelect = [];
							function articleSelectAddOrDel(id, title, viewFile){
								var isExtents = false, index = 0;
								for (var i=0; i<articleSelect.length; i++){
									if (articleSelect[i][0]==id){
										isExtents = true;
										index = i;
									}
								}
								if(isExtents){
									articleSelect.splice(index,1);
								}else{
									articleSelect.push([id, title, viewFile]);
								}
								articleSelectRefresh();
							}
							function articleSelectRefresh(){
								$("#articleDataRelation").val("");
								$("#articleSelectList").children().remove();
								for (var i=0; i<articleSelect.length; i++){
									$("#articleSelectList").append("<li><a href='${pageContext.request.contextPath}${fns:getFrontPath()}/view-" + articleSelect[i][2] + "-" + articleSelect[i][0] + "${fns:getUrlSuffix()}' target='_blank'>" + articleSelect[i][1]+"</a>&nbsp;&nbsp;<a href=\"javascript:\" onclick=\"articleSelectAddOrDel('"+articleSelect[i][0]+"','"+articleSelect[i][1]+"');\">×</a></li>");
									$("#articleDataRelation").val($("#articleDataRelation").val()+articleSelect[i][0]+",");
								}
							}
							$.getJSON("${ctxAdmin}/cms/article/findByIds",{ids:$("#articleDataRelation").val()},function(data){
								for (var i=0; i<data.length; i++){
									articleSelect.push([data[i][1],data[i][2],data[i][0]]);
								}
								articleSelectRefresh();
							});
							$("#relationButton").click(function(){
								top.$.jBox.open("iframe:${ctxAdmin}/cms/article/selectList?pageSize=8", "添加相关",$(top.document).width()-220,550,{
									buttons:{"确定":true}, loaded:function(h){
										$(".jbox-content", top.document).css("overflow-y","hidden");
									}
								});
							});
						</script>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">是否允许评论</label>
					<div class="col-md-6">
						<form:select path="articleData.allowComment" class="select2">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">推荐位</label>
					<div class="col-md-6">
						<form:select path="posidList" class="mt-multiselect btn btn-default" multiple="multiple" data-label="left" data-select-all="true" data-width="100%" data-filter="true" data-action-onchange="true">
							<form:options items="${fns:getDictList('cms_posid')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>							
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">发布时间</label>
					<div class="col-md-6">
			            <input id="createDate" name="createDate" type="text" readonly="readonly" maxlength="20" class="form-control"
							value="<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/>" 
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					</div>
				</div>
				<shiro:hasPermission name="cms:article:audit">
					<div class="form-group">
						<label class="control-label col-md-4">发布状态</label>
						<div class="col-md-6">
							<form:select path="delFlag" class="select2">
								<form:options items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>	
						</div>
					</div>
				</shiro:hasPermission>
				<shiro:hasPermission name="cms:category:edit">
		            <div class="form-group">
		                <label class="control-label col-md-4">自定义内容视图</label>
		                <div class="col-md-6">
							<form:select path="customContentView" class="mt-multiselect btn btn-default" data-label="left" data-select-all="false" data-width="100%" data-filter="false" data-action-onchange="true">
								<form:option value="" label="默认视图"/>
								<form:options items="${contentViewList}" htmlEscape="false"/>
							</form:select>	
	                     	<span class="help-inline">自定义内容视图名称必须以"${article_DEFAULT_TEMPLATE}"开始</span>
		            	</div>
		            </div>
		            <div class="form-group">
		                <label class="control-label col-md-4">自定义视图参数</label>
		                <div class="col-md-6">
		                      <form:input path="viewConfig" htmlEscape="true" class="form-control"/>
		                      <span class="help-inline">视图参数例如: {count:2, title_show:"yes"}</span>
		                </div>
		            </div>
				</shiro:hasPermission>
				<div class="form-group">
	               	<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/cms/article');"/>
						
						<shiro:hasPermission name="cms:article:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存" onClick="CKupdate();"/>
						</shiro:hasPermission>
						<!-- 
						<c:if test="${not empty article.id}">
							<input id="btnComment" class="btn" type="button" value="查看评论" onclick="viewComment('${ctxAdmin}/cms/comment/?module=article&contentId=${article.id}&status=0')"/>
							<script type="text/javascript">
								function viewComment(href){
									top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-180,{
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
						</c:if>
						 -->
					</div>
				</div>
			</form:form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
            if($("#link").val()){
                $('#linkBody').show();
                $('#url').attr("checked", true);
            }
			$("#title").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					if ($("#categoryId").val()==""){
                        $("#categoryName").focus();
                        messageMetronic('请选择归属栏目', 'warning');
                    }else if (CKEDITOR.instances.content.getData()=="" && $("#link").val().trim()==""){
                    	messageMetronic('请填写正文', 'warning');
                    }else{
                    	editPostHtml();
                    }
				},
				errorPlacement: function(error, element) {
					jqueryValidateErrorPlacement(error, element);
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
			// 初始化Select2控件
			ComponentsSelect2.init();
		});
		
		function CKupdate(){
			for ( instance in CKEDITOR.instances )
			  CKEDITOR.instances[instance].updateElement();
		}
	</script>