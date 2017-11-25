
package com.taurusx.xsite.modules.sys.utils;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.taurusx.xsite.common.mapper.JsonMapper;
import com.taurusx.xsite.common.utils.CacheUtils;
import com.taurusx.xsite.common.utils.SpringContextHolder;
import com.taurusx.xsite.modules.sys.dao.DictDao;
import com.taurusx.xsite.modules.sys.entity.Dict;

/**
 * 字典工具类
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
public class DictUtils {

	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);

	public static final String CACHE_DICT_MAP = "dictMap";

	public static String getDictLabel(String value, String type, String defaultValue) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
			for (Dict dict : getDictList(type)) {
				if (type.equalsIgnoreCase(dict.getType()) && value.equalsIgnoreCase(dict.getValue())) {
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}

	public static String getDictLabelById(String id, String type, String defaultValue) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(id)) {
			for (Dict dict : getDictList(type)) {
				if (type.equalsIgnoreCase(dict.getType()) && id.equalsIgnoreCase(dict.getId())) {
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}

	public static String getDictLabels(String values, String type, String defaultValue) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)) {
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")) {
				valueList.add(getDictLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}

	public static String getDictId(String label, String type, String defaultLabel) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)) {
			for (Dict dict : getDictList(type)) {
				if (type.equalsIgnoreCase(dict.getType()) && label.trim().equalsIgnoreCase(dict.getLabel())) {
					return dict.getId();
				}
			}
		}
		return defaultLabel;
	}

	public static String getDictValue(String label, String type, String defaultLabel) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)) {
			for (Dict dict : getDictList(type)) {
				if (type.equalsIgnoreCase(dict.getType()) && label.trim().equalsIgnoreCase(dict.getLabel())) {
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}

	public static List<Dict> getDictList(String type) {
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			for (Dict dict : dictDao.findAllList(new Dict())) {
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null) {
			dictList = Lists.newArrayList();
		}
		return dictList;
	}

	/**
	 * 返回字典列表（JSON）
	 * 
	 * @param type
	 * @return
	 */
	public static String getDictListJson(String type) {
		return JsonMapper.toJsonString(getDictList(type));
	}

	public static List<Dict> getDictListByParent(String type, String parentId) {
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			for (Dict dict : dictDao.findAllList(new Dict())) {
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<Dict> resultDictList = Lists.newArrayList();
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null) {
			dictList = Lists.newArrayList();
		} else {
			for (Dict dict : dictList) {
				if (dict.getParentId().equals(parentId)) {
					resultDictList.add(dict);
				}
			}
		}
		return resultDictList;
	}
}
