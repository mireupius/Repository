package com.sol.mall.shoppingbag;

import java.util.List;

import com.sol.mall.member.Customer;

public interface ShoppingBagMapper {
	public abstract int addToCart(ShoppingBag sb);

	public abstract List<ShoppingBag> showCartItems(ShoppingBag sb);

	public abstract int deleteCartItem(ShoppingBagItem sbItem);

	public abstract int deleteAllCartItem(Customer cc);
}
