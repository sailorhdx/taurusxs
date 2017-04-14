
package com.taurusx.xsite.modules.cms.web;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taurusx.xsite.common.web.BaseController;
import com.taurusx.xsite.modules.cms.entity.Category;
import com.taurusx.xsite.modules.cms.service.StatsService;

/**
 * 统计Controller
 * @author ThinkGem
 * @version 2013-5-21
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/stats")
public class StatsController extends BaseController {

	@Autowired
	private StatsService statsService;
	
	/**
	 * 文章信息量
	 * @param paramMap
	 * @param model
	 * @return
	 */
	@RequiresPermissions("cms:stats:article")
	@RequestMapping(value = "article")
	public String article(@RequestParam Map<String, Object> paramMap, Model model) {
		List<Category> list = statsService.article(paramMap);
		model.addAttribute("list", list);
		model.addAttribute("paramMap", paramMap);
		return "modules/cms/statsArticle";
	}

	/**
     * 文章信息量
     * @param paramMap
     * @param model
     * @return
     */
	@ResponseBody
    @RequiresPermissions("cms:stats:article")
    @RequestMapping(value = "article/listData")
    public List<Category> articleListData(@RequestParam Map<String, Object> paramMap, Model model) {
        return statsService.article(paramMap);
    }
}
