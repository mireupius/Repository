package com.sol.mall.myPage;

import java.math.BigDecimal;

public class SearchOrder {
	
	private String sd_customer_id;
	private BigDecimal sb_searchMonth;
	
	public SearchOrder() {
		// TODO Auto-generated constructor stub
	}

	public SearchOrder(String sd_customer_id, BigDecimal sb_searchMonth) {
		super();
		this.sd_customer_id = sd_customer_id;
		this.sb_searchMonth = sb_searchMonth;
	}

	public String getSd_customer_id() {
		return sd_customer_id;
	}

	public void setSd_customer_id(String sd_customer_id) {
		this.sd_customer_id = sd_customer_id;
	}

	public BigDecimal getSb_searchMonth() {
		return sb_searchMonth;
	}

	public void setSb_searchMonth(BigDecimal sb_searchMonth) {
		this.sb_searchMonth = sb_searchMonth;
	}
	
	
	
}
