
package com.taurusx.xsite.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taurusx.xsite.common.service.CrudService;
import com.taurusx.xsite.modules.cms.dao.ArticleDataDao;
import com.taurusx.xsite.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author ThinkGem
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
