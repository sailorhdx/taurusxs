
package com.taurusx.xsite.modules.test.dao;

import com.taurusx.xsite.common.persistence.CrudDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.test.entity.TestDataChild;

/**
 * 主子表生成DAO接口
 * @author TaurusX
 * @version 2017-04-12
 */
@MyBatisDao
public interface TestDataChildDao extends CrudDao<TestDataChild> {
	
}