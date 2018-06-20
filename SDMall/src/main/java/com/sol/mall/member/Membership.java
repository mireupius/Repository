package com.sol.mall.member;

import java.math.BigDecimal;

public class Membership {
	
	private String ms_csm_id;
	private String ms_grade;
	private BigDecimal ms_point;
	private BigDecimal ms_totalBuy;
	
	public Membership() {
		// TODO Auto-generated constructor stub
	}

	public Membership(String ms_csm_id, String ms_grade, BigDecimal ms_point, BigDecimal ms_totalBuy) {
		super();
		this.ms_csm_id = ms_csm_id;
		this.ms_grade = ms_grade;
		this.ms_point = ms_point;
		this.ms_totalBuy = ms_totalBuy;
	}

	public String getMs_csm_id() {
		return ms_csm_id;
	}

	public void setMs_csm_id(String ms_csm_id) {
		this.ms_csm_id = ms_csm_id;
	}

	public String getMs_grade() {
		return ms_grade;
	}

	public void setMs_grade(String ms_grade) {
		this.ms_grade = ms_grade;
	}

	public BigDecimal getMs_point() {
		return ms_point;
	}

	public void setMs_point(BigDecimal ms_point) {
		this.ms_point = ms_point;
	}

	public BigDecimal getMs_totalBuy() {
		return ms_totalBuy;
	}

	public void setMs_totalBuy(BigDecimal ms_totalBuy) {
		this.ms_totalBuy = ms_totalBuy;
	}
	

}