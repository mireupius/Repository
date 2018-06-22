package com.sol.mall.member;

import java.util.List;

public class Customers {
	
	private List<Customer> customer;
	
	public Customers() {
		// TODO Auto-generated constructor stub
	}

	public Customers(List<Customer> customer) {
		super();
		this.customer = customer;
	}

	public List<Customer> getCustomer() {
		return customer;
	}

	public void setCustomer(List<Customer> customer) {
		this.customer = customer;
	}
	
}
