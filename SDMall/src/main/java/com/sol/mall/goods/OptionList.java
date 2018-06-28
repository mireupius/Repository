package com.sol.mall.goods;

import java.util.ArrayList;

public class OptionList {
	private ArrayList<String> opl_no;
	private ArrayList<String> opl_name;
	private ArrayList<String> opl_price;
	private ArrayList<String> opl_stock;
	
	public OptionList() {
		// TODO Auto-generated constructor stub
	}

	public OptionList(ArrayList<String> opl_no, ArrayList<String> opl_name, ArrayList<String> opl_price,
			ArrayList<String> opl_stock) {
		super();
		this.opl_no = opl_no;
		this.opl_name = opl_name;
		this.opl_price = opl_price;
		this.opl_stock = opl_stock;
	}

	public ArrayList<String> getOpl_no() {
		return opl_no;
	}

	public void setOpl_no(ArrayList<String> opl_no) {
		this.opl_no = opl_no;
	}

	public ArrayList<String> getOpl_name() {
		return opl_name;
	}

	public void setOpl_name(ArrayList<String> opl_name) {
		this.opl_name = opl_name;
	}

	public ArrayList<String> getOpl_price() {
		return opl_price;
	}

	public void setOpl_price(ArrayList<String> opl_price) {
		this.opl_price = opl_price;
	}

	public ArrayList<String> getOpl_stock() {
		return opl_stock;
	}

	public void setOpl_stock(ArrayList<String> opl_stock) {
		this.opl_stock = opl_stock;
	}

}
