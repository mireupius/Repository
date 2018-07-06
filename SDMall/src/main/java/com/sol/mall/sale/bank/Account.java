package com.sol.mall.sale.bank;

public class Account {
	private String sa_id;
	private String sa_account_num;
	private String sa_account_bank;

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(String sa_id, String sa_account_num, String sa_account_bank) {
		super();
		this.sa_id = sa_id;
		this.sa_account_num = sa_account_num;
		this.sa_account_bank = sa_account_bank;
	}

	public String getSa_id() {
		return sa_id;
	}

	public void setSa_id(String sa_id) {
		this.sa_id = sa_id;
	}

	public String getSa_account_num() {
		return sa_account_num;
	}

	public void setSa_account_num(String sa_account_num) {
		this.sa_account_num = sa_account_num;
	}

	public String getSa_account_bank() {
		return sa_account_bank;
	}

	public void setSa_account_bank(String sa_account_bank) {
		this.sa_account_bank = sa_account_bank;
	}

}
