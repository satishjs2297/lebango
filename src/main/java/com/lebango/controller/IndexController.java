package com.lebango.controller;

import java.io.FileNotFoundException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.lebango.bean.Location;
import com.lebango.bean.ManagerSetting;
import com.lebango.bean.Role;
import com.lebango.bean.State;
import com.lebango.bean.User;
import com.lebango.service.LocationService;
import com.lebango.service.ManagerSettingService;
import com.lebango.service.RoleService;
import com.lebango.service.StateService;
import com.lebango.util.GlobalConstants;
import com.lebango.viewmodel.TraceViewModel;

@Controller
public class IndexController {

	@Autowired
	private LocationService locationService;
	
	@Autowired
	private StateService stateService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ManagerSettingService managerSettingService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session, HttpServletRequest request) {
		
		// Get roles
		List<Role> roles;
		roles = (List<Role>) session.getAttribute(GlobalConstants.SESSION_ROLES);
		if (roles == null || roles.size() == 0) {
			roles = roleService.loadRoles();
			session.setAttribute(GlobalConstants.SESSION_ROLES, roles);
		}
		// Get manager setting
		List<ManagerSetting> managerSettings;
		managerSettings = (List<ManagerSetting>) session.getAttribute(GlobalConstants.SESSION_MANAGER_SETTINGS);
		if (managerSettings == null || managerSettings.size() == 0) {
			managerSettings = managerSettingService.loadManagerSettings();
			session.setAttribute(GlobalConstants.SESSION_MANAGER_SETTINGS, managerSettings);
		}
		
		// Get states
		List<State> states;
		states = (List<State>) session.getAttribute(GlobalConstants.SESSION_STATES);
		if (states == null || states.size() == 0) {
			states = stateService.getAll();
			session.setAttribute(GlobalConstants.SESSION_STATES, states);
		}
		
		// Get locations
		List<Location> locations;
		locations = (List<Location>) session.getAttribute(GlobalConstants.SESSION_LOCATIONS);
		if (locations == null || locations.size() == 0) {
			locations = locationService.get();
			session.setAttribute(GlobalConstants.SESSION_LOCATIONS, locations);
		}
		
		// Set language
		ServletContext context = request.getSession().getServletContext();
		context.setAttribute("language", "en_US");

		return "index";
	}
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String Forgotpassword() {
		return "forgot-password";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String show403() {
		return "default/403";
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String show404() {
		return "default/404";
	}
	
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String show500() {
		return "default/500";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/language/zh", method = RequestMethod.GET)
	public String changeLanguageToChinese(HttpServletRequest request) {
		ServletContext context = request.getSession().getServletContext();
		context.setAttribute("language", "zh_CN");
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/language/en", method = RequestMethod.GET)
	public String changeLanguageToEnglish(HttpServletRequest request) {
		ServletContext context = request.getSession().getServletContext();
		context.setAttribute("language", "en_US");
		return "redirect:/login";
	}
}