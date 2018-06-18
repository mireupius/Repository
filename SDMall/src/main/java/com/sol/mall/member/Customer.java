package com.sol.mall.member;

import java.math.BigDecimal;
import java.util.Date;

public class Customer {
	
	private String csm_id;
	private String csm_pw;
	private String csm_name;
	private Date csm_birth;
	private String csm_phoneNo;
	private String csm_emailAddress;
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(String csm_id, String csm_pw, String csm_name, Date csm_birth, String csm_phoneNo,
			String csm_emailAddress) {
		super();
		this.csm_id = csm_id;
		this.csm_pw = csm_pw;
		this.csm_name = csm_name;
		this.csm_birth = csm_birth;
		this.csm_phoneNo = csm_phoneNo;
		this.csm_emailAddress = csm_emailAddress;
	}

	public String getCsm_id() {
		return csm_id;
	}

	public void setCsm_id(String csm_id) {
		this.csm_id = csm_id;
	}

	public String getCsm_pw() {
		return csm_pw;
	}

	public void setCsm_pw(String csm_pw) {
		this.csm_pw = csm_pw;
	}

	public String getCsm_name() {
		return csm_name;
	}

	public void setCsm_name(String csm_name) {
		this.csm_name = csm_name;
	}

	public Date getCsm_birth() {
		return csm_birth;
	}

	public void setCsm_birth(Date csm_birth) {
		this.csm_birth = csm_birth;
	}

	public String getCsm_phoneNo() {
		return csm_phoneNo;
	}

	public void setCsm_phoneNo(String csm_phoneNo) {
		this.csm_phoneNo = csm_phoneNo;
	}

	public String getCsm_emailAddress() {
		return csm_emailAddress;
	}

	public void setCsm_emailAddress(String csm_emailAddress) {
		this.csm_emailAddress = csm_emailAddress;
	}

	
}
