package com.sol.mall.member;

<<<<<<< HEAD
public interface MemberMapper {
	
	public abstract int registerCSM(Customer c);
	//public abstract int registerSL(Seller s);
//	public abstract int regTP(Product p);
	public abstract Customer getCustomerById(Customer c);
//	public abstract Seller getSellerById(Seller s);

=======
import java.util.List;

public interface MemberMapper {
	
	public abstract int registerCSM(Customer c);
	public abstract int registerSL(Seller s);
	public abstract int regTP(Product p);
	public abstract Customer getCustomerById(Customer c);
	public abstract Seller getSellerById(Seller s);
	public abstract List<Shoppingbag> getcart(Shoppingbag s);
>>>>>>> refs/remotes/origin/Oh
}
