package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Tour implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 255859955018233026L;
	
	private int id;
	
	private String tour_code;
	
	private int booking_id;
	
	private int supplier_id;
	
	private int agent_id;
	
	private String assign_car_array;
	
	private String assign_guide_array;
	
	private int status;
	
	private String description;	
	
	private int invoice_created;
	
	private String agent_review_content;
	
	private int agent_review_star;
	
	private String supplier_review_content;
	
	private int supplier_review_star;
	
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

	public String getTour_code() {
		return tour_code;
	}

	public void setTour_code(String tour_code) {
		this.tour_code = tour_code;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}

	public int getAgent_id() {
		return agent_id;
	}

	public void setAgent_id(int agent_id) {
		this.agent_id = agent_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getInvoice_created() {
		return invoice_created;
	}

	public void setInvoice_created(int invoice_created) {
		this.invoice_created = invoice_created;
	}

	public String getAgent_review_content() {
		return agent_review_content;
	}

	public void setAgent_review_content(String agent_review_content) {
		this.agent_review_content = agent_review_content;
	}

	public int getAgent_review_star() {
		return agent_review_star;
	}

	public void setAgent_review_star(int agent_review_star) {
		this.agent_review_star = agent_review_star;
	}

	public String getSupplier_review_content() {
		return supplier_review_content;
	}

	public void setSupplier_review_content(String supplier_review_content) {
		this.supplier_review_content = supplier_review_content;
	}

	public int getSupplier_review_star() {
		return supplier_review_star;
	}

	public void setSupplier_review_star(int supplier_review_star) {
		this.supplier_review_star = supplier_review_star;
	}

	public String getAssign_car_array() {
		return assign_car_array;
	}

	public void setAssign_car_array(String assign_car_array) {
		this.assign_car_array = assign_car_array;
	}

	public String getAssign_guide_array() {
		return assign_guide_array;
	}

	public void setAssign_guide_array(String assign_guide_array) {
		this.assign_guide_array = assign_guide_array;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
