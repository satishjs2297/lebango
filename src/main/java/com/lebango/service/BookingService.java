package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Booking;
import com.lebango.mapper.BookingMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class BookingService {

	@Autowired
	private BookingMapper bookingMapper;
	
	public Booking getBookingById(int booking_id) {
		return bookingMapper.getBookingById(booking_id);
	}
	
	public List<Booking> getAllBookingsByAgent(int agent_id) {
		return bookingMapper.getAllBookngsByAgent(agent_id);
	}
	
	public void insert(Booking newBooking) {
		bookingMapper.insert(newBooking);
		return;
	}
}
