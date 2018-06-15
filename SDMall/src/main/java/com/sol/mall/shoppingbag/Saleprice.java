package com.sol.mall.shoppingbag;

import java.math.BigDecimal;

public class Saleprice {
	private BigDecimal saleprice;
	private String csm_id;

	public Saleprice() {
		// TODO Auto-generated constructor stub
	}

	public BigDecimal getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(BigDecimal saleprice) {
		this.saleprice = saleprice;
	}

	public String getCsm_id() {
		return csm_id;
	}

	public void setCsm_id(String csm_id) {
		this.csm_id = csm_id;
	}

	public Saleprice(BigDecimal saleprice, String csm_id) {
		super();
		this.saleprice = saleprice;
		this.csm_id = csm_id;
	}

}
