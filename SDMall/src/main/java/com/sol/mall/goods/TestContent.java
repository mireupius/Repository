package com.sol.mall.goods;

public class TestContent {
	private String daumcontent;

	public TestContent() {
		// TODOAuto-generatedconstructorstub
	}

	public TestContent(String daumcontent) {
		super();
		this.daumcontent = daumcontent;
	}

	public String getDaumcontent() {
		return daumcontent;
	}

	public void setDaumcontent(String daumcontent) {
		this.daumcontent = daumcontent;
	}
	public void print(Goods g, GoodsDtl gdtl) {
		System.out.println(gdtl.getGt_no());
		System.out.println(gdtl.getGt_gdno());
		System.out.println(gdtl.getGt_mdlname());
		System.out.println(gdtl.getGt_maker());
		System.out.println(gdtl.getGt_brand());
		System.out.println(gdtl.getGt_mfd());
		System.out.println(gdtl.getGt_exp());
		System.out.println(gdtl.getGt_material());
		System.out.println(gdtl.getGt_weight());
		System.out.println(gdtl.getGt_volume());
		System.out.println(gdtl.getGt_origin());
		System.out.println(gdtl.getGt_keyword());
		System.out.println(gdtl.getGt_detail());
		
		
		System.out.println(g.getGd_name());
		System.out.println(g.getGd_csmprice());
		System.out.println(g.getGd_price());
		System.out.println(g.getGd_dlvchrg());
		System.out.println(g.getGd_imgl());
		System.out.println(g.getGd_imgm());
		System.out.println(g.getGd_imgs());
		System.out.println(g.getGd_imgss());
		System.out.println(g.getGd_clfl());
		System.out.println(g.getGd_clfm());
		System.out.println(g.getGd_clfs());
		System.out.println(g.getGd_sellerid());

	}

}
