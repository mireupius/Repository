package com.sol.mall.sale.delivery;

import java.util.List;

public interface DeliveryMapper {
	
	
	// --- 신규/발주
	public abstract List<Delivery> getAllDelivery();
	public abstract List<Delivery> getNewDeliverys();
	public abstract List<Delivery> getCheckDeliverys();
	
	public abstract int getNewDeliveryNum();
	public abstract int getCheckDeliveryNum();
	public abstract int getAllDeliveryNum();
	
	public abstract int sendDeliverys(Delivery d);
	public abstract int deliveryCheck(Delivery d);
	
	// --- 배송관리
	public abstract int getSendingDeliverysNum();
	public abstract int getSendDoneDeliveryNum();
	
	public abstract List<Delivery> getSendingDeliverys();
	public abstract List<Delivery> getSendDoneDeliverys();
	
	
	// --- 구매확정
	
	public abstract List<Delivery> getConfirmDelivery();
	public abstract int getConfirmDeliveryNum();

	
	// --- 취소
	
	public abstract List<Delivery> getCancelDelivery();
	public abstract int getCancelDeliveryNum();

	
	// --- 반품
	
	public abstract List<Delivery> getReturnDelivery();
	public abstract int getReturnDeliveryNum();

	
	// --- 교환
	public abstract List<Delivery> getExchangeDelivery();
	public abstract int getExchangeDeliveryNum();


}
