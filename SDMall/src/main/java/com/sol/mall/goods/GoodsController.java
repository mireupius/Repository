package com.sol.mall.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.category.CategoryDAO;

@Controller
public class GoodsController {

	@Autowired
	GoodsDAO gDAO;
	
	@Autowired
	CategoryDAO cDAO;

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String getAllGoods(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gDAO.getAllGoods(request, response);
		request.setAttribute("contentPage", "goods/shop.jsp");
		return "main";
	}

	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String getGoodsDtlByNo(Goods goods,HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gDAO.getGoodsByNo(goods, request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "main";
	}
}
