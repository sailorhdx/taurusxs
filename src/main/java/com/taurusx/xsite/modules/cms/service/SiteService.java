
package com.taurusx.xsite.modules.cms.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.service.CrudService;
import com.taurusx.xsite.modules.cms.dao.SiteDao;
import com.taurusx.xsite.modules.cms.entity.Site;
import com.taurusx.xsite.modules.cms.utils.CmsUtils;
import com.taurusx.xsite.modules.sys.entity.User;
import com.taurusx.xsite.modules.sys.utils.UserUtils;

/**
 * 站点Service
 * @author ThinkGem
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class SiteService extends CrudService<SiteDao, Site> {

    @Autowired
    private SiteDao siteDao;
    
	public Page<Site> findPage(Page<Site> page, Site site) {
//		DetachedCriteria dc = siteDao.createDetachedCriteria();
//		if (StringUtils.isNotEmpty(site.getName())){
//			dc.add(Restrictions.like("name", "%"+site.getName()+"%"));
//		}
//		dc.add(Restrictions.eq(Site.FIELD_DEL_FLAG, site.getDelFlag()));
//		//dc.addOrder(Order.asc("id"));
//		return siteDao.find(page, dc);
		site.getSqlMap().put("dsf", dataScopeFilter(site.getCurrentUser(), "o", "u"));
		
		// 如果当前用户不是超级管理员，则按用户ID过滤读取站点列表
		User user = UserUtils.getUser();
		if (!user.isAdmin()) {
		    site.getSqlMap().put("dsf", " AND su.user_id = '" + user.getId() + "'");
		}
		
		return super.findPage(page, site);
	}

	@Transactional(readOnly = false)
	public void save(Site site) {
		if (site.getCopyright()!=null){
			site.setCopyright(StringEscapeUtils.unescapeHtml4(site.getCopyright()));
		}
		siteDao.deleteSiteUser(site);
		if (site.getUserList().size() > 0) {
		    siteDao.insertSiteUser(site);
		    for (int i = 0; i < site.getUserIdList().size(); i++) {
		        String userId = site.getUserIdList().get(i);
		        siteDao.disableSiteUser(userId);
		        siteDao.enableSiteUser(site.getId(), userId);
		    }
		   
		}
		
		super.save(site);
		CmsUtils.removeCache("site_"+site.getId());
		CmsUtils.removeCache("siteList");
	}
	
	@Transactional(readOnly = false)
	public void delete(Site site) {
		//siteDao.updateDelFlag(id, isRe!=null&&isRe?Site.DEL_FLAG_NORMAL:Site.DEL_FLAG_DELETE);
		//site.setDelFlag(isRe!=null&&isRe?Site.DEL_FLAG_NORMAL:Site.DEL_FLAG_DELETE);
		super.delete(site);
		//siteDao.delete(id);
		siteDao.deleteSiteUser(site);
		CmsUtils.removeCache("site_"+site.getId());
		CmsUtils.removeCache("siteList");
	}
	
	@Transactional(readOnly = false)
	public void updateSiteUser(String id) {
	    Site site = new Site();
	    site.setIsDefault("1");
	    site.setId(id);
	    User user = UserUtils.getUser();
	    if (!user.isAdmin()) {
	        siteDao.disableSiteUser(user.getId());
	        siteDao.enableSiteUser(site.getId(), user.getId());
	    }
	}
	
	@Transactional(readOnly = true)
    public Site getDefaultSite() {
        Site site = new Site();
        User user = UserUtils.getUser();
        if (!user.isAdmin()) {
            site.getSqlMap().put("dsf", " AND su.user_id = '" + user.getId() + "'");
        }
        List<Site> siteList = siteDao.findList(site);
        for (int i = 0; i < siteList.size(); i++) {
            site = siteList.get(i);
            if ("1".equals(site.getIsDefault())) {
                return site;
            }
        }
        if (siteList.size() > 0) {
            return siteList.get(0);
        }
        return site;
    }
}
