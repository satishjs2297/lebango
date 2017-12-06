package com.lebango.controller.agent;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lebango.bean.Booking;
import com.lebango.bean.User;
import com.lebango.service.BookingService;
import com.lebango.viewmodel.ProfileUploadForm;

@Controller
@RequestMapping("/agent")
public class AgentController {

	@Autowired
	private BookingService bookingService;
	
	@RequestMapping(value = "/home")
	public String home(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		List<Booking> bookings = bookingService.getAllBookingsByAgent(currentUser.getId());
		if (bookings == null)
			model.addAttribute("total_bookings", 0);
		model.addAttribute("total_bookings", bookings.size());
		
		return "agent/home";
	}
	
	@RequestMapping(value = "/profile")
	public String account(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		ProfileUploadForm profileUploadForm = new ProfileUploadForm();
		profileUploadForm.setCompany_name(currentUser.getCompany_name());
		profileUploadForm.setConfirm_password(currentUser.getPassword());
		profileUploadForm.setDescription(currentUser.getDescription());
		profileUploadForm.setEmail(currentUser.getEmail());
		profileUploadForm.setFirstname(currentUser.getFirstname());
		profileUploadForm.setId(currentUser.getId());
		profileUploadForm.setLastname(currentUser.getLastname());
		profileUploadForm.setPassword(currentUser.getPassword());
		profileUploadForm.setPhone(currentUser.getPhone());
		profileUploadForm.setPrev_photo(currentUser.getPhoto());
		
		model.addAttribute("userForm", profileUploadForm);
		
		return "agent/profile";
	}
}