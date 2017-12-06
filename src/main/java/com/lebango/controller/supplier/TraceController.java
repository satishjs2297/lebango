package com.lebango.controller.supplier;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lebango.bean.Location;
import com.lebango.bean.SubTrace;
import com.lebango.bean.Trace;
import com.lebango.bean.User;
import com.lebango.service.LocationService;
import com.lebango.service.SubTraceService;
import com.lebango.service.TraceService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.viewmodel.CarUploadForm;
import com.lebango.viewmodel.SubTraceForm;
import com.lebango.viewmodel.TraceViewModel;

@Controller
@RequestMapping("/supplier")
public class TraceController {
	
	@Autowired
	private TraceService traceService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubTraceService subTraceService;
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value = "/manage-traces")
	public String showManageTraces(Model model, HttpSession session, HttpServletRequest request) {
		
		int cur_trace_id = 0;
		if (request.getParameter("trace_id") != null) {
			cur_trace_id = Integer.parseInt((String)request.getParameter("trace_id"));
		}
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Trace> trace_array = traceService.getBySupplier(currentUser.getId());
		
		
		if (trace_array != null && trace_array.size() > 0) {
			List<TraceViewModel> trace_model_array = new ArrayList<TraceViewModel>();
			List<SubTrace> sub_trace_array;
			
			for (int i = 0; i < trace_array.size(); i++) {
				TraceViewModel trace_view_model = new TraceViewModel();
				trace_view_model.setTrace_id(trace_array.get(i).getId());
				trace_view_model.setEnd_location(locationService.getById(trace_array.get(i).getEnd_location()).getName());
				trace_view_model.setStart_location(locationService.getById(trace_array.get(i).getStart_location()).getName());
				trace_model_array.add(trace_view_model);
			}
			model.addAttribute("trace_array", trace_model_array);
			
			if (cur_trace_id == 0) {
				model.addAttribute("cur_trace_id", trace_array.get(0).getId());
				sub_trace_array = subTraceService.getByParentId(trace_array.get(0).getId());
			} else {
				model.addAttribute("cur_trace_id", cur_trace_id);
				sub_trace_array = subTraceService.getByParentId(cur_trace_id);
			}
			
			if (sub_trace_array != null && sub_trace_array.size() > 0) {
				model.addAttribute("sub_trace_array", sub_trace_array);
			}
		}
		
		return "supplier/manage-traces";
	}
	
	@RequestMapping(value = "/add-trace")
	public String showAddTrace(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<Location> location_array = locationService.get();
		if (location_array != null && location_array.size() > 0) {
			model.addAttribute("location_array", location_array);
		}
		
		model.addAttribute("state_array", GlobalConstants.STATE_NAME_ARRAY);
		
		List<Trace> trace_array = traceService.getBySupplier(currentUser.getId());
		
		if (trace_array != null && trace_array.size() > 0) {
			List<TraceViewModel> trace_model_array = new ArrayList<TraceViewModel>();
			
			for (int i = 0; i < trace_array.size(); i++) {
				TraceViewModel trace_view_model = new TraceViewModel();
				trace_view_model.setTrace_id(trace_array.get(i).getId());
				trace_view_model.setEnd_location(locationService.getById(trace_array.get(i).getEnd_location()).getName());
				trace_view_model.setStart_location(locationService.getById(trace_array.get(i).getStart_location()).getName());
				trace_model_array.add(trace_view_model);
			}
			model.addAttribute("trace_array", trace_model_array);
		}
		
		model.addAttribute("traceForm", new Trace());
		model.addAttribute("subtraceForm", new SubTraceForm());
		return "supplier/add-trace";
	}
	
	@RequestMapping(value="/register-trace",method=RequestMethod.POST)
	public String registerTrace(@ModelAttribute Trace traceForm, Model model, HttpSession session, HttpServletRequest request) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		traceForm.setSupplier_id(currentUser.getId());
		int count = traceService.checkExisting(traceForm);
		if (count != 0) {
			model.addAttribute("message", "This trace is existing trace.");
			return "redirect:/supplier/add-trace";
		}
		try {
			traceService.insert(traceForm);
			model.addAttribute("message", "Successfully registered.");
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "Failure to insert new trace.");
		}
		return "redirect:/supplier/add-trace";
	}
	
	@RequestMapping(value="/register-sub-trace",method=RequestMethod.POST)
	public String registerSubTrace(@ModelAttribute SubTraceForm subtraceForm, Model model, HttpSession session, HttpServletRequest request) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		SubTrace subtrace = new SubTrace();
		if (subtraceForm != null) {
			subtrace.setParent_trace(subtraceForm.getParent_trace());
			subtrace.setName(subtraceForm.getName());
			subtrace.setDescription(subtraceForm.getDescription());
			try {
				subtrace.setSeat_7s(Float.parseFloat(subtraceForm.getSeat_7s()));
				subtrace.setSeat_14s(Float.parseFloat(subtraceForm.getSeat_14s()));
				subtrace.setSeat_21s(Float.parseFloat(subtraceForm.getSeat_21s()));
				subtrace.setSeat_25s(Float.parseFloat(subtraceForm.getSeat_25s()));
				subtrace.setSeat_33s(Float.parseFloat(subtraceForm.getSeat_33s()));
				subtrace.setSeat_45s(Float.parseFloat(subtraceForm.getSeat_45s()));
				subtrace.setSeat_55s(Float.parseFloat(subtraceForm.getSeat_55s()));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
				model.addAttribute("message", "Failure to insert new sub trace. Please input valid value.");
				return "redirect:/supplier/add-trace";
			}
			
			subtrace.setCreated_at(new Timestamp(System.currentTimeMillis()));
			subtrace.setUpdated_at(new Timestamp(System.currentTimeMillis()));
			
			try {
				subTraceService.insert(subtrace);
				model.addAttribute("message", "Successfully registered.");
			} catch (Exception ex) {
				ex.printStackTrace();
				model.addAttribute("message", "Failure to insert new sub trace.");
			}
		} else {
			model.addAttribute("message", "Failure to insert new trace.");
		}
		
		return "redirect:/supplier/add-trace";
	}
}
