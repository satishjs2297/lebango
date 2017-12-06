package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.State;

public interface StateMapper {
	List<State> getAll();
	State getById(int state_id);
}
