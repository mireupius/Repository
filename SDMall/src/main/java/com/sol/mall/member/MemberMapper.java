package com.sol.mall.member;

public interface MemberMapper {
	
	public abstract int registerCSM(Customer c);
	//public abstract int registerSL(Seller s);
//	public abstract int regTP(Product p);
	public abstract Customer getCustomerById(Customer c);
//	public abstract Seller getSellerById(Seller s);

}
