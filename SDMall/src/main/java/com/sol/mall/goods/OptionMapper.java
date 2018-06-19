package com.sol.mall.goods;

import java.util.List;

public interface OptionMapper {
	public abstract List<Option> getOptionByGdno(Goods goods);

}
