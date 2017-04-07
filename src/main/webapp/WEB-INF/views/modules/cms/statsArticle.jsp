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
	            <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
       		<!-- BEGIN FORM-->
			<div id="searchBox">       		
				<form:form id="searchForm" modelAttribute="article" action="${ctxAdmin}/cms/stats/article/listData" method="post" class="form-horizontal">
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">归属栏目</label>
							<div class="col-md-8">
								<sys:treeselect id="category" name="categoryId" value="${paramMap.categoryId}" labelName="categoryName" labelValue="${paramMap.categoryName}"
									title="栏目" url="/cms/category/treeData" module="article" allowClear="true"/>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">归属机构</label>
							<div class="col-md-8">
								<sys:treeselect id="office" name="officeId" value="${paramMap.officeId}" labelName="officeName" labelValue="${paramMap.officeName}" 
									title="机构" url="/sys/office/treeData" module="article" allowClear="true"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">开始日期</label>
							<div class="col-md-8">
								<input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="form-control"
									value="${paramMap.beginDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</div>
						</div>					
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">结束日期</label>
							<div class="col-md-8">
								<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="form-control"
									value="${paramMap.endDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</div>
						</div>	
					</div>
					<div class="row">				
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
       		<div id="tableBox">
				<table id="contentTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>父级栏目</th>
							<th>栏目名称</th>
							<th>信息量</th>
							<th>点击量</th>
							<th>最后更新时间</th>
							<th>归属机构</th>
						</tr>
					</thead>
					<tbody id="listTableList"></tbody>
					<script type="text/template" id="listTableTpl">
						<tr>
							<td><a href="javascript:" onclick="$('#categoryId').val('{{parent.id}}');$('#categoryName').val('{{parent.name}}');$('#searchForm').submit();return false;">{{parent.name}}</a></td>
							<td><a href="javascript:" onclick="$('#categoryId').val('{{row.id}}');$('#categoryName').val('{{row.name}}');$('#searchForm').submit();return false;">{{row.name}}</a></td>
							<td>{{row.cnt}}</td>
							<td>{{row.hits}}</td>
							<td>{{row.updateDate}}</td>
							<td><a href="javascript:" onclick="$('#officeId').val('{{office.id}}');$('#officeName').val('{{office.name}}');$('#searchForm').submit();return false;">{{office.name}}</a></td>
						</tr>
					</script>
				</table>
			</div>
			<!-- END TABLE-->
        </div>
    </div>
    <!-- END PORTLET-->	
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					searchPostJson({form:"#searchForm", callback:"searchCallback", tableType:"list"});
				}
			});
			
			// 页面打开初始化执行查询操作
			$("#searchForm").submit();
			
			autoRowSpan(contentTable,0,0);
	        $("td,th").css({"text-align":"center","vertical-align":"middle"});
	        
	        function autoRowSpan(tb,row,col){
		        var lastValue="",value="",pos=1;  
		        for(var i=row;i<tb.rows.length;i++){
		            value = tb.rows[i].cells[col].innerText;  
		            if(lastValue == value){
		                tb.rows[i].deleteCell(col); 
		                tb.rows[i-pos].cells[col].rowSpan = tb.rows[i-pos].cells[col].rowSpan+1;
		                pos++;
		            }else{
		                lastValue = value;
		                pos=1;
		            }
		        }
		    }
		});
		
		// 提交查询表单回调方法
		function searchCallback(param) {
           	var item = param.item;
   			$("#listTableList").append(Mustache.render(param.tpl, {
               	row: item, 
               	office: {
               		id: item.office.id,
               		name: item.office.name
               	},
               	parent: {
               		id: item.parent.id,
               		name: item.parent.name
               	}
            }));
		};
	</script>