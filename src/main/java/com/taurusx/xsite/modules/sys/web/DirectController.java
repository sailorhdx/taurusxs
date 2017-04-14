
package com.taurusx.xsite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.taurusx.xsite.common.web.BaseController;

/**
 * 用户Controller
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/direct")
public class DirectController extends BaseController {

	@RequestMapping(value = {""})
	public String redirect(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
	    String url = request.getParameter("url");
	    url = url.replaceFirst("page://", "/");
		return "modules" + url;
	}
	
    @RequestMapping(value = {"blank"})
    public String blank(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String url = request.getParameter("url");
        if (url.startsWith("direct://")) {
            url = url.replaceFirst("direct://", "/");
        } else if (url.startsWith("page://")) {
            url = adminPath + "/sys/direct?url=" + url.replaceFirst("page://", "/");
        } else if (url.startsWith("http://")) {
            
        } else {
            url = adminPath + url;
        }
        return "redirect:" + url;
    }
	
	@RequestMapping(value = {"iframe"})
    public String iframe(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String url = request.getParameter("url");
        String ctx = request.getSession().getServletContext().getContextPath();
        if (url.startsWith("direct://")) {
            url = ctx + url.replaceFirst("direct://", "/");
        } else if (url.startsWith("page://")) {
            url = ctx + adminPath + "/sys/direct?url=" + url.replaceFirst("page://", "/");
        } else if (url.startsWith("http://")) {
            
        } else {
            url = ctx + adminPath + url;
        }
        model.addAttribute("url", url);
        return "modules/sys/iFrame";
    }
	
}
