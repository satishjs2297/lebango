package com.lebango.controller;

import com.lebango.bean.Message;
import com.lebango.bean.Role;
import com.lebango.bean.User;
import com.lebango.mapper.UserMapper;
import com.lebango.service.LocationService;
import com.lebango.service.MessageService;
import com.lebango.service.RoleService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.authc.AuthenticationException;
//import org.apache.shiro.authc.IncorrectCredentialsException;
//import org.apache.shiro.authc.UsernamePasswordToken;
//import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired(required = true)
	UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private LocationService locationService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
        model.addAttribute("user", new User());
		return "login";
	}

	@RequestMapping(value = "/loginchk", method = RequestMethod.POST)
	public String loginchk(@Valid User user, BindingResult result, HttpSession session, HttpServletRequest request) {
		// if (result.hasErrors()) {
		// return "sessions/new";
		// }

		User currentUser = userService.findByEmailAndPassword(user);		
		
		if (currentUser == null) {
			//	result.reject("mismatch.signIn.failed");
			return "redirect:/login";
		}

		session.setAttribute("currentUser", currentUser);
		
		List<Message> messages = messageService.get(currentUser);
		List<Message> newMessages = new ArrayList<Message>();
		for (int i = 0; i < messages.size(); i++) {
			if (messages.get(i).getReceiver_id() == currentUser.getId() && messages.get(i).getStatus() != GlobalConstants.MESSAGE_STATUS_RECEIVED) {
				newMessages.add(messages.get(i));
			}
		}
		session.setAttribute("newMessages", newMessages);
		
		int roleType = currentUser.getType();
		String role_str = "";
		switch (roleType) {
			case GlobalConstants.USER_ADMIN:
				role_str = "admin";
				saveRole(session, role_str);
				return "redirect:/admin/home";
			case GlobalConstants.USER_AGENT:
				role_str = "agent";
				saveRole(session, role_str);
				return "redirect:/agent/home";
			case GlobalConstants.USER_ORGANIZATION:
				role_str = "organization";
				saveRole(session, role_str);
				return "redirect:/agent/home";
			case GlobalConstants.USER_SUPPLIER:
				role_str = "supplier";
				saveRole(session, role_str);
				return "redirect:/supplier/home";
		}

		return "login";
	}
	
	@SuppressWarnings("unchecked")
	private void saveRole(HttpSession session, String role_str) {
		List<Role> roles;
		roles = (List<Role>) session.getAttribute(GlobalConstants.SESSION_ROLES);
		if (roles == null || roles.size() == 0) {
			roles = roleService.loadRoles();
			session.setAttribute(GlobalConstants.SESSION_ROLES, roles);
		}
		
		for (int i = 0; i < roles.size(); i++) {
			Role role = roles.get(i);
			if (role.getRole().equals(role_str)) {
				session.setAttribute(GlobalConstants.SESSION_PERMISSIONS, role.getPermission());
			}
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.setAttribute("currentUser", null);
		return "redirect:/login";
	}
}
