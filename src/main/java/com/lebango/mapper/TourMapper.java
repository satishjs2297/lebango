package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Tour;

public interface TourMapper {
	public List<Tour> getUpcomingBookings(int supplier_id);
	public List<Tour> getFinishedBookings(int supplier_id);
    public void insert(Tour tour);
	public Tour getTourByBooking(int booking_id);
	public Tour getTourByCode(String tour_code);
	public List<Tour> getToursByCarId(String car_id);
	public List<Tour> getToursByGuideId(String guide_id);
}
