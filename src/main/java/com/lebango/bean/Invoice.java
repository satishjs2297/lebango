package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Invoice implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6049818550779406297L;

	private int id;
	
	private String invoice_code;
	
	private int booking_id;
	
	private String tour_code;
	
	private int type;
	
	private int user_id;
	
	private Float amount;
	
	private int status;
	
	private int method;
	
	private String pay_id;
	
	private String content;
	
	private Timestamp pay_due_date;
	
	private Float service_fee;

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

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getMethod() {
		return method;
	}

	public void setMethod(int method) {
		this.method = method;
	}

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public String getTour_code() {
		return tour_code;
	}

	public void setTour_code(String tour_code) {
		this.tour_code = tour_code;
	}

	public Float getService_fee() {
		return service_fee;
	}

	public void setService_fee(Float service_fee) {
		this.service_fee = service_fee;
	}

	public String getInvoice_code() {
		return invoice_code;
	}

	public void setInvoice_code(String invoice_code) {
		this.invoice_code = invoice_code;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Timestamp getPay_due_date() {
		return pay_due_date;
	}

	public void setPay_due_date(Timestamp pay_due_date) {
		this.pay_due_date = pay_due_date;
	}
}
