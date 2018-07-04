package com.sol.mall.shoppingbag;

import java.math.BigDecimal;

// 장바구니에 담긴 상품들 보여줄 때 사용하는 자바빈(테이블x)
public class ShoppingBagItem {
	
	private String sb_no;
	private String gd_name;
	private String gd_imgm;
	private String op_name;
	private BigDecimal sb_quantity;
	private BigDecimal op_price;
	private BigDecimal gd_price;
	
	public ShoppingBagItem() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingBagItem(String sb_no, String gd_name, String gd_imgm, String op_name, BigDecimal sb_quantity,
			BigDecimal op_price, BigDecimal gd_price) {
		super();
		this.sb_no = sb_no;
		this.gd_name = gd_name;
		this.gd_imgm = gd_imgm;
		this.op_name = op_name;
		this.sb_quantity = sb_quantity;
		this.op_price = op_price;
		this.gd_price = gd_price;
	}

	public String getSb_no() {
		return sb_no;
	}

	public void setSb_no(String sb_no) {
		this.sb_no = sb_no;
	}

	public String getGd_name() {
		return gd_name;
	}

	public void setGd_name(String gd_name) {
		this.gd_name = gd_name;
	}

	public String getGd_imgm() {
		return gd_imgm;
	}

	public void setGd_imgm(String gd_imgm) {
		this.gd_imgm = gd_imgm;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	public BigDecimal getSb_quantity() {
		return sb_quantity;
	}

	public void setSb_quantity(BigDecimal sb_quantity) {
		this.sb_quantity = sb_quantity;
	}

	public BigDecimal getOp_price() {
		return op_price;
	}

	public void setOp_price(BigDecimal op_price) {
		this.op_price = op_price;
	}

	public BigDecimal getGd_price() {
		return gd_price;
	}

	public void setGd_price(BigDecimal gd_price) {
		this.gd_price = gd_price;
	}
	
}
