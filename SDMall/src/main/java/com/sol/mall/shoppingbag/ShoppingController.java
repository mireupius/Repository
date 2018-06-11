package com.sol.mall.shoppingbag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class ShoppingController {
	
	private ShoppingDAO SDAO;
	
	@RequestMapping(value = "/shopbag.get.do", method = RequestMethod.GET)
	public String shopbagGet(Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {
		
		SDAO.getCart(sb, req, res);
		return "member/as";
		
	}

}
