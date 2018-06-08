package com.sol.mall.sale.delivery;

import java.util.List;

public interface DeliveryMapper {
	public abstract List<Delivery> getAllDelivery();
	public abstract int deliveryCheck(Delivery d);
}
