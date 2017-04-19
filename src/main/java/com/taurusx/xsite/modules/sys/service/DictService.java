
package com.taurusx.xsite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taurusx.xsite.common.service.TreeService;
import com.taurusx.xsite.common.utils.CacheUtils;
import com.taurusx.xsite.modules.sys.dao.DictDao;
import com.taurusx.xsite.modules.sys.entity.Dict;
import com.taurusx.xsite.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends TreeService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	/**
     * 查询字段类型列表
     * @return
     */
    public List<Dict> findAll(){
        return dao.findAllList(new Dict());
    }
    
	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	public Dict getDict(String id) {
        return super.get(id);
    }
}
