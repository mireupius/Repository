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

	// 상품 조회
	public abstract List<Goods> getGoods();

	// 상품 전체 조회
	public abstract List<Goods> getAllGoods();

	// 상품 전체 조회
	public abstract List<Goods> getGoodsByKey(Keywords k);

	// 상품상세 조회
	public abstract List<GoodsDtl> getGoodsDtl();

	// 다중 입력
	public abstract int insertGdtlTwo(HashMap<String, Object> map);

	// 옵션입력
	public abstract int insertOpTwo(HashMap<String, Object> map);

	// 선택한 상품 상세화면표시
	public abstract GoodsView getGoodsView(GoodsView gv);

	// 상품상세화면에 사용할 카테고리
	public abstract List<Category> getCtgryForView(GoodsCategory gc);

	public abstract Goods getGoodsByNo(Goods goods);// 상품코드로 상품 조회

	public abstract GoodsDtl getGoodsDtlByNo(Goods goods);// 상품코드로 상품 상세 조회

	public abstract List<Goods> getGoodsByCate();// 카테고리 상품 조회
}
