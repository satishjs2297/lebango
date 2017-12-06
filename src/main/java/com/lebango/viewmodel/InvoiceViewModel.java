package com.lebango.viewmodel;

import java.util.List;

import com.lebango.bean.Invoice;
import com.lebango.bean.User;

public class InvoiceViewModel {

	private Invoice invoice;
	
	private User from_user;
	
	private User to_user;
	
	private List<InvoiceItem> invoice_item_array;
	
	private String pay_address;

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public User getFrom_user() {
		return from_user;
	}

	public void setFrom_user(User from_user) {
		this.from_user = from_user;
	}

	public User getTo_user() {
		return to_user;
	}

	public void setTo_user(User to_user) {
		this.to_user = to_user;
	}

	public List<InvoiceItem> getInvoice_item_array() {
		return invoice_item_array;
	}

	public void setInvoice_item_array(List<InvoiceItem> invoice_item_array) {
		this.invoice_item_array = invoice_item_array;
	}

	public String getPay_address() {
		return pay_address;
	}

	public void setPay_address(String pay_address) {
		this.pay_address = pay_address;
	}
}
