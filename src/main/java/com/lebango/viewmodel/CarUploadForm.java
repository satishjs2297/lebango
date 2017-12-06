package com.lebango.viewmodel;

import org.springframework.web.multipart.MultipartFile;

public class CarUploadForm {
	
	private String number;
	
	private String brand;
	
	private String model;
	
	private String product_year;
	
	private int seat;
	
	private int location_id;
	
	private MultipartFile car_front_image;
	
	private MultipartFile car_inner_image;
	
	private MultipartFile car_back_image;
	
	private MultipartFile car_body_image;
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getProduct_year() {
		return product_year;
	}

	public void setProduct_year(String product_year) {
		this.product_year = product_year;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public int getLocation_id() {
		return location_id;
	}

	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}

	public MultipartFile getCar_front_image() {
		return car_front_image;
	}

	public void setCar_front_image(MultipartFile car_front_image) {
		this.car_front_image = car_front_image;
	}

	public MultipartFile getCar_inner_image() {
		return car_inner_image;
	}

	public void setCar_inner_image(MultipartFile car_inner_image) {
		this.car_inner_image = car_inner_image;
	}

	public MultipartFile getCar_back_image() {
		return car_back_image;
	}

	public void setCar_back_image(MultipartFile car_back_image) {
		this.car_back_image = car_back_image;
	}

	public MultipartFile getCar_body_image() {
		return car_body_image;
	}

	public void setCar_body_image(MultipartFile car_body_image) {
		this.car_body_image = car_body_image;
	}
}
