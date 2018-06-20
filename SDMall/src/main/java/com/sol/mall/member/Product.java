package com.sol.mall.member;

import java.math.BigDecimal;

public class Product {
	private BigDecimal tp_seq;
	private String tp_no;
	private String tp_name;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(BigDecimal tp_seq, String tp_no, String tp_name) {
		super();
		this.tp_seq = tp_seq;
		this.tp_no = tp_no;
		this.tp_name = tp_name;
	}

	public BigDecimal getTp_seq() {
		return tp_seq;
	}

	public void setTp_seq(BigDecimal tp_seq) {
		this.tp_seq = tp_seq;
	}

	public String getTp_no() {
		return tp_no;
	}

	public void setTp_no(String tp_no) {
		this.tp_no = tp_no;
	}

	public String getTp_name() {
		return tp_name;
	}

	public void setTp_name(String tp_name) {
		this.tp_name = tp_name;
	}
	
	
	
}
