package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.SupplierRegister;

public interface SupplierRegisterMapper {
	 void insert(SupplierRegister supplierRegister);
	 void update(SupplierRegister supplierRegister);
	 void delete(SupplierRegister supplierRegister);
	 List<SupplierRegister> getBySupplier(int supplier_id);
	 List<SupplierRegister> getAll();
	 int getMaxId();
}
