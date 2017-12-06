package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.SubTrace;

public interface SubTraceMapper {
	List<SubTrace> getByParentId(int parent_trace);
	
	void insert(SubTrace subTrace);
	
	void update(SubTrace subTrace);
	
	void delete(SubTrace subTrace);
	
	List<SubTrace> getBySupplierId(int supplier_id);

	SubTrace getById(int subtrace_id);
}
