package com.sol.mall.goods;

import java.math.BigDecimal;
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

	public void getGoodsByNo(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("goodsDtl1", ss.getMapper(GoodsMapper.class).getGoodsByNo(goods));
		request.setAttribute("goodsDtl2", ss.getMapper(GoodsMapper.class).getGoodsDtlByNo(goods));
		request.setAttribute("option", ss.getMapper(OptionMapper.class).getOptionByGdno(goods));
		System.out.println(goods.getGd_no());

		// ss.getMapper(GoodsMapper.class).getGoodsByNo(goods).getGd_clfl();

	}

	// 상품 조회
	public void getGd(HttpServletRequest request, HttpServletResponse response) {

		List<Goods> gds = ss.getMapper(GoodsMapper.class).getGoods();

		request.setAttribute("gds", gds);
	}

	// 상품상세 조회
	public void getGoodsView(GoodsView gv, GoodsCategory gc, HttpServletRequest request, HttpServletResponse response) {

		Option op = new Option();
		op.setOp_gdno(gv.getGd_no());

		GoodsView gdv = ss.getMapper(GoodsMapper.class).getGoodsView(gv);
		
		gc.setGd_clfl(gdv.getGd_clfl());
		gc.setGd_clfm(gdv.getGd_clfm());
		gc.setGd_clfs(gdv.getGd_clfs());

		List<Category> ctgLt = ss.getMapper(GoodsMapper.class).getCtgryForView(gc);
		
		List<Option> gdsOp= ss.getMapper(GoodsMapper.class).getOptionByNo(op);

		request.setAttribute("gdsView", gdv);
		request.setAttribute("gdViewCtg", ctgLt);
		request.setAttribute("gdsOp", gdsOp);
	}

	// 상품목록 전체조회
	public void getAllGoods(HttpServletRequest request) {
		List<Goods> gdslist = ss.getMapper(GoodsMapper.class).getAllGoods();

		request.setAttribute("gdslist", gdslist);
		request.setAttribute("allGoods", gdslist);
	}

	// 상품목록 전체조회(상품리스트화면)
	public void getAllGoodsView(HttpServletRequest request) {
		List<GoodsView> gdsViewList = ss.getMapper(GoodsMapper.class).getAllGoodsView();

		request.setAttribute("gdsViewList", gdsViewList);
	}
	
	// 상품목록 검색(상품리스트화면)
	public GoodsViewList getGoodsViewByKey(Keywords k, HttpServletRequest request) {
		return new GoodsViewList(ss.getMapper(GoodsMapper.class).getGoodsViewByKey(k));
	}

	// 입력-----------------------------------------------------------------------
	public void insertGd(Goods gd, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("=no="+gd.getGd_no());				
		System.out.println("=name="+gd.getGd_name());				
		System.out.println("=imgl="+gd.getGd_imgl());				
		System.out.println("=clfl="+gd.getGd_clfl());				
		System.out.println("=clfm="+gd.getGd_clfm());				
		System.out.println("=clfs="+gd.getGd_clfs());				
		System.out.println("=dlvchrg="+gd.getGd_dlvchrg());				
		System.out.println("=outarea="+gd.getGd_outarea());				
		System.out.println("=imgm="+gd.getGd_imgm());				
		System.out.println("=imgs="+gd.getGd_imgs());				
		System.out.println("=imgss="+gd.getGd_imgss());				
		System.out.println("=sellerid="+gd.getGd_sellerid());				

		
		// 이미지 문제
		if (ss.getMapper(GoodsMapper.class).insertGds(gd) == 1) {

			System.out.println("insertGd성공");
		} else {
			System.out.println("insertGd해당항목 없음");
		}
	}

//	public void insertGdtl(GoodsDtl g, HttpServletRequest request, HttpServletResponse response) {
//
//		if (ss.getMapper(GoodsMapper.class).insertGdsDtl(g) == 1) {
//
//			System.out.println("insertGdsDtl성공");
//		} else {
//			System.out.println("insertGdsDtl해당항목 없음");
//		}
//	}

	public void insertGdtlTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).insertGdtlTwo(map) == 1) {

			System.out.println("insertGdtlTwo성공");
		} else {
			System.out.println("insertGdtlTwo해당 항목없음");
		}
	}

	public void insertOpTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).insertOpTwo(map) == 1) {

			System.out.println("insertOpTwo성공");
		} else {
			System.out.println("insertOpTwo해당항목없음");
		}
	}
	public void insertOpTwoForUp(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {
		
		if (ss.getMapper(GoodsMapper.class).insertOpTwoForUp(map) == 1) {
			
			System.out.println("insertOpTwoForUp성공");
		} else {
			System.out.println("insertOpTwoForUp해당항목 없음");
		}
	}

	// 트랜잭션 3가지 테이블 입력시 상품번호 시퀀스충돌 방지?
	// @Transactional(rollbackFor = Exception.class)
	public void insertGdsInfo(Goods gd, GoodsDtl gdtl, OptionList opl, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 입력(상품테이블)
		insertGd(gd, request, response);

		// 입력(상품상세 파라메터 작성goods, goodsDtl)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goods", gd);
		map.put("goodsDtl", gdtl);
		// 입력(상품상세테이블)
		insertGdtlTwo(map, request, response);

		// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  옵션 여러개 입력할 때  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		Option op = new Option();
		for (int i = 0; i < opl.getOpl_name().size(); i++) {
			
			op.setOp_name(opl.getOpl_name().get(i));
			op.setOp_price(new BigDecimal(opl.getOpl_price().get(i)));
			op.setOp_stock(new BigDecimal(opl.getOpl_stock().get(i)));
	
			// 입력(상품상세 파라메터 작성goods, goodsDtl)
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("goods", gd);
			map2.put("option", op);
			// 입력(옵션테이블)
			insertOpTwo(map2, request, response);
		}
		// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑  옵션 여러개 입력할 때  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
		
	}
	
	// 업데이트==================================================
	
	// 트랜잭션 3가지 테이블 입력시 상품번호 시퀀스충돌 방지?
	// @Transactional(rollbackFor = Exception.class)
	public void updateGdsInfo(Goods gd, GoodsDtl gdtl, OptionList opl, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 입력(상품테이블)
		updateGd(gd, request, response);
		
		// 입력(상품상세 파라메터 작성goods, goodsDtl)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goods", gd);
		map.put("goodsDtl", gdtl);
		
		// 입력(상품상세테이블)
		updateGdtlTwo(map, request, response);
		
		// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  옵션 여러개 입력할 때  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		Option op = new Option();
		System.out.println("옵션 사이즈"+opl.getOpl_name().size());
		for (int i = 0; i < opl.getOpl_name().size(); i++) {
			
			op.setOp_no(opl.getOpl_no().get(i));
			op.setOp_name(opl.getOpl_name().get(i));
			op.setOp_price(new BigDecimal(opl.getOpl_price().get(i)));
			op.setOp_stock(new BigDecimal(opl.getOpl_stock().get(i)));
			// 입력(상품상세 파라메터 작성goods, goodsDtl)
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("goods", gd);
			map2.put("option", op);

System.out.println(gd.getGd_clfl());
System.out.println(gd.getGd_clfm());
System.out.println(gd.getGd_clfs());

			// 수정화면에서 옵션을 추가할시 수정이 아닌 입력이 필요
			if(op.getOp_no().equals("")) {
				System.out.println("수정화면 옵션 입력");
				insertOpTwoForUp(map2, request, response);
			}else {
				// 수정(옵션테이블)
				updateOpTwo(map2, request, response);
			}
		}
		// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑  옵션 여러개 입력할 때  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	}
	
	public void updateGd(Goods gd, HttpServletRequest request, HttpServletResponse response) {
		// 이미지 문제
		if (ss.getMapper(GoodsMapper.class).updateGds(gd) == 1) {

			System.out.println("updateGd성공");
		} else {
			System.out.println("updateGd 해당자료 없음");
		}
	}
	
	public void updateGdtlTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		
		System.out.println("updateGdtlTwo 시작");
		if (ss.getMapper(GoodsMapper.class).updateGdtlTwo(map) == 1) {

			System.out.println("updateGdtlTwo성공");
		} else {
			System.out.println("updateGdtlTwo 해당자료 없음");
		}
	}
	
	public void updateOpTwo(HashMap<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		if (ss.getMapper(GoodsMapper.class).updateOpTwo(map) == 1) {

			System.out.println("updateOpTwo성공");
		} else {
			System.out.println("updateOpTwo 해당자료 없음");
		}
	}
	
}
