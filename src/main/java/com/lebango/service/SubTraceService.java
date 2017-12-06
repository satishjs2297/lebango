package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.SubTrace;
import com.lebango.mapper.SubTraceMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class SubTraceService {

	@Autowired
	private SubTraceMapper subTraceMapper;
	
	public List<SubTrace> getByParentId(int parent_trace) {
		return subTraceMapper.getByParentId(parent_trace);
	}
	
	public List<SubTrace> getBySupplierId(int supplier_id) {
		return subTraceMapper.getBySupplierId(supplier_id);
	}
	
	public SubTrace getById(int subtrace_id) {
		return subTraceMapper.getById(subtrace_id);
	}
	
	public void insert(SubTrace subTrace) {
		subTraceMapper.insert(subTrace);
	}
	
	public void update(SubTrace subTrace) {
		subTraceMapper.update(subTrace);
	}

	public void delete(SubTrace subTrace) {
		subTraceMapper.delete(subTrace);
	}
}
