package com.sol.mall.myPage;

import java.util.Date;

public class ProductReview {
	
	private String pr_regNo;
	private String pr_orderNo;
	private String pr_csm_id;
	private String pr_comment;
	private String pr_gdNo;
	private String pr_gdName;
	private String pr_star;
	private Date pr_regDate;
	
	public ProductReview() {
		// TODO Auto-generated constructor stub
	}

	public ProductReview(String pr_regNo, String pr_orderNo, String pr_csm_id, String pr_comment, String pr_gdNo,
			String pr_gdName, String pr_star, Date pr_regDate) {
		super();
		this.pr_regNo = pr_regNo;
		this.pr_orderNo = pr_orderNo;
		this.pr_csm_id = pr_csm_id;
		this.pr_comment = pr_comment;
		this.pr_gdNo = pr_gdNo;
		this.pr_gdName = pr_gdName;
		this.pr_star = pr_star;
		this.pr_regDate = pr_regDate;
	}

	public String getPr_regNo() {
		return pr_regNo;
	}

	public void setPr_regNo(String pr_regNo) {
		this.pr_regNo = pr_regNo;
	}

	public String getPr_orderNo() {
		return pr_orderNo;
	}

	public void setPr_orderNo(String pr_orderNo) {
		this.pr_orderNo = pr_orderNo;
	}

	public String getPr_csm_id() {
		return pr_csm_id;
	}

	public void setPr_csm_id(String pr_csm_id) {
		this.pr_csm_id = pr_csm_id;
	}

	public String getPr_comment() {
		return pr_comment;
	}

	public void setPr_comment(String pr_comment) {
		this.pr_comment = pr_comment;
	}

	public String getPr_gdNo() {
		return pr_gdNo;
	}

	public void setPr_gdNo(String pr_gdNo) {
		this.pr_gdNo = pr_gdNo;
	}

	public String getPr_gdName() {
		return pr_gdName;
	}

	public void setPr_gdName(String pr_gdName) {
		this.pr_gdName = pr_gdName;
	}

	public String getPr_star() {
		return pr_star;
	}

	public void setPr_star(String pr_star) {
		this.pr_star = pr_star;
	}

	public Date getPr_regDate() {
		return pr_regDate;
	}

	public void setPr_regDate(Date pr_regDate) {
		this.pr_regDate = pr_regDate;
	}
	

}
