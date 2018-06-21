package com.sol.mall.myPage;

import java.util.List;

import com.sol.mall.member.Membership;

public interface MyPageMapper {
	
	public abstract List<Shoppingbag> orderList(Buy bb);
	public abstract Membership membershipStatus(Membership m);
	

}
