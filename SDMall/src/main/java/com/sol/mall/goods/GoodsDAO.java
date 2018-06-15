package com.sol.mall.goods;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsDAO {

	@Autowired
	private SqlSession ss;

	// 카테고리 조회
	public void getAllcategory(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("category", ss.getMapper(GoodsMapper.class).getAllcategory());
	}

	// 카테고리 분류별 카테고리정보 조회
	public Categories getCategory(Category cg, HttpServletRequest request, HttpServletResponse response) {

		return new Categories(ss.getMapper(GoodsMapper.class).getCategory(cg));
	}

	// 상품 조회
	public void getGd(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<Goods> gds = (ArrayList<Goods>) ss.getMapper(GoodsMapper.class).getGoods();

		request.setAttribute("gds", gds);
	}

	// 상품상세 조회
	public void getGdtl(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<GoodsDtl> gdsDtl = (ArrayList<GoodsDtl>) ss.getMapper(GoodsMapper.class).getGoodsDtl();

		request.setAttribute("gdsDtl", gdsDtl);
	}

	// 입력-----------------------------------------------------------------------
	public void insertGd(Goods g, HttpServletRequest request, HttpServletResponse response) {

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

		if (ss.getMapper(GoodsMapper.class).insertGds(g) == 1) {

			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}

	public void insertGdtl(GoodsDtl g, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).insertGdsDtl(g) == 1) {

			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}

	public void insertGdtlTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).insertGdtlTwo(map) == 1) {

			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}
}
