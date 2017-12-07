package com.lebango.viewmodel;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lebango.bean.GuideHour;
import com.lebango.bean.Tour;

public class GuideUploadForm {
	
	private String firstname;
	
	private String lastname;

	private MultipartFile photo;
	
	private String birthday;
	
	private int gender;
	
	private String description;
	
	private List<Tour> tours;
	private List<GuideHour> guideHour_array;

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Tour> getTours() {
		return tours;
	}

	public void setTours(List<Tour> tours) {
		this.tours = tours;
	}

	public List<GuideHour> getGuideHour_array() {
		return guideHour_array;
	}

	public void setGuideHour_array(List<GuideHour> guideHour_array) {
		this.guideHour_array = guideHour_array;
	}
		
}
