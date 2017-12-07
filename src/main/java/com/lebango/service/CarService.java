package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Car;
import com.lebango.mapper.CarMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class CarService {

	@Autowired
	private CarMapper carMapper;
	
	public List<Car> getBySupplier(int supplier_id) {
		return carMapper.getBySupplier(supplier_id);
	}
	
	public void insert(Car car) {
		carMapper.insert(car);
	}
	
	public Car getById(int id) {
		return carMapper.getById(id);
	}
	
	public int getMaxId() {
		return carMapper.getMaxId();
	}
	public List<Car> getBySupplierAndSeat(int supplier_id, int seat_num) {
		Car car = new Car();
		car.setSupplier_id(supplier_id);
		car.setSeat(seat_num);
		
		return carMapper.getBySupplierAndSeat(car);
	}
	
	public void deleteCarById(int id) {
		carMapper.deleteCarById(id);
	}
}
