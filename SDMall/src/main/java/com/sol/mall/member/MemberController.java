package com.sol.mall.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO MDAO;

	@RequestMapping(value = "/member.loginPage", method = RequestMethod.GET)
	public String goLoginPage(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("loginInfo", "loginArea.jsp");
		return "member/loginPage";

	}
	@RequestMapping(value = "/customer.register.go", method = RequestMethod.GET)
	public String goRegCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		return "member/regCSMPage";
		
	}

	@RequestMapping(value = "/customer.getAll.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Customers getAllCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		
		return MDAO.getAllCustomer(req, res);
		
	}
	
	@RequestMapping(value = "/customer.validCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Customers csmValidCheck(Customer c, HttpServletRequest req, HttpServletResponse res) {
		
		return MDAO.customerCheck(c, req, res);
		
	}
	
	@RequestMapping(value = "/customer.register.do", method = RequestMethod.POST)
	public String doRegCustomer(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {
		MDAO.registerCSM(c, m, req, res);
		System.out.println(c.getCsm_birth());
		return "member/loginArea";

	}

	@RequestMapping(value = "/seller.register.go", method = RequestMethod.GET)
	public String goRegSeller(HttpServletRequest req, HttpServletResponse res) {

		return "member/regSLPage";

	}

	@RequestMapping(value = "/seller.register.do", method = RequestMethod.POST)
	public String doRegSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		MDAO.registerSL(s, req, res);
		return "member/loginArea";

	}
	
	@RequestMapping(value = "/seller.validCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Sellers slValidCheck(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		return MDAO.sellerCheck(s, req, res);
		
	}

	@RequestMapping(value = "/customer.login.do", method = RequestMethod.GET)
	public String loginCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		MDAO.loginCustomer(c, req, res);
		if(MDAO.csmLoginCheck(req, res)) {
			
			return "customer/customerMain2";
			
		}else {
			return "member/loginPage";
		}
	
	}
	
	@RequestMapping(value = "/customer.myHome.go", method = RequestMethod.GET)
	public String goMyhome(Customer c, HttpServletRequest req, HttpServletResponse res) {
		
		
		if(MDAO.csmLoginCheck2(req, res)) {
			
			return "customer/customerMyPage";
			
		}else {
			return "member/loginPage";
		}
		
	}
	
	
	
	@RequestMapping(value = "/seller.login.do", method = RequestMethod.GET)
	public String loginSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.loginSeller(s, req, res);
		if(MDAO.slLoginCheck(req, res) == true) {
			
			return "seller/sellerManageMain";
	
		}else {
			return "member/loginArea";
			
		}
		
	}
	
	@RequestMapping(value = "/customer.logout.do", method = RequestMethod.GET)
	public String logoutCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.logoutCustomer(req, res);
		MDAO.csmLoginCheck(req, res);
		return "customer/customerMain2";
			
	}
	
	@RequestMapping(value = "/seller.logout.do", method = RequestMethod.GET)
	public String logoutSeller(HttpServletRequest req, HttpServletResponse res) {
		
		MDAO.logoutSeller(req, res);
		MDAO.slLoginCheck(req, res);
		return "member/loginArea";
		
		
	}

	//@RequestMapping(value = "/shopbag.get.do", method = RequestMethod.GET)
	//public String shopbagGet(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		//MDAO.getCart(sb, req, res);
		//return "member/as";

	//}

	@RequestMapping(value = "/customer.update.go", method = RequestMethod.GET)
	public String goUpdateCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.csmLoginCheck(req, res)) {
			
			return "member/updateCSMPage";
		
		}else {
			return "member/loginPage";
		}
		
	}
	
	@RequestMapping(value = "/customer.update.do", method = RequestMethod.POST)
	public String doUpdateCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.csmLoginCheck(req, res)) {
			
			MDAO.updateCustomer(c, req, res);
			return "customer/csmLoginOK";
			
		}else {
			return "member/loginPage";
		}
		
	}
	
	@RequestMapping(value = "/seller.update.go", method = RequestMethod.GET)
	public String goUpdateSeller(HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.slLoginCheck(req, res)) {
			
			return "member/updateSLPage";
			
		}else {
			return "member/loginPage";
		}
		
	}
	
	@RequestMapping(value = "/seller.update.do", method = RequestMethod.POST)
	public String doUpdateSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.slLoginCheck(req, res)) {
			
			MDAO.updateSeller(s, req, res);
			return "seller/slLoginOK";
			
		}else {
			return "member/loginPage";
		}
		
	}
	
	@RequestMapping(value = "/customer.withdraw.go", method = RequestMethod.GET)
	public String goWithdrawCustomer(HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.csmLoginCheck(req, res)) {
			
			return "member/withdrawCSMPage";
		
		}else {
			return "member/loginPage";
		}
		
	}
	
	@RequestMapping(value = "/customer.withdraw.do", method = RequestMethod.GET)
	public String doWithdrawCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {
	
			MDAO.withdrawCustomer(c, req, res);
			MDAO.logoutCustomer(req, res);
			MDAO.csmLoginCheck(req, res);
			return "member/loginPage";
		
	}
	
	@RequestMapping(value = "/seller.withdraw.go", method = RequestMethod.GET)
	public String goWithdrawSeller(HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.slLoginCheck(req, res)) {
			
			return "member/withdrawSLPage";
			
		}else {
			return "loginPage";
		}
		
	}
	
	@RequestMapping(value = "/seller.withdraw.do", method = RequestMethod.GET)
	public String doWithdrawSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		if(MDAO.slLoginCheck(req, res)) {
			
			MDAO.withdrawSeller(s, req, res);
			MDAO.logoutCustomer(req, res);
			MDAO.slLoginCheck(req, res);
		}
		return "member/loginPage";
		
	}
	

	
}
