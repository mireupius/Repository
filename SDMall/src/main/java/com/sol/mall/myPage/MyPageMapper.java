package com.sol.mall.myPage;

import java.util.List;

import com.sol.mall.member.Membership;
import com.sol.mall.sale.delivery.Delivery;

public interface MyPageMapper {
	
	public abstract List<Delivery> searchOrderList(SearchOrder bb);
	public abstract int orderCorrect(Delivery d);
	public abstract Membership membershipStatus(Membership m);
	

}
