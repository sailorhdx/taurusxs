
package com.taurusx.xsite.modules.test.dao;

import com.taurusx.xsite.common.persistence.TreeDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.test.entity.TestTree;

/**
 * 树结构生成DAO接口
 * @author TaurusX
 * @version 2017-04-12
 */
@MyBatisDao
public interface TestTreeDao extends TreeDao<TestTree> {
	
}