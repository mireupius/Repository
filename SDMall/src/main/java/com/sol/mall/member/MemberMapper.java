package com.sol.mall.member;

import java.util.List;

public interface MemberMapper {
	
	// 회원가입 관련
	public abstract int registerCSM(Customer c);
	public abstract int registerSL(Seller s);
	
	// 아이디로 구매자 정보가져오기(단일)
	public abstract Customer getCustomerById(Customer c);
	// 아이디로 구매자 정보가져오기(복수, Ajax)
	public abstract List<Customer> getCustomerById2(Customer c);
	// 아이디로 판매자 정보가져오기(단일)
	public abstract Seller getSellerById(Seller s);
	// 아이디로 판매자 정보가져오기(복수, Ajax)
	public abstract List<Seller> getSellerById2(Seller s);
	
	// 회원정보 수정
	public abstract int updateCSMInfo(Customer c);
	public abstract int updateSLInfo(Seller s);
	
	// 회원탈퇴
	public abstract int withdrawCSM(Customer c);
	public abstract int withdrawSL(Seller s);
	
	// 멤버십 등록(구매자 회원가입 관련 DAO에서 작동)
	public abstract int registerMemberShip(Membership m);
	// 멤버십 탈퇴(구매자 회원탈퇴 관련 DAO에서 자동)
	public abstract int withdrawMemberShip(Membership m);

}
