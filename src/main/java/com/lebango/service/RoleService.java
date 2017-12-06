package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Role;
import com.lebango.mapper.RoleMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> loadRoles() {
		return roleMapper.loadRoles();
	}
}
