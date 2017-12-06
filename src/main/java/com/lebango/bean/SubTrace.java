package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class SubTrace implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5393919490786285210L;
	
	private int id;
	
	private String name;
	
	private int parent_trace;
	
	private Float seat_7s;
	
	private Float seat_14s;
	
	private Float seat_21s;
	
	private Float seat_25s;
	
	private Float seat_33s;
	
	private Float seat_45s;
	
	private Float seat_55s;
	
	private String description;
	
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

	public int getParent_trace() {
		return parent_trace;
	}

	public void setParent_trace(int parent_trace) {
		this.parent_trace = parent_trace;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getSeat_7s() {
		return seat_7s;
	}

	public void setSeat_7s(Float seat_7s) {
		this.seat_7s = seat_7s;
	}

	public Float getSeat_14s() {
		return seat_14s;
	}

	public void setSeat_14s(Float seat_14s) {
		this.seat_14s = seat_14s;
	}

	public Float getSeat_21s() {
		return seat_21s;
	}

	public void setSeat_21s(Float seat_21s) {
		this.seat_21s = seat_21s;
	}

	public Float getSeat_25s() {
		return seat_25s;
	}

	public void setSeat_25s(Float seat_25s) {
		this.seat_25s = seat_25s;
	}

	public Float getSeat_33s() {
		return seat_33s;
	}

	public void setSeat_33s(Float seat_33s) {
		this.seat_33s = seat_33s;
	}

	public Float getSeat_45s() {
		return seat_45s;
	}

	public void setSeat_45s(Float seat_45s) {
		this.seat_45s = seat_45s;
	}

	public Float getSeat_55s() {
		return seat_55s;
	}

	public void setSeat_55s(Float seat_55s) {
		this.seat_55s = seat_55s;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
