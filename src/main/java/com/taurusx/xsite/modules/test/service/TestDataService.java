
package com.taurusx.xsite.modules.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taurusx.xsite.common.persistence.Page;
import com.taurusx.xsite.common.service.CrudService;
import com.taurusx.xsite.modules.test.dao.TestDataDao;
import com.taurusx.xsite.modules.test.entity.TestData;

/**
 * 单表生成Service
 * @author TaurusX
 * @version 2017-04-12
 */
@Service
@Transactional(readOnly = true)
public class TestDataService extends CrudService<TestDataDao, TestData> {

	public TestData get(String id) {
		return super.get(id);
	}
	
	public List<TestData> findList(TestData testData) {
		return super.findList(testData);
	}
	
	public Page<TestData> findPage(Page<TestData> page, TestData testData) {
		return super.findPage(page, testData);
	}
	
	@Transactional(readOnly = false)
	public void save(TestData testData) {
		super.save(testData);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestData testData) {
		super.delete(testData);
	}
	
}