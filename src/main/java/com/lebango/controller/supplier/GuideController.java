package com.lebango.controller.supplier;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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

import com.lebango.bean.Guide;
import com.lebango.bean.User;
import com.lebango.service.GuideHourService;
import com.lebango.service.GuideService;
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.Utils;
import com.lebango.viewmodel.GuideUploadForm;

@Controller
@RequestMapping("/supplier")
public class GuideController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private TourService tourService;

	@Autowired
	private GuideHourService guideHourService;
	
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
	
	@RequestMapping(value = "/view-guide")
	public String viewCar(Model model, HttpSession session, HttpServletRequest request) {
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}

		if (request.getParameter("id") == null) {
			return "redirect:/manage-guide";
		}
		try {
			GuideUploadForm guideInfo = getSelectedGuideInfo(request);
			model.addAttribute("guideForm", guideInfo);
		} catch (Exception e) {
			System.err.println("Exception :: "+e);
			return "redirect:/manage-guide";
		}
		return "supplier/view-guide";
	}
		
	@RequestMapping(value = "/edit-guide")
	public String showEditGuide(Model model, HttpServletRequest request) {
		
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		GuideUploadForm guideInfo = getSelectedGuideInfo(request);
		model.addAttribute("guideForm", guideInfo);
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
	
	/*@RequestMapping(value = "/delete-guide")
	public String deleteGuide(HttpServletRequest request) {
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		int guide_id = Integer.parseInt(request.getParameter("guide_id"));
		guideService.deleteGuideById(guide_id);
		return "supplier/manage-guide";
	}*/
	
	private GuideUploadForm getSelectedGuideInfo(HttpServletRequest request) {
		int guide_id = Integer.parseInt(request.getParameter("id"));
		Guide guide = guideService.getById(guide_id);
		GuideUploadForm uploadForm = guide.createGuideUploadForm();
		uploadForm.setTours(tourService.getToursByGuideId(String.valueOf(guide_id)));
		uploadForm.setGuideHour_array(guideHourService.getGuideHour(guide_id));
		return uploadForm;
	}	
}
