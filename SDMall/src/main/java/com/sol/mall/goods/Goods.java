package com.sol.mall.goods;

import java.math.BigDecimal;

public class Goods {

	private BigDecimal gdno;
	private String gdname;
	private BigDecimal gtprice;
	private BigDecimal gtdlvchrg;
	private BigDecimal gdcsmprice;
	private String gdimgl;
	private String gdimgm;
	private String gdimgs;
	private String gdimgss;
	private BigDecimal gdclfl;
	private BigDecimal gdclfm;
	private BigDecimal gdclfs;

	public Goods() {
		// TODO Auto-generated constructor stub
	}

	public Goods(BigDecimal gdno, String gdname, BigDecimal gtprice, BigDecimal gtdlvchrg, BigDecimal gdcsmprice,
			String gdimgl, String gdimgm, String gdimgs, String gdimgss, BigDecimal gdclfl, BigDecimal gdclfm,
			BigDecimal gdclfs) {
		super();
		this.gdno = gdno;
		this.gdname = gdname;
		this.gtprice = gtprice;
		this.gtdlvchrg = gtdlvchrg;
		this.gdcsmprice = gdcsmprice;
		this.gdimgl = gdimgl;
		this.gdimgm = gdimgm;
		this.gdimgs = gdimgs;
		this.gdimgss = gdimgss;
		this.gdclfl = gdclfl;
		this.gdclfm = gdclfm;
		this.gdclfs = gdclfs;
	}

	public BigDecimal getGdno() {
		return gdno;
	}

	public void setGdno(BigDecimal gdno) {
		this.gdno = gdno;
	}

	public String getGdname() {
		return gdname;
	}

	public void setGdname(String gdname) {
		this.gdname = gdname;
	}

	public BigDecimal getGtprice() {
		return gtprice;
	}

	public void setGtprice(BigDecimal gtprice) {
		this.gtprice = gtprice;
	}

	public BigDecimal getGtdlvchrg() {
		return gtdlvchrg;
	}

	public void setGtdlvchrg(BigDecimal gtdlvchrg) {
		this.gtdlvchrg = gtdlvchrg;
	}

	public BigDecimal getGdcsmprice() {
		return gdcsmprice;
	}

	public void setGdcsmprice(BigDecimal gdcsmprice) {
		this.gdcsmprice = gdcsmprice;
	}

	public String getGdimgl() {
		return gdimgl;
	}

	public void setGdimgl(String gdimgl) {
		this.gdimgl = gdimgl;
	}

	public String getGdimgm() {
		return gdimgm;
	}

	public void setGdimgm(String gdimgm) {
		this.gdimgm = gdimgm;
	}

	public String getGdimgs() {
		return gdimgs;
	}

	public void setGdimgs(String gdimgs) {
		this.gdimgs = gdimgs;
	}

	public String getGdimgss() {
		return gdimgss;
	}

	public void setGdimgss(String gdimgss) {
		this.gdimgss = gdimgss;
	}

	public BigDecimal getGdclfl() {
		return gdclfl;
	}

	public void setGdclfl(BigDecimal gdclfl) {
		this.gdclfl = gdclfl;
	}

	public BigDecimal getGdclfm() {
		return gdclfm;
	}

	public void setGdclfm(BigDecimal gdclfm) {
		this.gdclfm = gdclfm;
	}

	public BigDecimal getGdclfs() {
		return gdclfs;
	}

	public void setGdclfs(BigDecimal gdclfs) {
		this.gdclfs = gdclfs;
	}
	
	
}
