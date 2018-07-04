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
		BDAO.containProduct(req, res, cart);
		req.setAttribute("contentPage", "buying/buying.jsp");
		return "main";
	}

	@RequestMapping(value = "/buyingFormBarsket.go", method = RequestMethod.POST)
	public String buyingFormBarsket(HttpServletRequest req, HttpServletResponse res) {
		BDAO.containProducts(req, res);
		req.setAttribute("contentPage", "buying/buying.jsp");
		return "main";
	}

	@RequestMapping(value = "/buying.do", method = RequestMethod.POST)
	public String doBuying(Membership m, Delivery delivery, Order order, HttpServletRequest req,
			HttpServletResponse res) {
		BDAO.doBuying(delivery, order, req, res);
		SDAO.deleteAllCartItem(req, res);

		if (mDAO.csmLoginCheck2(req, res)) {

			cDAO.getAllCategory(req, res);
			mpDAO.getMembership(m, req, res);

			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");

			return "main";

		} else {
			return "member/loginPage";
		}

	}
}
