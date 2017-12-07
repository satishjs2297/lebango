package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Car;

public interface CarMapper {
	List<Car> getBySupplier(int supplier_id);
	void insert(Car car);
	Car getById(int id);
	int getMaxId();
	List<Car> getBySupplierAndSeat(Car car);
	void deleteCarById(int id);
}
