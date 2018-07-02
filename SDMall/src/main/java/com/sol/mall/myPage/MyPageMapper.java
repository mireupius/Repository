package com.sol.mall.myPage;

import java.util.HashMap;
import java.util.List;

import com.sol.mall.goods.Goods;
import com.sol.mall.member.Membership;
import com.sol.mall.sale.delivery.Delivery;

public interface MyPageMapper {
	
	// 주문관리
	public abstract List<Delivery> searchOrderList(SearchOrder bb);
	public abstract List<Delivery> searchClaimedOrderList(SearchOrder bb);
	public abstract List<Delivery> orderListToReview(Delivery d);
	//public abstract List<Delivery> searchGoodsByGd_no(Goods g);
	public abstract Delivery getOrderInfoBySd_pno(Delivery d);
	public abstract int cancelOrder(Delivery d);
	public abstract int exchangeOrder(Delivery d);
	public abstract int returnOrder(Delivery d);
	public abstract int writeQuestionToSeller(QuestionAnswer qa);
	public abstract Membership membershipStatus(Membership m);
	public abstract List<SearchOrder2> searchoo(HashMap<String, Object> g);
	
	// 활동관리
	public abstract int writeProductReview(ProductReview pr);
	public abstract int changeReviewState(ProductReview pr);
	public abstract List<ProductReview> getWritedReview(ProductReview pr);
	public abstract List<Delivery> searchOrderList2(SearchOrder so);
	public abstract List<QuestionAnswer> searchQAByCustomerId(QuestionAnswer qa);
	


}
