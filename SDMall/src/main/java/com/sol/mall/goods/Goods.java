package com.sol.mall.goods;

import java.math.BigDecimal;

public class Goods {

	private	String	gd_no;
	private	String	gd_name;
	private	BigDecimal	gd_csmprice;
	private	BigDecimal	gd_price;
	private	String	gd_dlvchrg;
	private	String	gd_imgl;
	private	String	gd_imgm;
	private	String	gd_imgs;
	private	String	gd_imgss;
	private	String	gd_clfl;
	private	String	gd_clfm;
	private	String	gd_clfs;
	private String  gd_sellerid;
	private	String	gd_outarea;

	public Goods() {
		// TODO Auto-generated constructor stub
	}

	public Goods(String gd_no, String gd_name, BigDecimal gd_csmprice, BigDecimal gd_price, String gd_dlvchrg,
			String gd_imgl, String gd_imgm, String gd_imgs, String gd_imgss, String gd_clfl, String gd_clfm,
			String gd_clfs, String gd_sellerid, String gd_outarea) {
		super();
		this.gd_no = gd_no;
		this.gd_name = gd_name;
		this.gd_csmprice = gd_csmprice;
		this.gd_price = gd_price;
		this.gd_dlvchrg = gd_dlvchrg;
		this.gd_imgl = gd_imgl;
		this.gd_imgm = gd_imgm;
		this.gd_imgs = gd_imgs;
		this.gd_imgss = gd_imgss;
		this.gd_clfl = gd_clfl;
		this.gd_clfm = gd_clfm;
		this.gd_clfs = gd_clfs;
		this.gd_sellerid = gd_sellerid;
		this.gd_outarea = gd_outarea;
	}

	public String getGd_no() {
		return gd_no;
	}

	public void setGd_no(String gd_no) {
		this.gd_no = gd_no;
	}

	public String getGd_name() {
		return gd_name;
	}

	public void setGd_name(String gd_name) {
		this.gd_name = gd_name;
	}

	public BigDecimal getGd_csmprice() {
		return gd_csmprice;
	}

	public void setGd_csmprice(BigDecimal gd_csmprice) {
		this.gd_csmprice = gd_csmprice;
	}

	public BigDecimal getGd_price() {
		return gd_price;
	}

	public void setGd_price(BigDecimal gd_price) {
		this.gd_price = gd_price;
	}

	public String getGd_dlvchrg() {
		return gd_dlvchrg;
	}

	public void setGd_dlvchrg(String gd_dlvchrg) {
		this.gd_dlvchrg = gd_dlvchrg;
	}

	public String getGd_imgl() {
		return gd_imgl;
	}

	public void setGd_imgl(String gd_imgl) {
		this.gd_imgl = gd_imgl;
	}

	public String getGd_imgm() {
		return gd_imgm;
	}

	public void setGd_imgm(String gd_imgm) {
		this.gd_imgm = gd_imgm;
	}

	public String getGd_imgs() {
		return gd_imgs;
	}

	public void setGd_imgs(String gd_imgs) {
		this.gd_imgs = gd_imgs;
	}

	public String getGd_imgss() {
		return gd_imgss;
	}

	public void setGd_imgss(String gd_imgss) {
		this.gd_imgss = gd_imgss;
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

	public String getGd_sellerid() {
		return gd_sellerid;
	}

	public void setGd_sellerid(String gd_sellerid) {
		this.gd_sellerid = gd_sellerid;
	}

	public String getGd_outarea() {
		return gd_outarea;
	}

	public void setGd_outarea(String gd_outarea) {
		this.gd_outarea = gd_outarea;
	}

}
