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
	
	// 상품상세 조회
	public abstract List<GoodsDtl> getGoodsDtl();
	
	// 다중 입력
	public abstract int insertGdtlTwo(HashMap<String, Object> map);

	public abstract int insertOpTwo(HashMap<String, Object> map);
	
	
}
