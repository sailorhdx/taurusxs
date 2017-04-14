
package com.taurusx.xsite.modules.sys.dao;

import com.taurusx.xsite.common.persistence.TreeDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
