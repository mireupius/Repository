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
	private ShoppingBagDAO sbDAO;
	
	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/cart.add", method = RequestMethod.GET)
	public String home(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {//로그인체크
			sbDAO.addToCart(sb, req, res);
			
			sbDAO.showCartItems(req, res);//장바구니 상품수량 반환
			req.setAttribute("contentPage", "home.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드

		return "main";
	}

	@RequestMapping(value = "/customer.cart.go", method = RequestMethod.GET)
	public String cartGo(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {//로그인체크
			sbDAO.showCartItems(req, res);//장바구니 상품수량 반환
		
			req.setAttribute("contentPage", "shoppingBag/cart.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
	}
	
	@RequestMapping(value = "/customer.cart.delete", method = RequestMethod.GET)
	public String deleteCartItem(ShoppingBag sb, ShoppingBagItem sbItem, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {//로그인체크
			sbDAO.deleteCartItem(sbItem, req, res);
			sbDAO.showCartItems(req, res);
			
			req.setAttribute("contentPage", "shoppingBag/cart.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
	}

}
