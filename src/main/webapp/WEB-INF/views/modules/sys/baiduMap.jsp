<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	<!-- BEGIN PORTLET-->
	<div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech"></i>百度地图
            </div>
            
            <div class="actions">
                <a id="showhide" class="btn btn-icon-only btn-default"> </a>
                <a class="btn btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
            </div>
        </div>
        <div class="portlet-body">
        	<div id="colLeft" class="col-md-3">
		        <div class="portlet">
			        <div class="portlet-body">
			        	ss
			        </div>
		   		 </div>
	   		 </div>
	   		 <div id="colRight" class="col-md-9">
	   		 	<div class="portlet">
			        <div class="portlet-body">
			        	<div id="mapContainer" style="height: 450px;"> </div>
			        </div> 
		   		 </div>
	   		 </div>
        </div>
    </div>
    <!-- END PORTLET-->
	<script type="text/javascript"  src="http://api.map.baidu.com/api?v=1.5&ak=FO2FQeSOoqNY2o8tSFsxGsbD6HP0C0uL&callback=initialize"></script>
    
    <script type="text/javascript">
		$(document).ready(function() {
			$("#showhide").click(function(){
				if ($("#colLeft").hasClass("hide") === true) {
					$("#colLeft").removeClass("hide");
					$("#colRight").removeClass("col-md-12").addClass("col-md-9");
				} else {
					$("#colLeft").addClass("hide");
					$("#colRight").removeClass("col-md-9").addClass("col-md-12");
				} 
			});
			
		});    
	    function initialize(){
			var map = new BMap.Map("mapContainer"); // 创建地图实例  
			var point = new BMap.Point(121.51681,38.856675); // 创建点坐标  
			map.addControl(new BMap.NavigationControl());  //给地图添加控件     
			map.addControl(new BMap.ScaleControl());       
			map.addControl(new BMap.OverviewMapControl());       
			map.addControl(new BMap.MapTypeControl());       
			map.setCurrentCity("大连");  //地区区域  
			map.centerAndZoom(point, 17); // 初始化地图，设置中心点坐标和地图级别  
			map.enableScrollWheelZoom(); //让鼠标滚轮可以放缩地图  
			var marker = new BMap.Marker(point);        // 创建标注       
			map.addOverlay(marker);  //在地图上添加标注
    	}
</script>      