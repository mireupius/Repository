package com.sol.mall.buying;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.sale.delivery.Delivery;

@Controller
public class BuyingController {

	@Autowired
	private BuyingDAO BDAO;

	@RequestMapping(value = "/buying.go", method = RequestMethod.POST)
	public String buyingGo(HttpServletRequest req, HttpServletResponse res, Delivery delivery) {
		BDAO.containProduct(req, res, delivery);
		req.setAttribute("contentPage", "buying/buying.jsp");
		return "main";
	}

	@RequestMapping(value = "/buyingFormBarsket.go", method = RequestMethod.POST)
	public String buyingFormBarsket(HttpServletRequest req, HttpServletResponse res, Delivery delivery) {

		req.setAttribute("contentPage", "buying/buying.jsp");
		return "main";
	}

	@RequestMapping(value = "/buying.do", method = RequestMethod.POST)
	public String doBuying(Delivery delivery, Order order, HttpServletRequest req, HttpServletResponse res) {
		BDAO.doBuying(delivery, order, req, res);
		req.setAttribute("contentPage", "buying/buying.jsp");
		return "main";
	}
}
