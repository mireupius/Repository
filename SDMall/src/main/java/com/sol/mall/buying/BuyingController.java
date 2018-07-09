package com.sol.mall.buying;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.member.Membership;
import com.sol.mall.myPage.MyPageDAO;
import com.sol.mall.sale.delivery.Delivery;
import com.sol.mall.shoppingbag.ShoppingBagDAO;

@Controller
public class BuyingController {

	@Autowired
	private BuyingDAO BDAO;

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private MyPageDAO mpDAO;

	@Autowired
	private CategoryDAO cDAO;

	@Autowired
	private ShoppingBagDAO SDAO;

	@RequestMapping(value = "/buying.go", method = RequestMethod.POST)
	public String buyingGo(HttpServletRequest req, HttpServletResponse res, Cart cart) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {// 로그인체크
			SDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			BDAO.containProduct(req, res, cart);
			req.setAttribute("contentPage", "buying/buying.jsp");
		} else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
	}

	@RequestMapping(value = "/buyingFormBarsket.go", method = RequestMethod.POST)
	public String buyingFormBarsket(HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {// 로그인체크
			SDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			BDAO.containProducts(req, res);
			req.setAttribute("contentPage", "buying/buying.jsp");
		} else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
	}

	@RequestMapping(value = "/buying.do", method = RequestMethod.POST)
	public String doBuying(Membership m, Delivery delivery, Order order, HttpServletRequest req,
			HttpServletResponse res) {
		cDAO.getAllCategory(req, res);
		BDAO.doBuying(delivery, order, req, res);
		SDAO.deleteAllCartItem(req, res);

		if (mDAO.csmLoginCheck(req, res)) {
			SDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getMembership(m, req, res);

			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "memberShip.jsp");

		} else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}
}
