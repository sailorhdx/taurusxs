<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
				<a href="${ctxAdmin}/gen/genTable/form?id=${genTable.id}&name=${genTable.name}" class="ajaxify">业务表<shiro:hasPermission name="gen:genTable:edit">${not empty genTable.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gen:genTable:edit">查看</shiro:lacksPermission></a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/gen/genTable/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 业务表列表 </a>
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
     		<!-- BEGIN FORM--> 
			<c:choose>
				<c:when test="${empty genTable.name}">
					<form:form id="inputForm-selectDBTable" modelAttribute="genTable" action="${ctxAdmin}/gen/genTable/form" method="post" class="form-horizontal">
						<form:hidden path="id"/>
						<sys:message content="${message}"/>
						<br/>
						<div class="form-group">
							<label class="control-label col-md-4">表名</label>
							<div class="col-md-6">
								<form:select path="name" class="form-control">
									<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-6">
								<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/gen/genTable/');"/>
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="下一步"/>
							</div>
						</div>
					</form:form>
				</c:when>
				<c:otherwise>
					<form:form id="inputForm" modelAttribute="genTable" action="${ctxAdmin}/gen/genTable/save" method="post" class="form-horizontal">
					<form:hidden path="id"/>
					<sys:message content="${message}"/>
						<legend>基本信息</legend>
						<div class="form-group">
							<label class="control-label col-md-4 required">表名</label>
							<div class="col-md-6">
								<form:input path="name" htmlEscape="false" maxlength="200" class="form-control required" readonly="true"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 required">说明</label>
							<div class="col-md-6">
								<form:input path="comments" htmlEscape="false" maxlength="200" class="form-control  required"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 required">类名</label>
							<div class="col-md-6">
								<form:input path="className" htmlEscape="false" maxlength="200" class="form-control  required"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">父表表名</label>
							<div class="col-md-6">
								<form:select path="parentTable" class="form-control">
									<form:option value="">无</form:option>
									<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">父表外键</label>
							<div class="col-md-6">								
								<form:select path="parentTableFk" class="form-control">
									<form:option value="">无</form:option>
									<form:options items="${genTable.columnList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
								</form:select>
								<span class="help-inline">如果有父表，请指定父表表名和外键</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">备注</label>
							<div class="col-md-6">
								<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control"/>
							</div>
						</div>
						<legend>字段列表</legend>
						<div class="form-group">
							<div class="col-md-12">
								<table id="contentTable" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>物理数据库属性</th>
											<th>Java实体属性</th>
											<th>Mapping属性</th>
											<th title="字段在表单中显示的类型">显示表单类型</th>
											<th title="显示表单类型设置为“下拉框、复选框、点选框”时，需设置字典的类型">字典类型</th>
											<th>排序</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${genTable.columnList}" var="column" varStatus="vs">
										<tr${column.delFlag eq '1'?' class="error" title="已删除的列，保存之后消失！"':''}>
											<td nowrap>
												<input type="hidden" name="columnList[${vs.index}].id" value="${column.id}"/>
												<input type="hidden" name="columnList[${vs.index}].delFlag" value="${column.delFlag}"/>
												<input type="hidden" name="columnList[${vs.index}].genTable.id" value="${column.genTable.id}"/>
												<input type="hidden" name="columnList[${vs.index}].name" value="${column.name}"/>
												<!-- 数据库字段名 -->
												列名:${column.name}
												<br>
												<!-- 物理类型，数据库中设置的字段类型及长度 -->
												<input type="hidden" name="columnList[${vs.index}].jdbcType" value="${column.jdbcType}"/>
												类型:${column.jdbcType}
												<br>
												<!-- 默认读取数据库字段备注 -->
												备注:<input type="text" name="columnList[${vs.index}].comments" value="${column.comments}" maxlength="200" class="form-control required" />
											</td>
											<td nowrap>
												<!-- 实体对象的属性字段类型 -->
												Java类型:
												<select name="columnList[${vs.index}].javaType" class="form-control required" style="width:100px;">
													<c:forEach items="${config.javaTypeList}" var="dict">
														<option value="${dict.value}" ${dict.value==column.javaType?'selected':''} title="${dict.description}">${dict.label}</option>
													</c:forEach>
												</select>
												<br>
												<!-- 实体对象的属性字段（对象名.属性名|属性名2|属性名3，例如：用户user.id|name|loginName，属性名2和属性名3为Join时关联查询的字段） -->
												Java属性名称:
												<input type="text" name="columnList[${vs.index}].javaField" value="${column.javaField}" maxlength="200" class="form-control required" style="width:100px;"/>
											</td>
											<td nowrap>
												<!-- 是否是数据库主键 -->
												主键:<input type="checkbox" name="columnList[${vs.index}].isPk" value="1" ${column.isPk eq '1' ? 'checked' : ''}/>
												<!-- 字段是否可为空值，不可为空字段自动进行空值验证 -->
												可空:<input type="checkbox" name="columnList[${vs.index}].isNull" value="1" ${column.isNull eq '1' ? 'checked' : ''}/>
												<br>
												<!-- 选中后该字段被加入到insert语句里 -->
												插入:<input type="checkbox" name="columnList[${vs.index}].isInsert" value="1" ${column.isInsert eq '1' ? 'checked' : ''}/>
												<!-- 选中后该字段被加入到update语句里 -->
												编辑:<input type="checkbox" name="columnList[${vs.index}].isEdit" value="1" ${column.isEdit eq '1' ? 'checked' : ''}/>
												<br>
												<!-- 选中后该字段被加入到查询列表里 -->
												列表:<input type="checkbox" name="columnList[${vs.index}].isList" value="1" ${column.isList eq '1' ? 'checked' : ''}/>
												<!-- 选中后该字段被加入到查询条件里 -->
												查询:<input type="checkbox" name="columnList[${vs.index}].isQuery" value="1" ${column.isQuery eq '1' ? 'checked' : ''}/>
												<br>
												<!-- 该字段为查询字段时的查询匹配方式 -->
												查询匹配方式:	
												<select name="columnList[${vs.index}].queryType" class="form-control required" style="width:100px;">
													<c:forEach items="${config.queryTypeList}" var="dict">
														<option value="${fns:escapeHtml(dict.value)}" ${fns:escapeHtml(dict.value)==column.queryType?'selected':''} title="${dict.description}">${fns:escapeHtml(dict.label)}</option>
													</c:forEach>
												</select>
											</td>
											<td>
												<select name="columnList[${vs.index}].showType" class="form-control required" >
													<c:forEach items="${config.showTypeList}" var="dict">
														<option value="${dict.value}" ${dict.value==column.showType?'selected':''} title="${dict.description}">${dict.label}</option>
													</c:forEach>
												</select>
											</td>
											<td>
												<input type="text" name="columnList[${vs.index}].dictType" value="${column.dictType}" maxlength="200" class="form-control input-small"/>
											</td>
											<td>
												<input type="text" name="columnList[${vs.index}].sort" value="${column.sort}" maxlength="200" class="form-control input-xsmall required digits"/>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
			            	<div class="col-md-offset-4 col-md-6">
		               			<input id="btnCancel" class="btn default" type="button" value="返回" onclick="locationHref('${ctxAdmin}/gen/genTable/');"/>
								<shiro:hasPermission name="gen:genTable:edit">
									<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>
								</shiro:hasPermission>
							</div>
						</div>
					</form:form>
				</c:otherwise>
			</c:choose>
            <!-- END FORM-->
        </div>
    </div>
    <!-- BEGIN PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm-selectDBTable").validate({
				submitHandler: function(form){
					editPostHtml({form:"#inputForm-selectDBTable"});
				}
			});
			
			$("#comments").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$("input[type=checkbox]").each(function(){
						$(this).after("<input type=\"hidden\" name=\""+$(this).attr("name")+"\" value=\""
								+($(this).attr("checked")?"1":"0")+"\"/>");
						$(this).attr("name", "_"+$(this).attr("name"));
					});
					editPostHtml();
				}
			});
		});
	</script>