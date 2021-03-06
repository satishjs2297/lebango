package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class ManagerSetting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2340876124069787548L;

	private int id;
	
	private String name;
	
	private String value;
	
	private Timestamp created_at;
	
	private Timestamp updated_at;
	
	private Timestamp deleted_at;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
