package com.sol.mall.shoppingbag;

import java.util.List;

public interface ShoppingBagMapper {
	public abstract int addToCart(ShoppingBag sb);
	public abstract List<ShoppingBag> showCartItems(ShoppingBag sb);
}
