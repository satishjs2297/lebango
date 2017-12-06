package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Invoice;

public interface InvoiceMapper {
	List<Invoice> getAll();
	List<Invoice> getBySupplier(int supplier_id);
	List<Invoice> getByAgent(int agent_id);
	void insert(Invoice invoice);
	void update(Invoice invoice);
	void delete(Invoice invoice);
	Invoice getById(int id);
}
