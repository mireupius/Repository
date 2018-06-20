package com.sol.mall.goods;

public class Keywords {
	private	String	key_name;
	private	String	key_value;

	public Keywords() {
		// TODO Auto-generated constructor stub
	}

	public Keywords(String key_name, String key_value) {
		super();
		this.key_name = key_name;
		this.key_value = key_value;
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
	
}
