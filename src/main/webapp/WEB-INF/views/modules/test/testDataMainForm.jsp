<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
	<!-- BEGIN PORTLET-->
   	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>
                <a href="${ctxAdmin}/test/testDataMain/form?id=${testDataMain.id}" class="ajaxify">
					主子表<shiro:hasPermission name="test:testDataMain:edit">${not empty testDataMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:testDataMain:edit">查看</shiro:lacksPermission>
				</a>
            </div>
            <div class="actions">
                <a href="${ctxAdmin}/test/testDataMain/" class="btn ajaxify">
                    <i class="fa fa-pencil"></i> 主子表列表 
                </a>
				<a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>                    
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<form:form id="inputForm" modelAttribute="testDataMain" action="${ctxAdmin}/test/testDataMain/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				<div class="form-group">
					<label class="control-label col-md-4">归属用户</label>
					<div class="col-md-6 ">
						<sys:treeselect id="user" name="user.id" value="${testDataMain.user.id}" labelName="user.name" labelValue="${testDataMain.user.name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属部门</label>
					<div class="col-md-6 ">
						<sys:treeselect id="office" name="office.id" value="${testDataMain.office.id}" labelName="office.name" labelValue="${testDataMain.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">归属区域</label>
					<div class="col-md-6 ">
						<sys:treeselect id="area" name="area.id" value="${testDataMain.area.id}" labelName="area.name" labelValue="${testDataMain.area.name}"
							title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">名称</label>
					<div class="col-md-6 ">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">性别</label>
					<div class="col-md-6 ">
						<form:select path="sex" class="mt-multiselect btn btn-default " data-label="left" data-select-all="true" data-width="100%" data-filter="false" data-action-onchange="true">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">加入日期</label>
					<div class="col-md-6 ">
						<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control "
							value="<fmt:formatDate value="${testDataMain.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">备注信息</label>
					<div class="col-md-6 ">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">业务数据子表：</label>
					<div class="col-md-6">
						<table id="contentTable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th class="hide"></th>
									<th>名称</th>
									<th>备注信息</th>
									<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
								</tr>
							</thead>
							<tbody id="testDataChildList">
							</tbody>
							<shiro:hasPermission name="test:testDataMain:edit"><tfoot>
								<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn">新增</a></td></tr>
							</tfoot></shiro:hasPermission>
						</table>
						<script type="text/template" id="testDataChildTpl">//<!--
							<tr id="testDataChildList{{idx}}">
								<td class="hide">
									<input id="testDataChildList{{idx}}_id" name="testDataChildList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
									<input id="testDataChildList{{idx}}_delFlag" name="testDataChildList[{{idx}}].delFlag" type="hidden" value="0"/>
								</td>
								<td>
									<input id="testDataChildList{{idx}}_name" name="testDataChildList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" class="form-control "/>
								</td>
								<td>
									<input id="testDataChildList{{idx}}_remarks" name="testDataChildList[{{idx}}].remarks" type="text" value="{{row.remarks}}" maxlength="255" class="form-control "/>
								</td>
								<shiro:hasPermission name="test:testDataMain:edit"><td class="text-center" width="10">
									{{#delBtn}}<span class="close" onclick="delRow(this, '#testDataChildList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
								</td></shiro:hasPermission>
							</tr>//-->
						</script>
						<script type="text/javascript">
							var testDataChildRowIdx = 0, testDataChildTpl = $("#testDataChildTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
							$(document).ready(function() {
								var data = ${fns:toJson(testDataMain.testDataChildList)};
								for (var i=0; i<data.length; i++){
									addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl, data[i]);
									testDataChildRowIdx = testDataChildRowIdx + 1;
								}
							});
						</script>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<input id="btnCancel" class="btn" type="button" value="返回" onclick="locationHref('${ctxAdmin}/test/testDataMain/');"/>
						<shiro:hasPermission name="test:testDataMain:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>
						</shiro:hasPermission>
					</div>
				</div>
			</form:form>
			<!-- END FORM-->
        </div>
    </div>
    <!-- END PORTLET-->
	
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					editPostHtml();
				}
			});
			
			// 初始化Multiselect控件
			ComponentsBootstrapMultiselect.init();
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>