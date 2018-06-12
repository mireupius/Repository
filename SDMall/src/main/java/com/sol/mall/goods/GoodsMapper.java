package com.sol.mall.goods;

import java.util.List;

public interface GoodsMapper {

	public abstract List<Category> getAllcategory();
	
	public abstract int insertCT(TestContent tct);
	
	public abstract List<TestContent> getAll();
	
}
