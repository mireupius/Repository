package com.sol.mall.goods;

import java.util.HashMap;
import java.util.List;

public interface GoodsMapper {

	// 카테고리 전체 조회
	public abstract List<Category> getAllcategory();

	// 카테고리 분류별 카테고리정보 조회
	public abstract List<Category> getCategory(Category cg);

	// 상품 입력
	public abstract int insertGds(Goods g);

	// 상품상세 입력
	public abstract int insertGdsDtl(GoodsDtl g);

	// 상품 전체 조회
	public abstract List<Goods> getAllGoods();

	// 상품 전체 조회
	public abstract List<GoodsView> getAllGoodsView(Goods g);
	
	// 상품 리스트 검색어 조회
	public abstract List<GoodsView> getGoodsViewByKey(Keywords k);

	// 상품상세 조회
	public abstract List<GoodsDtl> getGoodsDtl();
	
	// 상품상세 입력 다중파라메터사용
	public abstract int insertGdtlTwo(HashMap<String, Object> map);

	// 옵션입력
	public abstract int insertOpTwo(HashMap<String, Object> map);

	// 수정 화면에서 추가 옵션입력
	public abstract int insertOpTwoForUp(HashMap<String, Object> map);
	
	// 선택한 상품 상세화면표시 	
	public abstract GoodsView getGoodsView(GoodsView gv);

	// 상품상세화면에 사용할 카테고리
	public abstract List<Category> getCtgryForView(GoodsCategory gc);

	// 상품번호로 옵션 조회
	public abstract List<Option> getOptionByNo(Option op); 
	
	// 상품 수정
	public abstract int updateGds(Goods g);

	// 상품상세 수정 다중파라메터사용
	public abstract int updateGdtlTwo(HashMap<String, Object> map);

	// 옵션입력
	public abstract int updateOpTwo(HashMap<String, Object> map);
	
	// 상품삭제
	public abstract int deleteGoodsByNo(Goods g);
	
	// 상품상세삭제
	public abstract int deleteGoodsDtlByNo(Goods g);
	
	// 옵션삭제 (상품번호)
	public abstract int deleteOpByGoodsNo(Goods g);
	
	// 옵션삭제 (옵션번호, 옵션 상품번호)
	// 옵션번호로만 삭제 하면 옵션셀렉트 값으로 삭제가 되는 문제가 발생
	// 옵션상품번호와 옵션번호 두가지가 일치 해야지 삭제 되도록 변경
	public abstract int deleteOpByNo(Option op);

	public abstract Goods getGoodsByNo(Goods goods);// 상품코드로 상품 조회

	public abstract GoodsDtl getGoodsDtlByNo(Goods goods);// 상품코드로 상품 상세 조회
	
	public abstract List<Goods> searchGoods(Goods goods);//이름과 키워드로 상품 검색
	
	public abstract List<Goods> getGoodsByName(Goods goods);//상품이름검색

	public abstract List<Goods> getGoodsByCate(Category category);// 카테고리 상품 조회
}
