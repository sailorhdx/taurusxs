
package com.taurusx.xsite.modules.sys.web;

import java.io.UnsupportedEncodingException;
import java.util.List;
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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.taurusx.xsite.common.config.Global;
import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.utils.StringUtils;
import com.taurusx.xsite.common.web.BaseController;
import com.taurusx.xsite.modules.sys.entity.Dict;
import com.taurusx.xsite.modules.sys.service.DictService;

/**
 * 字典Controller
 * @author ThinkGem
 * @version 2014-05-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dict")
public class DictController extends BaseController {

	@Autowired
	private DictService dictService;
	
	@ModelAttribute
	public Dict get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return dictService.get(id);
		}else{
			return new Dict();
		}
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"list", ""})
	public String list(Dict dict, HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam(required=false) String mode) {
		List<String> typeList = dictService.findTypeList();
		model.addAttribute("typeList", typeList);
		
		if (StringUtils.isBlank(mode)) {
		    mode = "0";
		}
		model.addAttribute("mode", mode);
        //Page<Dict> page = dictService.findPage(new Page<Dict>(request, response), dict); 
        //model.addAttribute("page", page);
		return "modules/sys/dictList";
	}
	
	@ResponseBody
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"pageData"})
	public Page<Dict> pageData(Dict dict, HttpServletRequest request, HttpServletResponse response, Model model) {
	    Page<Dict> page = dictService.findPage(new Page<Dict>(request, response), dict); 
     return page;
    }
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = "form")
	public String form(Dict dict, Model model, @RequestParam(required=false) String mode) {
	    if (dict.getParent()==null||dict.getParent().getId()==null){
	        Dict parent = new Dict("0");
	        parent.setParentIds("0,");
	        dict.setParent(parent);
        } else {
            dict.setParent(dictService.get(dict.getParent().getId()));
        }
		model.addAttribute("dict", dict);
		model.addAttribute("mode", mode);
		return "modules/sys/dictForm";
	}

	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "save")//@Valid 
	public String save(Dict dict, Model model, RedirectAttributes redirectAttributes, @RequestParam(required=false) String mode) {
	    String description = dict.getDescription();
        try {
            description = java.net.URLEncoder.encode(description,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			model.addAttribute("dict", dict);
			return "redirect:" + adminPath + "/sys/dict/?repage&mode=" + mode + "&type="+dict.getType() + "&description=" + dict.getDescription();
		}
		if (!beanValidator(model, dict)){
			return form(dict, model, mode);
		}
		dictService.save(dict);
		addMessage(redirectAttributes, "保存" + dict.getDescription() + " '" + dict.getLabel() + "' 成功");
		return "redirect:" + adminPath + "/sys/dict/?repage&mode=" + mode + "&type=" + dict.getType() + "&description=" + description;
	}
	
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "delete")
	public String delete(Dict dict, RedirectAttributes redirectAttributes, @RequestParam(required=false) String mode) {
	    String description = dict.getDescription();
        try {
            description = java.net.URLEncoder.encode(description,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/dict/?repage&mode=" + mode + "&type="+dict.getType() + "&description=" + description;
		}
		dictService.delete(dict);
		addMessage(redirectAttributes, "删除" + dict.getDescription() + "成功");
		return "redirect:" + adminPath + "/sys/dict/?repage&mode=" + mode + "&type="+dict.getType() + "&description=" + description;
	}
	
	@ResponseBody
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "pageDelete")
	public Map<String, ?> pageDelete(Dict dict, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return redirectAttributes.getFlashAttributes();
        }
        dictService.delete(dict);
        addMessage(redirectAttributes, "删除" + dict.getDescription() + "成功");
        return redirectAttributes.getFlashAttributes();
	}
	   
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String type, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Dict dict = new Dict();
		dict.setType(type);
		List<Dict> list = dictService.findList(dict);
		for (int i=0; i<list.size(); i++){
			Dict e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getParentId());
			map.put("name", StringUtils.replace(e.getLabel(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value = "listData")
	public List<Dict> listData(@RequestParam(required=false) String type) {
		Dict dict = new Dict();
		dict.setType(type);
		return dictService.findList(dict);
	}

}
