package com.lebango.controller.supplier;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lebango.bean.Booking;
import com.lebango.bean.Tour;
import com.lebango.bean.User;
import com.lebango.service.BookingService;
import com.lebango.service.MessageService;
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.viewmodel.TourBooking;

@Controller
@RequestMapping("/supplier")
public class BookingController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private TourService tourService;
	
	@Autowired
	private BookingService bookingService;
	
	@RequestMapping(value = "/upcoming-bookings")
	public String showUpcomingBookings(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Tour> upcomingBookings = tourService.getUpcomingBookings(currentUser.getId());
		if (upcomingBookings.size() > 0) {
			List<TourBooking> tourbookings = new ArrayList<TourBooking>();
			for (int i = 0; i < upcomingBookings.size(); i++) {
				int booking_id = upcomingBookings.get(i).getBooking_id();
				Booking booking = bookingService.getBookingById(booking_id);
				
				TourBooking tourbooking = new TourBooking();
				tourbooking.setAgent_id(upcomingBookings.get(i).getAgent_id());
				tourbooking.setBooking_id(booking.getId());
				tourbooking.setChild_count(booking.getChild_count());
				tourbooking.setContact_person(booking.getContact_person());
				
				tourbooking.setEnd_date(booking.getEnd_date() + " " + booking.getEnd_time());
				tourbooking.setStart_date(booking.getStart_date() + " " + booking.getStart_time());
				
				tourbooking.setSpecial_request(booking.getSpecial_request());
				tourbooking.setState(booking.getState_name());
				tourbooking.setSupplier_id(upcomingBookings.get(i).getSupplier_id());
				tourbooking.setTotal_amount(booking.getTotal_amount());
				tourbooking.setTour_code(upcomingBookings.get(i).getTour_code());
				tourbooking.setTour_id(upcomingBookings.get(i).getId());
				tourbooking.setTour_status(upcomingBookings.get(i).getStatus());
				tourbooking.setVisitor_count(booking.getVisitor_count());
				tourbooking.setTrace(booking.getTrace_name());
				int status = tourbooking.getTour_status();
				switch (status) {
					case GlobalConstants.TOUR_STATUS_AGENT_REQUESTED:
						tourbooking.setTour_status_name("requested");
						break;
					case GlobalConstants.TOUR_STATUS_AGENT_CANCELLED:
						tourbooking.setTour_status_name("cancelled");
						break;
					case GlobalConstants.TOUR_STATUS_BOOKING_ACCEPTED:
						tourbooking.setTour_status_name("accepted");
						break;
					case GlobalConstants.TOUR_STATUS_BOOKING_DENIED:
						tourbooking.setTour_status_name("denied");
						break;
					case GlobalConstants.TOUR_STATUS_AGENT_PAID:
						tourbooking.setTour_status_name("paid");
						break;
				}
				
				/*
				tourbooking.setAssign_car_array(assign_car_array);
				tourbooking.setAssign_guide_array(assign_guide_array);
				tourbooking.setRequest_car_array(request_car_array);
				tourbooking.setRequest_guide_array(request_guide_array);
				tourbooking.setSub_trace_array(sub_trace_array);
				*/
				
				tourbookings.add(tourbooking);
			}
			model.addAttribute("tourbookings", tourbookings);
		}
		
		return "supplier/upcoming-bookings";
	}
	
	@RequestMapping(value = "/finished-bookings")
	public String showFinishedBookings(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Tour> finishedBookings = tourService.getFinishedBookings(currentUser.getId());
		if (finishedBookings.size() > 0) {
			List<TourBooking> tourbookings = new ArrayList<TourBooking>();
			for (int i = 0; i < finishedBookings.size(); i++) {
				int booking_id = finishedBookings.get(i).getBooking_id();
				Booking booking = bookingService.getBookingById(booking_id);
				
				TourBooking tourbooking = new TourBooking();
				tourbooking.setAgent_id(finishedBookings.get(i).getAgent_id());
				tourbooking.setBooking_id(booking.getId());
				tourbooking.setChild_count(booking.getChild_count());
				tourbooking.setContact_person(booking.getContact_person());
				
				tourbooking.setEnd_date(booking.getEnd_date() + " " + booking.getEnd_time());
				tourbooking.setStart_date(booking.getStart_date() + " " + booking.getStart_time());
			
				tourbooking.setSpecial_request(booking.getSpecial_request());
				tourbooking.setState(booking.getState_name());
				tourbooking.setSupplier_id(finishedBookings.get(i).getSupplier_id());
				tourbooking.setTotal_amount(booking.getTotal_amount());
				tourbooking.setTour_code(finishedBookings.get(i).getTour_code());
				tourbooking.setTour_id(finishedBookings.get(i).getId());
				tourbooking.setTour_status(finishedBookings.get(i).getStatus());
				tourbooking.setVisitor_count(booking.getVisitor_count());
				tourbooking.setTrace(booking.getTrace_name());
				int status = tourbooking.getTour_status();
				switch (status) {
					case GlobalConstants.TOUR_STATUS_SERVICE_STARTED:
						tourbooking.setTour_status_name("service started");
						break;
					case GlobalConstants.TOUR_STATUS_SERVICE_COMPLETED:
						tourbooking.setTour_status_name("service completed");
						break;
					case GlobalConstants.TOUR_STATUS_SERVICE_CANCELLED:
						tourbooking.setTour_status_name("service cancelled");
						break;
					case GlobalConstants.TOUR_STATUS_INVOICE_CREATED:
						tourbooking.setTour_status_name("invoice created");
						break;
					case GlobalConstants.TOUR_STATUS_INVOICE_PAID:
						tourbooking.setTour_status_name("invoice paid");
						break;
					case GlobalConstants.TOUR_STATUS_INVOICE_DENIED:
						tourbooking.setTour_status_name("invoice denied");
						break;
				}
				/*
				tourbooking.setAssign_car_array(assign_car_array);
				tourbooking.setAssign_guide_array(assign_guide_array);
				tourbooking.setRequest_car_array(request_car_array);
				tourbooking.setRequest_guide_array(request_guide_array);
				tourbooking.setSub_trace_array(sub_trace_array);
				*/
				
				tourbookings.add(tourbooking);
			}
			model.addAttribute("tourbookings", tourbookings);
		}
		
		return "supplier/finished-bookings";
	}
	
	@RequestMapping(value = "/detail-booking")
	public String showDetailBooking(Model model, HttpSession session, HttpServletRequest request) {
		int tour_id = 0;
		if (request.getParameter("tour_id") != null) {
			tour_id = Integer.parseInt((String)request.getParameter("tour_id"));
		}
		
		
		return "supplier/detail-booking";
	}
	
}
