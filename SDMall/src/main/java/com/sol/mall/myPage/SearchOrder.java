package com.sol.mall.myPage;

import java.math.BigDecimal;
import java.util.Date;

public class SearchOrder {
	
	private String sb_csm_id;
	private BigDecimal sb_searchMonth;
	
	public SearchOrder() {
		// TODO Auto-generated constructor stub
	}

	public SearchOrder(String sb_csm_id, BigDecimal sb_searchMonth) {
		super();
		this.sb_csm_id = sb_csm_id;
		this.sb_searchMonth = sb_searchMonth;
	}

	public String getSb_csm_id() {
		return sb_csm_id;
	}

	public void setSb_csm_id(String sb_csm_id) {
		this.sb_csm_id = sb_csm_id;
	}

	public BigDecimal getSb_searchMonth() {
		return sb_searchMonth;
	}

	public void setSb_searchMonth(BigDecimal sb_searchMonth) {
		this.sb_searchMonth = sb_searchMonth;
	}

}
