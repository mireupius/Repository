package com.sol.mall.buying;

import java.math.BigDecimal;

public class Cart {
	private String sd_imageFileName;
	private BigDecimal sd_delivery_cost;
	private String sd_product_name;
	private String sd_option_info;
	private BigDecimal sd_amount;
	private BigDecimal sd_option_price;
	private BigDecimal sd_product_price;
	private BigDecimal sd_product_sellprice;
	private BigDecimal sd_total_price;
	private String sd_out_area;
	private String sd_product_no;
	private String sd_seller_id;

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(String sd_imageFileName, BigDecimal sd_delivery_cost, String sd_product_name, String sd_option_info,
			BigDecimal sd_amount, BigDecimal sd_option_price, BigDecimal sd_product_price,
			BigDecimal sd_product_sellprice, BigDecimal sd_total_price, String sd_out_area, String sd_product_no,
			String sd_seller_id) {
		super();
		this.sd_imageFileName = sd_imageFileName;
		this.sd_delivery_cost = sd_delivery_cost;
		this.sd_product_name = sd_product_name;
		this.sd_option_info = sd_option_info;
		this.sd_amount = sd_amount;
		this.sd_option_price = sd_option_price;
		this.sd_product_price = sd_product_price;
		this.sd_product_sellprice = sd_product_sellprice;
		this.sd_total_price = sd_total_price;
		this.sd_out_area = sd_out_area;
		this.sd_product_no = sd_product_no;
		this.sd_seller_id = sd_seller_id;
	}

	public String getSd_imageFileName() {
		return sd_imageFileName;
	}

	public void setSd_imageFileName(String sd_imageFileName) {
		this.sd_imageFileName = sd_imageFileName;
	}

	public BigDecimal getSd_delivery_cost() {
		return sd_delivery_cost;
	}

	public void setSd_delivery_cost(BigDecimal sd_delivery_cost) {
		this.sd_delivery_cost = sd_delivery_cost;
	}

	public String getSd_product_name() {
		return sd_product_name;
	}

	public void setSd_product_name(String sd_product_name) {
		this.sd_product_name = sd_product_name;
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

	public String getSd_out_area() {
		return sd_out_area;
	}

	public void setSd_out_area(String sd_out_area) {
		this.sd_out_area = sd_out_area;
	}

	public String getSd_product_no() {
		return sd_product_no;
	}

	public void setSd_product_no(String sd_product_no) {
		this.sd_product_no = sd_product_no;
	}

	public String getSd_seller_id() {
		return sd_seller_id;
	}

	public void setSd_seller_id(String sd_seller_id) {
		this.sd_seller_id = sd_seller_id;
	}

	//

}
