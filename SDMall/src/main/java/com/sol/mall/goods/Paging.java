package com.sol.mall.goods;

import java.util.List;

public class Paging {

	private int curPage;
	private int pageCount;
	private List<GoodsView> goodsView;
	
	public Paging() {
		// TODO Auto-generated constructor stub
	}

	public Paging(int curPage, int pageCount, List<GoodsView> goodsView) {
		super();
		this.curPage = curPage;
		this.pageCount = pageCount;
		this.goodsView = goodsView;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<GoodsView> getGoodsView() {
		return goodsView;
	}

	public void setGoodsView(List<GoodsView> goodsView) {
		this.goodsView = goodsView;
	}
	
}
