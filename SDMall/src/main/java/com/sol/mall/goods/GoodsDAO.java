package com.sol.mall.goods;

import java.util.HashMap;
import java.util.List;

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

	// 상품코드로 상품 조회
	public void getGoodsByNo(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("goodsDtl1", ss.getMapper(GoodsMapper.class).getGoodsByNo(goods));
		request.setAttribute("goodsDtl2", ss.getMapper(GoodsMapper.class).getGoodsDtlByNo(goods));
		request.setAttribute("option", ss.getMapper(OptionMapper.class).getOptionByGdno(goods));
		System.out.println(goods.getGd_no());

		// ss.getMapper(GoodsMapper.class).getGoodsByNo(goods).getGd_clfl();

	}

	// 카테고리로 상품 조회
	public void getGoodsByCate(Category category, HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Goods> goods = ss.getMapper(GoodsMapper.class).getGoodsByCate(category);

			request.setAttribute("goods", goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 상품 조회
	public void getGd(HttpServletRequest request, HttpServletResponse response) {

		List<Goods> gds = ss.getMapper(GoodsMapper.class).getGoods();

		request.setAttribute("gds", gds);
	}

	// 상품상세 조회
	public void getGoodsView(GoodsView gv, GoodsCategory gc, HttpServletRequest request, HttpServletResponse response) {

		GoodsView gdv = ss.getMapper(GoodsMapper.class).getGoodsView(gv);

		gc.setGd_clfl(gdv.getGd_clfl());
		gc.setGd_clfm(gdv.getGd_clfm());
		gc.setGd_clfs(gdv.getGd_clfs());

		List<Category> ctgLt = ss.getMapper(GoodsMapper.class).getCtgryForView(gc);

		request.setAttribute("gdsView", gdv);
		request.setAttribute("gdViewCtg", ctgLt);
	}

	// 상품목록 전체조회
	public void getAllGoods(HttpServletRequest request) {
		List<Goods> gdslist = ss.getMapper(GoodsMapper.class).getAllGoods();

		request.setAttribute("gdslist", gdslist);
		request.setAttribute("allGoods", gdslist);
	}

	// 상품목록 전체조회
	public GoodsList getGoodsByKey(Keywords k, HttpServletRequest request) {
		return new GoodsList(ss.getMapper(GoodsMapper.class).getGoodsByKey(k));
	}

	// 입력-----------------------------------------------------------------------
	public void insertGd(Goods gd, HttpServletRequest request, HttpServletResponse response) {
		// 이미지 문제

		if (ss.getMapper(GoodsMapper.class).insertGds(gd) == 1) {

			System.out.println("insertGd성공");
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

			System.out.println("insertGdtlTwo성공");
		} else {
			System.out.println("실패");
		}
	}

	public void insertOpTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).insertOpTwo(map) == 1) {

			System.out.println("insertOpTwo성공");
		} else {
			System.out.println("실패");
		}
	}

	// 트랜잭션 3가지 테이블 입력시 상품번호 시퀀스충돌 방지?
	// @Transactional(rollbackFor = Exception.class)
	public void insertGdsInfo(Goods gd, GoodsDtl gdtl, Option op, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 입력(상품테이블)
		insertGd(gd, request, response);

		// 입력(상품상세 파라메터 작성goods, goodsDtl)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goods", gd);
		map.put("goodsDtl", gdtl);
		// 입력(상품상세테이블)
		insertGdtlTwo(map, request, response);

		// 입력(상품상세 파라메터 작성goods, goodsDtl)
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("goods", gd);
		map2.put("option", op);
		// 입력(옵션테이블)
		insertOpTwo(map2, request, response);
	}
}
