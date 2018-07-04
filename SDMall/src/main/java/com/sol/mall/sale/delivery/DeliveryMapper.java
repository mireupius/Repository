package com.sol.mall.sale.delivery;

import java.util.List;

public interface DeliveryMapper {
	
	
	// --- 신규/발주
	public abstract List<Delivery> getAllDelivery(Delivery d);
	public abstract List<Delivery> getNewDeliverys(Delivery d);
	public abstract List<Delivery> getCheckDeliverys(Delivery d);
	
	public abstract int getNewDeliveryNum(Delivery d);
	public abstract int getCheckDeliveryNum(Delivery d);
	public abstract int getAllDeliveryNum(Delivery d);
	
	public abstract int sendDeliverys(Delivery d);
	public abstract int deliveryCheck(Delivery d);
	
	// --- 배송관리
	public abstract int getSendingDeliverysNum(Delivery d);
	public abstract int getSendDoneDeliveryNum(Delivery d);
	
	public abstract List<Delivery> getSendingDeliverys(Delivery d);
	public abstract List<Delivery> getSendDoneDeliverys(Delivery d);
	
	
	// --- 구매확정
	
	public abstract List<Delivery> getConfirmDelivery(Delivery d);
	public abstract int getConfirmDeliveryNum(Delivery d);

	
	// --- 취소
	
	public abstract List<Delivery> getCancelDelivery(Delivery d);
	public abstract int getCancelDeliveryNum(Delivery d);

	
	// --- 반품
	
	public abstract List<Delivery> getReturnDelivery(Delivery d);
	public abstract int getReturnDeliveryNum(Delivery d);

	
	// --- 교환
	public abstract List<Delivery> getExchangeDelivery(Delivery d);
	public abstract int getExchangeDeliveryNum(Delivery d);


}
