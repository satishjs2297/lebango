package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Booking implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3825009466127480312L;

	private int id;
	
	private int agent_id;
	
	private int state_id;
	
	private String state_name;
	
	private int trace_id;
	
	private String trace_name;
	
	private String start_date;
	
	private String start_time;
	
	private String end_date;
	
	private String end_time;
	
	private int car_seat;
		
	private String sub_trace_array;
	
	private String request_car_array;
	
	private String request_guide_array;
	
	private Float total_amount;
	
	private int status;
	
	private int description;
	
	private String contact_person;
	
	private String special_request;
	
	private int visitor_count;
	
	private int child_count;
	
	private Timestamp created_at;
	
	private Timestamp updated_at;
	
	private Timestamp deleted_at;

	public int getAgent_id() {
		return agent_id;
	}

	public void setAgent_id(int agent_id) {
		this.agent_id = agent_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getRequest_guide_array() {
		return request_guide_array;
	}

	public void setRequest_guide_array(String request_guide_array) {
		this.request_guide_array = request_guide_array;
	}

	public String getState_name() {
		return state_name;
	}

	public void setState_name(String state_name) {
		this.state_name = state_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	public Timestamp getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(Timestamp deleted_at) {
		this.deleted_at = deleted_at;
	}

	public int getTrace_id() {
		return trace_id;
	}

	public void setTrace_id(int trace_id) {
		this.trace_id = trace_id;
	}

	public String getSub_trace_array() {
		return sub_trace_array;
	}

	public void setSub_trace_array(String sub_trace_array) {
		this.sub_trace_array = sub_trace_array;
	}

	public String getRequest_car_array() {
		return request_car_array;
	}

	public void setRequest_car_array(String request_car_array) {
		this.request_car_array = request_car_array;
	}

	public Float getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Float total_amount) {
		this.total_amount = total_amount;
	}

	public int getDescription() {
		return description;
	}

	public void setDescription(int description) {
		this.description = description;
	}

	public String getContact_person() {
		return contact_person;
	}

	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}

	public String getTrace_name() {
		return trace_name;
	}

	public void setTrace_name(String trace_name) {
		this.trace_name = trace_name;
	}

	public int getState_id() {
		return state_id;
	}

	public void setState_id(int state_id) {
		this.state_id = state_id;
	}

	public int getCar_seat() {
		return car_seat;
	}

	public void setCar_seat(int car_seat) {
		this.car_seat = car_seat;
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
	
}
