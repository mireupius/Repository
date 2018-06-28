package com.sol.mall.buying;

import java.util.Date;

public class Order {
	private String so_delivery_no;
	private String so_seller_id;
	private String so_customer_name;
	private String so_customer_id;
	private String so_taker_name;
	private String so_taker_phone;
	private String so_take_area;
	private String so_take_area_detail;
	private String so_customer_ph;
	private String so_postno;
	private Date so_order_date;
	private String so_pay_method;
	private String so_message;
	private String so_is_order;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(String so_delivery_no, String so_seller_id, String so_customer_name, String so_customer_id,
			String so_taker_name, String so_taker_phone, String so_take_area, String so_take_area_detail,
			String so_customer_ph, String so_postno, Date so_order_date, String so_pay_method, String so_message,
			String so_is_order) {
		super();
		this.so_delivery_no = so_delivery_no;
		this.so_seller_id = so_seller_id;
		this.so_customer_name = so_customer_name;
		this.so_customer_id = so_customer_id;
		this.so_taker_name = so_taker_name;
		this.so_taker_phone = so_taker_phone;
		this.so_take_area = so_take_area;
		this.so_take_area_detail = so_take_area_detail;
		this.so_customer_ph = so_customer_ph;
		this.so_postno = so_postno;
		this.so_order_date = so_order_date;
		this.so_pay_method = so_pay_method;
		this.so_message = so_message;
		this.so_is_order = so_is_order;
	}

	public String getSo_delivery_no() {
		return so_delivery_no;
	}

	public void setSo_delivery_no(String so_delivery_no) {
		this.so_delivery_no = so_delivery_no;
	}

	public String getSo_seller_id() {
		return so_seller_id;
	}

	public void setSo_seller_id(String so_seller_id) {
		this.so_seller_id = so_seller_id;
	}

	public String getSo_customer_name() {
		return so_customer_name;
	}

	public void setSo_customer_name(String so_customer_name) {
		this.so_customer_name = so_customer_name;
	}

	public String getSo_customer_id() {
		return so_customer_id;
	}

	public void setSo_customer_id(String so_customer_id) {
		this.so_customer_id = so_customer_id;
	}

	public String getSo_taker_name() {
		return so_taker_name;
	}

	public void setSo_taker_name(String so_taker_name) {
		this.so_taker_name = so_taker_name;
	}

	public String getSo_taker_phone() {
		return so_taker_phone;
	}

	public void setSo_taker_phone(String so_taker_phone) {
		this.so_taker_phone = so_taker_phone;
	}

	public String getSo_take_area() {
		return so_take_area;
	}

	public void setSo_take_area(String so_take_area) {
		this.so_take_area = so_take_area;
	}

	public String getSo_take_area_detail() {
		return so_take_area_detail;
	}

	public void setSo_take_area_detail(String so_take_area_detail) {
		this.so_take_area_detail = so_take_area_detail;
	}

	public String getSo_customer_ph() {
		return so_customer_ph;
	}

	public void setSo_customer_ph(String so_customer_ph) {
		this.so_customer_ph = so_customer_ph;
	}

	public String getSo_postno() {
		return so_postno;
	}

	public void setSo_postno(String so_postno) {
		this.so_postno = so_postno;
	}

	public Date getSo_order_date() {
		return so_order_date;
	}

	public void setSo_order_date(Date so_order_date) {
		this.so_order_date = so_order_date;
	}

	public String getSo_pay_method() {
		return so_pay_method;
	}

	public void setSo_pay_method(String so_pay_method) {
		this.so_pay_method = so_pay_method;
	}

	public String getSo_message() {
		return so_message;
	}

	public void setSo_message(String so_message) {
		this.so_message = so_message;
	}

	public String getSo_is_order() {
		return so_is_order;
	}

	public void setSo_is_order(String so_is_order) {
		this.so_is_order = so_is_order;
	}

}
