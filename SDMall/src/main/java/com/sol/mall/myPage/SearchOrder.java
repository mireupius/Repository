package com.sol.mall.myPage;

import java.math.BigDecimal;
import java.util.Date;

public class SearchOrder {
	
	private String sd_customer_id;
	private String sd_seller_id;
	private Date sd_order_date;
	private String sd_claim;
	private String sd_delivery_state;
	private String sd_delivery_pno;
	private String sd_delivery_no;
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
	private String sd_message;
	private	String	gd_no;
	private	String	gd_imgl;
	private	String	gd_imgm;
	private	String	gd_imgs;
	private	String	gd_imgss;
	
	public SearchOrder() {
		// TODO Auto-generated constructor stub
	}

	public SearchOrder(String sd_customer_id, String sd_seller_id, Date sd_order_date, String sd_claim,
			String sd_delivery_state, String sd_delivery_pno, String sd_delivery_no, String sd_product_no,
			String sd_product_name, String sd_option_type, String sd_option_info, BigDecimal sd_amount,
			BigDecimal sd_option_price, BigDecimal sd_product_price, BigDecimal sd_product_sellprice,
			BigDecimal sd_total_price, Date sd_check_date, String sd_message, String gd_no, String gd_imgl,
			String gd_imgm, String gd_imgs, String gd_imgss) {
		super();
		this.sd_customer_id = sd_customer_id;
		this.sd_seller_id = sd_seller_id;
		this.sd_order_date = sd_order_date;
		this.sd_claim = sd_claim;
		this.sd_delivery_state = sd_delivery_state;
		this.sd_delivery_pno = sd_delivery_pno;
		this.sd_delivery_no = sd_delivery_no;
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
		this.sd_message = sd_message;
		this.gd_no = gd_no;
		this.gd_imgl = gd_imgl;
		this.gd_imgm = gd_imgm;
		this.gd_imgs = gd_imgs;
		this.gd_imgss = gd_imgss;
	}

	public String getSd_customer_id() {
		return sd_customer_id;
	}

	public void setSd_customer_id(String sd_customer_id) {
		this.sd_customer_id = sd_customer_id;
	}

	public String getSd_seller_id() {
		return sd_seller_id;
	}

	public void setSd_seller_id(String sd_seller_id) {
		this.sd_seller_id = sd_seller_id;
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

	public String getSd_delivery_state() {
		return sd_delivery_state;
	}

	public void setSd_delivery_state(String sd_delivery_state) {
		this.sd_delivery_state = sd_delivery_state;
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

	public String getSd_message() {
		return sd_message;
	}

	public void setSd_message(String sd_message) {
		this.sd_message = sd_message;
	}

	public String getGd_no() {
		return gd_no;
	}

	public void setGd_no(String gd_no) {
		this.gd_no = gd_no;
	}

	public String getGd_imgl() {
		return gd_imgl;
	}

	public void setGd_imgl(String gd_imgl) {
		this.gd_imgl = gd_imgl;
	}

	public String getGd_imgm() {
		return gd_imgm;
	}

	public void setGd_imgm(String gd_imgm) {
		this.gd_imgm = gd_imgm;
	}

	public String getGd_imgs() {
		return gd_imgs;
	}

	public void setGd_imgs(String gd_imgs) {
		this.gd_imgs = gd_imgs;
	}

	public String getGd_imgss() {
		return gd_imgss;
	}

	public void setGd_imgss(String gd_imgss) {
		this.gd_imgss = gd_imgss;
	}


}
