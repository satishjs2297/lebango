package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.GuideHour;

public interface GuideHourMapper {
	
	List<GuideHour> getGuideHour(int guide_id);
	
	void insert(GuideHour guidehour);
	
	void update(GuideHour guidehour);
	
	void delete(GuideHour guidehour);
}
