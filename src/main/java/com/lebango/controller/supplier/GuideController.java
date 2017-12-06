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
import com.lebango.bean.Document;
import com.lebango.bean.Guide;
import com.lebango.bean.User;
import com.lebango.service.GuideService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.util.Utils;
import com.lebango.viewmodel.CarEntity;
import com.lebango.viewmodel.GuideUploadForm;

@Controller
@RequestMapping("/supplier")
public class GuideController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GuideService guideService;
	
	@RequestMapping(value = "/add-guide")
	public String showAddGuide(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("guideForm", new GuideUploadForm());
		
		return "supplier/add-guide";
	}
	
	@RequestMapping(value = "/register-guide")
	public String registerGuide(@ModelAttribute GuideUploadForm uploadForm, Model model, HttpSession session, HttpServletRequest request) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		if (uploadForm != null) {
			Guide new_guide = new Guide();
			new_guide.setBirthday(uploadForm.getBirthday());
			new_guide.setCreated_at(new Timestamp(System.currentTimeMillis()));
			new_guide.setUpdated_at(new Timestamp(System.currentTimeMillis()));
			new_guide.setDescription(uploadForm.getDescription());
			new_guide.setFirstname(uploadForm.getFirstname());
			new_guide.setGender(uploadForm.getGender());
			new_guide.setLastname(uploadForm.getLastname());
			new_guide.setSupplier_id(currentUser.getId());
			
			MultipartFile file = null;
			file = uploadForm.getPhoto();
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
				new_guide.setPhoto("/upload/guide/" + filename);
			}
			
			guideService.insert(new_guide);
			model.addAttribute("message", "Successfully, registered new car.");
		} else {
			model.addAttribute("message", "Form data is empty");
		}
		
		return "redirect:/supplier/add-guide";
	}
	
	@RequestMapping(value = "/edit-guide")
	public String showEditGuide(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		return "supplier/edit-guide";
	}
	
	@RequestMapping(value = "/manage-guide")
	public String showManageGuide(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		List<Guide> guides = guideService.getBySupplier(currentUser.getId());
		if (guides.size() > 0) {
			model.addAttribute("guides", guides);
		}
		
		return "supplier/manage-guide";
	}
}
