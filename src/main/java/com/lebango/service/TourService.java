package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Tour;
import com.lebango.mapper.TourMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class TourService {
	
	@Autowired
	private TourMapper tourMapper;
	
	public List<Tour> getUpcomingBookings(int supplier_id) {
		return tourMapper.getUpcomingBookings(supplier_id);
	}
	public List<Tour> getFinishedBookings(int supplier_id) {
		return tourMapper.getFinishedBookings(supplier_id);
	}
	public void insert(Tour tour) {
		tourMapper.insert(tour);
		return;
	}
	public Tour getTourByBooking(int booking_id) {
		Tour tour = tourMapper.getTourByBooking(booking_id);
		return tour;
	}
	public Tour getTourByCode(String tour_code) {
		Tour tour = tourMapper.getTourByCode(tour_code);
		return tour;
	}
	
	public List<Tour> getToursByCarId(String car_id) {
		return tourMapper.getToursByCarId(car_id);
	}
	
	
}
