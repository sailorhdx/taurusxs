
package com.taurusx.xsite.modules.sys.dao;

import java.util.List;

import com.taurusx.xsite.common.persistence.TreeDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends TreeDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
