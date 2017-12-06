package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Trace;

public interface TraceMapper {

	public List<Trace> getAll();
	public List<Trace> getBySupplier(int supplier_id);
	public int checkExisting(Trace trace);
	public void insert(Trace trace);
	public List<Trace> getByStart(int start_location);
	public List<Trace> getByEnd(int end_location);
	public Trace getByStartAndEnd(Trace trace);
	
}
