package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Trace;
import com.lebango.mapper.TraceMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class TraceService {
	
	@Autowired
	private TraceMapper traceMapper;
	
	public List<Trace> getAll() {
		return traceMapper.getAll();
	}
	
	public List<Trace> getBySupplier(int supplier_id) {
		return traceMapper.getBySupplier(supplier_id);
	}
	
	public int checkExisting(Trace trace) {
		return traceMapper.checkExisting(trace);
	}

	public void insert(Trace trace) {
		traceMapper.insert(trace);
		return;
	}

	public List<Trace> getByStart(int start_location) {
		return traceMapper.getByStart(start_location);
	}

	public List<Trace> getByEnd(int end_location) {
		return traceMapper.getByEnd(end_location);
	}
	
	public Trace getByStartAndEnd(Trace trace) {
		return traceMapper.getByStartAndEnd(trace);
	}
}
