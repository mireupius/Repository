package com.sol.mall.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.goods.GoodsDAO;
import com.sol.mall.myPage.MyPageDAO;
import com.sol.mall.sale.delivery.Delivery;
import com.sol.mall.sale.delivery.DeliveryDAO;
import com.sol.mall.shoppingbag.ShoppingBagDAO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private MyPageDAO mpDAO;

	@Autowired
	private CategoryDAO cDAO;

	@Autowired
	private GoodsDAO gdsDAO;

	@Autowired
	private ShoppingBagDAO sbDAO;

	@Autowired
	private DeliveryDAO DDAO;

	// 로그인 페이지 가기
	@RequestMapping(value = "/member.loginPage", method = RequestMethod.GET)
	public String goLoginPage(HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		if (mDAO.csmLoginCheck(req, res)) {// 로그인체크
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
		}

		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	// 구매자 회원가입하러 가기
	@RequestMapping(value = "/customer.register.go", method = RequestMethod.GET)
	public String goRegCustomer(HttpServletRequest req, HttpServletResponse res) {

		return "member/regCSMPage";

	}

	// 구매자 회원가입 하기
	@RequestMapping(value = "/customer.register.do", method = RequestMethod.POST)
	public String doRegCustomer(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {
		mDAO.registerCSM(c, m, req, res);
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/joinSuccess.jsp");
		return "main";

	}

	// 구매자 유효성 검사
	@RequestMapping(value = "/customer.validCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Customers csmValidCheck(Customer c, HttpServletRequest req, HttpServletResponse res) {

		return mDAO.customerCheck(c, req, res);

	}

	// 판매자 회원가입하러 가기
	@RequestMapping(value = "/seller.register.go", method = RequestMethod.GET)
	public String goRegSeller(HttpServletRequest req, HttpServletResponse res) {

		return "member/regSLPage";

	}

	// 판매자 회원가입 하기
	@RequestMapping(value = "/seller.register.do", method = RequestMethod.POST)
	public String doRegSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		mDAO.registerSL(s, req, res);
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/joinSuccess.jsp");
		return "main";

	}

	// 판매자 유효성검사
	@RequestMapping(value = "/seller.validCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Sellers slValidCheck(Seller s, HttpServletRequest req, HttpServletResponse res) {

		return mDAO.sellerCheck(s, req, res);

	}

	// 구매자 로그인
	@RequestMapping(value = "/customer.login.do", method = RequestMethod.GET)
	public String loginCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		mDAO.loginCustomer(c, req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			gdsDAO.getAllGoods(req); // 상품 전체 목록 가져오기
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 구매자 마이페이지로 가기
	@RequestMapping(value = "/customer.myHome.go", method = RequestMethod.GET)
	public String goMyhome(Membership m, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck2(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getMembership(m, req, res);

			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "memberShip.jsp");

		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 판매자 로그인
	@RequestMapping(value = "/seller.login.do", method = RequestMethod.GET)
	public String loginSeller(Seller s, HttpServletRequest req, HttpServletResponse res, Delivery d) {

		mDAO.loginSeller(s, req, res);

		if (mDAO.slLoginCheck(req, res)) {

			DDAO.paging(req, res, DDAO.getAllOrder(req, res, d));
			DDAO.getAllDeliveryNum(req, res, d);
			DDAO.getNewDeliveryNum(req, res, d);
			DDAO.getCheckDeliveryNum(req, res, d);
			req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
			return "sale/saleIndex";

		} else {
			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";

		}

	}

	// 구매자 로그아웃
	@RequestMapping(value = "/customer.logout.do", method = RequestMethod.GET)
	public String logoutCustomer(HttpServletRequest req, HttpServletResponse res) {

		mDAO.logoutCustomer(req, res);
		mDAO.csmLoginCheck(req, res);
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		req.setAttribute("contentPage", "home.jsp");
		return "main";

	}

	// 판매자 로그아웃
	@RequestMapping(value = "/seller.logout.do", method = RequestMethod.GET)
	public String logoutSeller(HttpServletRequest req, HttpServletResponse res) {

		mDAO.logoutSeller(req, res);
		mDAO.slLoginCheck(req, res);
		cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
		req.setAttribute("contentPage", "home.jsp");
		return "main";

	}

	// 구매자 회원정보 수정하러가기
	@RequestMapping(value = "/customer.update.go", method = RequestMethod.GET)
	public String goUpdateCustomer(HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);

		if (mDAO.csmLoginCheck(req, res)) {

			return "member/updateCSMPage";

		} else {

			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}

	}

	// 구매자 회원정보 수정하기
	@RequestMapping(value = "/customer.update.do", method = RequestMethod.POST)

	public String doUpdateCustomer(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);

		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mDAO.updateCustomer(c, req, res);
			mpDAO.getMembership(m, req, res);

			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "memberShip.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 판매자 회원정보 수정하러가기
	@RequestMapping(value = "/seller.update.go", method = RequestMethod.GET)
	public String goUpdateSeller(HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.slLoginCheck(req, res)) {

			return "member/updateSLPage";

		} else {
			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}

	}

	// 판매자 회원정보 수정하기
	@RequestMapping(value = "/seller.update.do", method = RequestMethod.POST)
	public String doUpdateSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.slLoginCheck(req, res)) {

			mDAO.updateSeller(s, req, res);
			return "sale/saleIndex";

		} else {
			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}

	}

	// 구매자 회원탈퇴하러가기
	@RequestMapping(value = "/customer.withdraw.go", method = RequestMethod.GET)
	public String goWithdrawCustomer(HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			return "member/withdrawCSMPage";

		} else {
			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}

	}

	// 구매자 회원탈퇴 하기
	@RequestMapping(value = "/customer.withdraw.do", method = RequestMethod.GET)
	public String doWithdrawCustomer(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mDAO.withdrawCustomer(c, m, req, res);
			mDAO.logoutCustomer(req, res);
			mDAO.csmLoginCheck(req, res);

		}
		cDAO.getAllCategory(req, res);

		req.setAttribute("contentPage", "member/withdrawSuccess.jsp");

		return "main";

	}

	// 판매자 회원탈퇴하러가기
	@RequestMapping(value = "/seller.withdraw.go", method = RequestMethod.GET)
	public String goWithdrawSeller(HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.slLoginCheck(req, res)) {

			return "member/withdrawSLPage";

		} else {

			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";

		}

	}

	// 판매자 회원탈퇴하기
	@RequestMapping(value = "/seller.withdraw.do", method = RequestMethod.GET)
	public String doWithdrawSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.slLoginCheck(req, res)) {

			mDAO.withdrawSeller(s, req, res);
			mDAO.logoutSeller(req, res);
			mDAO.slLoginCheck(req, res);
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/withdrawSuccess.jsp");
		return "main";

	}

}
