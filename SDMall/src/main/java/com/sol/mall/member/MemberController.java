
package com.sol.mall.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO MDAO;
	
	
	@RequestMapping(value = "/customer.register.go", method = RequestMethod.GET)
	public String goRegCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		return "member/regCSMPage";
		
	}
	
//	@RequestMapping(value = "/customer.register.do", method = RequestMethod.GET)
//	public String doRegCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {
//		
//		MDAO.registerCSM(c, req, res);
//		return "member/loginArea";
//		
//	}
	
	@RequestMapping(value = "/seller.register.go", method = RequestMethod.GET)
	public String goRegSeller(HttpServletRequest req, HttpServletResponse res) {
		
		return "member/regSLPage";
		
	}
	
	@RequestMapping(value = "/seller.register.do", method = RequestMethod.GET)
	public String doRegSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.registerSL(s, req, res);
		return "member/loginArea";
		
	}
	
	@RequestMapping(value = "/product.register.go", method = RequestMethod.GET)
	public String goRegP(HttpServletRequest req, HttpServletResponse res) {
		
		return "member/regP";
		
	}
	
	@RequestMapping(value = "/product.register.do", method = RequestMethod.GET)
	public String regP(Product p, HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.regTP(p, req, res);
		return "member/loginArea";
		
	}
	
	@RequestMapping(value = "/customer.login.do", method = RequestMethod.POST)
	public String loginMember(Customer c, HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.loginCustomer(c, req, res);
		return "member/loginArea";
		
	}
//	@RequestMapping(value = "/shopbag.get.do", method = RequestMethod.GET)
//	public String shopbagGet(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {
//
//		MDAO.getCart(sb, req, res);
//		return "member/as";
//
//	}
	
	
	

}
