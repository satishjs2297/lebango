package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.CarHour;
import com.lebango.mapper.CarHourMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class CarHourService {

	@Autowired
	private CarHourMapper carhourMapper;
	
	public List<CarHour> get(int car_id) {
		return carhourMapper.get(car_id);
	}

	public void insert(CarHour carhour) {
		carhourMapper.insert(carhour);
		return;
	}
}
