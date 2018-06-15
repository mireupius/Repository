package com.sol.mall.shoppingbag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingController {

	@Autowired
	private ShoppingDAO SDAO;

	// @RequestMapping(value = "/shopbag.get.do", method = RequestMethod.GET)
	// public String shopbagGet(Shoppingbag sb, HttpServletRequest req,
	// HttpServletResponse res) {
	//
	// SDAO.getCart(sb, req, res);
	// return "member/as";
	//
	
	// }
	@RequestMapping(value = "/shopbag.get.do", method = RequestMethod.GET)
	public String shopbagGet(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		SDAO.getoption(req, res);
		SDAO.getCart(sb, req, res);
		SDAO.getprice(res, req);
		SDAO.getpriceALL(res, req);
		SDAO.saleprice(req, res);
		return "shoppingbag";

	}
	
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String gohome(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		return "member/loginArea";

	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deletegd(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		System.out.println(sb.getSb_gd_no());
		SDAO.deletegd(sb, req, res);
		SDAO.getCart(sb, req, res);
		SDAO.getoption(req, res);
		SDAO.getprice(res, req);
		SDAO.getpriceALL(res, req);
		SDAO.saleprice(req, res);
		return "shoppingbag";

	}
	
	@RequestMapping(value = "/stockcheck.go", method = RequestMethod.GET)
	public String stockcheck(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		System.out.println(sb.getSb_gd_no());
		SDAO.deletegd(sb, req, res);
		SDAO.getCart(sb, req, res);
		SDAO.getoption(req, res);
		SDAO.getprice(res, req);
		SDAO.getpriceALL(res, req);
		SDAO.saleprice(req, res);
		return "shoppingbag";

	}
	
	
	@RequestMapping(value = "/deleteAll.do", method = RequestMethod.GET)
	public String deletegdAll(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		System.out.println(sb.getSb_csm_id());
		SDAO.deletegdAll(sb, req, res);
		SDAO.getCart(sb, req, res);
		SDAO.getprice(res, req);
		SDAO.getpriceALL(res, req);
		SDAO.saleprice(req, res);
		return "shoppingbag";

	}


}
