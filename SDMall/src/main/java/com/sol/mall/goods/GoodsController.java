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
	private GoodsDAO gdsDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goods(HttpServletRequest request, HttpServletResponse response) {

		gdsDAO.getAllcategory(request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "index";
	}

	@RequestMapping(value = "/editor.do", method = RequestMethod.POST)
	public String editor(TestContent tct, HttpServletRequest request, HttpServletResponse response) {
		gdsDAO.insertCT(tct, request, response);
		gdsDAO.view( request, response);
		
		request.setAttribute("contentPage", "goods/test.jsp");
		return "index";
	}


}