package com.sol.mall.sale.delivery.excel;

import java.math.BigDecimal;

public class Deliver {
	private String name;
	private BigDecimal age;

	public Deliver() {
		// TODO Auto-generated constructor stub
	}

	public Deliver(String name, BigDecimal age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getAge() {
		return age;
	}

	public void setAge(BigDecimal age) {
		this.age = age;
	}

}
