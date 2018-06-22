package com.sol.mall.goods;

public class GoodsCategory {
	private String gd_clfl;
	private String gd_clfm;
	private String gd_clfs;

	public GoodsCategory() {
		// TODO Auto-generated constructor stub
	}

	public GoodsCategory(String gd_clfl, String gd_clfm, String gd_clfs) {
		super();
		this.gd_clfl = gd_clfl;
		this.gd_clfm = gd_clfm;
		this.gd_clfs = gd_clfs;
	}

	public String getGd_clfl() {
		return gd_clfl;
	}

	public void setGd_clfl(String gd_clfl) {
		this.gd_clfl = gd_clfl;
	}

	public String getGd_clfm() {
		return gd_clfm;
	}

	public void setGd_clfm(String gd_clfm) {
		this.gd_clfm = gd_clfm;
	}

	public String getGd_clfs() {
		return gd_clfs;
	}

	public void setGd_clfs(String gd_clfs) {
		this.gd_clfs = gd_clfs;
	}

}
