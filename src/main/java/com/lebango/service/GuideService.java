package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Guide;
import com.lebango.mapper.GuideMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class GuideService {

	@Autowired
	private GuideMapper guideMapper;
	
	public void insert(Guide guide) {
		guideMapper.insert(guide);
		return;
	}
	
	public List<Guide> getBySupplier(int supplier_id) {
		return guideMapper.getBySupplier(supplier_id);
	}
	
	public Guide getById(int guide_id) {
		return guideMapper.getById(guide_id);
	}
}
