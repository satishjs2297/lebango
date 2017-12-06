package com.lebango.viewmodel;

import org.springframework.web.multipart.MultipartFile;

public class RegisterUploadForm {
	
	private int user_type;
	
	private int user_group;
	
	private String firstname;
	
	private String lastname;
	
	private String company_name;
	
	private String email;
	
	private String phone;
	
	private String password;
	
	private MultipartFile business_register_certificate;
	
	private MultipartFile car_service_company_certificate;
	
	private MultipartFile public_liability;

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
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

	public MultipartFile getBusiness_register_certificate() {
		return business_register_certificate;
	}

	public void setBusiness_register_certificate(MultipartFile business_register_certificate) {
		this.business_register_certificate = business_register_certificate;
	}

	public MultipartFile getCar_service_company_certificate() {
		return car_service_company_certificate;
	}

	public void setCar_service_company_certificate(MultipartFile car_service_company_certificate) {
		this.car_service_company_certificate = car_service_company_certificate;
	}

	public MultipartFile getPublic_liability() {
		return public_liability;
	}

	public void setPublic_liability(MultipartFile public_liability) {
		this.public_liability = public_liability;
	}

	public int getUser_group() {
		return user_group;
	}

	public void setUser_group(int user_group) {
		this.user_group = user_group;
	}
}
