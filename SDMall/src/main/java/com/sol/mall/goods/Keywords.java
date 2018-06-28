package com.sol.mall.goods;

public class Keywords {
	
	private	String	gd_sellerid;
	private	String	key_name;
	private	String	key_value;
	private	String	sort_name;
	private	String	desc_name;

	public Keywords() {
		// TODO Auto-generated constructor stub
	}

	public Keywords(String gd_sellerid, String key_name, String key_value, String sort_name, String desc_name) {
		super();
		this.gd_sellerid = gd_sellerid;
		this.key_name = key_name;
		this.key_value = key_value;
		this.sort_name = sort_name;
		this.desc_name = desc_name;
	}

	public String getGd_sellerid() {
		return gd_sellerid;
	}

	public void setGd_sellerid(String gd_sellerid) {
		this.gd_sellerid = gd_sellerid;
	}

	public String getKey_name() {
		return key_name;
	}

	public void setKey_name(String key_name) {
		this.key_name = key_name;
	}

	public String getKey_value() {
		return key_value;
	}

	public void setKey_value(String key_value) {
		this.key_value = key_value;
	}

	public String getSort_name() {
		return sort_name;
	}

	public void setSort_name(String sort_name) {
		this.sort_name = sort_name;
	}

	public String getDesc_name() {
		return desc_name;
	}

	public void setDesc_name(String desc_name) {
		this.desc_name = desc_name;
	}

}
