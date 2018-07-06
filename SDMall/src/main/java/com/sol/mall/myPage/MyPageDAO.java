package com.sol.mall.myPage;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Customer;
import com.sol.mall.member.Membership;
import com.sol.mall.sale.delivery.Delivery;

@Service
public class MyPageDAO {

	@Autowired
	private SqlSession ss;
	
	
	public void pagingOrderList (int curPage, String showCnt, SearchMonth sm, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("서치먼쓰==="+sm.getSearchMonth());
		
		// 검색을 위해 준비
		Customer cc = (Customer) request.getSession().getAttribute("loginCustomer");

		SearchOrder so = new SearchOrder();
		so.setSd_customer_id(cc.getCsm_id());

		// string에 적힌 이름의 자바빈에서 파라미터 추출or주입
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchOrder", so);
		map.put("searchMonth", sm.getSearchMonth());
		
		List<SearchOrder> orders2 = ss.getMapper(MyPageMapper.class).searchOrderList(map);

		// 처음 화면 표시할 때 전체검색 멤버에 집어넣고 페이징시에는 세션으로만
		// 페이징은 세션이용 멤버리스트에서 해당 페이지 만큼 세션에 넣어서
		// 수정 화면에 이동은 페이징 세션으로 해결
		double cnt = Double.parseDouble(showCnt);// 페이지당 건수
		int listSize = orders2.size();
		int allPage = (int) Math.ceil(listSize / cnt);// 총페이지
		request.setAttribute("pageCount", allPage);

		// 현재 페이지 색변경
		if (curPage <= allPage && curPage > 1) {
			request.setAttribute("curPage", curPage);
		} else if (curPage > allPage && curPage > 1) {
			curPage = curPage - 1;
			request.setAttribute("curPage", curPage);
		} else {
			request.setAttribute("curPage", 1);
		}
		
		int start = listSize - (int) cnt * (curPage - 1);// 페이지 첫번째 게시물
		int end = (curPage == allPage) ? 1 : start - ((int) cnt - 1);// 페이지 마지막 게시물

		List<SearchOrder> ordersPage = new ArrayList<>();// 해당 페이지 게시물 리스트

		// start가 0인 경우 -1이 나와서 익셉션걸림(검색결과가 0인 경우에 -1이 됨 주의)
		for (int i = start; i >= end; i--) {
			// 페이지용 List에 해당 페이지 만큼넣기
			ordersPage.add(orders2.get(i - 1));
		}

		request.getSession().setAttribute("ordersPage", ordersPage);

	}

	// 주문&배송 조회
	public void searchOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		SearchOrder so = new SearchOrder();
		so.setSd_customer_id(cc.getCsm_id());

		// string에 적힌 이름의 자바빈에서 파라미터 추출or주입
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchOrder", so);
		map.put("searchMonth", sm.getSearchMonth());
		System.out.println(sm.getSearchMonth());
		
		List<SearchOrder> orders = ss.getMapper(MyPageMapper.class).searchOrderList(map);

		System.out.println(orders.size()+"오더리스트");

		if (cc.getCsm_id().equals(so.getSd_customer_id())) {

			req.setAttribute("orderList", orders);
		}

	}

	// 주문취소신청
	public void cancelOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

			d.setSd_customer_id(cc.getCsm_id());

			if (ss.getMapper(MyPageMapper.class).cancelOrder(d) == 1) {

				System.out.println("주문취소 접수 성공");

				req.setAttribute("r", "주문취소 접수 성공");

			} else {
				System.out.println("주문취소 접수 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("주문취소 접수 실패");
		}

	}

	// 교환신청
	public void exchangeOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

			d.setSd_customer_id(cc.getCsm_id());

			if (ss.getMapper(MyPageMapper.class).exchangeOrder(d) == 1) {

				System.out.println("교환신청 접수성공");

			} else {
				System.out.println("교환신청 접수실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("교환신청 접수실패");
		}

	}

	// 반품신청
	public void returnOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

			d.setSd_customer_id(cc.getCsm_id());

			if (ss.getMapper(MyPageMapper.class).returnOrder(d) == 1) {

				System.out.println("반품신청 접수성공");

			} else {
				System.out.println("반품신청 접수실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("반품신청 접수실패");
		}

	}

	// 수취확인
	public void completeDelivery(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

			d.setSd_customer_id(cc.getCsm_id());

			if (ss.getMapper(MyPageMapper.class).completeDelivery(d) == 1) {

				System.out.println("배송완료 변경");

			} else {
				System.out.println("배송완료 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("배송완료 실패");
		}

	}
	
	// 구매확정
	public void completeBuyOrder(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		try {
			
			Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
			
			d.setSd_customer_id(cc.getCsm_id());
			
			if (ss.getMapper(MyPageMapper.class).completeBuyOrder(d) == 1) {
				
				System.out.println("구매확정 성공");
				
			} else {
				System.out.println("구매확정 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("구매확정 실패");
		}
		
	}

	// 교환, 반품, 취소된 주문내역 조회
	public void searchClaimedOrderList(SearchMonth sm, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		SearchOrder so = new SearchOrder();
		so.setSd_customer_id(cc.getCsm_id());

		HashMap<String, Object> map = new HashMap<>();
		map.put("searchOrder", so);
		map.put("searchMonth", sm.getSearchMonth());

		List<SearchOrder> orders = ss.getMapper(MyPageMapper.class).searchClaimedOrderList(map);

		if (cc.getCsm_id().equals(so.getSd_customer_id())) {

			req.setAttribute("orderList", orders);
		}

	}

	// 상품평 남길 주문내역 조회
	public void getOrderListToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		d.setSd_customer_id(cc.getCsm_id());
		System.out.println("id"+d.getSd_customer_id());

		List<Delivery> orders = ss.getMapper(MyPageMapper.class).orderListToReview(d);
System.out.println(orders.size());
		if (cc.getCsm_id().equals(d.getSd_customer_id())) {
			
			req.setAttribute("orderList", orders);
		}

	}

	// 마이페이지 메인에 멤버쉽 정보 보여주기
	public void getMembership(Membership m, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
		m.setMs_csm_id(cc.getCsm_id());

		try {

			Membership mms = ss.getMapper(MyPageMapper.class).membershipStatus(m);

			req.setAttribute("memberStatus", mms);
			System.out.println("멤버쉽 가져오기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버쉽 가져오기 실패");
		}

	}
	
	// 리뷰할 상품의 정보 자동입력 될 때 가져오기
	public void goOrderToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Delivery product = ss.getMapper(MyPageMapper.class).getOrderInfoBySd_pno(d);

			req.setAttribute("review", product);
			System.out.println("리뷰 대상 정보 불러오기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 대상 정보 불러오기 실패");
		}

	}

	// 상품 리뷰 작성하기
	public void writeProductReview(ProductReview pr, HttpServletRequest req, HttpServletResponse res) {

		try {

			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			pr.setPr_regDate(sdf.parse(sdf.format(today)));

			if (ss.getMapper(MyPageMapper.class).writeProductReview(pr) == 1
					&& ss.getMapper(MyPageMapper.class).changeReviewState(pr) == 1) {

				System.out.println("상품평 등록 성공");

			}

		} catch (Exception e) {
			System.out.println("상품평 등록 실패");
			e.printStackTrace();

		}

	}

	// 작성된 상품 리뷰 조회
	public void getWritedReview(ProductReview pr, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer c = (Customer) req.getSession().getAttribute("loginCustomer");
			pr.setPr_csm_id(c.getCsm_id());

			List<ProductReview> reviews = ss.getMapper(MyPageMapper.class).getWritedReview(pr);

			System.out.println("상품평 조회 성공");
			req.setAttribute("reviewList", reviews);

		} catch (Exception e) {
			System.out.println("상품평 조회 실패");

		}

	}

	// 판매자에게 Q&A 남기러 가기
	public void goOrderToQuestion(Delivery d, HttpServletRequest req, HttpServletResponse res) {

		try {

			Delivery product = ss.getMapper(MyPageMapper.class).getOrderInfoBySd_pno(d);

			req.setAttribute("question", product);
			System.out.println("질문 대상 정보 불러오기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("질문 대상 정보 불러오기 실패");
		}

	}

	// 판매자에게 질문 하기
	public void writeQuestion(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {

		try {

			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			qa.setQa_qRegDate(sdf.format(today));

			if (ss.getMapper(MyPageMapper.class).writeQuestionToSeller(qa) == 1) {

				System.out.println("질문 요청 성공");

			}

		} catch (Exception e) {
			System.out.println("질문 요청 실패");
			e.printStackTrace();

		}

	}

	// 작성된 Q&A 가져오기
	public void getMyQuestionAnswer(QuestionAnswer qa, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer c = (Customer) req.getSession().getAttribute("loginCustomer");
			qa.setQa_csm_id(c.getCsm_id());

			List<QuestionAnswer> myQuestion = ss.getMapper(MyPageMapper.class).searchQAByCustomerId(qa);
			System.out.println("내 질문 보여주기 성공");

			req.setAttribute("myQuestionList", myQuestion);

		} catch (Exception e) {
			System.out.println("내 질문 보여주기 실패");
			e.printStackTrace();
		}

	}

	// 멤버십 누적금액 수정
	public void updateCumulativePrice(HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer c = (Customer) req.getSession().getAttribute("loginCustomer");
			Delivery d = new Delivery();
			Membership m = new Membership();
			d.setSd_customer_id(c.getCsm_id());
			m.setMs_csm_id(c.getCsm_id());

			BigDecimal totalBuyPrice = ss.getMapper(MyPageMapper.class).getTotalBuyPriceById(d);
			System.out.println(totalBuyPrice);

			m.setMs_totalBuy(totalBuyPrice);
			if (ss.getMapper(MyPageMapper.class).updateCumulativePrice(m) == 1) {
				System.out.println("누적금 변경됬니??");
				System.out.println(totalBuyPrice);
			} else {
				System.out.println("누적금 변경오류?");
			}

		} catch (Exception e) {
			System.out.println("누적금 변경오류?");
			e.printStackTrace();
		}

	}

	// 멤버십 등급 수정
	public void updateMemberShipGrade(HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer c = (Customer) req.getSession().getAttribute("loginCustomer");
			Delivery d = new Delivery();
			Membership m = new Membership();
			d.setSd_customer_id(c.getCsm_id());
			m.setMs_csm_id(c.getCsm_id());

			BigDecimal totalBuyPrice = ss.getMapper(MyPageMapper.class).getTotalBuyPriceById(d);
			m.setMs_totalBuy(totalBuyPrice);
			System.out.println(m.getMs_totalBuy());
			BigDecimal gold = new BigDecimal("100000");
			BigDecimal platinum = new BigDecimal("500000");

			if (totalBuyPrice.compareTo(platinum) > 0) {
				m.setMs_grade("플래티넘");

			} else if (totalBuyPrice.compareTo(gold) > 0) {
				m.setMs_grade("골드");
			}

			if (ss.getMapper(MyPageMapper.class).updateMemberShipGrade(m) == 1) {
				System.out.println("멤버십 등급 변경");
				System.out.println(totalBuyPrice);
			} else {
				System.out.println("변경사항 없음");

			}

		} catch (Exception e) {
			System.out.println("멤버십 등급 변경 실패");
			e.printStackTrace();

		}

	}
	
	// 적립금 적립
		public void accumulatePoint(Delivery d, HttpServletRequest req, HttpServletResponse res) {

			try {

				Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
					
				Membership m = new Membership();
				m.setMs_csm_id((cc.getCsm_id()));
				BigDecimal pointRate = new BigDecimal(0.01);
				BigDecimal priceByPno = ss.getMapper(MyPageMapper.class).getTotalBuyPriceByPno(d);
				
				m.setMs_point(priceByPno.multiply(pointRate));

				if (ss.getMapper(MyPageMapper.class).updateAccumulatePoint(m) == 1) {

					System.out.println("포인트 적립 완료");

				} else {
					System.out.println("포인트 적립 실패");
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("포인트 적립 실패");
			}

		}
}
