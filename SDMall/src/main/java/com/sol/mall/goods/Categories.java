package com.sol.mall.goods;

import java.util.List;

// ajax용
public class Categories {
	private List<Category> category;
	
	public Categories() {
		// TODO Auto-generated constructor stub
	}

	public Categories(List<Category> category) {
		super();
		this.category = category;
	}

	public List<Category> getCategory() {
		return category;
	}

	public void setCategory(List<Category> category) {
		this.category = category;
	}
}
