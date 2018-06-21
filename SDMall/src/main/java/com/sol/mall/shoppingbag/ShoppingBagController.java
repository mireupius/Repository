package com.sol.mall.shoppingbag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingBagController {

	@Autowired
	private ShoppingBagDAO sbDAO;

	@RequestMapping(value = "/cart.add", method = RequestMethod.GET)
	public String home(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {
		sbDAO.addToCart(sb, req, res);
		return "main";
	}

}
