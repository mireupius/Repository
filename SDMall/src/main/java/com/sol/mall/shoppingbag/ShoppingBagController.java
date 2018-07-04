package com.sol.mall.shoppingbag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;

@Controller
public class ShoppingBagController {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private ShoppingBagDAO sbDAO;

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/cart.add", method = RequestMethod.GET)
	public String home(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드

			sbDAO.addToCart(sb, req, res);
			req.setAttribute("contentPage", "home.jsp");
			return "main";

		}
		return "member/loginPage";

	}

	@RequestMapping(value = "/customer.cart.go", method = RequestMethod.GET)
	public String cartGo(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			sbDAO.showCartItems(sb, req, res);
			req.setAttribute("contentPage", "shoppingBag/cart.jsp");

			return "main";
		}

		return "member/loginPage";
	}
	
	@RequestMapping(value = "/customer.cart.delete", method = RequestMethod.GET)
	public String deleteCartItem(ShoppingBag sb, ShoppingBagItem sbItem, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		
		sbDAO.deleteCartItem(sbItem, req, res);
		sbDAO.showCartItems(sb, req, res);
		req.setAttribute("contentPage", "shoppingBag/cart.jsp");
		return "main";
	}

}
