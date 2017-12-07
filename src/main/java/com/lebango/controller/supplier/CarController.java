package com.lebango.controller.supplier;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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

import com.lebango.bean.Car;
import com.lebango.bean.CarHour;
import com.lebango.bean.Document;
import com.lebango.bean.Location;
import com.lebango.bean.User;
import com.lebango.service.CarHourService;
import com.lebango.service.CarService;
import com.lebango.service.DocumentService;
import com.lebango.service.LocationService;
import com.lebango.service.TourService;
import com.lebango.service.UserService;
import com.lebango.util.GlobalConstants;
import com.lebango.util.Utils;
import com.lebango.viewmodel.CarEntity;
import com.lebango.viewmodel.CarUploadForm;

@Controller
@RequestMapping("/supplier")
public class CarController {

	@Autowired
	private UserService userService;

	@Autowired
	private CarService carService;

	@Autowired
	private CarHourService carHourService;

	@Autowired
	private DocumentService documentService;

	@Autowired
	private LocationService locationService;
	
	@Autowired
	private TourService tourService;

	@RequestMapping(value = "/manage-car")
	public String showManageCar(Model model, HttpSession session) {

		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}

		List<Car> cars = carService.getBySupplier(currentUser.getId());
		if (cars.size() > 0) {
			List<CarEntity> cars_viewmodels = new ArrayList<CarEntity>();
			for (int i = 0; i < cars.size(); i++) {
				Car item = cars.get(i);
				Document document = new Document();
				document.setCategory(GlobalConstants.DOCUMENT_CATEGORY_CAR);
				document.setRefer_id(item.getId());
				List<Document> documents = documentService.get(document);
				CarEntity temp = new CarEntity();
				temp.setCar(item);
				temp.setPhoto_array(documents);
				cars_viewmodels.add(temp);
			}

			model.addAttribute("cars", cars_viewmodels);
		}

		return "supplier/manage-car";
	}

	@RequestMapping(value = "/add-car")
	public String showAddCar(Model model, HttpSession session) {

		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}

		// prepare location list
		Map<Integer, String> locationList = getLocationList(session);

		Map<Integer, String> seatList = getSeatNumberList();

		model.addAttribute("uploadForm", new CarUploadForm());
		model.addAttribute("locationList", locationList);
		model.addAttribute("seatList", seatList);

		return "supplier/add-car";
	}

	private Map<Integer, String> getSeatNumberList() {
		// prepare seat number list
		Map<Integer, String> seatList = new LinkedHashMap<Integer, String>();
		int[] seat_array = GlobalConstants.SEAT_NUMBER;
		for (int i = 0; i < seat_array.length; i++) {
			seatList.put(seat_array[i], seat_array[i] + "s");
		}
		return seatList;
	}

	private Map<Integer, String> getLocationList(HttpSession session) {
		Map<Integer, String> locationList = new LinkedHashMap<Integer, String>();
		List<Location> locations;
		locations = (List<Location>) session.getAttribute(GlobalConstants.SESSION_LOCATIONS);
		if (locations == null || locations.size() == 0) {
			locations = locationService.get();
			session.setAttribute(GlobalConstants.SESSION_LOCATIONS, locations);
		}

		for (int i = 0; i < locations.size(); i++) {
			locationList.put(locations.get(i).getId(), locations.get(i).getName());
		}
		return locationList;
	}

	@RequestMapping(value = "/register-car", method = RequestMethod.POST)
	public String registerCar(@ModelAttribute CarUploadForm uploadForm, Model model, HttpSession session,
			HttpServletRequest request) {
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}

		if (uploadForm != null) {
			Car new_car = new Car();
			new_car.setBrand(uploadForm.getBrand());
			new_car.setCreated_at(new Timestamp(System.currentTimeMillis()));
			new_car.setUpdated_at(new Timestamp(System.currentTimeMillis()));
			new_car.setLocation_id(uploadForm.getLocation_id());
			new_car.setModel(uploadForm.getModel());
			new_car.setNumber(uploadForm.getNumber());
			new_car.setProduct_year(uploadForm.getProduct_year());
			new_car.setSeat(uploadForm.getSeat());
			new_car.setSupplier_id(currentUser.getId());

			carService.insert(new_car);
			int car_id = carService.getMaxId();
			MultipartFile file = null;
			file = uploadForm.getCar_back_image();
			if (!file.isEmpty()) {
				String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
				String path = request.getServletContext().getRealPath("upload/car/") + filename;
				this.saveDocumentImage(GlobalConstants.CAR_BACK_IMAGE, filename, file, car_id, path);
			}
			file = uploadForm.getCar_body_image();
			if (!file.isEmpty()) {
				String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
				String path = request.getServletContext().getRealPath("upload/car/") + filename;
				this.saveDocumentImage(GlobalConstants.CAR_BODY_IMAGE, filename, file, car_id, path);
			}
			file = uploadForm.getCar_inner_image();
			if (!file.isEmpty()) {
				String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
				String path = request.getServletContext().getRealPath("upload/car/") + filename;
				this.saveDocumentImage(GlobalConstants.CAR_INNER_IMAGE, filename, file, car_id, path);
			}
			file = uploadForm.getCar_front_image();
			if (!file.isEmpty()) {
				String filename = Utils.getSaltString() + "." + FilenameUtils.getExtension(file.getOriginalFilename());
				String path = request.getServletContext().getRealPath("upload/car/") + filename;
				this.saveDocumentImage(GlobalConstants.CAR_FRONT_IMAGE, filename, file, car_id, path);
			}

			model.addAttribute("message", "Successfully, registered new car.");
		} else {
			model.addAttribute("message", "Form data is empty");
		}

		return "redirect:/supplier/add-car";
	}

	void saveDocumentImage(String type, String filename, MultipartFile file, int refer_id, String path) {
		Document document = new Document();
		document.setCategory(GlobalConstants.DOCUMENT_CATEGORY_CAR);
		document.setCreated_at(new Timestamp(System.currentTimeMillis()));
		document.setUpdated_at(new Timestamp(System.currentTimeMillis()));
		document.setRefer_id(refer_id);
		document.setType(GlobalConstants.DOCUMENT_TYPE_PHOTO);

		File destfile = new File(path);
		// Save the bytes to a file.
		try {
			FileUtils.writeByteArrayToFile(destfile, file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		document.setUrl("/upload/car/" + filename);
		document.setName(type);
		documentService.insert(document);
	}

	@RequestMapping(value = "/viewcar")
	public String viewCar(Model model, HttpSession session, HttpServletRequest request) {

		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}

		if (request.getParameter("id") == null) {
			return "redirect:/manage-car";
		}
		try {
			CarEntity temp = getSelectedCarInfo(request);
			model.addAttribute("carEntity", temp);			
			model.addAttribute("locationList", getLocationList(session));
			model.addAttribute("seatList", getSeatNumberList());
		} catch (Exception e) {
			return "redirect:/manage-car";
		}
		return "supplier/view-car";
	}

	@RequestMapping(value = "/edit-car")
	public String showEditCar(Model model, HttpServletRequest request) {

		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		try {
			CarEntity temp = getSelectedCarInfo(request);
			model.addAttribute("carEntity", temp);
			model.addAttribute("locationList", getLocationList(request.getSession()));
			model.addAttribute("seatList", getSeatNumberList());
		} catch (Exception e) {
			return "redirect:/manage-car";
		}
		return "supplier/edit-car";
	}
	
	@RequestMapping(value = "/delete-car")
	public String deleteCar(HttpServletRequest request) {
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		if (currentUser == null) {
			return "redirect:/login";
		}
		int car_id = Integer.parseInt(request.getParameter("car_id"));
		carService.deleteCarById(car_id);
		return "redirect:/supplier/manage-car";
	}
	
	private CarEntity getSelectedCarInfo(HttpServletRequest request) {
		int car_id = Integer.parseInt(request.getParameter("id"));
		Car car = carService.getById(car_id);
		Document document = new Document();
		document.setCategory(GlobalConstants.DOCUMENT_CATEGORY_CAR);
		document.setRefer_id(car.getId());
		List<Document> documents = documentService.get(document);
		CarEntity temp = new CarEntity();
		if (!documents.isEmpty())
			temp.setPhoto_array(documents);
		List<CarHour> carhour_array = carHourService.get(car_id);
		if (!carhour_array.isEmpty()) {
			temp.setCarhour_array(carhour_array);
		}
		car.setTours(tourService.getToursByCarId(String.valueOf(car_id)));
		temp.setCar(car);
		return temp;
	}
	
}
