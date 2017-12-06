package com.lebango.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.lebango.bean.Document;
import com.lebango.bean.SupplierRegister;
import com.lebango.bean.User;
import com.lebango.service.DocumentService;
import com.lebango.service.SupplierRegisterService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.util.Utils;
import com.lebango.viewmodel.RegisterUploadForm;


@Controller
public class RegisterController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private SupplierRegisterService supplierRegisterService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model, HttpSession session) {
		RegisterUploadForm uploadForm = new RegisterUploadForm();
		model.addAttribute("uploadForm", uploadForm);		
		return "register";
	}
	
	@RequestMapping(value = "/register-user", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute RegisterUploadForm uploadForm, Model model, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		if (uploadForm != null) {
			User newUser = new User();
			newUser.setEmail(uploadForm.getEmail());
			newUser.setPassword(uploadForm.getPassword());
			
			Boolean isExisting = userService.isExisting(newUser);
			if (isExisting == false) {
				newUser.setCompany_name(uploadForm.getCompany_name());
				newUser.setCreated_at(new Timestamp(System.currentTimeMillis()));
				newUser.setUpdated_at(new Timestamp(System.currentTimeMillis()));
				newUser.setEmail(uploadForm.getEmail());
				newUser.setFirstname(uploadForm.getFirstname());
				
				newUser.setLastname(uploadForm.getLastname());
				newUser.setPassword(uploadForm.getPassword());
				newUser.setPhone(uploadForm.getPhone());
				
				int type;
				int user_type = uploadForm.getUser_type();
				int user_group = uploadForm.getUser_group();
				if (user_type == 1) {
					if (user_group == 1) {
						type = GlobalConstants.USER_AGENT;
						newUser.setIs_approved(0);
					} else {
						type = GlobalConstants.USER_ORGANIZATION;
						newUser.setIs_approved(0);
					}
				} else {
					type = GlobalConstants.USER_SUPPLIER;
					newUser.setIs_approved(2);
				}
				newUser.setType(type);
				
				// Insert User
				try {
					userService.insert(newUser);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "failure");
					return "redirect:/register";
				}
				
				if (newUser.getType() == GlobalConstants.USER_SUPPLIER) {
					int supplier_id = userService.findByEmailAndPassword(newUser).getId();
					
					// Insert Supplier Register
					SupplierRegister supplierRegister = new SupplierRegister();
					supplierRegister.setCreated_at(new Timestamp(System.currentTimeMillis()));
					supplierRegister.setUpdated_at(new Timestamp(System.currentTimeMillis()));
					supplierRegister.setIs_resubmit(GlobalConstants.SUPPLIER_REGISTER_IS_RESUBMIT_NO);
					supplierRegister.setStatus(GlobalConstants.SUPPLIER_REGISTER_STATUS_WAITING);
					supplierRegister.setSupplier_id(supplier_id);
					supplierRegisterService.insert(supplierRegister);
					int supplier_register_id = supplierRegisterService.getMaxId();
					
					// File Upload
					MultipartFile file = null;
					file = uploadForm.getBusiness_register_certificate();
					if (!file.isEmpty()) {
						String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
						String path = request.getServletContext().getRealPath("upload/supplier_register/") + filename;
						this.saveDocumentImage(GlobalConstants.BUSINESS_REGISTER_CERTIFICATE, filename, file, supplier_register_id, path);
					}
					
					file = uploadForm.getCar_service_company_certificate();
					if (!file.isEmpty()) {
						String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
						String path = request.getServletContext().getRealPath("upload/supplier_register/") + filename;
						this.saveDocumentImage(GlobalConstants.CAR_SERVICE_OPERATING_COMPANY_CERTIFICATE, filename, file, supplier_register_id, path);
					}
					
					file = uploadForm.getPublic_liability();
					if (!file.isEmpty()) {
						String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
						String path = request.getServletContext().getRealPath("upload/supplier_register/") + filename;
						this.saveDocumentImage(GlobalConstants.PUBLIC_LIABILITY, filename, file, supplier_register_id, path);
					}					
				}
			} else {		// Existing User

				model.addAttribute("message", URLEncoder.encode("this is existing user", "UTF-8"));
				return "redirect:/register";
			}
		} else {		// Form is null
			model.addAttribute("message", "form is null");
			return "redirect:/register";
		}
		
		model.addAttribute("message", "successfully registered.");
		return "redirect:/login";
	}
	
	void saveDocumentImage(String type, String filename, MultipartFile file, int refer_id, String path) {
		Document document = new Document();
		document.setCategory(GlobalConstants.DOCUMENT_CATEGORY_REGISTER);
		document.setCreated_at(new Timestamp(System.currentTimeMillis()));
		document.setUpdated_at(new Timestamp(System.currentTimeMillis()));
		document.setRefer_id(refer_id);
		document.setType(GlobalConstants.DOCUMENT_TYPE_PHOTO);
	
		File destfile = new File(path);
		//Save the bytes to a file.
		try {
			FileUtils.writeByteArrayToFile(destfile, file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		document.setUrl("/upload/supplier_register/" + filename);
		document.setName(type);
		documentService.insert(document);
	}
}
