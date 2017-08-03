var AppMetronicTheme = function() {

	
	var genStrHref = function (ctxAdmin, isValidHref, href, target) {
		var strHref = "javascript:;";
		if (isValidHref) {
			/**
			 * /起始URL
			 * 内部Controller，示例 /sys/user/info (/modules/controller/method)
			 * 		默认(同content)/contentt				调用私有Controller，即ctxAdmin + href;
			 * 		iframe								调用公共Controller，即ctxAdmin + "/sys/direct/iframe?url=" + href;
			 * 		_blank								调用公共Controller，即ctxAdmin + "/sys/direct/blank?url=" + href;
			 * 		
			 * http:// or https://起始URL
			 * 外部链接，示例 http://www.163.com 
			 * 		默认(同_blank)/_blank					target="_blank"弹出原始URL
			 * 		iframe								调用公共Controller，即ctxAdmin + "/sys/direct/iframe?url=" + href;
			 * 														
			 * page://起始URL
			 * 内部无Controller的页面链接，示例 page://sys/baiduMap 	(/modules/page)
			 * 		默认(同content)/content				调用公共Controller，即ctxAdmin + "/sys/direct?url=" + href;
			 * 		iframe								调用公共Controller，即ctxAdmin + "/sys/direct/iframe?url=" + href;
			 * 		_blank  							调用公共Controller，即ctxAdmin + "/sys/direct/blank?url=" + href;
			 * 		
			 * direct://起始URL		
			 * 内部非module链接，示例 direct://druid
			 * 		默认(同iframe)/iframe				调用公共Controller，即ctxAdmin + "/sys/direct/iframe?url=" + href;
			 * 		_blank  							调用公共Controller，即ctxAdmin + "/sys/direct/blank?url=" + href;
			 **/
			if (href.indexOf("http://") == 0 || href.indexOf("https://") == 0) { // 外部链接
				if (target == "iframe") {
					strHref =  ctxAdmin + "/sys/direct/iframe?url=" + href;
				} else { // (target == "_blank" || isNullOrEmpty(target))
					strHref = href;
				}
			} else if (href.indexOf("direct://") == 0) { // 内部非module链接
				if (target == "_blank") {
					strHref = ctxAdmin + "/sys/direct/blank?url=" + href;
				} else { // (target == "iframe" || isNullOrEmpty(target))
					strHref =  ctxAdmin + "/sys/direct/iframe?url=" + href;
				}
			} else if (href.indexOf("page://") == 0) { // 内部无Controller页面
				if (target == "_blank") {
					strHref =  ctxAdmin + "/sys/direct/blank?url=" + href;
				} else if (target == "iframe") {
					strHref =  ctxAdmin + "/sys/direct/iframe?url=" + href;
				} else { // (target == "content" || isNullOrEmpty(target))
					strHref =  ctxAdmin + "/sys/direct?url=" + href;
				}
			} else { // 内部module有专用Controller链接
				if (target == "_blank") {
					strHref = ctxAdmin + "/sys/direct/blank?url=" + href;
				} else if (target == "iframe") {
					strHref =  ctxAdmin + "/sys/direct/iframe?url=" + href;
				} else { // (target == "content" || isNullOrEmpty(target))
					strHref =  ctxAdmin + href;
				}
			}
		}
		return strHref;
	}
	
	var genStrTarget = function (isValidHref, href, target) {
		var strTarget = "";
		if (isValidHref) {
			if ((href.indexOf("http://") == 0 || href.indexOf("https://") == 0) && isNullOrEmpty(target)) {
				target = "_blank";
			}
			// target不等于_blank时，均不设置target信息
			strTarget = (target != "_blank" ? "" : " target=\"_blank\"");
		}
		return strTarget;
	}
	
	var genStrClass = function (isValidHref, strClass, href, target, level) {
		if (isValidHref) {
			if ((href.indexOf("http://") == 0 || href.indexOf("https://") == 0) && isNullOrEmpty(target)) {
				target = "_blank";
			}
			// target不等于_blank时，均在class中设置ajaxify属性采用ajax调用
			strClass = strClass + (target != "_blank" ? " ajaxify" : "");
		} else if (level > 1){
			// 左侧常规菜单，大于2级的文件夹菜单
			strClass = strClass + " nav-toggle";
		}
		return strClass;
	}
	/**
	 * 初始化处理顶部、左侧菜单信息
	 * ctxAdmin 上下文路径
	 * menulist 菜单列表
	 * http:// or https:// （外部链接），支持http://+iframe和http://+_blank(空值默认)形式配置
	 * direct://（内部链接），支持direct://+iframe、direct://+content(空值默认)、direct://+_blank形式配置
	 * /开头（默认形式，内部链接），支持/+iframe、/+content(空值默认)、/+_blank形式配置
	 */
	var handleMenu = function(ctxAdmin, menulist) {
		/**
		 * 创建Navbar菜单，只读取第一级菜单
		 * @param ctxAdmin上下文路徑
		 * @param menulist 菜单列表
		 * @returns 菜单html文本
		 */
		var createNavbarMenu = function (ctxAdmin, menulist) {
			var str = "";
			for (var i=0; i<menulist.length; i++){
				var row = menulist[i];
				var pId = row.parentId;
				var isShow =row.isShow;
				if ((pId == 1) && (isShow == 1)) {// pId == 1是第一级菜单
					var id = row.id;
					var icon = row.icon;
					var name = row.name;
					var target =  row.target;
					var href =  row.href;
					var nav = "," + name;
					str =  str + "<li id=\"" + id + "\" class=\"navbar-menu\">";
					
					// 递归读取子菜单内容
					var subMenu = createSidebarMenu(ctxAdmin, menulist, "", id, 2, "");
					
					// 设置超链接信息，内容如下 :
					// data-id 菜单ID，data-nav 导航信息标签， href 链接地址, class 样式
					str =  str + "<a"
						+ " data-id=\"" + id + "\""
						+ " data-nav=\"" + nav + "\""
						+ " href=\"" + genStrHref(ctxAdmin, !isNullOrEmpty(href), href, target) + "\""
						+ " class=\"" + genStrClass(!isNullOrEmpty(href), "menu menu-toggle", href, target, 0) + "\""
						+ genStrTarget(!isNullOrEmpty(href), href, target)
						+ " navbar-menu=\"true\""
						+ ">";
					
					str =  str + "<span class=\"title\">" + name + "</span>"
						+ "</a>"
						+ "</li>";
				}
			}
			return str;
		};

		/**
		 * 创建Navbar中Usercenter菜单
		 * @param menulist 菜单列表
		 * @returns 菜单html文本
		 */
		var createUsercenterMenu = function (ctxAdmin, menulist) {
			var str = "";//"<ul class=\"dropdown-menu dropdown-menu-default\">";
			for (var i=0; i<menulist.length; i++){
				var row = menulist[i];
				var isUsercenter = row.isUsercenter;
				var isShow = row.isShow;
				if ((isUsercenter == 1) && (isShow == 1)) {
					var id = row.id;
					var icon = row.icon;
					var name = row.name;
					var isFavorite = row.isFavorite;
					var target =  row.target;
					var href =  row.href;
					var nav = ",个人中心," + name;
					str =  str + "<li>";
					
					// 设置超链接信息，内容如下 :
					// data-id 菜单ID, data-nav 导航信息标签, href 链接地址, class 样式, data-menuid 点击事件调用对应的菜单ID参数, data-usercenter 用户中心数据标识
					str =  str + "<a" 
					    + " data-id=\"" + id + "\""
					    + " data-nav=\"" + nav + "\""
						+ " href=\"" + genStrHref(ctxAdmin, true, href, target) + "\""
						+ " class=\"" + genStrClass(true, "", href, target, 0) + "\""
						+ genStrTarget(true, href, target)
					    + " data-menuid=\"" + id + "\""
					    + " data-usercenter=\"1\""
						+ ">";
						
					str =  str + "<i class=\"fa fa-" + icon + "\"></i>";		
					str =  str + "<span class=\"title\">" + name + "</span>";
					str =  str + "</a>";	
					str =  str + "</li>";
				}
			}
			str = str + "<li class=\"divider\"> </li>";
//			str = str + "<li>"
//	        	+ "<a href=\"" + ctxAdmin + "/logout\">"
//	            + "<i class=\"fa fa-sign-out\"></i> 退出 </a>"
//	            + "</li>";
	        //str = str + "</ul>";
			return str;		
		};
		
		/**
		 * 创建Sidebar收藏夹
		 * @param menulist 菜单列表
		 * @returns 收藏夹html文本
		 */
		var createSidebarFavorite = function (ctxAdmin, menulist) {
			var str = "<li id=\"group_favorite\" class=\"nav-item start\">"
				+ "<a id=\"group_favorite\" href=\"javascript:;\" class=\"nav-link nav-toggle\">"
				+ "<i class=\"fa fa-star\"></i>"
				+ "<span class=\"title\">收藏夹</span>"
				+ "<span class=\"arrow\"></span>"
				+ "</a>"
				+ "<ul class=\"sub-menu\">";
			
			// 添加dashboard页面链接
			/*str =  str + "<li id=\"group_favorite\" class=\"nav-item start\">"
				 + "<a id=\"dashboard\" data-nav=\",Dashboard\" href=\"" + ctxAdmin + "/sys/direct?url=/sys/dashboard\" class=\"nav-link ajaxify\" >"
				 + "<i class=\"fa fa-home\"></i>"
				 + "<span class=\"title\">Dashboard</span>"
				 + "</a>"
				 + "</li>";*/

			for (var i=0; i<menulist.length; i++){
				var row = menulist[i];
				var isShow = row.isShow;
				var isFavorite = row.isFavorite;
				if ((isFavorite == 1) && (isShow == 1)) {
					var id = row.id;
					var icon = row.icon;
					var name = row.name;
					var target =  row.target;
					var href =  row.href;
					var nav = ",收藏夹," + name;
					
					str =  str + "<li id=\"group_favorite\" class=\"nav-item start\">";
					
					// 递归读取子菜单内容
					var subMenu = createSidebarMenu(ctxAdmin, menulist, "", id, 2, "");
					
					// 子菜单为空，且，href不为空，作为有效菜单，否则为文件夹菜单或无效连接项
					var isValidHref = (isNullOrEmpty(subMenu) && !isNullOrEmpty(href) ? true : false);
					
					// 设置超链接信息，内容如下 :
					// data-id 菜单ID, data-nav 导航信息标签, href 链接地址, class 样式, data-menuid 点击事件调用对应的菜单ID参数, data-favorite 收藏夹数据标识
					str =  str + "<a"
						+ " data-id=\"" + id + "\""
						+ " data-nav=\"" + nav + "\""
						+ " href=\"" + genStrHref(ctxAdmin, isValidHref, href, target) + "\""
						+ " class=\"" + genStrClass(isValidHref, "nav-link", href, target, 0) + "\""
						+ genStrTarget(isValidHref, href, target)
						+ " data-menuid=\"" + id + "\""
						+ " data-favorite=\"1\""
						+ ">";
					
					str =  str + "<i class=\"fa fa-" + icon + "\"></i>"	
					 	+ "<span class=\"title\">" + name + "</span>"
					 	+ "</a>"
					 	+ "</li>";
				}
			}
			
			str = str + "</ul>"
				+ "</li>";
			
			return str;		
		};
		
		/**
		 * 递归创建Sidebar菜单
		 * @param menulist 菜单列表
		 * @param groupId 菜单分组标识
		 * @param parentId 父菜单ID
		 * @param level 菜单级别
		 * @param datanav 菜单导航标签
		 * @returns 菜单html文本
		 */
		var createSidebarMenu = function (ctxAdmin, menulist, groupId, parentId, level, datanav) {
			var str = "";
			for (var i=0; i<menulist.length; i++){
				var row = menulist[i];
				var pId = row.parentId;
				var isShow = row.isShow;
				if ((pId == parentId) && (isShow == 1)) {
					var id = row.id;
					var icon = row.icon;
					var name = row.name;
					var isFavorite = row.isFavorite;
					var target = row.target;
					var href = row.href;
					var nav = datanav + "," + name;
					
					// 构造groupId，每个一级菜单下的所有菜单，均保持与一级菜单一致的groupId值
					// 用以控制某个一级菜单及子菜单的整体隐藏或显示
					// 各级菜单的ID属性设置为groupId值
					var groupId = (level == 1 ? "group_" + id : groupId); 
					
					// 递归读取子菜单内容
					var subMenu = createSidebarMenu(ctxAdmin, menulist, groupId, id, level+1, nav);
					
					// 子菜单为空，且，href不为空，作为有效菜单，否则为文件夹菜单或无效连接项
					var isValidHref = (isNullOrEmpty(subMenu) && !isNullOrEmpty(href) ? true : false);
					
					if (level == 1) {
						str = str + "<li id=\"" + groupId + "\" class=\"heading\" style=\"display: none\">";
						str = str + "<h3 class=\"uppercase\">";
					} else {
						str =  str + "<li id=\"" + groupId + "\" class=\"nav-item\" style=\"display: none\">";
					}
					
					// 设置超链接信息，内容如下 :
					// data-id 菜单ID, data-nav 导航信息标签, href 链接地址, class 样式, id 点击收藏夹或个人中心的连接根据data-menuid值调用与此id值相等的菜单,  data-isFavorite 是否被收藏标识
					str =  str + "<a"
						+ " data-id=\"" + id + "\""
						+ " data-nav=\"" + nav + "\""
						+ " href=\"" + genStrHref(ctxAdmin, isValidHref, href, target) + "\""
						+ " class=\"" + genStrClass(isValidHref, "nav-link", href, target, level) + "\""
						+ genStrTarget(isValidHref, href, target)
						+ " id=\"menuid" + id + "\""
						+ " data-isFavorite=\"" + isFavorite + "\""
						+ ">";
					
					if (level == 1) {
						str =  str + name;
						str =  str + "</a>";
						
						str =  str + "</h3>";
						str =  str + "</li>";
						
						str = str + (!isNullOrEmpty(subMenu) ? subMenu : ""); 
					} else {
						str =  str + "<i class=\"fa fa-" + icon + "\"></i>"		
							+ "<span class=\"title\">" + name + "</span>"
							// 子菜单不为空的菜单项，作为文件夹菜单项，显示右侧的文件夹箭头“<”标识
							+ (!isNullOrEmpty(subMenu) ? "<span class=\"arrow\"></span>" : "<span class=\"\"></span>") 
							+ "</a>";
							
						// 子菜单不为空的菜单项，作为文件夹菜单项，显示sub-menu子菜单项内容
						str =  str + (!isNullOrEmpty(subMenu) ? "<ul class=\"sub-menu\">" + subMenu + "</ul>" : ""); 		
						str =  str + "</li>";
					}						
				}
			}
			return str;
		};
		
		var eventBinding = function(ctxAdmin) {
			var tabmode = $('#tabmode').val();
			
			if (tabmode == 1) {// 分页 绑定tab
				jericho.buildTabpanel();	
			}
			
			// pageheader菜单点击事件
			$("#menubar a.menu").click(function(){
				$("#menubar li").removeClass("active");
				$(this).parent().addClass("active");
				
				$(".page-sidebar .page-sidebar-menu .heading").hide();
				$(".page-sidebar .page-sidebar-menu .nav-item").hide();
				$(".page-sidebar .page-sidebar-menu #group_favorite").show();
				$(".page-sidebar .page-sidebar-menu #group_"+$(this).attr("data-id")).show();
			});
			
			// page-sidebar-wrapper菜单点击事件
			$(".page-sidebar .page-sidebar-menu a,.page-header a").click(function(){
				var pagebar = $('.page-content .page-bar .page-breadcrumb');
				if ($(this).attr("href").trim() !== "javascript:;"){
					
					var dataNav = $(this).attr("data-nav");
					var isFavorite = $(this).attr("data-isFavorite");
					if ($(this).attr("data-favorite") == "1" || $(this).attr("data-usercenter") == "1") {// 如果是通过收藏夹或个人中心点击的菜单链接，则获取原始菜单的data-nav信息
						dataNav = $(".page-sidebar .page-sidebar-menu #menuid" + $(this).attr("data-menuid")).attr("data-nav");
						//console.log("-------dataNav = " + dataNav);
						isFavorite = $(".page-sidebar .page-sidebar-menu #menuid" + $(this).attr("data-menuid")).attr("data-isFavorite");
						//console.log("-------isFavorite = " + isFavorite);
					}
					
					if (tabmode == 1) { //分页 tab转换链接方式	
						if($(this).attr("href") != "JavaScript:;"){
						 	$(this).attr("page-href",$(this).attr("href")).attr("href","JavaScript:;");
						}
					}
					
					if (!isNullOrEmpty(dataNav)){
						var dataNavs = dataNav.split(",");
						var dataNavStr = "<li><a href=\"" + ctxAdmin + "\">首页</a></li>";
						for(var i=0;i<dataNavs.length;i++){
							if (!isNullOrEmpty(dataNavs[i])) {
								dataNavStr = dataNavStr + "<li>";
								dataNavStr = dataNavStr + "<i class=\"fa fa-circle\"></i>";
								dataNavStr = dataNavStr + dataNavs[i];
								dataNavStr = dataNavStr + "</li>";
							}
						}
						
						// dashboard不设置收藏按钮
						//if ($(this).attr("id") != "dashboard") {
						// 顶部navbar-menu不设置收藏按钮
						if ($(this).attr("navbar-menu") != "true") {
							dataNavStr = dataNavStr + " <a id=\"doFavorite\" href=\"" + ctxAdmin + "/sys/menu/" + (isFavorite == 0? "addFavorite" : "delFavorite") + "?id=" +  $(this).attr("data-id")  + "\" onclick=\"return confirmGetJson({mess:'确认要" + (isFavorite == 0? "添加收藏" : "取消收藏") + "该菜单吗？',url:this.href, callback:'favoriteCallBack', callbackParam:{ctxAdmin:'" + ctxAdmin +"'}})\">"
								+ "<i class=\"fa fa-bookmark " + (isFavorite == 0? "font-green-jungle" : "font-red-thunderbird") + "\"></i>"
								+ "</a>";
						}
						pagebar.html(dataNavStr);
					}
				}
			});
			
			if (tabmode == 1) {// 分页
				var jericho = {
					 showLoader: function() {
			              $('#divMainLoader').css('display', 'block');
			         },
			         removeLoader: function() {
			             $('#divMainLoader').css('display', 'none');
			         },
		  			 buildTabpanel:function() {
			        	$.fn.initJerichoTab({
			              renderTo: '.divRight',
			              uniqueId: 'myJerichoTab',
			              contentCss: { 'height': $('.divRight').height() - 50 },
			              
			                  activeTabIndex: 1,
			                  loadOnce: true
			              });
			          }     			
		      	};
			
		      	var tool_index = {
		    		trim:function (str,is_global){
		 	            var result;
		 	            result = str.replace(/(^\s+)|(\s+$)/g,"");
		 	            if(is_global.toLowerCase()=="g")
		 	            {
		 	                result = result.replace(/\s/g,"");
		 	             }
		 	            return result;
		    		}
		    	};
		      	
		        //子页tab装载
		        var setTurn = function(page,value){
		        	$("."+page).empty();
			        $("."+page).append(value);
		        };
			}
					
		};
		
       	$('.top-menu #menubar').append(createNavbarMenu(ctxAdmin, menulist));
    	$('.top-menu .dropdown-user .dropdown-menu').prepend(createUsercenterMenu(ctxAdmin, menulist));
    	$('.page-sidebar .page-sidebar-menu').append(createSidebarFavorite(ctxAdmin, menulist));
    	$('.page-sidebar .page-sidebar-menu').append(createSidebarMenu(ctxAdmin, menulist, "", 1, 1, ""));
    	eventBinding(ctxAdmin);

	};
	
    // Handle Theme Settings
    var handleTheme = function() {

        //handle theme layout
        var resetLayout = function() {
            $("body").
            removeClass("page-boxed").
            removeClass("page-footer-fixed").
            removeClass("page-sidebar-fixed").
            removeClass("page-header-fixed").
            removeClass("page-sidebar-reversed");

            $('.page-header > .page-header-inner').removeClass("container");

            if ($('.page-container').parent(".container").size() === 1) {
                $('.page-container').insertAfter('body > .clearfix');
            }

            if ($('.page-footer > .container').size() === 1) {
                $('.page-footer').html($('.page-footer > .container').html());
            } else if ($('.page-footer').parent(".container").size() === 1) {
                $('.page-footer').insertAfter('.page-container');
                $('.scroll-to-top').insertAfter('.page-footer');
            }

             $(".top-menu > .navbar-nav > li.dropdown").removeClass("dropdown-dark");

            $('body > .container').remove();
        };

        var lastSelectedLayout = '';

        var setLayout = function() {
        	
            var layoutOption = $('#layoutOption').val();
            var headerOption = $('#headerOption').val();
            var headerTopDropdownStyle = $('#headerTopDropdownStyle').val();
            var sidebarOption = $('#sidebarOption').val();
            var sidebarMenuOption = $('#sidebarMenuOption').val();
            var sidebarPosOption = $('#sidebarPosOption').val();
            var sidebarStyleOption = $('#sidebarStyleOption').val();
            var footerOption = $('#footerOption').val();

            if (sidebarOption == "fixed" && headerOption == "default") {
                alert('Default Header with Fixed Sidebar option is not supported. Proceed with Fixed Header with Fixed Sidebar.');
                $('#headerOption').val("fixed");
                $('#sidebarOption').val("fixed");
                sidebarOption = 'fixed';
                headerOption = 'fixed';
            }

            resetLayout(); // reset layout to default state

            //layout
            if (layoutOption === "boxed") {
                $("body").addClass("page-boxed");

                // set header
                $('.page-header > .page-header-inner').addClass("container");
                var cont = $('body > .page-wrapper > .clearfix').after('<div class="container"></div>');

                // set content
                $('.page-container').appendTo('body > .page-wrapper > .container');

                // set footer
                if (footerOption === 'fixed') {
                    $('.page-footer').html('<div class="container">' + $('.page-footer').html() + '</div>');
                } else {
                    $('.page-footer').appendTo('body > .page-wrapper > .container');
                }
            }

            if (lastSelectedLayout != layoutOption) {
                //layout changed, run responsive handler: 
                App.runResizeHandlers();
            }
            lastSelectedLayout = layoutOption;

            //header
            if (headerOption === 'fixed') {
                $("body").addClass("page-header-fixed");
                $(".page-header").removeClass("navbar-static-top").addClass("navbar-fixed-top");
            } else {
                $("body").removeClass("page-header-fixed");
                $(".page-header").removeClass("navbar-fixed-top").addClass("navbar-static-top");
            }

            // top dropdown style
            if (headerTopDropdownStyle === 'dark') {
                $(".top-menu > .navbar-nav > li.dropdown").addClass("dropdown-dark");
            } else {
                $(".top-menu > .navbar-nav > li.dropdown").removeClass("dropdown-dark");
            }

            //sidebar
            if ($('body').hasClass('page-full-width') === false) {
                if (sidebarOption === 'fixed') {
                    $("body").addClass("page-sidebar-fixed");
                    $("page-sidebar-menu").addClass("page-sidebar-menu-fixed");
                    $("page-sidebar-menu").removeClass("page-sidebar-menu-default");
                    Layout.initFixedSidebarHoverEffect();
                } else {
                    $("body").removeClass("page-sidebar-fixed");
                    $("page-sidebar-menu").addClass("page-sidebar-menu-default");
                    $("page-sidebar-menu").removeClass("page-sidebar-menu-fixed");
                    $('.page-sidebar-menu').unbind('mouseenter').unbind('mouseleave');
                }
            }

            //sidebar style
            if (sidebarStyleOption === 'light') {
                $(".page-sidebar-menu").addClass("page-sidebar-menu-light");
            } else {
                $(".page-sidebar-menu").removeClass("page-sidebar-menu-light");
            }

            //sidebar menu 
            if (sidebarMenuOption === 'hover') {
                if (sidebarOption == 'fixed') {
                    $('#sidebarMenuOption').val("accordion");
                    alert("Hover Sidebar Menu is not compatible with Fixed Sidebar Mode. Select Default Sidebar Mode Instead.");
                } else {
                    $(".page-sidebar-menu").addClass("page-sidebar-menu-hover-submenu");
                }
            } else {
                $(".page-sidebar-menu").removeClass("page-sidebar-menu-hover-submenu");
            }

            //sidebar position
            if (sidebarPosOption === 'right') {
                $("body").addClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'left'
                });
            } else {
                $("body").removeClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'right'
                });
            }

            //footer 
            if (footerOption === 'fixed') {
                $("body").addClass("page-footer-fixed");
            } else {
                $("body").removeClass("page-footer-fixed");
            }
            
            
            // 顶部菜单开启模式设置
            var navbarMenuOption = $('#navbarMenuOption').val();
        	if (navbarMenuOption == "default") { // 开启顶部导航菜单
        		$(".page-header .top-menu #menubar").show();
        		$(".page-sidebar .page-sidebar-menu .nav-item").hide();
        		$(".page-sidebar .page-sidebar-menu .heading").hide();
        		$(".page-sidebar .page-sidebar-menu #group_favorite").show();
            	// 开启顶部导航菜单时，初始化点击第一个一级菜单
    			$("#menubar a.menu:first").click();
        	} else { // 关闭顶部导航菜单
        		$(".page-header .top-menu #menubar").hide();
        		$(".page-sidebar .page-sidebar-menu .nav-item").show();
        		$(".page-sidebar .page-sidebar-menu .heading").show();
        	}
        	
        	// 用户信息位置
        	var userOption = $('#userOption').val();
        	if (userOption === 'default') { // default顶部page-header.navbar栏
        		$(".page-header .top-menu .navbar-nav .dropdown-user").show();
        		$(".page-sidebar .page-sidebar-menu .sidebar-user-wrapper").hide();
        	} else { // side左侧page-sidebar栏
        		$(".page-header .top-menu .navbar-nav .dropdown-user").hide();
        		$(".page-sidebar .page-sidebar-menu .sidebar-user-wrapper").show();
        	}
        	
        	// 搜索栏开启模式设置
        	var searchOption = $('#searchOption').val();
        	if (searchOption === 'default') { // 显示
        		$(".page-sidebar .page-sidebar-menu .sidebar-search-wrapper").show();
        	} else { // 关闭
        		$(".page-sidebar .page-sidebar-menu .sidebar-search-wrapper").hide();
        	}
        	
        	// 收藏夹开启模式设置
        	var favoriteOption = $('#favoriteOption').val();
        	if (favoriteOption === 'default') { // 显示
        		$(".page-sidebar .page-sidebar-menu #group_favorite").show();
        	} else { // 关闭
        		$(".page-sidebar .page-sidebar-menu #group_favorite").hide();
        	}
        	
            if (typeof Cookies !== "undefined") {
            	Cookies.set("theme", $('#themeColor').val(), {expires: 30});
            	
            	Cookies.set("layoutOption",layoutOption, {expires: 30});
            	Cookies.set("headerOption",headerOption, {expires: 30});
            	Cookies.set("headerTopDropdownStyle",headerTopDropdownStyle, {expires: 30});
            	Cookies.set("sidebarOption",sidebarOption, {expires: 30});
            	Cookies.set("sidebarMenuOption",sidebarMenuOption, {expires: 30});
            	Cookies.set("sidebarStyleOption",sidebarStyleOption, {expires: 30});
            	Cookies.set("sidebarPosOption",sidebarPosOption, {expires: 30});
            	Cookies.set("footerOption",footerOption, {expires: 30});
            	
            	// 顶部菜单开启模式设置
            	Cookies.set("navbarMenuOption",navbarMenuOption, {expires: 30});
            	// 用户信息位置
            	Cookies.set("userOption",userOption, {expires: 30});
            	// 搜索栏开启模式设置
            	Cookies.set("searchOption",searchOption, {expires: 30});
            	// 收藏夹开启模式设置
            	Cookies.set("favoriteOption",favoriteOption, {expires: 30});
	        }
            
            Layout.fixContentHeight(); // fix content height            
            Layout.initFixedSidebar(); // reinitialize fixed sidebar
            
        };

        // handle theme colors
        var setColor = function(color) {
            var color_ = color;
            $('#style_color').attr("href", Layout.getLayoutCssPath() + 'themes/' + color_ + ".min.css");
            $('#custom_color').attr("href", Layout.getLayoutCssPath() + 'themes/' + color_ + ".custom.css");
        };

		var setThemeColor = function(color){
			cookie("theme", color, {expires: 30});
			setColor(color);
		}       
		
        $('#layoutOption, #headerOption, #headerTopDropdownStyle, #sidebarOption, #sidebarMenuOption, #sidebarStyleOption, #sidebarPosOption, #footerOption, #navbarMenuOption, #userOption, #searchOption, #favoriteOption').change(setLayout);
		$('#layoutStyleOption').change(function() {setThemeStyle($(this).val());});
		$('#themeColor').change(function() {setThemeColor($(this).val());});
		$('#tabmode').change(function() {setTabMode($(this).val());});

		setLayout(); 
    };
    
    var setTabMode = function(tabmode){
		cookie("tabmode", tabmode, {expires: 30});
		location=location.href;
	}
    
    // handle theme style
    var setThemeStyle = function(style) {
        var file = (style === 'rounded' ? 'components-rounded' : 'components');

        $('#style_components').attr("href", App.getGlobalCssPath() + file + ".css");

        if (typeof Cookies !== "undefined") {
            Cookies.set('layoutStyleOption', style, {expires: 30});
        }
    };

    return {

        //main function to initiate the theme
        init: function(ctxAdmin, menulist, tabmode) {
        	
        	// 页面初始化加载顶部、左侧菜单
    		handleMenu(ctxAdmin, menulist, tabmode);

            // handles style customer tool
            handleTheme(); 
            
            // handle layout style change
            $('layoutStyleOption').change(function() {
                 setThemeStyle($(this).val());
            });

            
            // set layout style from cookie
            if (typeof Cookies !== "undefined" && Cookies.get('layoutStyleOption') === 'rounded') {
                setThemeStyle(Cookies.get('layoutStyleOption'));
            } 
            
           
            // 默认点击打开dashboard
            //$(".page-sidebar .page-sidebar-menu #group_favorite").click();
			//$(".page-sidebar .page-sidebar-menu #dashboard").click();
        }
    };

}();

/**
 * 点击添加收藏/取消收藏操作的回调函数
 * @param res 操作返回的信息内容
 * @returns
 */
function favoriteCallBack(param) {
	var doFavorite = $(".page-bar .page-breadcrumb #doFavorite");
	var doFavoriteBookmark = $(".page-bar .page-breadcrumb #doFavorite .fa-bookmark");
	if (param.res.isFavorite == 1) {
		doFavoriteBookmark.removeClass("font-green-jungle");
		doFavoriteBookmark.addClass("font-red-thunderbird");
		doFavorite.attr("href", param.callbackParam.ctxAdmin + "/sys/menu/delFavorite?id=" + param.res.menuId )
	} else {
		doFavoriteBookmark.removeClass("font-red-thunderbird");
		doFavoriteBookmark.addClass("font-green-jungle");
		doFavorite.attr("href", param.callbackParam.ctxAdmin + "/sys/menu/addFavorite?id=" + param.res.menuId )
	}
}

/**
 * Notify8风格信息提示
 * @param notific8_text 提示信息内容
 * @param notific8_theme 提示框主题色"teal", "amethyst", "ruby", "tangerine", "lemon" ,"lime", "ebony", "smoke"
 */
var messageNotific8 = function (notific8_text, notific8_theme) {
	
	var _theme = notific8_theme || '';
	var _themeArr = ["teal", "amethyst", "ruby", "tangerine", "lemon" ,"lime", "ebony", "smoke"];
	
	if (_theme == null || _theme == ""){
		_theme = "teal";
	} else {
		_theme = _theme.trim().toLowerCase();		
	}
	
	if (_themeArr.toString().indexOf(_theme) === -1) {
		_theme = "teal";
	}
	
    var settings = {
        theme: _theme,
        sticky: false,
        horizontalEdge: 'top',
        verticalEdge: 'right'
    };
    
    if ($.trim($('#notific8_heading').val()) != '') {
        settings.heading = $.trim($('#notific8_heading').val());
    }
    
    if (!settings.sticky) {
        settings.life = 5000;
    }

    $.notific8('zindex', 11500);
    $.notific8($.trim(notific8_text), settings);
    
}

/**
 * BootstrapGrowl风格信息提示
 * @param growl_text 提示信息内容
 * @param growl_type 提示框主题色'info', 'danger', 'success', 'warning'
 */
var messageGrowl = function(growl_text, growl_type) {
	
	var _type = growl_type || '';
	var _typeArr = ['info', 'danger', 'success', 'warning'];
	
	if (_type == null || _type == ""){
		_type = "info";
	} else {
		_type = _type.trim().toLowerCase();
	}
	
	if (_typeArr.toString().indexOf(_type) === -1) {
		_type = "info";
	}

    $.bootstrapGrowl(growl_text, {
        ele: 'body', // which element to append to
        type: _type, // (null, 'info', 'danger', 'success', 'warning')
        offset: {
            from: 'top',
            amount: 100
        }, // 'top', or 'bottom'
        align: 'right', // ('left', 'right', or 'center')
        width: 'auto', // (integer, or 'auto')
        delay: 5000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
        allow_dismiss: true, // If true then will display a cross to close the popup.
        stackup_spacing: 10 // spacing between consecutively stacked growls.
    });
}

/**
 * Toastr Notifications风格信息提示
 * @param toastr_message 提示信息内容
 * @param toastr_type 提示框主题色'info', 'error', 'success', 'warning'
 */
var messageToastr = function (toastr_message, toastr_type){
	
	var _type = toastr_type || '';
	var _typeArr = ['info', 'error', 'success', 'warning'];
	if (_type == null || _type == ""){
		_type = "info";
	} else {
		_type = _type.trim().toLowerCase();
	}
	
	if (_typeArr.toString().indexOf(_type) === -1) {
		_type = "info";
	}

	
	toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "positionClass": "toast-top-right",
			  "onclick": null,
			  "showDuration": "1000",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	}
	
    var $toast = toastr[_type](toastr_message, "信息提示"); // Wire up an event handler to a button in the toast, if it exists
       
}

/**
 * Metronic Alert风格信息提示
 * @param message 提示信息内容
 * @param type 提示框主题色'info', 'danger', 'success', 'warning'
 * @returns
 */
function messageMetronic(metronic_message, metronic_type){
	
	var _type = metronic_type || '';
	var _typeArr = ['info', 'danger', 'success', 'warning'];
	if (_type == null || _type == ""){
		_type = "info";
	} else {
		_type = _type.trim().toLowerCase();
	}
	
	if (_typeArr.toString().indexOf(_type) === -1) {
		_type = "info";
	}
	
	var icon = '';
	if(_type == 'success'){
		icon = 'check';
	} else {
		icon = 'warning';
	}
    App.alert({
        container: '', // alerts parent container(by default placed after the page breadcrumbs)
        place: 'append', // append or prepent
        type: _type,  // success,danger,warning,info
        message: metronic_message,  // success,danger,warning,info
        close: 'true', // make alert closable
        reset: 'true', // close all previouse alerts first
        focus: 'true', // auto scroll to the alert after shown
        closeInSeconds: 5, // auto close after defined seconds
        icon: icon // '',warning,check,user
    });
}


//URL跳转，如返回按钮
function locationHref(href){
	Layout.loadAjaxContent(href);
}

/**
 * 确认框，Url以ajax方式提交后返回json信息
 * @param json格式参数 {
 * 			mess: 确认提示信息
 * 			callback: 返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义
 * 			callbackParam: 回调函数参数信息
 * 		}
 * @returns 
 */
function confirmGetJson(param){
	if (isNullOrEmpty(param)) {
		param = {};
		param["currentTime"] = (new Date()).toLocaleTimeString();
	} 
	
	// 设置默认回调函数
	if (isNullOrEmpty(param.callback)) {
		param["callback"] = "researchGetJsonCallback";
	} 
	
	if (isNullOrEmpty(param.callbackParam)) {
		param.callbackParam = {};
		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
	}
	
	return sweetAlertBootstrap({mess:param.mess, type:"warning", callback: "ajaxGetJson", callbackParam:param});
}

/**
 * 确认框，Url以ajax方式提交后返回html信息
  * @param json格式参数 {
 * 			mess: 确认提示信息
 * 			callback: 返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义
 * 			callbackParam: 回调函数参数信息
 * 		}
 * @returns
 */
function confirmGetHtml(param){
	if (isNullOrEmpty(param)) {
		param = {};
		param["currentTime"] = (new Date()).toLocaleTimeString();
	} 

	// 设置默认回调函数
	if (isNullOrEmpty(param.callback)) {
		param["callback"] = "defaultAjaxGetHtmlCallback";
	}
	
	if (isNullOrEmpty(param.callbackParam)) {
		param.callbackParam = {};
		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
	}
	
	return sweetAlertBootstrap({mess:param.mess, type:"warning", callback: "ajaxGetHtml", callbackParam:param});
}

/**
 * 确认框，Form以ajax方式提交后返回json信息
  * @param json格式参数 {
 * 			mess: 确认提示信息
 * 			callback: 返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义
 * 			callbackParam: 回调函数参数信息
 * 		}
 * @returns 确认提交返回true,否则返回false
 */
function confirmPostJson(param){
	if (isNullOrEmpty(param)) {
		param = {};
		param["currentTime"] = (new Date()).toLocaleTimeString();
	} 
	
	if (isNullOrEmpty(param.callbackParam)) {
		param.callbackParam = {};
		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
	}
	
	param.callbackParam["form"] = param.form;
	
	return sweetAlertBootstrap({mess:param.mess, type:"warning", callback: "ajaxPostJson", callbackParam:param});
}

/**
 * 确认框，Form以ajax方式提交后返回Html信息
 * @param json格式参数 {
 * 			mess: 确认提示信息
 * 			callback: 返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义
 * 			callbackParam: 回调函数参数信息
 * 		}
 * @returns
 */
function confirmPostHtml(param){
	if (isNullOrEmpty(param)) {
		param = {};
		param["currentTime"] = (new Date()).toLocaleTimeString();
	} 
	
	if (isNullOrEmpty(param.callbackParam)) {
		param.callbackParam = {};
		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
	}
	
	param.callbackParam["form"] = param.form;
	
	return sweetAlertBootstrap({mess:param.mess, type:"warning", callback: "ajaxPostHtml", callbackParam:param});
}

/**
 * SweetAlert For Bootstrap
 * @param param json结构的参数信息，如{
 * 				mess:提示信息, 
 * 				type:类型(默认info, 可选success,warning,error), 
 * 				cancelButton:是否显示取消按钮(默认true,可选false),
 * 				callBack:确认提交后的业务处理函数,
 * 				jsonParam:确认提交后的业务处理函数的json结构参数}
 * @returns 确认提交返回true,否则返回false
 */
function sweetAlertBootstrap(param){
	var mess = param.mess;
	var type = param.type;
	var cancelButton = param.cancelButton;
	var confirmButtonText = param.confirmButtonText;
	var cancelButtonText = param.cancelButtonText;
	var callback = param.callback;
	var callbackParam = param.callbackParam;
	
	if (isNullOrEmpty(mess)) {
		mess = "Please enter your prompt information!";
	}
	
	if (isNullOrEmpty(type)) {
		type = "info";
	} else if('success' != type && 'warning' != type  && 'error' != type && 'info' != type) {
		type = "info";
	}

	if (isNullOrEmpty(cancelButton) || cancelButton == "true" ) {
		cancelButton = true;
	} else {
		cancelButton = false;
	}
	
	if (isNullOrEmpty(confirmButtonText)) {
		confirmButtonText = "确认";
	}
	
	if (isNullOrEmpty(cancelButtonText)) {
		cancelButtonText = "取消";
	}
		
	var btnClass = "btn-info";
	
	if ('error' === type) {
		btnClass = "btn-danger";
	} else {
		btnClass = "btn-" + type;
	}
			
	swal({
	  	title: "系统提示",
	  	text: mess,
	  	type: type, //success,warning,error,info
	  	showConfirmButton: true,
	  	showCancelButton: cancelButton,
	  	confirmButtonClass: btnClass,
	  	confirmButtonText: confirmButtonText,
	  	cancelButtonText: cancelButtonText,
	  	closeOnConfirm: true 
	},
	function(isConfirm) {
		if (isConfirm){
			if (!isNullOrEmpty(callback)) {
				var callbackObj = eval(callback);
				callbackObj(callbackParam);
			}
			return true;
		} else {
			return false;
		} 
	});	
	return false;
}


/**
 * url以ajax方式提交返回json信息串
 * @param param json形式的参数，如{
 * 				url:请求地址,
 * 				mess:提交提示信息,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义}
 */
var ajaxGetJson = function(param) {
	var mess = param.mess;
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	App.startPageLoading({message: mess});
    $.ajax({
        type: "GET",
        cache: false,
        url: param.url,
        dataType: "json",
        success: function (res) {    
            App.stopPageLoading();
            messageToastr(res.message, 'success');
            if (!isNullOrEmpty(param.callback)) {
            	param["res"] = res;
            	var callbackObj = eval(param.callback);
    			callbackObj(param);
            }
        },
        error: function (res, ajaxOptions, thrownError) {
            App.stopPageLoading();
            messageToastr(res.message + " ERROR " + res.status, "error");
        }
    });
    
    /**
     * confirm的默认回调事件，通用的删除回调事件，自动提交查询表单
     * @param param
     * @returns
     */
    function researchGetJsonCallback(param) {
    	if ($('.page-content #searchForm').size() != 0) {
    		$("#searchForm").submit();
    	} 
    }
}

/**
 * url以ajax方式提交返回Html页面信息
 * @param param json形式的参数，如{
 * 				url:请求地址,
 * 				mess:提交提示信息,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义}
 */
var ajaxGetHtml = function(param) {
	var mess = param.mess;
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	App.startPageLoading({message: mess});
    $.ajax({
        type: "GET",
        cache: false,
        url: param.url,
        dataType: "html",
        success: function (res) {    
            App.stopPageLoading();
            //messageToastr(res.message, 'success');
			if (!isNullOrEmpty(param.callback)) {
				param["res"] = res;
				var callbackObj = eval(param.callback);
				callbackObj(param);
			} 
        },
        error: function (res, ajaxOptions, thrownError) {
            App.stopPageLoading();
            messageToastr(res.message + " ERROR " + res.status, "error");
        }
    });
    
    /**
     * confirm的默认回调事件，填充页面'.page-content .page-content-body'
     * @param param
     * @returns
     */
    function defaultAjaxGetHtmlCallback(param) {
		// 添加、更新表单提交返回html数据的情况下，如果未配置自定义回调函数则默认在页面中显示返回的html信息
		var pageContent = $('.page-content .page-content-body');
		pageContent.empty();
		pageContent.html(param.res);
    }
}

/**
 * form表单以ajax提交返回json
 * @param param json结构的参数，如{
 * 				mess:提交提示信息,
 * 				form:提交的form表单ID,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				callbackParam:回调函数参数
 * 				}
 * @returns
 */
var ajaxPostJson = function(param) {
	
	var mess = param.mess;
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	
	var form = param.form;
	
	App.startPageLoading({message: mess});
	$.ajax({
        type: "post",
        cache: false,
        url: $(form).attr("action"),
        dataType: "json",
        data: $(form).serialize(),
        success: function (res) {    
            App.stopPageLoading();
            if (!isNullOrEmpty(param.callback)) {
            	if (isNullOrEmpty(param.callbackParam)) {
            		param.callbackParam = {};
            		// 向传递的参数中添加时间戳信息
            		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
            	}
            	param.callbackParam["res"] = res;
            	var callbackObj = eval(param.callback);
            	callbackObj(param.callbackParam);
            }
            Layout.fixContentHeight(); // fix content height
            App.initAjax(); // initialize core stuff
        },
        error: function (res, ajaxOptions, thrownError) {
            App.stopPageLoading();
        }
    });
	
	/**
	 * 提交编辑(添加/更新)表单返回json数据的回调方法
	 */
	function editPostJsonCallback(param) {
		messageToastr(param.res.message, 'success');
		if (!isNullOrEmpty(param.callback)) {
			var callbackObj = eval(param.callback);
			callbackObj(param);
		}
	}
	
	/**
	 * 提交查询表单回调方法
	 * list表示非翻页Table
	 */
	function searchListCallback(param) {
		var listTable = "#listTable";
		if (!isNullOrEmpty(param.table)) {
			listTable = param.table;
		}
		var listTableTpl = "#listTableTpl";
		if (!isNullOrEmpty(param.tableTpl)) {
			listTableTpl = param.tableTpl;
		}
		var listTableList = "#listTableList";
		if (!isNullOrEmpty(param.tableList)) {
			listTableList = param.tableList;
		}
		
		var callbackObj = "";
		if (!isNullOrEmpty(param.callback)) {
			callbackObj = eval(param.callback);
		}
		
		// 获取Table模板
		var tpl = $(listTableTpl).html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		// 向传递的参数中添加模板对象信息
		param["tpl"] = tpl;
	    // 清空Table数据tbody区
	    $(listTableList).empty();
	    
	    // 遍历返回page对象中的list数据，生成新的Table数据tbody区
	    $.each(param.res, function(index, item){
	    	if (isNullOrEmpty(callbackObj)) {
	    		$(listTableList).append(Mustache.render(tpl, {
	            	row: item 
	            }));
	    	} else {
	    		// 向传递的参数中添加模板item记录条目信息
	    		param["item"] = item; 
	    		callbackObj(param);
	    	}
		});

	}

	/**
	 * 提交查询表单回调方法
	 * tree表示树形table
	 */
	function searchTreeCallback(param) {
		var treeTable = "#treeTable";
		if (!isNullOrEmpty(param.table)) {
			treeTable = param.table;
		}
		var treeTableTpl = "#treeTableTpl";
		if (!isNullOrEmpty(param.tableTpl)) {
			treeTableTpl = param.tableTpl;
		}
		var treeTableList = "#treeTableList";
		if (!isNullOrEmpty(param.tableList)) {
			treeTableList = param.tableList;
		}
		var expandLevel = 5;
		if (!isNullOrEmpty(param.expandLevel)) {
			expandLevel = param.expandLevel;
		}
		var callbackObj = "";
		if (!isNullOrEmpty(param.callback)) {
			callbackObj = eval(param.callback);
		}
		
		// 获取Table模板
		var tpl = $(treeTableTpl).html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		// 向传递的参数中添加模板对象信息
		param["tpl"] = tpl;
	    // 清空Table数据tbody区
	    $(treeTableList).empty();
	    
	    var data = param.res, ids = [], rootIds = [];;
		param["res"] = "";
		
		//console.log("data.length = " + data.length);
		
		if (!isNullOrEmpty(param.rootId)) {
			rootIds.push(param.rootId) 
		} else {
			// 用变量ids保存下来所有节点的id值，并以逗号分隔
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			//console.log("ids = " + ids)
			
			// 遍历数据记录集，哪个节点的parentId值没有出现在ids中，即为rootID
			for (var i=0; i<data.length; i++){
				//console.log("data["+i+"]=" + data[i] + " , data["+i+"].parentId = " + data[i].parentId);
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
		}
		
		// 对所有以rootIds中数据为根节点的记录进行递归生成树
		for (var i=0; i<rootIds.length; i++){
			//console.log("rootIds[" + i+ "] = " + rootIds[i]);
			// 调用递归函数，生成树table
			addTreeRow(treeTableList, param, callbackObj, data, rootIds[i], true);
		}
		
		$(treeTable).treeTable({expandLevel : expandLevel}).show();
		
		// 递归添加Table数据行
		function addTreeRow(treeTableList, param, callback, data, pid, root){
			$.each(data, function(index, item){
				if (item.parentId == pid){
					if (isNullOrEmpty(callbackObj)) {
			    		$(treeTableList).append(Mustache.render(param.tpl, {
			    			pid: (root?0:pid),
			    			row: item 
			            }));
			    	} else {
			    		// 向传递的参数中添加模板item记录条目信息
			    		param["item"] = item; 
			    		param["pid"] = pid;
			    		param["root"] = root;
			    		callbackObj(param);
			    	}
					addTreeRow(treeTableList, param, callback, data, item.id, false);
				}
			});
		}
	}
	
	/**
	 * postJson的page回调函数
	 * page表示翻页table
	 * @param param json结构的参数，如{
	 * 				tableTpl:pageTable模板ID，默认值#pageTableTpl,
	 * 				tableList:pageTable数据区ID，默认值"#pageTableList",
	 * 				pagination:pageTable翻页区ID，默认值"#pagination",
	 * 				callback:设置Mustache的view属性,为空进行默认设置}
	 * @returns 
	 */
	function searchPageCallback(param){
		
		var pageTableTpl = "#pageTableTpl";
		var pageTableList = "#pageTableList";
		var pagination = "#pagination";
		var callbackObj = "";
		
		if (!isNullOrEmpty(param.funcParam)) {

			if (!isNullOrEmpty(param.funcParam.tableTpl)) {
				pageTableTpl = param.funcParam.tableTpl;
			}
			
			if (!isNullOrEmpty(param.funcParam.tableList)) {
				pageTableList = param.funcParam.tableList;
			}
			
			if (!isNullOrEmpty(param.funcParam.pagination)) {
				pagination = param.funcParam.pagination;
			}
			
			if (!isNullOrEmpty(param.funcParam.callback)) {
				callbackObj = eval(param.funcParam.callback);
			}
			
		}
		
		
		// 获取Table模板
		var tpl = $(pageTableTpl).html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		// 向传递的参数中添加模板对象信息
		param["tpl"] = tpl;
	    // 清空Table数据tbody区
	    $(pageTableList).empty();
	    // 遍历返回page对象中的list数据，生成新的Table数据tbody区
	    $.each(param.res.list, function(index, item){
	    	if (isNullOrEmpty(callbackObj)) {
	    		$(pageTableList).append(Mustache.render(tpl, {
	            	row: item 
	            }));
	    	} else {
	    		// 向传递的参数中添加模板item记录条目信息
	    		param["item"] = item; 
	    		callbackObj(param);
	    	}
		});
	    // 清空Table翻页区
	    $(pagination).empty();
	    // 使用返回page对象中的html数据，填充Table翻页区
	    $(pagination).html(param.res.html);
	}
}

/**
 * form表单以ajax提交返回json
 * @param param json结构的参数，如{
 * 				mess:提交提示信息,
 * 				form:提交的form表单ID,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				callbackParam:回调函数参数
 * 				}
 * @returns
 */
var ajaxPostHtml = function(param) {
	
	var mess = param.mess;
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	
	var form = param.form;
	
	App.startPageLoading({message: mess});
	$.ajax({
        type: "post",
        cache: false,
        url: $(form).attr("action"),
        dataType: "html",
        data: $(form).serialize(),
        success: function (res) {    
        	console.log(res);
            App.stopPageLoading();
            if (!isNullOrEmpty(param.callback)) {
            	if (isNullOrEmpty(param.callbackParam)) {
            		param.callbackParam = {};
            		// 向传递的参数中添加时间戳信息
            		param.callbackParam["currentTime"] = (new Date()).toLocaleTimeString();
            	}
            	param.callbackParam["res"] = res;
            	var callbackObj = eval(param.callback);
            	callbackObj(param.callbackParam);
            }
            Layout.fixContentHeight(); // fix content height
            App.initAjax(); // initialize core stuff
        },
        error: function (res, ajaxOptions, thrownError) {
            App.stopPageLoading();
        }
    });
	
	/**
	 * 提交添加/更新表单返回html数据的回调方法
	 */
	function defaultPostHtmlCallback(param) {
		if (!isNullOrEmpty(param.callback)) {
			var callbackObj = eval(param.callback);
			callbackObj(param);
		} else {
			// 添加、更新表单提交返回html数据的情况下，如果未配置自定义回调函数则默认在页面中显示返回的html信息
			var pageContent = $('.page-content .page-content-body');
			pageContent.empty();
			pageContent.html(param.res);
		}
	}
}

/**
 * 查询表单ajax提交请求事件方法
 * @param param json结构的参数，如{
 * 				form:提交的form表单ID，默认值#searchForm,
 * 				tableType:数据表格类型，默认值page分页表格，可选值list，tree
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				param: 回调函数参数}
 * @returns 
 */
function searchPostJson(param){
	if (isNullOrEmpty(param)) {
		param = {};
	}
	// 向传递的参数中添加时间戳信息
	param["currentTime"] = (new Date()).toLocaleTimeString();
	
	// 默认值#searchForm
	var formId = "#searchForm";
	if (!isNullOrEmpty(param.form)) {
		formId = param.form;
	}
	// 向传递的参数中添加表单ID信息
	param["form"] = formId;
	
	// 默认是page，可选list，tree
	var tableType = "page";
	if (!isNullOrEmpty(param.tableType)) {
		tableType = param.tableType;
	}
	param["tableType"] = tableType;
	
	// 默认searchPageCallback，可选searchListCallback，searchTreeCallback
	var callback = "searchPageCallback";
	if (tableType == "list") {
		callback = "searchListCallback";
	} else if (tableType == "tree") {
		callback = "searchTreeCallback";
	} else {
		// 在表单提交前，给表单隐藏项赋值
		// 初始化打开提交前只需要赋值pageNo和pageSize
		// 其它参数在回调函数中赋值即可
		if (!isNullOrEmpty(param.pageNo)) {
			$("#pageNo").val(param.pageNo);
		}
		// 向传递的参数中添加当前页码信息
		param["pageNo"] = $("#pageNo").val();
		if (!isNullOrEmpty(param.pageSize)) {
			$("#pageSize").val(param.pageSize);	
		}
		// 向传递的参数中添加每页记录数
		param["pageSize"] = $("#pageSize").val();
		
		// 给表单隐藏项funcName自动赋值
		param["funcName"] = "searchPostJson";
		$("#funcName").val(param.funcName);
		
		if (!isNullOrEmpty(param.funcParam)) {
			// 重组page方法的参数funcParam，通过表单参数funcParam提交给page对象
			var jsonObject = JSON.parse(JSON.stringify(param.funcParam));
			var funcParam = "";
			$.each(jsonObject,function(name,value) {
				//console.log("jsonObject " + name + " = " + value);
				funcParam =  funcParam + name+ ":'" + value + "',";
			});  
			// 设置表单隐藏项的funcParam值
			$("#funcParam").val("{" + funcParam + "}");
		}
	} 
	
	ajaxPostJson({form:formId, callback:callback, callbackParam: param});
}

/**
 * 查询表单ajax提交请求事件方法
 * @param param json结构的参数，如{
 * 				form:提交的form表单ID，默认值#searchForm,
 * 				tableType:数据表格类型，默认值page分页表格，可选值list，tree
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				param: 回调函数参数}
 * @returns 
 */
function searchPostHtml(param){
	if (isNullOrEmpty(param)) {
		param = {};
	}
	// 向传递的参数中添加时间戳信息
	param["currentTime"] = (new Date()).toLocaleTimeString();
	
	// 默认值#searchForm
	var formId = "#searchForm";
	if (!isNullOrEmpty(param.form)) {
		formId = param.form;
	}
	// 向传递的参数中添加表单ID信息
	param["form"] = formId;
	
	ajaxPostHtml({form:formId, callback:"defaultPostHtmlCallback", callbackParam: param});
}

/**
 * 查询表单ajax提交请求事件方法
 * @param param json结构的参数，如{
 * 				form:提交的form表单ID，默认值#searchForm,
 * 				tableType:数据表格类型，默认值page分页表格，可选值list，tree
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				param: 回调函数参数}
 * @returns 
 */
function page(param){
	if (isNullOrEmpty(param)) {
		param = {};
	}
	// 向传递的参数中添加时间戳信息
	param["currentTime"] = (new Date()).toLocaleTimeString();
	
	// 默认值#searchForm
	var formId = "#searchForm";
	if (!isNullOrEmpty(param.form)) {
		formId = param.form;
	}
	// 向传递的参数中添加表单ID信息
	param["form"] = formId;
	
	// 在表单提交前，给表单隐藏项赋值
	// 初始化打开提交前只需要赋值pageNo和pageSize
	// 其它参数在回调函数中赋值即可
	if (!isNullOrEmpty(param.pageNo)) {
		$("#pageNo").val(param.pageNo);
	}
	// 向传递的参数中添加当前页码信息
	param["pageNo"] = $("#pageNo").val();
	if (!isNullOrEmpty(param.pageSize)) {
		$("#pageSize").val(param.pageSize);	
	}
	// 向传递的参数中添加每页记录数
	param["pageSize"] = $("#pageSize").val();
	
	
	ajaxPostHtml({form:formId, callback:"defaultPostHtmlCallback", callbackParam: param});
}

/**
 * 编辑（添加/更新）表单ajax提交请求事件方法
 * @param param json结构的参数，如{
 * 				form:提交的form表单ID，默认值#inputForm,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				dataType:返回的数据类型，默认值json，可选值json/html
 * 				param: 回调函数参数}
 * @returns 
 */
function editPostJson(param){
	if (isNullOrEmpty(param)) {
		param = {};
	}
	// 向传递的参数中添加时间戳信息
	param["currentTime"] = (new Date()).toLocaleTimeString();
	
	var formId = "#inputForm";
	if (!isNullOrEmpty(param.form)) {
		formId = param.form;
	}
	// 向传递的参数中添加表单ID信息
	param["form"] = formId;
	
	ajaxPostJson({form:formId, callback:"editPostJsonCallback", callbackParam: param});	
}

/**
 * 编辑（添加/更新）表单ajax提交请求事件方法
 * @param param json结构的参数，如{
 * 				form:提交的form表单ID，默认值#inputForm,
 * 				callback:返回成功后的回调函数，为空即什么都不做，可以在页面进行自定义,
 * 				dataType:返回的数据类型，默认值json，可选值json/html
 * 				param: 回调函数参数}
 * @returns 
 */
function editPostHtml(param){
	if (isNullOrEmpty(param)) {
		param = {};
	}
	// 向传递的参数中添加时间戳信息
	param["currentTime"] = (new Date()).toLocaleTimeString();
	
	var formId = "#inputForm";
	if (!isNullOrEmpty(param.form)) {
		formId = param.form;
	}
	// 向传递的参数中添加表单ID信息
	param["form"] = formId;
	
	ajaxPostHtml({form:formId, callback:"defaultPostHtmlCallback", callbackParam: param});
}



/**
 * Bootstrap Multiselect Dropdowns下拉列表控件初始化
 * 在每个使用Bootstrap Multiselect Dropdowns控件的页面$(document).ready()方法中掉调用
 * 调用方式如：ComponentsBootstrapMultiselect.init();
 */
var ComponentsBootstrapMultiselect = function () {

    return {
        //main function to initiate the module
        init: function () {
        	$('.mt-multiselect').each(function(){
        		var btn_class = $(this).attr('class');
        		var clickable_groups = ($(this).data('clickable-groups')) ? $(this).data('clickable-groups') : false ;
        		var collapse_groups = ($(this).data('collapse-groups')) ? $(this).data('collapse-groups') : false ;
        		var drop_right = ($(this).data('drop-right')) ? $(this).data('drop-right') : false ;
        		var drop_up = ($(this).data('drop-up')) ? $(this).data('drop-up') : false ;
        		var select_all = ($(this).data('select-all')) ? $(this).data('select-all') : false ;
        		var width = ($(this).data('width')) ? $(this).data('width') : '' ;
        		var height = ($(this).data('height')) ? $(this).data('height') : '' ;
        		var filter = ($(this).data('filter')) ? $(this).data('filter') : false ;

        		// advanced functions
        		//var onchange_function = function(option, checked, select) {
	                //alert('Changed option ' + $(option).val() + '.');
	            //}
	            //var dropdownshow_function = function(event) {
	                //alert('Dropdown shown.');
	            //}
	            //var dropdownhide_function = function(event) {
	                //alert('Dropdown Hidden.');
	            //}

	            // init advanced functions
	            //var onchange = ($(this).data('action-onchange') == true) ? onchange_function : '';
	            //var dropdownshow = ($(this).data('action-dropdownshow') == true) ? dropdownshow_function : '';
	            //var dropdownhide = ($(this).data('action-dropdownhide') == true) ? dropdownhide_function : '';

	            // template functions
	            // init variables
	            var li_template;
	            if ($(this).attr('multiple')){
	            	li_template = '<li class="mt-checkbox-list"><a href="javascript:void(0);"><label class="mt-checkbox"> <span></span></label></a></li>';
        		} else {
        			li_template = '<li><a href="javascript:void(0);"><label></label></a></li>';
         		}

	            // init multiselect
        		$(this).multiselect({
        			enableClickableOptGroups: clickable_groups,
        			enableCollapsibleOptGroups: collapse_groups,
        			disableIfEmpty: true,
        			enableFiltering: filter,
        			includeSelectAllOption: select_all,
        			dropRight: drop_right,
        			buttonWidth: width,
        			maxHeight: height,
        			//onChange: onchange,
        			//onDropdownShow: dropdownshow,
        			//onDropdownHide: dropdownhide,
        			buttonClass: btn_class,
        			nonSelectedText: '请选择',
        			nSelectedText: '已选',
        			selectAllText: ' 全部选中',
        			filterPlaceholder: '查询',
        			allSelectedText: '全部已选',
        			//optionClass: function(element) { return "mt-checkbox"; },
        			//optionLabel: function(element) { console.log(element); return $(element).html() + '<span></span>'; },
        			/*templates: {
		                li: li_template,
		            }*/
        		});   
        	});
         	
        }
    };

}();


/**
 * Select2 Dropdowns下拉列表控件初始化
 * 在每个使用Select2 Dropdowns控件的页面$(document).ready()方法中掉调用
 * 调用方式如：ComponentsSelect2.init();
 */
var ComponentsSelect2 = function() {

    return {
        //main function to initiate the module
        init: function() {
        	$.fn.select2.defaults.set("theme", "bootstrap");
    		var placeholder = "请选择";
            $(".select2, .select2-multiple").select2({
                placeholder: placeholder,
                width: null
            });
            
            $(".select2-allow-clear").select2({
                allowClear: true,
                placeholder: placeholder,
                width: null
            });
        }
    };

}();

/**
 * Bootstrap Select下拉列表控件初始化
 * 在每个使用Bootstrap Select控件的页面$(document).ready()方法中掉调用
 * 调用方式如：ComponentsBootstrapSelect.init();
 */
var ComponentsBootstrapSelect = function () {

    return {
        //main function to initiate the module
        init: function () {      
        	$('.bs-select').selectpicker({
                iconBase: 'fa',
                tickIcon: 'fa-check',
                noneSelectedText:'请选择',
                selectAllText: '全部选中',
                deselectAllText: '全部取消'
            });
        }
    };

}();

/**
 * jQueryValidate事件对特殊空间的错误信息位置调整
 */
var jqueryValidateErrorPlacement = function(error, element){
	//console.log("-----------------");
	if (element.hasClass("select2")||element.hasClass("select2-allow-clear")||element.hasClass("select2-multiple")) {
		// Select2 Dropdowns下拉列表
		error.appendTo(element.parent());
	} else if (element.hasClass("mt-multiselect") || element.hasClass("bs-select")){
		//Bootstrap Multiselect Dropdowns下拉列表 || Bootstrap Select下拉列表
		error.appendTo(element.parent().parent());
	} else if (element.hasClass("treeselect")){
		//treeselect自定义标签控件
		error.appendTo(element.parent().parent());
	} else if (element.is(":checkbox")||element.is(":radio")||element.is("select")){
		// 一般的checkbox、radio、select控件
		error.appendTo(element.parent().parent());
	} else {
		// 其它控件，如一般input
		error.insertAfter(element);
	}
};

/**
 * Draggable Modal初始化事件
 * 在调用Draggable Modal的页面$(document).ready()方法中掉调用
 * 调用方式如：UIModals.init();
 */
var UIModals = function () {

    return {
        //main function to initiate the module
        init: function () {
        	 $(".draggable-modal").draggable({
                 // handle: ".modal-header"
              });
        }

    };

}();

/*-----------------------------------*/
/*------------自定义工具函数------------*/
/*-----------------------------------*/

/**
 * 判断字符串是否为空
 * @param strVal 字符串
 * @returns 空返回true，否则false
 */
function isNullOrEmpty(strVal) {
	if (strVal == '' || strVal == null || strVal == undefined) {
		return true;
	} else {
		return false;
	}
}

/**
 * 判断字符串是否为true
 * @param val 字符串
 * @returns 是返回true，否则false
 */
function isTrue(val) {
	if (val != undefined && (val == true || val.toLowerCase == "true")) {
		return true;
	} else {
		return false;
	}
}


//引入js和css文件
function include(id, path, file){
	if (document.getElementById(id)==null){
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++){
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i==0?" id="+id:"") + attr + link + "></" + tag + ">");
        }
	}
}

// 获取URL地址参数
function getQueryString(name, url) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    if (!url || url == ""){
	    url = window.location.search;
    }else{	
    	url = url.substring(url.indexOf("?"));
    }
    r = url.substr(1).match(reg)
    if (r != null) return unescape(r[2]); return null;
}

//获取字典标签
function getDictLabel(data, value, defaultValue){
	for (var i=0; i<data.length; i++){
		var row = data[i];
		if (row.value == value){
			return row.label;
		}
	}
	return defaultValue;
}

// 打开一个窗体
function windowOpen(url, name, width, height){
	var top=parseInt((window.screen.height-height)/2,10),left=parseInt((window.screen.width-width)/2,10),
		options="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,"+
		"resizable=yes,scrollbars=yes,"+"width="+width+",height="+height+",top="+top+",left="+left;
	window.open(url ,name , options);
}


// 添加TAB页面
function addTabPage(title, url, closeable, $this, refresh){
	top.$.fn.jerichoTab.addTab({
        tabFirer: $this,
        title: title,
        closeable: closeable == undefined,
        data: {
            dataType: 'iframe',
            dataLink: url
        }
    }).loadData(refresh != undefined);
}

// cookie操作
function cookie(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}

// 数值前补零
function pad(num, n) {
    var len = num.toString().length;
    while(len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

// 转换为日期
function strToDate(date){
	return new Date(date.replace(/-/g,"/"));
}

// 日期加减
function addDate(date, dadd){  
	date = date.valueOf();
	date = date + dadd * 24 * 60 * 60 * 1000;
	return new Date(date);  
}

//截取字符串，区别汉字和英文
function abbr(name, maxLength){  
 if(!maxLength){  
     maxLength = 20;  
 }  
 if(name==null||name.length<1){  
     return "";  
 }  
 var w = 0;//字符串长度，一个汉字长度为2   
 var s = 0;//汉字个数   
 var p = false;//判断字符串当前循环的前一个字符是否为汉字   
 var b = false;//判断字符串当前循环的字符是否为汉字   
 var nameSub;  
 for (var i=0; i<name.length; i++) {  
    if(i>1 && b==false){  
         p = false;  
    }  
    if(i>1 && b==true){  
         p = true;  
    }  
    var c = name.charCodeAt(i);  
    //单字节加1   
    if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {  
         w++;  
         b = false;  
    }else {  
         w+=2;  
         s++;  
         b = true;  
    }  
    if(w>maxLength && i<=name.length-1){  
         if(b==true && p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(b==false && p==false){  
             nameSub = name.substring(0,i-3)+"...";  
         }  
         if(b==true && p==false){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         break;  
    }  
 }  
 if(w<=maxLength){  
     return name;  
 }  
 return nameSub;  
}