package com.sol.mall.member;

public class Seller {
	
	private String sl_id;
	private String sl_pw;
	private String sl_coName;
	private String sl_coRegNo;
	private String sl_phoneNo;
	private String sl_emailAddress;
	
	public Seller() {
		// TODO Auto-generated constructor stub
	}

	public Seller(String sl_id, String sl_pw, String sl_coName, String sl_coRegNo, String sl_phoneNo,
			String sl_emailAddress) {
		super();
		this.sl_id = sl_id;
		this.sl_pw = sl_pw;
		this.sl_coName = sl_coName;
		this.sl_coRegNo = sl_coRegNo;
		this.sl_phoneNo = sl_phoneNo;
		this.sl_emailAddress = sl_emailAddress;
	}

	public String getSl_id() {
		return sl_id;
	}

	public void setSl_id(String sl_id) {
		this.sl_id = sl_id;
	}

	public String getSl_pw() {
		return sl_pw;
	}

	public void setSl_pw(String sl_pw) {
		this.sl_pw = sl_pw;
	}

	public String getSl_coName() {
		return sl_coName;
	}

	public void setSl_coName(String sl_coName) {
		this.sl_coName = sl_coName;
	}

	public String getSl_coRegNo() {
		return sl_coRegNo;
	}

	public void setSl_coRegNo(String sl_coRegNo) {
		this.sl_coRegNo = sl_coRegNo;
	}

	public String getSl_phoneNo() {
		return sl_phoneNo;
	}

	public void setSl_phoneNo(String sl_phoneNo) {
		this.sl_phoneNo = sl_phoneNo;
	}

	public String getSl_emailAddress() {
		return sl_emailAddress;
	}

	public void setSl_emailAddress(String sl_emailAddress) {
		this.sl_emailAddress = sl_emailAddress;
	}
	

}
