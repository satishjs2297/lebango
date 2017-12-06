package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Booking;

public interface BookingMapper {
	public Booking getBookingById(int booking_id);

	public List<Booking> getAllBookngsByAgent(int agent_id);

	public void insert(Booking newBooking);
}
