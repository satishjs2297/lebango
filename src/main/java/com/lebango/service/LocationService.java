package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Location;
import com.lebango.mapper.LocationMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class LocationService {
	
	@Autowired
	private LocationMapper locationMapper;
	
	public List<Location> get() {
		return locationMapper.get();
	}
	
	public Location getById(int location_id) {
		return locationMapper.getById(location_id);
	}

	public List<Location> getByState(int state_id) {
		return locationMapper.getByState(state_id);
	}
}
