package com.sol.mall.goods;

import java.math.BigDecimal;

public class Category {
	private BigDecimal ct_no; 
	private String ct_clfname;   
	private String ct_clf;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	
	public Category(BigDecimal ct_no, String ct_clfname, String ct_clf) {
		super();
		this.ct_no = ct_no;
		this.ct_clfname = ct_clfname;
		this.ct_clf = ct_clf;
	}


	public BigDecimal getCt_no() {
		return ct_no;
	}

	public void setCt_no(BigDecimal ct_no) {
		this.ct_no = ct_no;
	}

	public String getCt_clfname() {
		return ct_clfname;
	}

	public void setCt_clfname(String ct_clfname) {
		this.ct_clfname = ct_clfname;
	}

	public String getCt_clf() {
		return ct_clf;
	}

	public void setCt_clf(String ct_clf) {
		this.ct_clf = ct_clf;
	}
	
	

}
