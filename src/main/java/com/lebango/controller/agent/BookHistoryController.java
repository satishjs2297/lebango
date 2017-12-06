package com.lebango.controller.agent;

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
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.viewmodel.TourBooking;

@Controller
@RequestMapping("/agent")
public class BookHistoryController {

	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private TourService tourService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/bookhistory")
	public String myorder(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Booking> bookings = bookingService.getAllBookingsByAgent(currentUser.getId());
		if (bookings.size() > 0) {
			List<TourBooking> tourbookings = new ArrayList<TourBooking>();
			for (int i = 0; i < bookings.size(); i++) {
				Booking item = bookings.get(i);
				Tour tour = tourService.getTourByBooking(item.getId());
				TourBooking tourbooking = new TourBooking();
				tourbooking.setAgent_id(item.getAgent_id());
				tourbooking.setBooking_id(item.getId());
				tourbooking.setChild_count(item.getChild_count());
				User supplier = userService.getUserById(tour.getSupplier_id());
				String contact_person = supplier.getFirstname() + " " + supplier.getLastname() +", " + supplier.getPhone();  
				tourbooking.setContact_person(contact_person);
				
				/*
				SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
				Date date = new Date();
				date.setTime(item.getEnd_time().getTime());
				String formattedDate = dateFormat.format(date);
				*/
				tourbooking.setEnd_date(item.getEnd_date() + " " + item.getEnd_time());
				tourbooking.setStart_date(item.getStart_date() + " " + item.getStart_time());
				
				tourbooking.setState(item.getState_name());
				tourbooking.setSupplier_id(supplier.getId());
				tourbooking.setTotal_amount(item.getTotal_amount());
				tourbooking.setTour_code(tour.getTour_code());
				tourbooking.setTour_id(tour.getId());
				tourbooking.setTour_status(tour.getStatus());
				tourbooking.setTrace(item.getTrace_name());
				tourbooking.setVisitor_count(item.getVisitor_count());
				tourbooking.setBook_status(item.getStatus());
				int status = item.getStatus();
				switch (status) {
					case GlobalConstants.BOOKING_STATUS_BOOKING_REQUESTED:
						tourbooking.setBook_status_name("requested");
						break;
					case GlobalConstants.BOOKING_STATUS_BOOKING_ACCEPTED:
						tourbooking.setBook_status_name("accepted");
						break;
					case GlobalConstants.BOOKING_STATUS_BOOKING_DENIED:
						tourbooking.setBook_status_name("denied");
						break;
					case GlobalConstants.BOOKING_STATUS_BOOKING_PAID:
						tourbooking.setBook_status_name("paid");
						break;
					case GlobalConstants.BOOKING_STATUS_BOOKING_CANCELLED:
						tourbooking.setBook_status_name("cancelled");
						break;
					case GlobalConstants.BOOKING_STATUS_SERVICE_STARTED:
						tourbooking.setBook_status_name("started");
						break;
					case GlobalConstants.BOOKING_STATUS_SERVICE_COMPLETED:
						tourbooking.setBook_status_name("completed");
						break;
					case GlobalConstants.BOOKING_STATUS_SERVICE_CANCELLED:
						tourbooking.setBook_status_name("stopped");
						break;
				}
				
				
				tourbookings.add(tourbooking);
			}
			model.addAttribute("tourbookings", tourbookings);
		}
		
		return "agent/book-history";
	}
	
	@RequestMapping(value = "/detail-booking")
	public String detailbooking(Model model, HttpSession session, HttpServletRequest request) { 
		int booking_id = 0;
		if (request.getParameter("booking_id") != null) {
			booking_id = Integer.parseInt((String)request.getParameter("booking_id"));
		}
		
		
		return "agent/detail-booking";
	}
}
