package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

public class SupplierRegister implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7159531794844322786L;

	private int id;
	
	private int supplier_id;
	
	private int status;
	
	@NotNull
	private String description;
	
	private int is_resubmit;
	
	private Timestamp created_at;
	
	private Timestamp updated_at;
	
	private Timestamp deleted_at;

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIs_resubmit() {
		return is_resubmit;
	}

	public void setIs_resubmit(int is_resubmit) {
		this.is_resubmit = is_resubmit;
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
}
