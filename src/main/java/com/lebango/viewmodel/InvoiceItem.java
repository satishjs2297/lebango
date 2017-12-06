package com.lebango.viewmodel;

import java.util.List;

public class InvoiceItem {
	
	private int trace_id;
	
	private String trace_name;
	
	private int quantity;
	
	private float item_price;
	
	private float total_price;
	
	private List<OrderItem> order_item_array;
	
	public int getTrace_id() {
		return trace_id;
	}

	public void setTrace_id(int trace_id) {
		this.trace_id = trace_id;
	}

	public String getTrace_name() {
		return trace_name;
	}

	public void setTrace_name(String trace_name) {
		this.trace_name = trace_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public float getItem_price() {
		return item_price;
	}

	public void setItem_price(float item_price) {
		this.item_price = item_price;
	}

	public float getTotal_price() {
		return total_price;
	}

	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}

	public List<OrderItem> getOrder_item_array() {
		return order_item_array;
	}

	public void setOrder_item_array(List<OrderItem> order_item_array) {
		this.order_item_array = order_item_array;
	}
}
