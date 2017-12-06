package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Invoice;
import com.lebango.mapper.InvoiceMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class InvoiceService {
	
	@Autowired
	private InvoiceMapper invoiceMapper;
	
	public List<Invoice> getAll() {
		return invoiceMapper.getAll();
	}
	
	public Invoice getById(int id) {
		return invoiceMapper.getById(id);
	}
	
	public List<Invoice> getBySupplier(int supplier_id) {
		return invoiceMapper.getBySupplier(supplier_id);
	}
	
	public List<Invoice> getByAgent(int agent_id) {
		return invoiceMapper.getBySupplier(agent_id);
	}
	
	public void insert(Invoice invoice) {
		invoiceMapper.insert(invoice);
		return;
	}
	
	public void update(Invoice invoice) {
		invoiceMapper.update(invoice);
		return;
	}
	
	public void delete(Invoice invoice) {
		invoiceMapper.delete(invoice);
		return;
	}
}
