/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	// The configuration options below are needed when running CKEditor from source files.
	config.font_names = '宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ 
	 	'Arial/Arial, Helvetica, sans-serif;' +
		'Comic Sans MS/Comic Sans MS, cursive;' +
		'Courier New/Courier New, Courier, monospace;' +
		'Georgia/Georgia, serif;' +
		'Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;' +
		'Tahoma/Tahoma, Geneva, sans-serif;' +
		'Times New Roman/Times New Roman, Times, serif;' +
		'Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;' +
		'Verdana/Verdana, Geneva, sans-serif';
	    
    config.toolbarCanCollapse = true;  //工具栏是否可以被收缩  
    config.toolbarStartupExpanded = false;  //工具栏默认是否展开  
    config.autoUpdateElement = true;  // 当提交包含有此编辑器的表单时，是否自动更新元素内的数据
    
	config.filebrowserBrowseUrl = config.ckfinderPath+'/ckfinder.html?type=Files&start=Files:'+config.ckfinderUploadPath;
	config.filebrowserImageBrowseUrl = config.ckfinderPath+'/ckfinder.html?type=Images&start=Images:'+config.ckfinderUploadPath;
	config.filebrowserFlashBrowseUrl = config.ckfinderPath+'/ckfinder.html?type=Flash&start=Flash:'+config.ckfinderUploadPath;
	config.filebrowserUploadUrl = config.ckfinderPath+'/core/connector/java/connector.java?command=QuickUpload&type=Files&currentFolder='+config.ckfinderUploadPath;
	config.filebrowserImageUploadUrl = config.ckfinderPath+'/core/connector/java/connector.java?command=QuickUpload&type=Images&currentFolder='+config.ckfinderUploadPath;
	config.filebrowserFlashUploadUrl = config.ckfinderPath+'/core/connector/java/connector.java?command=QuickUpload&type=Flash&currentFolder='+config.ckfinderUploadPath;
	config.filebrowserWindowWidth = '1000';
	config.filebrowserWindowHeight = '700';	
};
