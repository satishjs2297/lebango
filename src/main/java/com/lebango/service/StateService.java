package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.State;
import com.lebango.mapper.StateMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class StateService {
	
	@Autowired
	private StateMapper stateMapper;
	
	public List<State> getAll() {
		return stateMapper.getAll();
	}
	public State getById(int state_id) {
		return stateMapper.getById(state_id);
	}
	
}
