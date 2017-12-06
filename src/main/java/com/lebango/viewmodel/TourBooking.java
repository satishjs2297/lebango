package com.lebango.viewmodel;

import java.util.List;

public class TourBooking {
	
	private String tour_code;
	
	private int tour_id;
	
	private int booking_id;
	
	private int agent_id;
	
	private int supplier_id;
	
	private String state;
	
	private String trace;
	
	private String start_date;
	
	private String end_date;
	
	private String contact_person;
	
	private String special_request;
	
	private int visitor_count;
	
	private int child_count;
	
	private List<String> sub_trace_array;
	
	private List<String> request_car_array;
	
	private List<String> request_guide_array;
	
	private List<String> assign_car_array;
	
	private List<String> assign_guide_array;
	
	private Float total_amount;
	
	private String book_status_name;
	
	private int book_status;
	
	private String tour_status_name;
	
	private int tour_status;

	public String getTour_code() {
		return tour_code;
	}

	public void setTour_code(String tour_code) {
		this.tour_code = tour_code;
	}

	public int getTour_id() {
		return tour_id;
	}

	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getAgent_id() {
		return agent_id;
	}

	public void setAgent_id(int agent_id) {
		this.agent_id = agent_id;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTrace() {
		return trace;
	}

	public void setTrace(String trace) {
		this.trace = trace;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getContact_person() {
		return contact_person;
	}

	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}

	public String getSpecial_request() {
		return special_request;
	}

	public void setSpecial_request(String special_request) {
		this.special_request = special_request;
	}

	public int getVisitor_count() {
		return visitor_count;
	}

	public void setVisitor_count(int visitor_count) {
		this.visitor_count = visitor_count;
	}

	public int getChild_count() {
		return child_count;
	}

	public void setChild_count(int child_count) {
		this.child_count = child_count;
	}

	public List<String> getSub_trace_array() {
		return sub_trace_array;
	}

	public void setSub_trace_array(List<String> sub_trace_array) {
		this.sub_trace_array = sub_trace_array;
	}

	public List<String> getRequest_car_array() {
		return request_car_array;
	}

	public void setRequest_car_array(List<String> request_car_array) {
		this.request_car_array = request_car_array;
	}

	public List<String> getRequest_guide_array() {
		return request_guide_array;
	}

	public void setRequest_guide_array(List<String> request_guide_array) {
		this.request_guide_array = request_guide_array;
	}

	public List<String> getAssign_car_array() {
		return assign_car_array;
	}

	public void setAssign_car_array(List<String> assign_car_array) {
		this.assign_car_array = assign_car_array;
	}

	public List<String> getAssign_guide_array() {
		return assign_guide_array;
	}

	public void setAssign_guide_array(List<String> assign_guide_array) {
		this.assign_guide_array = assign_guide_array;
	}

	public Float getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Float total_amount) {
		this.total_amount = total_amount;
	}

	public int getTour_status() {
		return tour_status;
	}

	public void setTour_status(int tour_status) {
		this.tour_status = tour_status;
	}

	public String getTour_status_name() {
		return tour_status_name;
	}

	public void setTour_status_name(String tour_status_name) {
		this.tour_status_name = tour_status_name;
	}

	public String getBook_status_name() {
		return book_status_name;
	}

	public void setBook_status_name(String book_status_name) {
		this.book_status_name = book_status_name;
	}

	public int getBook_status() {
		return book_status;
	}

	public void setBook_status(int book_status) {
		this.book_status = book_status;
	}
}
