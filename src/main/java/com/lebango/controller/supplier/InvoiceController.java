package com.lebango.controller.supplier;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lebango.bean.Booking;
import com.lebango.bean.Car;
import com.lebango.bean.Guide;
import com.lebango.bean.Invoice;
import com.lebango.bean.SubTrace;
import com.lebango.bean.Tour;
import com.lebango.bean.User;
import com.lebango.service.BookingService;
import com.lebango.service.CarService;
import com.lebango.service.GuideService;
import com.lebango.service.InvoiceService;
import com.lebango.service.SubTraceService;
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.util.Utils;
import com.lebango.viewmodel.InvoiceItem;
import com.lebango.viewmodel.InvoiceViewModel;
import com.lebango.viewmodel.OrderItem;

@Controller
@RequestMapping("/supplier")
public class InvoiceController {

	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private SubTraceService subtraceService;
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping(value = "/invoices")
	public String showInvoices(Model model, HttpSession session) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
	
		List<Invoice> invoices = invoiceService.getBySupplier(currentUser.getId());
		if (invoices.size() > 0) {
			model.addAttribute("invoices", invoices);
		}
		
		return "supplier/invoices";
	}
	
	@RequestMapping(value = "/detail-invoice")
	public String showDetailInvoice(Model model, HttpSession session, HttpServletRequest request) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
	
		if (request.getParameter("invoice_id") == null) {
			model.addAttribute("message", "no invoice id");
			return "redirect:/supplier/invoices";
		}
		int invoice_id;
		Invoice cur_invoice;
		try {
			invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
			cur_invoice = invoiceService.getById(invoice_id);
			if (cur_invoice == null) {
				model.addAttribute("message", "not valid invoice id");
				return "redirect:/supplier/invoices";
			}
			InvoiceViewModel viewmodel = new InvoiceViewModel();
			
			int booking_id = cur_invoice.getBooking_id();
			String tour_code = cur_invoice.getTour_code();
			Tour tour = tourService.getTourByCode(tour_code);
			Booking booking = bookingService.getBookingById(booking_id);
			if (cur_invoice.getType() == GlobalConstants.INVOICE_TYPE_PAY) {
				viewmodel.setFrom_user(userService.getAdmin());
				viewmodel.setTo_user(userService.getUserById(cur_invoice.getUser_id()));
			} else {
				viewmodel.setFrom_user(userService.getUserById(cur_invoice.getUser_id()));
				viewmodel.setTo_user(userService.getAdmin());
			}
			
			viewmodel.setInvoice(cur_invoice);
			
			String cars = tour.getAssign_car_array();
			String guides = tour.getAssign_guide_array();
			String[] car_array = cars.split(",");
			String[] guide_array = guides.split(",");
			List<OrderItem> order_item_array = new ArrayList<OrderItem>();
			for (int i = 0; i < guide_array.length; i++) {
				try {
					int guide_id = Integer.parseInt(guide_array[i]);
					int car_id = Integer.parseInt(car_array[i]);
					Guide guide = guideService.getById(guide_id);
					Car car = carService.getById(car_id);
					OrderItem temp = new OrderItem();
					temp.setCar_id(car.getId());
					temp.setCar_name(car.getBrand() + " : " + car.getModel());
					temp.setCar_seat(car.getSeat());
					temp.setGuide_id(guide.getId());
					temp.setGuide_name(guide.getFirstname() + " " + guide.getLastname());			
					order_item_array.add(temp);
				} catch (Exception ex) {
					
				}
				
			}
			List<InvoiceItem> invoice_item_array = new ArrayList<InvoiceItem>();
			String sub_traces = booking.getSub_trace_array();
			String[] trace_array = sub_traces.split(",");
			float total_amount = 0;
			for (int i = 0; i < trace_array.length; i++) {
				try {
					int sub_trace_id = Integer.parseInt(trace_array[i]);
					SubTrace item = subtraceService.getById(sub_trace_id);
					InvoiceItem invoice_item = new InvoiceItem();
					invoice_item.setOrder_item_array(order_item_array);
					invoice_item.setQuantity(1);
					invoice_item.setItem_price(Utils.getPrice(item, booking.getCar_seat()));
					invoice_item.setTotal_price(Utils.getPrice(item, booking.getCar_seat()) * order_item_array.size());
					invoice_item.setTrace_id(item.getId());
					invoice_item.setTrace_name(item.getName());
					invoice_item_array.add(invoice_item);
					total_amount += invoice_item.getTotal_price();
				} catch (Exception ex) {
					
				}
			}
			
			viewmodel.setInvoice_item_array(invoice_item_array);
			model.addAttribute("invoice_model", viewmodel);
		} catch (Exception ex) {
			model.addAttribute("message", "not valid invoice id");
			return "redirect:/supplier/invoices";
		}
		
		return "supplier/detail-invoice";
	}
	
	@RequestMapping(value = "/generate-pdf")
	public String generatePDF(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		if (request.getParameter("invoice_id") == null) {
			model.addAttribute("message", "no invoice id");
			return "redirect:/supplier/invoices";
		}
		int invoice_id;
		Invoice cur_invoice;
		InvoiceViewModel viewmodel = new InvoiceViewModel();
		try {
			invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
			cur_invoice = invoiceService.getById(invoice_id);
			if (cur_invoice == null) {
				model.addAttribute("message", "not valid invoice id");
				return "redirect:/supplier/invoices";
			}
			
			int booking_id = cur_invoice.getBooking_id();
			String tour_code = cur_invoice.getTour_code();
			Tour tour = tourService.getTourByCode(tour_code);
			Booking booking = bookingService.getBookingById(booking_id);
			if (cur_invoice.getType() == GlobalConstants.INVOICE_TYPE_PAY) {
				viewmodel.setFrom_user(userService.getAdmin());
				viewmodel.setTo_user(userService.getUserById(cur_invoice.getUser_id()));
			} else {
				viewmodel.setFrom_user(userService.getUserById(cur_invoice.getUser_id()));
				viewmodel.setTo_user(userService.getAdmin());
			}
			
			viewmodel.setInvoice(cur_invoice);
			
			String cars = tour.getAssign_car_array();
			String guides = tour.getAssign_guide_array();
			String[] car_array = cars.split(",");
			String[] guide_array = guides.split(",");
			List<OrderItem> order_item_array = new ArrayList<OrderItem>();
			for (int i = 0; i < guide_array.length; i++) {
				try {
					int guide_id = Integer.parseInt(guide_array[i]);
					int car_id = Integer.parseInt(car_array[i]);
					Guide guide = guideService.getById(guide_id);
					Car car = carService.getById(car_id);
					OrderItem temp = new OrderItem();
					temp.setCar_id(car.getId());
					temp.setCar_name(car.getBrand() + " : " + car.getModel());
					temp.setCar_seat(car.getSeat());
					temp.setGuide_id(guide.getId());
					temp.setGuide_name(guide.getFirstname() + " " + guide.getLastname());			
					order_item_array.add(temp);
				} catch (Exception ex) {
					
				}
				
			}
			List<InvoiceItem> invoice_item_array = new ArrayList<InvoiceItem>();
			String sub_traces = booking.getSub_trace_array();
			String[] trace_array = sub_traces.split(",");
			float total_amount = 0;
			for (int i = 0; i < trace_array.length; i++) {
				try {
					int sub_trace_id = Integer.parseInt(trace_array[i]);
					SubTrace item = subtraceService.getById(sub_trace_id);
					InvoiceItem invoice_item = new InvoiceItem();
					invoice_item.setOrder_item_array(order_item_array);
					invoice_item.setQuantity(1);
					invoice_item.setItem_price(Utils.getPrice(item, booking.getCar_seat()));
					invoice_item.setTotal_price(Utils.getPrice(item, booking.getCar_seat()) * order_item_array.size());
					invoice_item.setTrace_id(item.getId());
					invoice_item.setTrace_name(item.getName());
					invoice_item_array.add(invoice_item);
					total_amount += invoice_item.getTotal_price();
				} catch (Exception ex) {
					
				}
			}
			
			viewmodel.setInvoice_item_array(invoice_item_array);
		} catch (Exception ex) {
			model.addAttribute("message", "not valid invoice id");
			return "redirect:/supplier/invoices";
		}

		String filename = Utils.getSaltString() + ".pdf";
		String path = request.getServletContext().getRealPath("download/invoice/") + filename;
		if (!Utils.generateInvoicePDF(path, viewmodel)) {
			/*
			File downloadFile = new File(path);
	        InputStream inputStream;
			try {
				inputStream = new FileInputStream(downloadFile);
				response.setContentType("application/pdf");
				
			    //	copy it to response's OutputStream
				org.apache.commons.io.IOUtils.copy(inputStream, response.getOutputStream());
				response.flushBuffer();
				inputStream.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException ex) {
				
			}
			*/
			return "redirect:/supplier/detail-invoice?invoice_id=" + invoice_id;
		}
		
		return "redirect:/download/invoice/" + filename;
	}
}
