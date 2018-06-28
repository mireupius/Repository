package com.sol.mall.goods;

import java.util.List;

public class GoodsViewList {
	private List<GoodsView> goodsView;

	public GoodsViewList() {
		// TODO Auto-generated constructor stub
	}

	public GoodsViewList(List<GoodsView> goodsView) {
		super();
		this.goodsView = goodsView;
	}

	public List<GoodsView> getGoodsView() {
		return goodsView;
	}

	public void setGoodsView(List<GoodsView> goodsView) {
		this.goodsView = goodsView;
	}
	
}
