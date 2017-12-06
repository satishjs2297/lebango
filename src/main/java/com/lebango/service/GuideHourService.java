package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.GuideHour;
import com.lebango.mapper.GuideHourMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class GuideHourService {
	
	@Autowired
	private GuideHourMapper guideHourMapper;
	
	public List<GuideHour> getGuideHour(int guide_id) {
		return guideHourMapper.getGuideHour(guide_id);
	}
	
	public void insert(GuideHour guidehour) {
		guideHourMapper.insert(guidehour);
		return;
	}
	
	public void update(GuideHour guidehour) {
		guideHourMapper.update(guidehour);
		return;
	}
	
	public void delete(GuideHour guidehour) {
		guideHourMapper.delete(guidehour);
		return;
	}
}
