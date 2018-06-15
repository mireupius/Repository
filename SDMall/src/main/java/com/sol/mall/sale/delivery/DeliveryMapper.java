package com.sol.mall.sale.delivery;

import java.util.List;

public interface DeliveryMapper {
	public abstract List<Delivery> getAllDelivery();
	public abstract List<Delivery> getNewDeliverys();
	public abstract List<Delivery> getCheckDeliverys();
	
	public abstract List<Delivery> getSendingDeliverys();
	public abstract List<Delivery> getSendDoneDeliverys();
	
	
	public abstract int deliveryCheck(Delivery d);
	public abstract int getNewDeliveryNum();
	public abstract int getCheckDeliveryNum();
	public abstract int getAllDeliveryNum();
	
	public abstract int getSendingDeliverysNum();
	public abstract int getSendDoneDeliveryNum();
}
