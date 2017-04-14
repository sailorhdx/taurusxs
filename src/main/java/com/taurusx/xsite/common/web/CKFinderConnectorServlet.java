
package com.taurusx.xsite.common.web;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ckfinder.connector.ConnectorServlet;
import com.taurusx.xsite.common.config.Global;
import com.taurusx.xsite.common.utils.FileUtils;
import com.taurusx.xsite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * CKFinderConnectorServlet
 * @author ThinkGem
 * @version 2014-06-25
 */
public class CKFinderConnectorServlet extends ConnectorServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, false);
		super.doGet(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, true);
		super.doPost(request, response);
	}
	
	private void prepareGetResponse(final HttpServletRequest request,
			final HttpServletResponse response, final boolean post) throws ServletException {
	    Principal principal = (Principal) UserUtils.getPrincipal();
        if (principal == null){
            return;
        }
        String command = request.getParameter("command");
        String type = request.getParameter("type");
        //showParams(request);
        // 初始化时，如果startupPath文件夹不存在，则自动创建startupPath文件夹
        if ("Init".equals(command)){
            String startupPath = request.getParameter("startupPath");// 当前文件夹可指定为模块名
            if (startupPath!=null){
                String[] ss = startupPath.split(":");
                if (ss.length==2){
                    String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
                            + principal + "/" + ss[0] + ss[1];
                    FileUtils.createDirectory(FileUtils.path(realPath));
                }
            }
        }
        // 快捷上传，自动创建当前文件夹，并上传到该路径
        else if ("QuickUpload".equals(command) && type!=null){
            String currentFolder = request.getParameter("currentFolder");// 当前文件夹可指定为模块名
            String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
                    + principal + "/" + type + (currentFolder != null ? currentFolder : "");
            FileUtils.createDirectory(FileUtils.path(realPath));
        }
//      System.out.println("------------------------");
//      for (Object key : request.getParameterMap().keySet()){
//          System.out.println(key + ": " + request.getParameter(key.toString()));
//      }
	}
	
	private void showParams(HttpServletRequest request) {  
        Map map = new HashMap();  
        Enumeration paramNames = request.getParameterNames();  
        while (paramNames.hasMoreElements()) {  
            String paramName = (String) paramNames.nextElement();  
  
            String[] paramValues = request.getParameterValues(paramName);  
            if (paramValues.length == 1) {  
                String paramValue = paramValues[0];  
                if (paramValue.length() != 0) {  
                    map.put(paramName, paramValue);  
                }  
            }  
        }  
  
        Set<Map.Entry<String, String>> set = map.entrySet();  
        System.out.println("------------------------------------------------------------");  
        for (Map.Entry entry : set) {  
            System.out.println("-------" +entry.getKey() + ":" + entry.getValue()+"-------");  
        }  
        System.out.println("------------------------------------------------------------");  
    }  
}
