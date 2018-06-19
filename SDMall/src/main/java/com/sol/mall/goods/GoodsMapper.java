package com.sol.mall.goods;

import java.util.List;

public interface GoodsMapper {
	public abstract List<Goods> getAllGoods();

	public abstract Goods getGoodsByNo(Goods goods);

	public abstract GoodsDtl getGoodsDtlByNo(Goods goods);

}
