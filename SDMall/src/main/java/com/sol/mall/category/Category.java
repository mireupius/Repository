package com.sol.mall.category;

import java.math.BigDecimal;

public class Category {
	private BigDecimal ct_no;
	private String ct_clfname;
	private String ct_clf;
	private String ct_parentno;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(BigDecimal ct_no, String ct_clfname, String ct_clf, String ct_parentno) {
		super();
		this.ct_no = ct_no;
		this.ct_clfname = ct_clfname;
		this.ct_clf = ct_clf;
		this.ct_parentno = ct_parentno;
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

	public String getCt_parentno() {
		return ct_parentno;
	}

	public void setCt_parentno(String ct_parentno) {
		this.ct_parentno = ct_parentno;
	}
	
	
}

