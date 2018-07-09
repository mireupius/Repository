package com.sol.mall.goods;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
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

	private ArrayList<Goods> item;

	public void paging(int page, HttpServletRequest request, HttpServletResponse response) {
		try {

			@SuppressWarnings("unchecked")
			ArrayList<Goods> item2 = (ArrayList<Goods>) request.getAttribute("goodsList");
			request.setAttribute("itemCount", item2.size());

			if (item2 == null) {
				item2 = item;
			}

			double cnt = 15;// 한 페이지당 나올 수
			int itemSize = item2.size();// 총 글 수
			int pageCount = (int) Math.ceil(itemSize / cnt);
			request.setAttribute("pageCount", pageCount);

			int start = itemSize - ((int) cnt * (page - 1));
			int end = (page == pageCount) ? -1 : start - ((int) cnt + 1);

			ArrayList<Goods> items = new ArrayList<>();

			for (int i = start - 1; i > end; i--) {
				items.add(item2.get(i));
			}

			request.setAttribute("pageCount", pageCount);
			request.setAttribute("page", page);
			request.setAttribute("goodsList", items);
		} catch (Exception e) {
			request.setAttribute("itemCount", 0);
			request.setAttribute("pageCount", 1);
			request.setAttribute("page", 1);
			request.setAttribute("goodsList", null);
		}

	}

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

	}

	// 카테고리로 상품 조회
	public void getGoodsByCate(Category category, HttpServletRequest request, HttpServletResponse response) {
			List<Goods> goods = ss.getMapper(GoodsMapper.class).getGoodsByCate(category);
			item=(ArrayList<Goods>) goods;

			request.setAttribute("goodsList", goods);
	}

	// 검색창에 입력받은 값으로 상품 이름과 키워드를 검색
	public void searchGoods(Goods goods, HttpServletRequest request, HttpServletResponse response) {
			List<Goods> goodsResult = ss.getMapper(GoodsMapper.class).searchGoods(goods);

			request.setAttribute("goodsList", goodsResult);
	}

	public GoodsList getGoodsByName(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		return new GoodsList(ss.getMapper(GoodsMapper.class).getGoodsByName(goods));
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

		List<Option> gdsOp = ss.getMapper(GoodsMapper.class).getOptionByNo(op);

		request.setAttribute("gdsView", gdv);
		request.setAttribute("gdViewCtg", ctgLt);
		request.setAttribute("gdsOp", gdsOp);
	}

	// 상품목록 전체조회
	public void getAllGoods(HttpServletRequest request) {
		List<Goods> gdslist = ss.getMapper(GoodsMapper.class).getAllGoods();

		item = (ArrayList<Goods>) gdslist;

		request.setAttribute("gdslist", gdslist);
		request.setAttribute("goodsList", gdslist);
	}

	// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 페이징 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 상품목록 검색(상품리스트화면)
	public Paging getGoodsViewByKey(Keywords k, int curPage, double cnt, HttpServletRequest request) {
		List<GoodsView> gdv = ss.getMapper(GoodsMapper.class).getGoodsViewByKey(k);

		// double cnt = 10;// 페이지당 건수
		int listSize = gdv.size();

		int allPage = (int) Math.ceil(listSize / cnt);// 총페이지 올림
		request.setAttribute("pageCount", allPage);

		int start = listSize - (int) cnt * (curPage - 1);// 페이지 첫번째 게시물
		int end = (curPage == allPage) ? 1 : start - ((int) cnt - 1);// 페이지 마지막 게시물

		List<GoodsView> gdsPage = new ArrayList<>();// 해당 페이지 게시물 리스트

		// start가 0인 경우 -1이 나와서 익셉션걸림(검색결과가 0인 경우에 -1이 됨)
		if (start > 0) {
			for (int i = start; i >= end; i--) {
				gdsPage.add(gdv.get(i - 1));
			}
		}

		return new Paging(curPage, allPage, gdsPage);
	}

	// 상품목록 전체조회(상품리스트화면)
	public void getAllGoodsView(Goods gds, HttpServletRequest request) {
		List<GoodsView> gdv = ss.getMapper(GoodsMapper.class).getAllGoodsView(gds);

		int curPage = 1;
		double cnt = 10;// 페이지당 건수
		int listSize = gdv.size();

		int allPage = (int) Math.ceil(listSize / cnt);// 총페이지 올림
		request.setAttribute("pageCount", allPage);

		int start = listSize - (int) cnt * (curPage - 1);// 페이지 첫번째 게시물
		int end = (curPage == allPage) ? 1 : start - ((int) cnt - 1);// 페이지 마지막 게시물

		List<GoodsView> gdsPage = new ArrayList<>();// 해당 페이지 게시물 리스트

		// start가 0인 경우 -1이 나와서 익셉션걸림(검색결과가 0인 경우에 -1이 됨)
		if (start > 0) {
			for (int i = start; i >= end; i--) {
				gdsPage.add(gdv.get(i - 1));
			}
		}
		request.setAttribute("gdsViewList", gdsPage);
	}
	// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 페이징 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	// 입력 ==================================================
	public void insertGd(Goods gd, HttpServletRequest request, HttpServletResponse response) {
		// 이미지 문제
		if (ss.getMapper(GoodsMapper.class).insertGds(gd) == 1) {
			System.out.println("insertGd성공");
		} else {
			System.out.println("insertGd해당항목 없음");
		}
	}

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

	public void insertOpTwoForUp(HashMap<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) {
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

		// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 옵션 여러개 입력할 때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		Option op = new Option();
		for (int i = 0; i < opl.getOpl_name().size(); i++) {

			if (!opl.getOpl_name().get(i).equals("") && !opl.getOpl_price().get(i).equals("")
					&& !opl.getOpl_stock().get(i).equals("")) {

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
		}
		// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 옵션 여러개 입력할 때 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	}

	// 업데이트================================================

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

		// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 옵션 여러개 입력할 때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		Option op = new Option();
		for (int i = 0; i < opl.getOpl_name().size(); i++) {
			if (!opl.getOpl_name().get(i).equals("") && !opl.getOpl_price().get(i).equals("")
					&& !opl.getOpl_stock().get(i).equals("")) {

				op.setOp_no(opl.getOpl_no().get(i));
				op.setOp_name(opl.getOpl_name().get(i));
				op.setOp_price(new BigDecimal(opl.getOpl_price().get(i)));
				op.setOp_stock(new BigDecimal(opl.getOpl_stock().get(i)));
				// 입력(상품상세 파라메터 작성goods, goodsDtl)
				HashMap<String, Object> map2 = new HashMap<String, Object>();

				map2.put("goods", gd);
				map2.put("option", op);

				// 옵션번호가 없으면 수정이 아닌 입력이 필요(옵션 번호 이외는 필수체크로 null이나""이면 안됨)
				// ""일때 size가 0 이되서 화면에서 "insert" 강제 입력
				if (op.getOp_no().equals("insert")) {
					System.out.println("수정화면 옵션 입력");
					insertOpTwoForUp(map2, request, response);
				} else {
					// 수정(옵션테이블)
					updateOpTwo(map2, request, response);
				}
			}
		}
		// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 옵션 여러개 입력할 때 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
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

	// 삭제 ==================================================
	// 상품 삭제
	public void deleteGoodsByNo(Goods gd) {
		if (ss.getMapper(GoodsMapper.class).deleteGoodsByNo(gd) == 1) {
			System.out.println("deleteGoodsByNo 성공");
		} else {
			System.out.println("deleteGoodsByNo 해당자료 없음");
		}
	}

	// 상품상세 삭제
	public void deleteGoodsDtlByNo(Goods gd) {
		if (ss.getMapper(GoodsMapper.class).deleteGoodsDtlByNo(gd) == 1) {
			System.out.println("deleteGoodsDtlByNo 성공");
		} else {
			System.out.println("deleteGoodsDtlByNo 해당자료 없음");
		}
	}

	// 옵션 삭제(상품번호에 해당하는 모든 옵션삭제)
	public void deleteGoodsOpByNo(Goods gd) {
		if (ss.getMapper(GoodsMapper.class).deleteOpByGoodsNo(gd) == 1) {
			System.out.println("deleteGoodsOpByNo 성공");
		} else {
			System.out.println("deleteGoodsOpByNo 해당자료 없음");
		}
	}

	// 트랜잭션 (옵션, 상세, 상품, 이미지) 삭제
	public void deleteGdsInfo(Goods gd, HttpServletRequest request) throws Exception {

		// 이미지 파일명 가져오기
		String imgl = gd.getGd_imgl();
		String imgm = gd.getGd_imgm();
		String imgs = gd.getGd_imgs();
		String imgss = gd.getGd_imgss();

		// 서버기본경로 (프로젝트 폴더 아님)
		String defaultPath = request.getSession().getServletContext().getRealPath("/");
		String path = defaultPath + "upload" + File.separator + "";

		// 옵션 삭제
		deleteGoodsOpByNo(gd);
		// 상품상세 삭제
		deleteGoodsDtlByNo(gd);
		// 상품 삭제
		deleteGoodsByNo(gd);

		// 이미지 삭제
		if (fileDelete(path, imgl) && fileDelete(path, imgm) && fileDelete(path, imgs) && fileDelete(path, imgss)) {
			System.out.println("이미지 삭제 완료");
		} else {
			System.out.println("이미지 삭제 실패");
		}
	}

	// 파일 삭제
	public boolean fileDelete(String path, String filename) throws Exception {

		// System.out.println("path==="+path);
		// System.out.println("filename==="+filename);
		// path 파일 경로, filename 파일 이름
		File oldFile = new File(path + filename);

		if (oldFile.delete()) {
			return true;
		} else {
			throw new Exception();
		}
	}

	// 옵션삭제 (옵션번호, 옵션 상품번호)
	// 옵션번호로만 삭제 하면 옵션셀렉트 값으로 삭제가 되는 문제가 발생
	// 옵션상품번호와 옵션번호 두가지가 일치 해야지 삭제 되도록 변경
	public boolean deleteOpByNo(Option op) throws Exception {
		if (ss.getMapper(GoodsMapper.class).deleteOpByNo(op) == 1) {
			System.out.println("deleteOpByNo 성공");
			return false;
		} else {
			System.out.println("deleteOpByNo 해당자료 없음");
			return true;
		}
	}

	// 상품번호로 옵션 가져오기
	public List<Option> getOptionByGdNo(Option op) {
		return ss.getMapper(GoodsMapper.class).getOptionByNo(op);
	}

}