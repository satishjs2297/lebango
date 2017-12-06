package com.lebango.viewmodel;

import java.util.List;

import com.lebango.bean.Car;
import com.lebango.bean.CarHour;
import com.lebango.bean.Document;
import com.lebango.bean.Location;
import com.lebango.bean.Tour;

public class CarEntity {
	
	private Car car;
	
	private List<Document> photo_array;
	
	private Location location;

	private List<CarHour> carhour_array;
	
	
	
	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public List<Document> getPhoto_array() {
		return photo_array;
	}

	public void setPhoto_array(List<Document> photo_array) {
		this.photo_array = photo_array;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<CarHour> getCarhour_array() {
		return carhour_array;
	}

	public void setCarhour_array(List<CarHour> carhour_array) {
		this.carhour_array = carhour_array;
	}
}
