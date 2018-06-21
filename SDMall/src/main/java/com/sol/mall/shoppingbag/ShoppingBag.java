package com.sol.mall.shoppingbag;

import java.math.BigDecimal;

public class ShoppingBag {

	private String sb_no;
	private String sb_csmid;
	private String sb_gdno;
	private String sb_opno;
	private BigDecimal sb_quantity;

	public ShoppingBag() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingBag(String sb_no, String sb_csmid, String sb_gdno, String sb_opno, BigDecimal sb_quantity) {
		super();
		this.sb_no = sb_no;
		this.sb_csmid = sb_csmid;
		this.sb_gdno = sb_gdno;
		this.sb_opno = sb_opno;
		this.sb_quantity = sb_quantity;
	}

	public String getSb_no() {
		return sb_no;
	}

	public void setSb_no(String sb_no) {
		this.sb_no = sb_no;
	}

	public String getSb_csmid() {
		return sb_csmid;
	}

	public void setSb_csmid(String sb_csmid) {
		this.sb_csmid = sb_csmid;
	}

	public String getSb_gdno() {
		return sb_gdno;
	}

	public void setSb_gdno(String sb_gdno) {
		this.sb_gdno = sb_gdno;
	}

	public String getSb_opno() {
		return sb_opno;
	}

	public void setSb_opno(String sb_opno) {
		this.sb_opno = sb_opno;
	}

	public BigDecimal getSb_quantity() {
		return sb_quantity;
	}

	public void setSb_quantity(BigDecimal sb_quantity) {
		this.sb_quantity = sb_quantity;
	}

}
