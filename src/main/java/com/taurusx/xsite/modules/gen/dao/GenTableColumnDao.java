
package com.taurusx.xsite.modules.gen.dao;

import com.taurusx.xsite.common.persistence.CrudDao;
import com.taurusx.xsite.common.persistence.annotation.MyBatisDao;
import com.taurusx.xsite.modules.gen.entity.GenTableColumn;

/**
 * 业务表字段DAO接口
 * @author ThinkGem
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	
	public void deleteByGenTableId(String genTableId);
}
