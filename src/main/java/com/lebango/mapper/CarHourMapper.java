package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.CarHour;

public interface CarHourMapper {
	List<CarHour> get(int car_id);
	void insert(CarHour carhour);
}
