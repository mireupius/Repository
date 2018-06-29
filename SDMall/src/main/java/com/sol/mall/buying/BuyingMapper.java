package com.sol.mall.buying;

import com.sol.mall.sale.delivery.Delivery;

public interface BuyingMapper {

	public abstract int insertOrder(Order order);
	public abstract int insertDelivery(Delivery delivery);
	public abstract int changeIsOrderToYes(Order order);

}
