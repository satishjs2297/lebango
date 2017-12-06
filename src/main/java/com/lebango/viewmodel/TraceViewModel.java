package com.lebango.viewmodel;

public class TraceViewModel {
	
	private int trace_id;
	
	private String start_location;
	
	private String end_location;
	
	public int getTrace_id() {
		return trace_id;
	}
	public void setTrace_id(int trace_id) {
		this.trace_id = trace_id;
	}
	
	public String getStart_location() {
		return start_location;
	}
	public void setStart_location(String start_location) {
		this.start_location = start_location;
	}
	
	public String getEnd_location() {
		return end_location;
	}
	public void setEnd_location(String end_location) {
		this.end_location = end_location;
	}
}
