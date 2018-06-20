package com.sol.mall.myPage;

import java.math.BigDecimal;
import java.util.Date;


public class Shoppingbag {
	private BigDecimal sb_gd_no;
	private String sb_csm_id;
	private String sb_Pname;
	private BigDecimal sb_Pprice;
	private BigDecimal sb_PSprice;
	private String sb_Img;
	private String sb_optionName;
	private BigDecimal sb_optionPrice;
	private BigDecimal sb_quantity;
	private String sb_shippingFee;
	private Date sb_orderDate;
	
	public Shoppingbag() {
		// TODO Auto-generated constructor stub
	}

	public Shoppingbag(BigDecimal sb_gd_no, String sb_csm_id, String sb_Pname, BigDecimal sb_Pprice,
			BigDecimal sb_PSprice, String sb_Img, String sb_optionName, BigDecimal sb_optionPrice,
			BigDecimal sb_quantity, String sb_shippingFee, Date sb_orderDate) {
		super();
		this.sb_gd_no = sb_gd_no;
		this.sb_csm_id = sb_csm_id;
		this.sb_Pname = sb_Pname;
		this.sb_Pprice = sb_Pprice;
		this.sb_PSprice = sb_PSprice;
		this.sb_Img = sb_Img;
		this.sb_optionName = sb_optionName;
		this.sb_optionPrice = sb_optionPrice;
		this.sb_quantity = sb_quantity;
		this.sb_shippingFee = sb_shippingFee;
		this.sb_orderDate = sb_orderDate;
	}

	public BigDecimal getSb_gd_no() {
		return sb_gd_no;
	}

	public void setSb_gd_no(BigDecimal sb_gd_no) {
		this.sb_gd_no = sb_gd_no;
	}

	public String getSb_csm_id() {
		return sb_csm_id;
	}

	public void setSb_csm_id(String sb_csm_id) {
		this.sb_csm_id = sb_csm_id;
	}

	public String getSb_Pname() {
		return sb_Pname;
	}

	public void setSb_Pname(String sb_Pname) {
		this.sb_Pname = sb_Pname;
	}

	public BigDecimal getSb_Pprice() {
		return sb_Pprice;
	}

	public void setSb_Pprice(BigDecimal sb_Pprice) {
		this.sb_Pprice = sb_Pprice;
	}

	public BigDecimal getSb_PSprice() {
		return sb_PSprice;
	}

	public void setSb_PSprice(BigDecimal sb_PSprice) {
		this.sb_PSprice = sb_PSprice;
	}

	public String getSb_Img() {
		return sb_Img;
	}

	public void setSb_Img(String sb_Img) {
		this.sb_Img = sb_Img;
	}

	public String getSb_optionName() {
		return sb_optionName;
	}

	public void setSb_optionName(String sb_optionName) {
		this.sb_optionName = sb_optionName;
	}

	public BigDecimal getSb_optionPrice() {
		return sb_optionPrice;
	}

	public void setSb_optionPrice(BigDecimal sb_optionPrice) {
		this.sb_optionPrice = sb_optionPrice;
	}

	public BigDecimal getSb_quantity() {
		return sb_quantity;
	}

	public void setSb_quantity(BigDecimal sb_quantity) {
		this.sb_quantity = sb_quantity;
	}

	public String getSb_shippingFee() {
		return sb_shippingFee;
	}

	public void setSb_shippingFee(String sb_shippingFee) {
		this.sb_shippingFee = sb_shippingFee;
	}

	public Date getSb_orderDate() {
		return sb_orderDate;
	}

	public void setSb_orderDate(Date sb_orderDate) {
		this.sb_orderDate = sb_orderDate;
	}
	
}
