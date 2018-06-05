package com.sol.mall.sale.delivery;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryDAO DDAO;

	@RequestMapping(value = "/saleMain.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res) {
		DDAO.getAllOrder(req, res);
		req.setAttribute("saleNav", "saleNav.jsp");
		req.setAttribute("saleContent", "saleHome.jsp");
		return "sale/saleIndex";
	}
	
	@RequestMapping(value = "/delivery.new.go", method = RequestMethod.GET)
	public String delivery(HttpServletRequest req, HttpServletResponse res) {
		DDAO.getAllOrder(req, res);
		req.setAttribute("saleNav", "saleNav.jsp");
		req.setAttribute("saleContent", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}
}
