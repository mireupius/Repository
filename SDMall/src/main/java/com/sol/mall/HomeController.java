package com.sol.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.category.CategoryDAO;
import com.sol.mall.goods.GoodsDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	private CategoryDAO cDAO;

	@Autowired
	private GoodsDAO gDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		// req.setAttribute("loginInfo", "loginArea.jsp");
		// return "member/loginPage";
		cDAO.getAllCategory(request, response);// 메인 카테고리 호출 메소드

		request.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);

		gDAO.getAllGoods(request, response);
		return "maintest";
	}

}
