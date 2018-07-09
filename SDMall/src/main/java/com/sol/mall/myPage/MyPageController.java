package com.sol.mall.myPage;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.sale.delivery.Delivery;
import com.sol.mall.shoppingbag.ShoppingBagDAO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageDAO mpDAO;

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private CategoryDAO cDAO;
	
	@Autowired
	private ShoppingBagDAO sbDAO;

	// 주문&배송 목록 조회하러가기
	@RequestMapping(value = "/customer.myHome.orderList.go", method = RequestMethod.GET)
	public String goOrderList(SearchMonth bb, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);
		
		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			//추가 페이징
			SearchMonth sm = new SearchMonth();
			sm.setSearchMonth(new BigDecimal(1));
			mpDAO.pagingOrderList(1, "3", sm, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");

		}else {
			
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
		
	}

	// 주문&배송 목록 기간별로 가져오기
	@RequestMapping(value = "/customer.myHome.orderList", method = RequestMethod.GET)
	public String getOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.searchOrderList(sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
			
		}else {
			
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		
		return "main";

	}
	// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ paging  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 주문&배송 목록 기간별로 가져오기
	@RequestMapping(value = "/customer.myHome.pagingOrderList", method = RequestMethod.GET)
	public String pagingOrderList(int curPage, String showCnt, SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		System.out.println("입장====");
		System.out.println("curPage=="+curPage);
		if(curPage == 0) {
			curPage =1;
		}
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			
			mpDAO.pagingOrderList(curPage, showCnt, sm, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}
	
	@RequestMapping(value = "/customer.myHome.pagingClaimList", method = RequestMethod.GET)
	public String pagingClaimedOrderList(int curPage, String showCnt, SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {
		
		System.out.println("입장====");
		System.out.println("curPage=="+curPage);
		if(curPage == 0) {
			curPage =1;
		}
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			
			mpDAO.pagingClaimedOrderList(curPage, showCnt, sm, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderClaim.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
		
	}
	// ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑  paging  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
	// 교환&반품&취소 목록 조회하러가기
	@RequestMapping(value = "/customer.myHome.claimedOrderList.go", method = RequestMethod.GET)
	public String goClaimedOrderList(SearchMonth bb, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환

			SearchMonth sm = new SearchMonth();
			sm.setSearchMonth(new BigDecimal(1));
			mpDAO.pagingOrderList(1, "3", sm, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderClaim.jsp");
			//추가 페이징

		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 교환&반품&취소 목록 기간별로 조회하기
	@RequestMapping(value = "/customer.myHome.claimList", method = RequestMethod.GET)
	public String getClaimedOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.searchClaimedOrderList(sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderClaim.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 주문 상품취소하기
	@RequestMapping(value = "/orderList.cancel.do", method = RequestMethod.GET)
	public String correctOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.cancelOrder(d, req, res);
			SearchMonth sm = new SearchMonth();
			sm.setSearchMonth(new BigDecimal("1"));
			mpDAO.pagingOrderList(1, "3", sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}
	
	// 주문 상품 교환하기
	@RequestMapping(value = "/orderList.exchange.do", method = RequestMethod.GET)
	public String exchangeOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.exchangeOrder(d, req, res);
			SearchMonth sm = new SearchMonth();
			sm.setSearchMonth(new BigDecimal("1"));
			mpDAO.pagingOrderList(1, "3", sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 주문 상품 반품하기
	@RequestMapping(value = "/orderList.return.do", method = RequestMethod.GET)
	public String returnOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.returnOrder(d, req, res);
			SearchMonth sm = new SearchMonth();
			sm.setSearchMonth(new BigDecimal("1"));
			mpDAO.pagingOrderList(1, "3", sm, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";


	}
	
	// 수취확인하기
	@RequestMapping(value = "/orderList.completeDelivery.do", method = RequestMethod.GET)
	public String completeDelivery(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.completeDelivery(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
		
		
	}
	
	// 구매확정하기
	@RequestMapping(value = "/orderList.completeBuy.do", method = RequestMethod.GET)
	public String completeBuyOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.completeBuyOrder(d, req, res);
			mpDAO.updateCumulativePrice(req, res);
			mpDAO.updateMemberShipGrade(req, res);
			mpDAO.accumulatePoint(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "orderDelivery.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";
		
		
	}
	
	// 리뷰할 주문내역 가져오기
	@RequestMapping(value = "/customer.myHome.productReview.go", method = RequestMethod.GET)
	public String getOrderListToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getOrderListToReview(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "productReviewPage.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 각 주문 상품 실제로 리뷰작성하러 가기
	@RequestMapping(value = "/productReview.writing.go", method = RequestMethod.GET)
	public String goWritingReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);

		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.goOrderToReview(d, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "productReview.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 리뷰작성하기
	@RequestMapping(value = "/customer.productReview.write", method = RequestMethod.GET)
	public String doWritingReview(ProductReview pr, Delivery d, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {

			mpDAO.writeProductReview(pr, req, res);
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getOrderListToReview(d, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "productReviewPage.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 작성한 리뷰 가져오기
	@RequestMapping(value = "/customer.productReview.show", method = RequestMethod.GET)
	public String getWritedReview(ProductReview pr, HttpServletRequest req, HttpServletResponse res) {
		
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {

			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getWritedReview(pr, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "writedReviews.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 판매자에게 질문하러가기
	@RequestMapping(value = "/question.writing.go", method = RequestMethod.GET)
	public String goWritingQuestion(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			
			mpDAO.goOrderToQuestion(d, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "question.jsp");

		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 판매자에게 질문하기
	@RequestMapping(value = "/order.question.write", method = RequestMethod.GET)
	public String doWritingQuestion(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {
		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.writeQuestion(qa, req, res);
			
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "myQuestion.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

	// 질문한 내역 보여주기
	@RequestMapping(value = "/customer.myQuestion.show", method = RequestMethod.GET)
	public String getWritedQuestionAnswer(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {

		cDAO.getAllCategory(req, res);
		if (mDAO.csmLoginCheck(req, res)) {
			
			sbDAO.showCartItems(req, res);// 장바구니 상품수량 반환
			mpDAO.getMyQuestionAnswer(qa, req, res);
			req.setAttribute("contentPage", "customer/customerMyPage2.jsp");
			req.setAttribute("myPageContentArea", "myQuestion.jsp");
		}else {
			req.setAttribute("contentPage", "member/loginArea.jsp");
		}
		return "main";

	}

}
