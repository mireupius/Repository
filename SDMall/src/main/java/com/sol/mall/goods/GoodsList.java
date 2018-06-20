package com.sol.mall.goods;

import java.util.List;

//ajax용
public class GoodsList {
	private List<Goods> goods;
	
	public GoodsList() {
		// TODO Auto-generated constructor stub
	}

	public GoodsList(List<Goods> goods) {
		super();
		this.goods = goods;
	}

	public List<Goods> getGoods() {
		return goods;
	}

	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
}
