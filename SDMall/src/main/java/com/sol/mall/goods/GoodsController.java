package com.sol.mall.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GoodsController {

	@Autowired
	GoodsDAO gDAO;

	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String getAllGoods(HttpServletRequest request, HttpServletResponse response) {
		gDAO.getAllGoods(request, response);
		return "shop";
	}
}
