package com.sol.mall.goods;

import java.util.List;

public interface GoodsMapper {

	public abstract List<Category> getAllcategory();
	
	public abstract List<Category> getCategory(Category cg);
	
	
	public abstract int insertGdsDtl(GoodsDtl g);
	
	public abstract List<GoodsDtl> getGoodsDtl();
	
	
	// 테스트용 
	public abstract int insertCT(TestContent tct);
	public abstract List<TestContent> getAll();
	
}
