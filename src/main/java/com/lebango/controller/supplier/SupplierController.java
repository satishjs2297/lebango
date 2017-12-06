package com.lebango.controller.supplier;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lebango.bean.Car;
import com.lebango.bean.Guide;
import com.lebango.bean.Message;
import com.lebango.bean.SubTrace;
import com.lebango.bean.Tour;
import com.lebango.bean.User;
import com.lebango.service.CarService;
import com.lebango.service.GuideService;
import com.lebango.service.ManagerSettingService;
import com.lebango.service.MessageService;
import com.lebango.service.SubTraceService;
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.util.Utils;
import com.lebango.viewmodel.CarUploadForm;
import com.lebango.viewmodel.ProfileUploadForm;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private TourService tourService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private SubTraceService subTraceService;
	
	@RequestMapping(value = "/home")
	public String home(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Tour> upcomingBookings = tourService.getUpcomingBookings(currentUser.getId());
		List<Tour> finishedBookings = tourService.getFinishedBookings(currentUser.getId());
		
		List<Car> cars = carService.getBySupplier(currentUser.getId());
		List<Guide> guides = guideService.getBySupplier(currentUser.getId());
		List<SubTrace> traces = subTraceService.getBySupplierId(currentUser.getId());
		
		model.addAttribute("booking_count", upcomingBookings.size() + finishedBookings.size());
		model.addAttribute("car_count", cars.size());
		model.addAttribute("guide_count", guides.size());
		model.addAttribute("trace_count", traces.size());
		
		return "supplier/home";
	}
	
	@RequestMapping(value = "/profile")
	public String showProfile(Model model, HttpSession session) {
		
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
		
		return "supplier/profile";
	}
	
	@RequestMapping(value = "/update-profile")
	public String updateProfile(@ModelAttribute ProfileUploadForm userForm, Model model, HttpSession session, HttpServletRequest request) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		if (userForm != null) {
			if (userForm.getPassword() == null || userForm.getConfirm_password() == null) {
				model.addAttribute("message", "Password can not be empty.");
				return "redirect:/supplier/profile";
			}
			if (userForm.getPassword().isEmpty() || userForm.getConfirm_password().isEmpty()) {
				model.addAttribute("message", "Password can not be empty.");
				return "redirect:/supplier/profile";
			}
			if (!userForm.getPassword().equals(userForm.getConfirm_password())) {
				model.addAttribute("message", "Password and confirm password value doesn't match");
				return "redirect:/supplier/profile";
			}
			User update_user = new User();
			update_user.setCompany_name(userForm.getCompany_name());
			update_user.setUpdated_at(new Timestamp(System.currentTimeMillis()));
			update_user.setDescription(userForm.getDescription());
			update_user.setEmail(userForm.getEmail());
			update_user.setFirstname(userForm.getFirstname());
			update_user.setId(currentUser.getId());
			update_user.setLastname(userForm.getLastname());
			update_user.setPassword(userForm.getPassword());
			update_user.setPhone(userForm.getPhone());
			
			MultipartFile file = null;
			file = userForm.getPhoto();
			if (!file.isEmpty()) {
				String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
				String path = request.getServletContext().getRealPath("upload/guide/") + filename;
				File destfile = new File(path);
				//Save the bytes to a file.
				try {
					FileUtils.writeByteArrayToFile(destfile, file.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
				update_user.setPhoto("/upload/guide/" + filename);
			} else {
				update_user.setPhoto(currentUser.getPhoto());
			}
			
			try {
				userService.updateProfile(update_user);
				session.setAttribute("currentUser", update_user);
				model.addAttribute("message", "Successfully updated profile.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("message", "Update profile get failure.");
				return "redirect:/supplier/profile";
			}
		}
		
		return "redirect:/supplier/profile";
	}
}