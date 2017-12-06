package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3906948763448354895L;

	private int id;
	
	private int sender_id;
	
	private int receiver_id;
	
	private String receiver_mail;
	
	private String title;
	
	private String content;
	
	private int type;
	
	private int refer_id;
	
	private int status;
	
	private int response_id;
	
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

	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public int getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getReceiver_mail() {
		return receiver_mail;
	}

	public void setReceiver_mail(String receiver_mail) {
		this.receiver_mail = receiver_mail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getRefer_id() {
		return refer_id;
	}

	public void setRefer_id(int refer_id) {
		this.refer_id = refer_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getResponse_id() {
		return response_id;
	}

	public void setResponse_id(int response_id) {
		this.response_id = response_id;
	}
	
}
