package com.sol.mall.myPage;

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

	public void getOrderList(SearchOrder bb, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		bb.setSd_customer_id(cc.getCsm_id());

		List<Delivery> orders = ss.getMapper(MyPageMapper.class).searchOrderList(bb);

		if (cc.getCsm_id().equals(bb.getSd_customer_id())) {
			
			req.setAttribute("orderList", orders);
		}

	}
	
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

	public void getClaimedOrderList(SearchOrder bb, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		bb.setSd_customer_id(cc.getCsm_id());

		List<Delivery> orders = ss.getMapper(MyPageMapper.class).searchClaimedOrderList(bb);

		if (cc.getCsm_id().equals(bb.getSd_customer_id())) {
			
			req.setAttribute("orderList", orders);
		}

	}
	
	public void getOrderListToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
		
		d.setSd_customer_id(cc.getCsm_id());
		
		List<Delivery> orders = ss.getMapper(MyPageMapper.class).orderListToReview(d);
		
		if (cc.getCsm_id().equals(d.getSd_customer_id())) {
			
			req.setAttribute("orderList", orders);
		}
		
	}
	
	public void getMembership(Membership m, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
		m.setMs_csm_id(cc.getCsm_id());

		// ss.getMapper(MyPageMapper.class).membershipStatus(c);

		try {

			Membership mms = ss.getMapper(MyPageMapper.class).membershipStatus(m);

			req.setAttribute("memberStatus", mms);
			System.out.println("멤버쉽 가져오기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버쉽 가져오기 실패");
		}

	}
	
	public void goOrderToReview(Delivery d, HttpServletRequest req, HttpServletResponse res) {
		
		try {
			
			Delivery product = ss.getMapper(MyPageMapper.class).orderToReviewBySd_pno(d);
			
			req.setAttribute("review", product);
			System.out.println("리뷰 대상 정보 불러오기 성공");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 대상 정보 불러오기 실패");
		}
		
	}

	
	public void writeProductReview(Membership m, HttpServletRequest req, HttpServletResponse res) {
		
		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
		m.setMs_csm_id(cc.getCsm_id());
		
		// ss.getMapper(MyPageMapper.class).membershipStatus(c);
		
		try {
			
			Membership mms = ss.getMapper(MyPageMapper.class).membershipStatus(m);
			
			req.setAttribute("memberStatus", mms);
			System.out.println("멤버쉽 가져오기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버쉽 가져오기 실패");
		}
		
	}
	
	
	

}
