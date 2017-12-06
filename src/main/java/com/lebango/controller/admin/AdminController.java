package com.lebango.controller.admin;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lebango.bean.User;
import com.lebango.viewmodel.ProfileUploadForm;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

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
		
		return "admin/profile";
	}
	
	@RequestMapping(value = "/home")
	public String home(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/home";
	}
	
	@RequestMapping(value = "/agents")
	public String agents(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/agents";
	}
	
	@RequestMapping(value = "/organizations")
	public String organizations(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/organizations";
	}
	
	@RequestMapping(value = "/suppliers")
	public String suppliers(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/suppliers";
	}
	
	@RequestMapping(value = "/orders")
	public String orders(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/orders";
	}
	
	@RequestMapping(value = "/transactions")
	public String transactions(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/transactions";
	}
	
	@RequestMapping(value = "/register_requests")
	public String register_request(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/register-requests";
	}
	
	@RequestMapping(value = "/inbox")
	public String showInbox(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "admin/inbox";
	}
}