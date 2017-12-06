package com.lebango.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5897880006363333311L;
	
	private int id;
	@NotNull
	private String firstname;
	@NotNull
	private String lastname;
	@NotNull
	private String company_name;
	@NotNull @Email
	private String email;
	@NotNull
	private String phone;
	@NotNull @Size(min=6,max=12,message="{user.password.size}")
	private String password;
	@NotNull
	private int type;
	@NotNull
	private String photo;
	@NotNull
	private String description;
	@NotNull
	private int is_approved;
	@NotNull
	private String remember_token;
	
	private Timestamp created_at;
	private Timestamp updated_at;
	private Timestamp deleted_at;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIs_approved() {
		return is_approved;
	}

	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}

	public String getRemember_token() {
		return remember_token;
	}

	public void setRemember_token(String remember_token) {
		this.remember_token = remember_token;
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
	
	@Override
	public String toString() {
		return "user{" + "id=" + id + ", name=" + firstname + ", lastname=" + lastname + ", company_name=" + company_name
				+ ", email=" + email + ", phone=" + phone + ", password=" + password + ", type=" + type
				+ ", photo=" + photo + ", description=" + description
				+ ", is_approved=" + is_approved + ", remember_token=" + remember_token + ", deleted_at=" + deleted_at
				+ ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
	}

	public User() {
	}

	public User(String firstname, String lastname, String company_name, String email, String phone, String password,
			int type, String contactperson, String photo, String description, int is_approved,
			String remember_token, Timestamp deleted_at, Timestamp created_at, Timestamp updated_at) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.company_name = company_name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.type = type;
		this.photo = photo;
		this.description = description;
		this.is_approved = is_approved;
		this.remember_token = remember_token;
		
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}
}
