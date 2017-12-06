package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Guide;

public interface GuideMapper {
	void insert(Guide guide);
	List<Guide> getBySupplier(int supplier_id);
	Guide getById(int guide_id);
}
