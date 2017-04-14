
package com.taurusx.xsite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.web.BaseController;
import com.taurusx.xsite.modules.sys.entity.Log;
import com.taurusx.xsite.modules.sys.service.LogService;

/**
 * 日志Controller
 * @author ThinkGem
 * @version 2013-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
        //Page<Log> page = logService.findPage(new Page<Log>(request, response), log); 
        //model.addAttribute("page", page);
		return "modules/sys/logList";
	}
	
	@ResponseBody
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = {"pageData"})
	public Page<Log> pageData(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
	    return logService.findPage(new Page<Log>(request, response), log); 
	}

}
