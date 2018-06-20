package com.sol.mall.member;

import java.util.List;

public interface MemberMapper {
	
	public abstract int registerCSM(Customer c);
	public abstract int registerSL(Seller s);
	public abstract int regTP(Product p);
	public abstract Customer getCustomerById(Customer c);
	public abstract List<Customer> getCustomerById2(Customer c);
	public abstract Seller getSellerById(Seller s);
	public abstract List<Seller> getSellerById2(Seller s);
	public abstract List<Customer> getAllCustomer();
	public abstract int updateCSMInfo(Customer c);
	public abstract int updateSLInfo(Seller s);
	public abstract int withdrawCSM(Customer c);
	public abstract int withdrawSL(Seller s);
	public abstract int registerMemberShip(Membership m);

}
