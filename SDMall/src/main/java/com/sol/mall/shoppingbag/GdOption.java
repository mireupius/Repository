package com.sol.mall.shoppingbag;

import java.math.BigDecimal;

public class GdOption {
	private String op_no;
	private String op_gdno;
	private String op_name;
	private BigDecimal op_price;
	private BigDecimal op_stock;

	public GdOption() {
		// TODO Auto-generated constructor stub
	}

	public String getOp_no() {
		return op_no;
	}

	public void setOp_no(String op_no) {
		this.op_no = op_no;
	}

	public String getOp_gdno() {
		return op_gdno;
	}

	public void setOp_gdno(String op_gdno) {
		this.op_gdno = op_gdno;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	public BigDecimal getOp_price() {
		return op_price;
	}

	public void setOp_price(BigDecimal op_price) {
		this.op_price = op_price;
	}

	public BigDecimal getOp_stock() {
		return op_stock;
	}

	public void setOp_stock(BigDecimal op_stock) {
		this.op_stock = op_stock;
	}

	public GdOption(String op_no, String op_gdno, String op_name, BigDecimal op_price, BigDecimal op_stock) {
		super();
		this.op_no = op_no;
		this.op_gdno = op_gdno;
		this.op_name = op_name;
		this.op_price = op_price;
		this.op_stock = op_stock;
	}

}
