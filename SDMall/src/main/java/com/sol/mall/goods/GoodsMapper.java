package com.sol.mall.goods;

import java.util.List;

public interface GoodsMapper {
	public abstract List<Goods> getAllGoods();
	
	public abstract GoodsDtl getGoodsDtlByNo(Goods goods);
}
