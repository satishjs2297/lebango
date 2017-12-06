package com.lebango.viewmodel;

public class OrderItem {
	
	private int car_id;
	
	private String car_name;
	
	private int car_seat;
	
	private int guide_id;
	
	private String guide_name;	

	public int getCar_id() {
		return car_id;
	}

	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public int getCar_seat() {
		return car_seat;
	}

	public void setCar_seat(int car_seat) {
		this.car_seat = car_seat;
	}

	public int getGuide_id() {
		return guide_id;
	}

	public void setGuide_id(int guide_id) {
		this.guide_id = guide_id;
	}

	public String getGuide_name() {
		return guide_name;
	}

	public void setGuide_name(String guide_name) {
		this.guide_name = guide_name;
	}
	
}
