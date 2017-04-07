/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.util.Date;
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

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Comment;
import com.thinkgem.jeesite.modules.cms.service.CommentService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 评论Controller
 * 
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    @ModelAttribute
    public Comment get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return commentService.get(id);
        } else {
            return new Comment();
        }
    }

    @RequiresPermissions("cms:comment:view")
    @RequestMapping(value = {"list", ""})
    public String list(Comment comment, HttpServletRequest request,
            HttpServletResponse response, Model model) {
        Page<Comment> page = commentService
                .findPage(new Page<Comment>(request, response), comment);
        model.addAttribute("page", page);
        return "modules/cms/commentList";
    }
    
    @ResponseBody
    @RequiresPermissions("cms:comment:view")
    @RequestMapping(value = {"pageData"})
    public Page<Comment> pageData(Comment comment, HttpServletRequest request,
            HttpServletResponse response, Model model) {
        return commentService
                .findPage(new Page<Comment>(request, response), comment);
    }

    @RequiresPermissions("cms:comment:edit")
    @RequestMapping(value = "save")
    public String save(Comment comment, RedirectAttributes redirectAttributes) {
        if (beanValidator(redirectAttributes, comment)) {
            if (comment.getAuditUser() == null) {
                comment.setAuditUser(UserUtils.getUser());
                comment.setAuditDate(new Date());
            }
            comment.setDelFlag(Comment.DEL_FLAG_NORMAL);
            commentService.save(comment);
            addMessage(redirectAttributes, DictUtils
                    .getDictLabel(comment.getDelFlag(), "cms_del_flag", "保存")
                    + "评论'"
                    + StringUtils.abbr(
                            StringUtils.replaceHtml(comment.getContent()), 50)
                    + "'成功");
        }
        return "redirect:" + adminPath + "/cms/comment/?repage&delFlag=2";
    }

    @ResponseBody
    @RequiresPermissions("cms:comment:edit")
    @RequestMapping(value = "delete")
    public Map<String,?> delete(Comment comment,
            @RequestParam(required = false) Boolean isRe,
            RedirectAttributes redirectAttributes) {
//        comment.setDelFlag(isRe != null && isRe ? Comment.DEL_FLAG_AUDIT
//                : Comment.DEL_FLAG_DELETE);
        commentService.delete(comment);
        addMessage(redirectAttributes,
                (comment.getDelFlag().equals(Comment.DEL_FLAG_DELETE) ? "删除" : (comment.getDelFlag().equals(Comment.DEL_FLAG_AUDIT) ? "恢复审核" : "审核通过")) + "评论成功");
        //return "redirect:" + adminPath + "/cms/comment/?repage&delFlag="
        //        + (isRe != null && isRe ? Comment.DEL_FLAG_AUDIT
        //                : Comment.DEL_FLAG_DELETE);
        return redirectAttributes.getFlashAttributes();
    }

}
