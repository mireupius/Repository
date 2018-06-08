package com.sol.mall.sale.delivery;

import java.math.BigDecimal;
import java.util.Date;

public class Delivery {
	private String sd_delivery_pno;
	private String sd_delivery_no;
	private String sd_courier;
	private String sd_invoice_no;
	private Date sd_delivery_done_date;
	private String sd_customer_name;
	private String sd_customer_id;
	private String sd_taker_name;
	private String sd_delivery_state;
	private String sd_state_detail;
	private BigDecimal sd_delivery_cost;
	private String sd_product_no;
	private String sd_product_name;
	private String sd_option_type;
	private String sd_option_info;
	private BigDecimal sd_amount;
	private BigDecimal sd_option_price;
	private BigDecimal sd_product_price;
	private BigDecimal sd_product_sellprice;
	private BigDecimal sd_total_price;
	private Date sd_check_date;
	private String sd_taker_phone;
	private String sd_take_area;
	private String sd_customer_ph;
	private String sd_postno;
	private String sd_message;
	private String sd_out_area;
	private Date sd_order_date;
	private String sd_claim;
	private String sd_pay_method;

	public Delivery() {
		// TODO Auto-generated constructor stub
	}

	public Delivery(String sd_delivery_pno, String sd_delivery_no, String sd_courier, String sd_invoice_no,
			Date sd_delivery_done_date, String sd_customer_name, String sd_customer_id, String sd_taker_name,
			String sd_delivery_state, String sd_state_detail, BigDecimal sd_delivery_cost, String sd_product_no,
			String sd_product_name, String sd_option_type, String sd_option_info, BigDecimal sd_amount,
			BigDecimal sd_option_price, BigDecimal sd_product_price, BigDecimal sd_product_sellprice,
			BigDecimal sd_total_price, Date sd_check_date, String sd_taker_phone, String sd_take_area,
			String sd_customer_ph, String sd_postno, String sd_message, String sd_out_area, Date sd_order_date,
			String sd_claim, String sd_pay_method) {
		super();
		this.sd_delivery_pno = sd_delivery_pno;
		this.sd_delivery_no = sd_delivery_no;
		this.sd_courier = sd_courier;
		this.sd_invoice_no = sd_invoice_no;
		this.sd_delivery_done_date = sd_delivery_done_date;
		this.sd_customer_name = sd_customer_name;
		this.sd_customer_id = sd_customer_id;
		this.sd_taker_name = sd_taker_name;
		this.sd_delivery_state = sd_delivery_state;
		this.sd_state_detail = sd_state_detail;
		this.sd_delivery_cost = sd_delivery_cost;
		this.sd_product_no = sd_product_no;
		this.sd_product_name = sd_product_name;
		this.sd_option_type = sd_option_type;
		this.sd_option_info = sd_option_info;
		this.sd_amount = sd_amount;
		this.sd_option_price = sd_option_price;
		this.sd_product_price = sd_product_price;
		this.sd_product_sellprice = sd_product_sellprice;
		this.sd_total_price = sd_total_price;
		this.sd_check_date = sd_check_date;
		this.sd_taker_phone = sd_taker_phone;
		this.sd_take_area = sd_take_area;
		this.sd_customer_ph = sd_customer_ph;
		this.sd_postno = sd_postno;
		this.sd_message = sd_message;
		this.sd_out_area = sd_out_area;
		this.sd_order_date = sd_order_date;
		this.sd_claim = sd_claim;
		this.sd_pay_method = sd_pay_method;
	}

	public String getSd_delivery_pno() {
		return sd_delivery_pno;
	}

	public void setSd_delivery_pno(String sd_delivery_pno) {
		this.sd_delivery_pno = sd_delivery_pno;
	}

	public String getSd_delivery_no() {
		return sd_delivery_no;
	}

	public void setSd_delivery_no(String sd_delivery_no) {
		this.sd_delivery_no = sd_delivery_no;
	}

	public String getSd_courier() {
		return sd_courier;
	}

	public void setSd_courier(String sd_courier) {
		this.sd_courier = sd_courier;
	}

	public String getSd_invoice_no() {
		return sd_invoice_no;
	}

	public void setSd_invoice_no(String sd_invoice_no) {
		this.sd_invoice_no = sd_invoice_no;
	}

	public Date getSd_delivery_done_date() {
		return sd_delivery_done_date;
	}

	public void setSd_delivery_done_date(Date sd_delivery_done_date) {
		this.sd_delivery_done_date = sd_delivery_done_date;
	}

	public String getSd_customer_name() {
		return sd_customer_name;
	}

	public void setSd_customer_name(String sd_customer_name) {
		this.sd_customer_name = sd_customer_name;
	}

	public String getSd_customer_id() {
		return sd_customer_id;
	}

	public void setSd_customer_id(String sd_customer_id) {
		this.sd_customer_id = sd_customer_id;
	}

	public String getSd_taker_name() {
		return sd_taker_name;
	}

	public void setSd_taker_name(String sd_taker_name) {
		this.sd_taker_name = sd_taker_name;
	}

	public String getSd_delivery_state() {
		return sd_delivery_state;
	}

	public void setSd_delivery_state(String sd_delivery_state) {
		this.sd_delivery_state = sd_delivery_state;
	}

	public String getSd_state_detail() {
		return sd_state_detail;
	}

	public void setSd_state_detail(String sd_state_detail) {
		this.sd_state_detail = sd_state_detail;
	}

	public BigDecimal getSd_delivery_cost() {
		return sd_delivery_cost;
	}

	public void setSd_delivery_cost(BigDecimal sd_delivery_cost) {
		this.sd_delivery_cost = sd_delivery_cost;
	}

	public String getSd_product_no() {
		return sd_product_no;
	}

	public void setSd_product_no(String sd_product_no) {
		this.sd_product_no = sd_product_no;
	}

	public String getSd_product_name() {
		return sd_product_name;
	}

	public void setSd_product_name(String sd_product_name) {
		this.sd_product_name = sd_product_name;
	}

	public String getSd_option_type() {
		return sd_option_type;
	}

	public void setSd_option_type(String sd_option_type) {
		this.sd_option_type = sd_option_type;
	}

	public String getSd_option_info() {
		return sd_option_info;
	}

	public void setSd_option_info(String sd_option_info) {
		this.sd_option_info = sd_option_info;
	}

	public BigDecimal getSd_amount() {
		return sd_amount;
	}

	public void setSd_amount(BigDecimal sd_amount) {
		this.sd_amount = sd_amount;
	}

	public BigDecimal getSd_option_price() {
		return sd_option_price;
	}

	public void setSd_option_price(BigDecimal sd_option_price) {
		this.sd_option_price = sd_option_price;
	}

	public BigDecimal getSd_product_price() {
		return sd_product_price;
	}

	public void setSd_product_price(BigDecimal sd_product_price) {
		this.sd_product_price = sd_product_price;
	}

	public BigDecimal getSd_product_sellprice() {
		return sd_product_sellprice;
	}

	public void setSd_product_sellprice(BigDecimal sd_product_sellprice) {
		this.sd_product_sellprice = sd_product_sellprice;
	}

	public BigDecimal getSd_total_price() {
		return sd_total_price;
	}

	public void setSd_total_price(BigDecimal sd_total_price) {
		this.sd_total_price = sd_total_price;
	}

	public Date getSd_check_date() {
		return sd_check_date;
	}

	public void setSd_check_date(Date sd_check_date) {
		this.sd_check_date = sd_check_date;
	}

	public String getSd_taker_phone() {
		return sd_taker_phone;
	}

	public void setSd_taker_phone(String sd_taker_phone) {
		this.sd_taker_phone = sd_taker_phone;
	}

	public String getSd_take_area() {
		return sd_take_area;
	}

	public void setSd_take_area(String sd_take_area) {
		this.sd_take_area = sd_take_area;
	}

	public String getSd_customer_ph() {
		return sd_customer_ph;
	}

	public void setSd_customer_ph(String sd_customer_ph) {
		this.sd_customer_ph = sd_customer_ph;
	}

	public String getSd_postno() {
		return sd_postno;
	}

	public void setSd_postno(String sd_postno) {
		this.sd_postno = sd_postno;
	}

	public String getSd_message() {
		return sd_message;
	}

	public void setSd_message(String sd_message) {
		this.sd_message = sd_message;
	}

	public String getSd_out_area() {
		return sd_out_area;
	}

	public void setSd_out_area(String sd_out_area) {
		this.sd_out_area = sd_out_area;
	}

	public Date getSd_order_date() {
		return sd_order_date;
	}

	public void setSd_order_date(Date sd_order_date) {
		this.sd_order_date = sd_order_date;
	}

	public String getSd_claim() {
		return sd_claim;
	}

	public void setSd_claim(String sd_claim) {
		this.sd_claim = sd_claim;
	}

	public String getSd_pay_method() {
		return sd_pay_method;
	}

	public void setSd_pay_method(String sd_pay_method) {
		this.sd_pay_method = sd_pay_method;
	}

}
