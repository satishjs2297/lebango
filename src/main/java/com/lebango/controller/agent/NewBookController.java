package com.lebango.controller.agent;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.lebango.bean.Car;
import com.lebango.bean.Document;
import com.lebango.bean.Guide;
import com.lebango.bean.Location;
import com.lebango.bean.State;
import com.lebango.bean.SubTrace;
import com.lebango.bean.Trace;
import com.lebango.bean.User;
import com.lebango.service.CarService;
import com.lebango.service.DocumentService;
import com.lebango.service.GuideService;
import com.lebango.service.LocationService;
import com.lebango.service.StateService;
import com.lebango.service.SubTraceService;
import com.lebango.service.TraceService;
import com.lebango.util.GlobalConstants;
import com.lebango.viewmodel.CarViewModel;
import com.lebango.viewmodel.TraceViewModel;

@Controller
@RequestMapping("/agent")
public class NewBookController {
	
	@Autowired
	private TraceService traceService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private StateService stateService;
	
	@Autowired
	private SubTraceService subtraceService;
	
	@RequestMapping(value = "/bookorder")
	public String booktrip1st(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<State> states = stateService.getAll();
		locationService.get();
		for (int i = 0; i < states.size(); i++) {
			State state = states.get(i);
			locationService.getByState(state.getId());
			
		}
		
		List<Trace> traces = traceService.getBySupplier(currentUser.getId());
		for (int i = 0; i < traces.size(); i++) {
			List<TraceViewModel> trace_array = new ArrayList<TraceViewModel>();
			TraceViewModel trace_view_model = new TraceViewModel();
			trace_view_model.setTrace_id(traces.get(i).getId());
			trace_view_model.setEnd_location(locationService.getById(traces.get(i).getEnd_location()).getName());
			trace_view_model.setStart_location(locationService.getById(traces.get(i).getStart_location()).getName());
			trace_array.add(trace_view_model);
		}
		
		return "agent/new-book1";
	}
	
	@RequestMapping(value = "/new-book2")
	public String booktrip2nd(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		List<State> states = stateService.getAll();
		locationService.get();
		for (int i = 0; i < states.size(); i++) {
			State state = states.get(i);
			locationService.getByState(state.getId());
			
		}
		
		List<Trace> traces = traceService.getBySupplier(currentUser.getId());
		for (int i = 0; i < traces.size(); i++) {
			List<TraceViewModel> trace_array = new ArrayList<TraceViewModel>();
			TraceViewModel trace_view_model = new TraceViewModel();
			trace_view_model.setTrace_id(traces.get(i).getId());
			trace_view_model.setEnd_location(locationService.getById(traces.get(i).getEnd_location()).getName());
			trace_view_model.setStart_location(locationService.getById(traces.get(i).getStart_location()).getName());
			trace_array.add(trace_view_model);
		}
		
		return "agent/new-book2";
	}
	
	@RequestMapping(value="/getsubtraces", method=RequestMethod.POST)
	public @ResponseBody String getTracesInJSON(@RequestParam String jsonData)
	{
		String result = "{}";
		
		/*
		** String jsonData = "{"start_location" : 7, "end_location" : 14}";
		**/
		JsonParser jsonParser = new JsonParser();
		JsonObject jobj = (JsonObject)jsonParser.parse(jsonData);
		int start_location = jobj.get("start_location").getAsInt();
		int end_location = jobj.get("end_location").getAsInt();
		Trace trace = new Trace();
		trace.setStart_location(start_location);
		trace.setEnd_location(end_location);
		int count = traceService.checkExisting(trace);
		if (count != 0) {
			Trace current = traceService.getByStartAndEnd(trace);
			Gson gson = new Gson();
			if (current != null) {
				current.getSupplier_id();
				List<SubTrace> subtrace_array = subtraceService.getByParentId(current.getId());
				if (subtrace_array != null && subtrace_array.size() > 0) {
					result = gson.toJson(subtrace_array);
				}
			}
		}
		return result;
	}
	
	@RequestMapping(value="/getlocations", method=RequestMethod.POST)
	public @ResponseBody String getLocationsInJSON(@RequestParam String jsonData)
	{
		String result = "{}";
		
		/*
		** String jsonData = "{"state_id" : 7}";
		**/
		JsonParser jsonParser = new JsonParser();
		JsonObject jobj = (JsonObject)jsonParser.parse(jsonData);
		int state_id = jobj.get("state_id").getAsInt();
		List<Location> location_array = locationService.getByState(state_id);
		
		if (location_array != null && location_array.size() > 0) {
			Gson gson = new Gson();
			result = gson.toJson(location_array);
		}
		
		return result;
	}
	
	@RequestMapping(value="/getcars", method=RequestMethod.POST)
	public @ResponseBody String getCarsInJSON(@RequestParam String jsonData)
	{
		String result = "{}";
		
		/*
		** String jsonData = '{"start_location" : 1 , "end_location" : 2 , "seat_num" : 5 , "pickup_date" : '12/22/2017' , "dropoff_date" : '12/22/2017'}';
		**/
		JsonParser jsonParser = new JsonParser();
		JsonObject jobj = (JsonObject)jsonParser.parse(jsonData);
		int start_location = jobj.get("start_location").getAsInt();
		int end_location = jobj.get("end_location").getAsInt();
		int seat_num = jobj.get("seat_num").getAsInt();
		jobj.get("pickup_date").getAsString();
		jobj.get("dropoff_date").getAsString();
		
		// GET TRACE
		// 1. State
		// 2. Start Location/End Location
		// 3. Check Trace
		// 3. Supplier
		// 4. Get Subtrace
		
		// GET CAR
		// 1. Supplier 
		// 2. Location
		// 3. Car Seat
		// 4. Available Hour
		
		// GET GUIDE
		// 1. Supplier
		// 2. Available Hour
		
		Trace trace = new Trace();
		trace.setStart_location(start_location);
		trace.setEnd_location(end_location);
		int count = traceService.checkExisting(trace);
		if (count != 0) {
			Trace current = traceService.getByStartAndEnd(trace);
			if (current != null) {
				int supplier_id = current.getSupplier_id();
				List<Car> car_array = carService.getBySupplierAndSeat(supplier_id, seat_num);
				if (car_array != null && car_array.size() > 0) {
					List<CarViewModel> cars = new ArrayList<CarViewModel>();
					List<Guide> guides = guideService.getBySupplier(supplier_id);
					
					for (int i=0; i<car_array.size(); i++) {
						
						Car item = car_array.get(i);
						CarViewModel cur_car = new CarViewModel();
						cur_car.setCar(item);
						
						Document document = new Document();
						document.setCategory(GlobalConstants.DOCUMENT_CATEGORY_CAR);
						document.setRefer_id(item.getId());
						List<Document> documentList = documentService.get(document);
						String photoUrl = new String(); 
						if (documentList != null && documentList.size() > 0) {
							photoUrl = documentList.get(0).getUrl();
						}
						cur_car.setPhoto(photoUrl);
						String guide_name = guides.get(0).getFirstname() + " " + guides.get(0).getLastname();
						cur_car.setGuide_name(guide_name);
						cars.add(cur_car);
					}
					Gson gson = new Gson();
					result = gson.toJson(cars);
				}
			}
		}
		
		
		
		return result;
	}
}
