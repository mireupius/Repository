package com.sol.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.shoppingbag.ShoppingBagDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private CategoryDAO cDAO;
	
	@Autowired
	private ShoppingBagDAO sbDAO;
	
	@Autowired
	private MemberDAO mDAO;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(request, response)) {//로그인체크
			sbDAO.showCartItems(request, response);//장바구니 상품수량 반환
		}

		request.setAttribute("contentPage", "home.jsp");
		return "main";
	}

}