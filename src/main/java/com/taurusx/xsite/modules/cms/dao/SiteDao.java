
package com.taurusx.xsite.modules.cms.dao;

import com.taurusx.xsite.common.persistence.CrudDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.cms.entity.Site;

/**
 * 站点DAO接口
 * @author ThinkGem
 * @version 2013-8-23
 */
@MyBatisDao
public interface SiteDao extends CrudDao<Site> {
    
    public int deleteSiteUser(Site site);

    public int insertSiteUser(Site site);
    
    public int disableSiteUser(String userId);
    
    public int enableSiteUser(String siteaId, String userId);

}
