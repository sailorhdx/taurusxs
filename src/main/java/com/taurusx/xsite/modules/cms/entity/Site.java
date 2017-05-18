
package com.taurusx.xsite.modules.cms.entity;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;
import com.taurusx.xsite.common.persistence.DataEntity;
import com.taurusx.xsite.modules.cms.utils.CmsUtils;
import com.taurusx.xsite.modules.sys.entity.User;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * 站点Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class Site extends DataEntity<Site> {
	
	private static final long serialVersionUID = 1L;
	private String name;	// 站点名称
	private String title;	// 站点标题
	private String logo;	// 站点logo
	private String description;// 描述，填写有助于搜索引擎优化
	private String keywords;// 关键字，填写有助于搜索引擎优化
	private String theme;	// 主题
	private String copyright;// 版权信息
	private String customIndexView;// 自定义首页视图文件
	private String domain;
	private String isDefault; //是否默认站点

	private List<User> userList = Lists.newArrayList();    // 站点管理用户列表
	
	public Site() {
		super();
	}
	
	public Site(String id){
		this();
		this.id = id;
	}

	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=1, max=100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Length(min=0, max=255)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Length(min=0, max=255)
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	@Length(min=1, max=255)
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	public String getCustomIndexView() {
		return customIndexView;
	}

	public void setCustomIndexView(String customIndexView) {
		this.customIndexView = customIndexView;
	}

	/**
	 * 获取默认站点ID
	 */
	public static String defaultSiteId(){
	    
	    //if (UserUtils.getUser().isAdmin()) {
	    //    return "1";    
	    //} else {
	        Site site = CmsUtils.getDefaultSite();
	        return site.getId();
	    //}
		
	}
	
	/**
	 * 判断是否为默认（主站）站点
	 */
	public static boolean isDefault(String id){
		return id != null && id.equals(defaultSiteId());
	}
	
	/**
	 * 获取当前编辑的站点编号
	 */
	public static String getCurrentSiteId(){
		String siteId = (String)UserUtils.getCache("siteId");
		return StringUtils.isNotBlank(siteId)?siteId:defaultSiteId();
	}

    /**
   	 * 模板路径
   	 */
   	public static final String TPL_BASE = "/WEB-INF/views/modules/cms/front/themes";

    /**
   	 * 获得模板方案路径。如：/WEB-INF/views/modules/cms/front/themes/basic
   	 *
   	 * @return
   	 */
   	public String getSolutionPath() {
   		return TPL_BASE + "/" + getTheme();
   	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	
    public String getUserIds() {
        return StringUtils.join(getUserIdList(), ",");
    }

    public String getUserNames() {
        return StringUtils.join(getUserNameList(), ",");
    }
    
    public void setUserIds(String userIds) {
        userList = Lists.newArrayList();
        if (userIds != null){
            String[] ids = StringUtils.split(userIds, ",");
            setUserIdList(Lists.newArrayList(ids));
        }
    }
    
    public List<String> getUserIdList() {
        List<String> userIdList = Lists.newArrayList();
        for (User user : userList) {
            userIdList.add(user.getId());
        }
        return userIdList;
    }

    public List<String> getUserNameList() {
        List<String> userNameList = Lists.newArrayList();
        for (User user : userList) {
            userNameList.add(user.getName());
        }
        return userNameList;
    }
    
    public void setUserIdList(List<String> userIdList) {
        userList = Lists.newArrayList();
        for (String userId : userIdList) {
            User user = new User();
            user.setId(userId);
            userList.add(user);
        }
    }
    
    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }
}