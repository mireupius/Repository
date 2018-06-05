package com.sol.mall.sale.delivery;

import java.math.BigDecimal;
import java.util.Date;

public class Delivery {
	private BigDecimal shp_o_order_pnum;
	private BigDecimal shp_o_order_num;
	private String shp_o_courier;
	private BigDecimal shp_o_invoice_num;
	private Date shp_o_delivery_done_date;
	private String shp_o_customer_name;
	private String shp_o_customer_id;
	private String shp_o_taker_name;
	private String shp_o_state;
	private String shp_o_state_detail;
	private BigDecimal shp_o_delivery_cost;
	private BigDecimal shp_o_product_num;
	private String shp_o_product_name;
	private String shp_o_option_type;
	private String shp_o_option_info;
	private BigDecimal shp_o_amount;
	private BigDecimal shp_o_option_price;
	private BigDecimal shp_o_product_price;
	private BigDecimal shp_o_product_sellprice;
	private BigDecimal shp_o_total_price;
	private Date shp_o_check_date;
	private String shp_o_taker_ph;
	private String shp_o_take_area;
	private String shp_o_customer_ph;
	private BigDecimal shp_o_postnum;
	private String shp_o_message;
	private String shp_o_out_area;
	private Date shp_o_date;
	private String shp_o_claim;
	private String shp_o_pay_method;

	public Delivery() {
		// TODO Auto-generated constructor stub
	}

	public Delivery(BigDecimal shp_o_order_pnum, BigDecimal shp_o_order_num, String shp_o_courier,
			BigDecimal shp_o_invoice_num, Date shp_o_delivery_done_date, String shp_o_customer_name,
			String shp_o_customer_id, String shp_o_taker_name, String shp_o_state, String shp_o_state_detail,
			BigDecimal shp_o_delivery_cost, BigDecimal shp_o_product_num, String shp_o_product_name,
			String shp_o_option_type, String shp_o_option_info, BigDecimal shp_o_amount, BigDecimal shp_o_option_price,
			BigDecimal shp_o_product_price, BigDecimal shp_o_product_sellprice, BigDecimal shp_o_total_price,
			Date shp_o_check_date, String shp_o_taker_ph, String shp_o_take_area, String shp_o_customer_ph,
			BigDecimal shp_o_postnum, String shp_o_message, String shp_o_out_area, Date shp_o_date, String shp_o_claim,
			String shp_o_pay_method) {
		super();
		this.shp_o_order_pnum = shp_o_order_pnum;
		this.shp_o_order_num = shp_o_order_num;
		this.shp_o_courier = shp_o_courier;
		this.shp_o_invoice_num = shp_o_invoice_num;
		this.shp_o_delivery_done_date = shp_o_delivery_done_date;
		this.shp_o_customer_name = shp_o_customer_name;
		this.shp_o_customer_id = shp_o_customer_id;
		this.shp_o_taker_name = shp_o_taker_name;
		this.shp_o_state = shp_o_state;
		this.shp_o_state_detail = shp_o_state_detail;
		this.shp_o_delivery_cost = shp_o_delivery_cost;
		this.shp_o_product_num = shp_o_product_num;
		this.shp_o_product_name = shp_o_product_name;
		this.shp_o_option_type = shp_o_option_type;
		this.shp_o_option_info = shp_o_option_info;
		this.shp_o_amount = shp_o_amount;
		this.shp_o_option_price = shp_o_option_price;
		this.shp_o_product_price = shp_o_product_price;
		this.shp_o_product_sellprice = shp_o_product_sellprice;
		this.shp_o_total_price = shp_o_total_price;
		this.shp_o_check_date = shp_o_check_date;
		this.shp_o_taker_ph = shp_o_taker_ph;
		this.shp_o_take_area = shp_o_take_area;
		this.shp_o_customer_ph = shp_o_customer_ph;
		this.shp_o_postnum = shp_o_postnum;
		this.shp_o_message = shp_o_message;
		this.shp_o_out_area = shp_o_out_area;
		this.shp_o_date = shp_o_date;
		this.shp_o_claim = shp_o_claim;
		this.shp_o_pay_method = shp_o_pay_method;
	}

	public BigDecimal getShp_o_order_pnum() {
		return shp_o_order_pnum;
	}

	public void setShp_o_order_pnum(BigDecimal shp_o_order_pnum) {
		this.shp_o_order_pnum = shp_o_order_pnum;
	}

	public BigDecimal getShp_o_order_num() {
		return shp_o_order_num;
	}

	public void setShp_o_order_num(BigDecimal shp_o_order_num) {
		this.shp_o_order_num = shp_o_order_num;
	}

	public String getShp_o_courier() {
		return shp_o_courier;
	}

	public void setShp_o_courier(String shp_o_courier) {
		this.shp_o_courier = shp_o_courier;
	}

	public BigDecimal getShp_o_invoice_num() {
		return shp_o_invoice_num;
	}

	public void setShp_o_invoice_num(BigDecimal shp_o_invoice_num) {
		this.shp_o_invoice_num = shp_o_invoice_num;
	}

	public Date getShp_o_delivery_done_date() {
		return shp_o_delivery_done_date;
	}

	public void setShp_o_delivery_done_date(Date shp_o_delivery_done_date) {
		this.shp_o_delivery_done_date = shp_o_delivery_done_date;
	}

	public String getShp_o_customer_name() {
		return shp_o_customer_name;
	}

	public void setShp_o_customer_name(String shp_o_customer_name) {
		this.shp_o_customer_name = shp_o_customer_name;
	}

	public String getShp_o_customer_id() {
		return shp_o_customer_id;
	}

	public void setShp_o_customer_id(String shp_o_customer_id) {
		this.shp_o_customer_id = shp_o_customer_id;
	}

	public String getShp_o_taker_name() {
		return shp_o_taker_name;
	}

	public void setShp_o_taker_name(String shp_o_taker_name) {
		this.shp_o_taker_name = shp_o_taker_name;
	}

	public String getShp_o_state() {
		return shp_o_state;
	}

	public void setShp_o_state(String shp_o_state) {
		this.shp_o_state = shp_o_state;
	}

	public String getShp_o_state_detail() {
		return shp_o_state_detail;
	}

	public void setShp_o_state_detail(String shp_o_state_detail) {
		this.shp_o_state_detail = shp_o_state_detail;
	}

	public BigDecimal getShp_o_delivery_cost() {
		return shp_o_delivery_cost;
	}

	public void setShp_o_delivery_cost(BigDecimal shp_o_delivery_cost) {
		this.shp_o_delivery_cost = shp_o_delivery_cost;
	}

	public BigDecimal getShp_o_product_num() {
		return shp_o_product_num;
	}

	public void setShp_o_product_num(BigDecimal shp_o_product_num) {
		this.shp_o_product_num = shp_o_product_num;
	}

	public String getShp_o_product_name() {
		return shp_o_product_name;
	}

	public void setShp_o_product_name(String shp_o_product_name) {
		this.shp_o_product_name = shp_o_product_name;
	}

	public String getShp_o_option_type() {
		return shp_o_option_type;
	}

	public void setShp_o_option_type(String shp_o_option_type) {
		this.shp_o_option_type = shp_o_option_type;
	}

	public String getShp_o_option_info() {
		return shp_o_option_info;
	}

	public void setShp_o_option_info(String shp_o_option_info) {
		this.shp_o_option_info = shp_o_option_info;
	}

	public BigDecimal getShp_o_amount() {
		return shp_o_amount;
	}

	public void setShp_o_amount(BigDecimal shp_o_amount) {
		this.shp_o_amount = shp_o_amount;
	}

	public BigDecimal getShp_o_option_price() {
		return shp_o_option_price;
	}

	public void setShp_o_option_price(BigDecimal shp_o_option_price) {
		this.shp_o_option_price = shp_o_option_price;
	}

	public BigDecimal getShp_o_product_price() {
		return shp_o_product_price;
	}

	public void setShp_o_product_price(BigDecimal shp_o_product_price) {
		this.shp_o_product_price = shp_o_product_price;
	}

	public BigDecimal getShp_o_product_sellprice() {
		return shp_o_product_sellprice;
	}

	public void setShp_o_product_sellprice(BigDecimal shp_o_product_sellprice) {
		this.shp_o_product_sellprice = shp_o_product_sellprice;
	}

	public BigDecimal getShp_o_total_price() {
		return shp_o_total_price;
	}

	public void setShp_o_total_price(BigDecimal shp_o_total_price) {
		this.shp_o_total_price = shp_o_total_price;
	}

	public Date getShp_o_check_date() {
		return shp_o_check_date;
	}

	public void setShp_o_check_date(Date shp_o_check_date) {
		this.shp_o_check_date = shp_o_check_date;
	}

	public String getShp_o_taker_ph() {
		return shp_o_taker_ph;
	}

	public void setShp_o_taker_ph(String shp_o_taker_ph) {
		this.shp_o_taker_ph = shp_o_taker_ph;
	}

	public String getShp_o_take_area() {
		return shp_o_take_area;
	}

	public void setShp_o_take_area(String shp_o_take_area) {
		this.shp_o_take_area = shp_o_take_area;
	}

	public String getShp_o_customer_ph() {
		return shp_o_customer_ph;
	}

	public void setShp_o_customer_ph(String shp_o_customer_ph) {
		this.shp_o_customer_ph = shp_o_customer_ph;
	}

	public BigDecimal getShp_o_postnum() {
		return shp_o_postnum;
	}

	public void setShp_o_postnum(BigDecimal shp_o_postnum) {
		this.shp_o_postnum = shp_o_postnum;
	}

	public String getShp_o_message() {
		return shp_o_message;
	}

	public void setShp_o_message(String shp_o_message) {
		this.shp_o_message = shp_o_message;
	}

	public String getShp_o_out_area() {
		return shp_o_out_area;
	}

	public void setShp_o_out_area(String shp_o_out_area) {
		this.shp_o_out_area = shp_o_out_area;
	}

	public Date getShp_o_date() {
		return shp_o_date;
	}

	public void setShp_o_date(Date shp_o_date) {
		this.shp_o_date = shp_o_date;
	}

	public String getShp_o_claim() {
		return shp_o_claim;
	}

	public void setShp_o_claim(String shp_o_claim) {
		this.shp_o_claim = shp_o_claim;
	}

	public String getShp_o_pay_method() {
		return shp_o_pay_method;
	}

	public void setShp_o_pay_method(String shp_o_pay_method) {
		this.shp_o_pay_method = shp_o_pay_method;
	}

}
