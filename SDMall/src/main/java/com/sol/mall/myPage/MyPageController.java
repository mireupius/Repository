package com.sol.mall.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.sale.delivery.Delivery;

@Controller
public class MyPageController {

	@Autowired
	private MyPageDAO mpDAO;

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/customer.myHome.orderList.go", method = RequestMethod.GET)
	public String goOrderList(SearchMonth bb, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");

			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";
	}

	@RequestMapping(value = "/customer.myHome.orderList", method = RequestMethod.GET)
	public String getOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {
			cDAO.getAllCategory(req, res);
			mpDAO.searchOrderList(sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/customer.myHome.claimedOrderList.go", method = RequestMethod.GET)
	public String goClaimedOrderList(SearchMonth bb, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderClaim.jsp");

			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/customer.myHome.claimList", method = RequestMethod.GET)
	public String getClaimedOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			mpDAO.searchClaimedOrderList(sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderClaim.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/orderList.cancel.do", method = RequestMethod.GET)
	public String correctOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			mpDAO.cancelOrder(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/orderList.exchange.do", method = RequestMethod.GET)
	public String exchangeOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {


		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			mpDAO.exchangeOrder(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/orderList.return.do", method = RequestMethod.GET)
	public String returnOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		if (mDAO.csmLoginCheck(req, res)) {

			cDAO.getAllCategory(req, res);
			mpDAO.returnOrder(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";


	}
	
	@RequestMapping(value = "/orderList.completeBuy.do", method = RequestMethod.GET)
	public String completeBuyOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		if (mDAO.csmLoginCheck(req, res)) {
			
			cDAO.getAllCategory(req, res);
			mpDAO.completeBuyOrder(d, req, res);
			mpDAO.updateCumulativePrice(req, res);
			mpDAO.updateMemberShipGrade(req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			return "main";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";
		
		
	}
	
	// 리뷰할 주문내역 가져오기
	@RequestMapping(value = "/customer.myHome.productReview.go", method = RequestMethod.GET)
	public String getOrderListToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.getOrderListToReview(d, req, res);
			return "customer/productReviewPage";
		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	// 파라미터 앞 주소가 같으면 스프링이 찾아서 파라메터 이름이 같은 걸 가져옴
	@RequestMapping(value = "/productReview.writing.go", method = RequestMethod.GET)
	public String goWritingReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.goOrderToReview(d, req, res);
			return "customer/productReview";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/customer.productReview.write", method = RequestMethod.GET)
	public String doWritingReview(ProductReview pr, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.writeProductReview(pr, req, res);
			return "customer/productReview";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/customer.productReview.show", method = RequestMethod.GET)
	public String getWritedReview(ProductReview pr, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.getWritedReview(pr, req, res);
			return "customer/writedReviews";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/question.writing.go", method = RequestMethod.GET)
	public String goWritingQuestion(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.goOrderToQuestion(d, req, res);
			return "customer/question";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/order.question.write", method = RequestMethod.GET)
	public String doWritingQuestion(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.writeQuestion(qa, req, res);
			return "customer/customerMyPage2";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

	@RequestMapping(value = "/customer.myQuestion.show", method = RequestMethod.GET)
	public String getWritedReview(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.getMyQuestionAnswer(qa, req, res);
			return "customer/myQuestion";

		}
		cDAO.getAllCategory(req, res);
		req.setAttribute("contentPage", "member/loginArea.jsp");
		return "main";

	}

}
