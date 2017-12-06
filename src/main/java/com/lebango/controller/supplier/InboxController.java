package com.lebango.controller.supplier;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lebango.bean.Message;
import com.lebango.bean.User;
import com.lebango.service.MessageService;

@Controller
@RequestMapping("/supplier")
public class InboxController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/inbox")
	public String showInbox(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Message> messages = messageService.get(currentUser);
		if (messages.size() > 0) {
			model.addAttribute("messages", messages);
		}
		return "supplier/inbox";
	}
}
