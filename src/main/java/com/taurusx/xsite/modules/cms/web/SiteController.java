
package com.taurusx.xsite.modules.cms.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.taurusx.xsite.common.config.Global;
import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.utils.CookieUtils;
import com.taurusx.xsite.common.utils.StringUtils;
import com.taurusx.xsite.common.web.BaseController;
import com.taurusx.xsite.modules.cms.entity.Site;
import com.taurusx.xsite.modules.cms.service.SiteService;
import com.taurusx.xsite.modules.sys.service.OfficeService;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * 站点Controller
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/site")
public class SiteController extends BaseController {

	@Autowired
	private SiteService siteService;
	
	@Autowired
	private OfficeService officeService;
	   
	@ModelAttribute
	public Site get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return siteService.get(id);
		}else{
			return new Site();
		}
	}
	
	@RequiresPermissions("cms:site:view")
	@RequestMapping(value = {"list", ""})
	public String list(Site site, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Site> page = siteService.findPage(new Page<Site>(request, response), site); 
        model.addAttribute("page", page);
		return "modules/cms/siteList";
	}
	
	@ResponseBody
	@RequiresPermissions("cms:site:view")
    @RequestMapping(value = {"pageData"})
    public Page<Site> pageData(Site site, HttpServletRequest request, HttpServletResponse response, Model model) {
        return siteService.findPage(new Page<Site>(request, response), site); 
    }


	@RequiresPermissions("cms:site:view")
	@RequestMapping(value = "form")
	public String form(Site site, Model model) {
		model.addAttribute("site", site);
		model.addAttribute("userList", officeService.findAll());
		return "modules/cms/siteForm";
	}

	@RequiresPermissions("cms:site:edit")
	@RequestMapping(value = "save")
	public String save(Site site, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/cms/site/?repage";
		}
		if (!beanValidator(model, site)){
			return form(site, model);
		}
		siteService.save(site);
		addMessage(redirectAttributes, "保存站点'" + site.getName() + "'成功");
		return "redirect:" + adminPath + "/cms/site/?repage";
	}
	
	@ResponseBody
	@RequiresPermissions("cms:site:edit")
	@RequestMapping(value = "delete")
	public Map<String,?> delete(Site site, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			//return "redirect:" + adminPath + "/cms/site/?repage";
			return redirectAttributes.getFlashAttributes();
		}
		if (Site.isDefault(site.getId())){
			addMessage(redirectAttributes, "删除站点失败, 不允许删除默认站点");
		}else{
			siteService.delete(site);
			addMessage(redirectAttributes, 
			        (site.getDelFlag().equals(Site.DEL_FLAG_DELETE) ? "删除" : "恢复")  +"站点成功");
		}
		//return "redirect:" + adminPath + "/cms/site/?repage";
		return redirectAttributes.getFlashAttributes();
	}
	
	/**
	 * 选择站点
	 * @param id
	 * @return
	 */
	@RequiresPermissions("cms:site:select")
	@RequestMapping(value = "select")
	public String select(String id, boolean flag, HttpServletResponse response){
		if (id!=null){
			UserUtils.putCache("siteId", id);
			siteService.updateSiteUser(id);
			// 保存到Cookie中，下次登录后自动切换到该站点
			CookieUtils.setCookie(response, "siteId", id);
		}
		if (flag){
			return "redirect:" + adminPath;
		}
		return "modules/cms/siteSelect";
	}
}
