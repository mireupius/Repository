package com.sol.mall.member;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	// 구매자 회원가입 DAO
	public void registerCSM(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {

		try {

			// Spring에서 자바빈 변수명과 JSP input name의 요청파라메터명이 같으면 자동으로 생성해주는데
			// 이 때 Date 타입은 스프링이 자동으로 해주지 못하므로
			// 자동으로 못 들어가게 요청파라메터명을 다르게 바꿔줌
			// System.out.println(req.getParameter("csm_birthday"));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String csm_emailFront = req.getParameter("csm_emailFront");
			String csm_autoCompleteEmail = req.getParameter("csm_autoCompleteEmail");
			String csm_emailAddress = String.format("%s%s", csm_emailFront, csm_autoCompleteEmail);

			c.setCsm_birth(sdf.parse(req.getParameter("csm_birthday")));
			System.out.println(c.getCsm_birth());
			c.setCsm_emailAddress(csm_emailAddress);
			m.setMs_csm_id(req.getParameter("csm_id"));

			// 회원가입 시 멤버십 가입

			if (ss.getMapper(MemberMapper.class).registerCSM(c) == 1
					&& ss.getMapper(MemberMapper.class).registerMemberShip(m) == 1) {
				
				System.out.println(c.getCsm_name());
				req.setAttribute("name", c.getCsm_name());
				System.out.println("구매자 회원가입 성공");

			} else {
				req.setAttribute("r", "가입 실패");
			}


		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");
			System.out.println("멤버쉽 가입 실패");

		}

	}
	
	// 구매자 유효성검사
	public Customers customerCheck(Customer c, HttpServletRequest req, HttpServletResponse res) {

		return new Customers(ss.getMapper(MemberMapper.class).getCustomerById2(c));
	}
	
	// 판매자 회원가입 DAO
	public void registerSL(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {

			String sl_emailFront = req.getParameter("sl_emailFront");
			String sl_autoCompleteEmail = req.getParameter("sl_autoCompleteEmail");
			String sl_emailAddress = String.format("%s%s", sl_emailFront, sl_autoCompleteEmail);

			s.setSl_emailAddress(sl_emailAddress);

			if (ss.getMapper(MemberMapper.class).registerSL(s) == 1) {
				req.setAttribute("name", s.getSl_coName());
				System.out.println("판매자 회원가입 성공");

			} else {
				req.setAttribute("r", "가입 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");

		}

	}

	// 판매자 유효성검사
	public Sellers sellerCheck(Seller s, HttpServletRequest req, HttpServletResponse res) {

		return new Sellers(ss.getMapper(MemberMapper.class).getSellerById2(s));
	}
	
	// 구매자 로그인
	public void loginCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer dbC = ss.getMapper(MemberMapper.class).getCustomerById(c);

			// 로그인 성공시
			req.getSession().setAttribute("loginCustomer", dbC);
			req.getSession().setMaxInactiveInterval(86400);

			// 로그인 실패는 AJAX로 유효성 검사

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	// 판매자 로그인
	public void loginSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {
			Seller dbS = ss.getMapper(MemberMapper.class).getSellerById(s);

			req.getSession().setAttribute("loginSeller", dbS);
			req.getSession().setMaxInactiveInterval(86400);

		} catch (Exception e) {
			e.printStackTrace();
			// req.setAttribute("r", "DB서버문제");
		}

	}

	// 보통의 구매자 로그인 체크
	public boolean csmLoginCheck(HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		if (cc != null) {
			req.setAttribute("contentPage", "goods/shop.jsp");

			return true;

		} else {
			req.setAttribute("loginInfo", "loginArea.jsp");
			return false;
		}

	}

	// 마이페이지 이동시 구매자 로그인 체크 
	public boolean csmLoginCheck2(HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		if (cc != null) {
			// req.setAttribute("loginInfo", "csmLoginOK.jsp");
			System.out.println("마이페이지이동성공");
			return true;

		} else {
			System.out.println("마이페이지이동실패");
			req.setAttribute("loginInfo", "loginArea.jsp");
			return false;
		}

	}

	// 판매자 로그인 체크
	public boolean slLoginCheck(HttpServletRequest req, HttpServletResponse res) {

		Seller s = (Seller) req.getSession().getAttribute("loginSeller");

		if (s != null) {
			return true;

		}
		req.setAttribute("loginInfo", "member/loginArea.jsp");
		return false;

	}

	// 구매자 로그아웃
	public void logoutCustomer(HttpServletRequest req, HttpServletResponse res) {

		req.getSession().setAttribute("loginCustomer", null);

	}

	// 판매자 로그아웃
	public void logoutSeller(HttpServletRequest req, HttpServletResponse res) {

		req.getSession().setAttribute("loginSeller", null);

	}

	// 모든 구매자 보여주기
	public Customers getAllCustomer(HttpServletRequest req, HttpServletResponse res) {

		return new Customers(ss.getMapper(MemberMapper.class).getAllCustomer());

	}

	// 구매자 회원정보 수정
	public void updateCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {
			// 세션 불러와서
			// Customer nowSession = (Customer)
			// req.getSession().getAttribute("loginCustomer");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String csm_emailFront = req.getParameter("csm_emailFront");
			String csm_autoCompleteEmail = req.getParameter("csm_autoCompleteEmail");
			String csm_emailAddress = String.format("%s%s", csm_emailFront, csm_autoCompleteEmail);

			c.setCsm_birth(sdf.parse(req.getParameter("csm_birthday")));
			c.setCsm_emailAddress(csm_emailAddress);

			if (ss.getMapper(MemberMapper.class).updateCSMInfo(c) == 1) {
				req.setAttribute("r", "정보 수정성공");
				// 세션 업데이트
				req.getSession().setAttribute("loginCustomer", ss.getMapper(MemberMapper.class).getCustomerById(c));

			} else {
				req.setAttribute("r", "정보 수정실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "정보 수정실패");

		}

	}

	// 판매자 회원정보 수정
	public void updateSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {
			// 세션 불러오기
			// Seller nowSession = (Seller) req.getSession().getAttribute("loginSeller");

			String sl_emailFront = req.getParameter("sl_emailFront");
			String sl_autoCompleteEmail = req.getParameter("sl_autoCompleteEmail");
			String sl_emailAddress = String.format("%s%s", sl_emailFront, sl_autoCompleteEmail);

			s.setSl_emailAddress(sl_emailAddress);

			if (ss.getMapper(MemberMapper.class).updateSLInfo(s) == 1) {
				req.setAttribute("r", "정보 수정성공");
				req.getSession().setAttribute("loginSeller", ss.getMapper(MemberMapper.class).getSellerById(s));

			} else {
				req.setAttribute("r", "정보 수정실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "정보 수정실패");

		}

	}

	// 구매자 회원탈퇴
	public void withdrawCustomer(Customer c, Membership m, HttpServletRequest req, HttpServletResponse res) {

		try {
			System.out.println(c.getCsm_id());
			System.out.println(m.getMs_csm_id());

			if (ss.getMapper(MemberMapper.class).withdrawCSM(c) == 1
					&& ss.getMapper(MemberMapper.class).withdrawMemberShip(m) == 1) {

				System.out.println("탈퇴 성공");
				// req.getSession().setAttribute("loginCustomer", null);

			} else {
				System.out.println("탈퇴 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("탈퇴 실패");
		}

	}

	// 판매자 회원탈퇴
	public void withdrawSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {

			if (ss.getMapper(MemberMapper.class).withdrawSL(s) == 1) {

				req.setAttribute("r", "탈퇴 성공");

			} else {
				req.setAttribute("r", "탈퇴 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴 실패");
		}

	}

}
