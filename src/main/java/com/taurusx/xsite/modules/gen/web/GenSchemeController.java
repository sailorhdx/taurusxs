
package com.taurusx.xsite.modules.gen.web;

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

import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.utils.StringUtils;
import com.taurusx.xsite.common.web.BaseController;
import com.taurusx.xsite.modules.gen.entity.GenScheme;
import com.taurusx.xsite.modules.gen.service.GenSchemeService;
import com.taurusx.xsite.modules.gen.service.GenTableService;
import com.taurusx.xsite.modules.gen.utils.GenUtils;
import com.taurusx.xsite.modules.sys.entity.User;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * 生成方案Controller
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genScheme")
public class GenSchemeController extends BaseController {

	@Autowired
	private GenSchemeService genSchemeService;
	
	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public GenScheme get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genSchemeService.get(id);
		}else{
			return new GenScheme();
		}
	}
	
	@RequiresPermissions("gen:genScheme:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response, Model model) {
		//User user = UserUtils.getUser();
		//if (!user.isAdmin()){
		//	genScheme.setCreateBy(user);
		//}
        //Page<GenScheme> page = genSchemeService.find(new Page<GenScheme>(request, response), genScheme); 
        //model.addAttribute("page", page);
		
		return "modules/gen/genSchemeList";
	}
	
	@ResponseBody
	@RequiresPermissions("gen:genScheme:view")
	@RequestMapping(value = {"pageData"})
	public Page<GenScheme> pageData(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response, Model model) {
	    User user = UserUtils.getUser();
	    if (!user.isAdmin()){
	        genScheme.setCreateBy(user);
	    }
	    return genSchemeService.find(new Page<GenScheme>(request, response), genScheme); 
	}

	@RequiresPermissions("gen:genScheme:view")
	@RequestMapping(value = "form")
	public String form(GenScheme genScheme, Model model) {
		if (StringUtils.isBlank(genScheme.getPackageName())){
			genScheme.setPackageName("com.taurusx.xsite.modules");
		}
//		if (StringUtils.isBlank(genScheme.getFunctionAuthor())){
//			genScheme.setFunctionAuthor(UserUtils.getUser().getName());
//		}
		model.addAttribute("genScheme", genScheme);
		model.addAttribute("config", GenUtils.getConfig());
		model.addAttribute("tableList", genTableService.findAll());
		return "modules/gen/genSchemeForm";
	}

	@RequiresPermissions("gen:genScheme:edit")
	@RequestMapping(value = "save")
	public String save(GenScheme genScheme, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genScheme)){
			return form(genScheme, model);
		}
		
		String result = genSchemeService.save(genScheme);
		addMessage(redirectAttributes, "操作生成方案'" + genScheme.getName() + "'成功<br/>"+result);
		return "redirect:" + adminPath + "/gen/genScheme/?repage";
	}
	
	@ResponseBody
	@RequiresPermissions("gen:genScheme:edit")
	@RequestMapping(value = "delete")
	public Map<String,?> delete(GenScheme genScheme, RedirectAttributes redirectAttributes) {
		genSchemeService.delete(genScheme);
		addMessage(redirectAttributes, "删除生成方案成功");
		//return "redirect:" + adminPath + "/gen/genScheme/?repage";
		return redirectAttributes.getFlashAttributes();
	}

}
