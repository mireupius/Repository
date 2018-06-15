package com.sol.mall.shoppingbag;

import java.util.List;

public interface ShoppingbagMapper {
	public abstract List<Shoppingbag> getcart(Shoppingbag s);
	public abstract List<Summoney> getprice(Summoney s);
	public abstract List<Saleprice> getsaleprice(Saleprice s);
	public abstract List<Summoney> getSprice(Summoney s);
	public abstract int deletegd(Shoppingbag s);
	public abstract int deletegdAll(Shoppingbag s);
	public abstract List<GdOption> joinSBOS();
}

