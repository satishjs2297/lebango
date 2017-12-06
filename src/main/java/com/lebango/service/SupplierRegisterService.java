package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.SupplierRegister;
import com.lebango.mapper.SupplierRegisterMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class SupplierRegisterService {
	
	@Autowired
	private SupplierRegisterMapper supplierRegisterMapper;
	
	public void insert(SupplierRegister supplierRegister) {
		supplierRegisterMapper.insert(supplierRegister);
		return;
	}
	
	public List<SupplierRegister> getBySupplier(int supplier_id) {
		return supplierRegisterMapper.getBySupplier(supplier_id);
	}
	
	public void update(SupplierRegister supplierRegister) {
		supplierRegisterMapper.update(supplierRegister);
		return;
	}
	
	public List<SupplierRegister> getAll() {
		return supplierRegisterMapper.getAll();
	}
	
	public int getMaxId() {
		return supplierRegisterMapper.getMaxId();
	}
}
