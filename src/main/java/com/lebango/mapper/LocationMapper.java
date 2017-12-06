package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Location;

public interface LocationMapper {
	List<Location> get();
	Location getById(int location_id);
	List<Location> getByState(int state_id);
}
