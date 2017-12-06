package com.lebango.service;

import com.lebango.bean.User;
import com.lebango.mapper.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User getUserById(int user_id) {
		return userMapper.getUserById(user_id);
	}

	public void insert(User user) throws Exception {
		userMapper.insert(user);
		return;
	}
	
	public User findByEmailAndPassword(User user) {
		return userMapper.findByEmailAndPassword(user);
	}
	
	public User getAdmin() {
		return userMapper.getAdmin();
	}
	
	public Boolean isExisting(User user) {
		int count = userMapper.checkExisting(user);
		if (count > 0) 
			return true;
		else 
			return false;
	}
	
	public void updateProfile(User user) throws Exception {
		userMapper.updateProfile(user);
		return;
	}
	
	public void updateApprove(User user) throws Exception {
		userMapper.updateApprove(user);
		return;
	}
}