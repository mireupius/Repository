package com.sol.mall.myPage;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import com.sol.mall.member.Membership;
import com.sol.mall.sale.delivery.Delivery;

public interface MyPageMapper {
	
	// 주문관련
	public abstract List<SearchOrder> searchOrderList(HashMap<String, Object> g);
	public abstract List<SearchOrder> searchClaimedOrderList(HashMap<String, Object> g);
	public abstract List<Delivery> orderListToReview(Delivery d);
	public abstract Delivery getOrderInfoBySd_pno(Delivery d);
	public abstract int cancelOrder(Delivery d);
	public abstract int exchangeOrder(Delivery d);
	public abstract int returnOrder(Delivery d);
	public abstract int completeDelivery(Delivery d);
	public abstract int completeBuyOrder(Delivery d);
	
	// 누적금 관련
	public abstract BigDecimal getTotalBuyPriceById(Delivery d);
	public abstract BigDecimal getTotalBuyPriceByPno(Delivery d);
	public abstract int updateCumulativePrice(Membership m);
	
	// 멤버십 관련
		// 멤버십 정보 
	public abstract Membership membershipStatus(Membership m);
		// 멤버십 등급
	public abstract int updateMemberShipGrade(Membership m);
		// 적립금
	public abstract int updateAccumulatePoint(Membership m);
	
	// 활동관리
	public abstract int writeProductReview(ProductReview pr);
	// sale_delivery테이블 review 상태 변경
	public abstract int changeReviewState(ProductReview pr);
	public abstract List<ProductReview> getWritedReview(ProductReview pr);
	
	// Q&A
	public abstract List<QuestionAnswer> searchQAByCustomerId(QuestionAnswer qa);
	
	public abstract int writeQuestionToSeller(QuestionAnswer qa);
	
}
