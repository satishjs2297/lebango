package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Trace implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1952773854108835799L;

	private int id;
	
	private int supplier_id;
	
	private int start_location;
	
	private int end_location;

	private Timestamp created_at;
	
	private Timestamp updated_at;
	
	private Timestamp deleted_at;
	
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}

	public int getStart_location() {
		return start_location;
	}

	public void setStart_location(int start_location) {
		this.start_location = start_location;
	}

	public int getEnd_location() {
		return end_location;
	}

	public void setEnd_location(int end_location) {
		this.end_location = end_location;
	}
}
