package com.sol.mall.member;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

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
			
			if (ss.getMapper(MemberMapper.class).registerCSM(c) == 1 && ss.getMapper(MemberMapper.class).registerMemberShip(m) == 1) {
				req.setAttribute("r", "가입 성공");

			} else {
				req.setAttribute("r", "가입 실패");
			}
			
			
			//if (ss.getMapper(MemberMapper.class).registerMemberShip(m) == 1) {
				//System.out.println("멤버쉽 가입 성공");
				
			//} else {
				//System.out.println("멤버쉽 가입 실패");
			//}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");
			System.out.println("멤버쉽 가입 실패");

		}

	}

	public Customers customerCheck(Customer c, HttpServletRequest req, HttpServletResponse res) {

		return new Customers(ss.getMapper(MemberMapper.class).getCustomerById2(c));
	}

	public void registerSL(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {

			String sl_emailFront = req.getParameter("sl_emailFront");
			String sl_autoCompleteEmail = req.getParameter("sl_autoCompleteEmail");
			String sl_emailAddress = String.format("%s%s", sl_emailFront, sl_autoCompleteEmail);

			s.setSl_emailAddress(sl_emailAddress);

			// System.out.println(s.getSl_id());System.out.println(s.getSl_pw());
			// System.out.println(s.getSl_coName());System.out.println(s.getSl_coRegNo());
			// System.out.println(s.getSl_phoneNo());
			// System.out.println(s.getSl_emailAddress());

			if (ss.getMapper(MemberMapper.class).registerSL(s) == 1) {
				req.setAttribute("r", "가입 성공");

			} else {
				req.setAttribute("r", "가입 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");

		}

	}

	public Sellers sellerCheck(Seller s, HttpServletRequest req, HttpServletResponse res) {

		return new Sellers(ss.getMapper(MemberMapper.class).getSellerById2(s));
	}

	public void loginCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {

			Customer dbC = ss.getMapper(MemberMapper.class).getCustomerById(c);

			// 로그인 성공시
			req.getSession().setAttribute("loginCustomer", dbC);
			req.getSession().setMaxInactiveInterval(300);

			// 로그인 실패는 AJAX로 유효성 검사

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void loginSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {
			Seller dbS = ss.getMapper(MemberMapper.class).getSellerById(s);

			// if (dbS != null) {

			// if (s.getSl_pw().equals(dbS.getSl_pw())) {
			req.getSession().setAttribute("loginSeller", dbS);
			req.getSession().setMaxInactiveInterval(300);

			// }else {
			// req.setAttribute("r", "비밀번호 오류");
			// }

			// } else {
			// req.setAttribute("r", "계정 없음");
			// }

		} catch (Exception e) {
			e.printStackTrace();
			// req.setAttribute("r", "DB서버문제");
		}

	}

	public boolean csmLoginCheck(HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		if (cc != null) {
			req.setAttribute("loginInfo", "csmLoginOK.jsp");
			System.out.println("csmLoginOK ------ ");
			return true;

		} else {
			System.out.println("loginArea ------ ");
			req.setAttribute("loginInfo", "loginArea.jsp");
			return false;
		}

	}

	public boolean slLoginCheck(HttpServletRequest req, HttpServletResponse res) {

		Seller s = (Seller) req.getSession().getAttribute("loginSeller");

		if (s != null) {
			req.setAttribute("loginInfo", "slLoginOK.jsp");
			return true;

		}
		req.setAttribute("loginInfo", "member/loginArea.jsp");
		return false;

	}

	public void logoutCustomer(HttpServletRequest req, HttpServletResponse res) {

		req.getSession().setAttribute("loginCustomer", null);

	}

	public void logoutSeller(HttpServletRequest req, HttpServletResponse res) {

		req.getSession().setAttribute("loginSeller", null);

	}

	public void getCart(Shoppingbag sb2, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginMember");

		System.out.println("==" + sb2.getSb_csm_id());

		sb2.setSb_csm_id(cc.getCsm_id());

		List<Shoppingbag> tt = ss.getMapper(MemberMapper.class).getcart(sb2);

		for (Shoppingbag shoppingbag : tt) {

			System.out.println(shoppingbag.getSb_csm_id());
		}

		System.out.println(tt.size());

		if (cc.getCsm_id().equals(sb2.getSb_csm_id())) {

			req.setAttribute("shopBag", tt);

		}

	}

	public Customers getAllCustomer(HttpServletRequest req, HttpServletResponse res) {

		return new Customers(ss.getMapper(MemberMapper.class).getAllCustomer());

	}

	public void updateCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {
			// 세션 불러와서
			Customer nowSession = (Customer) req.getSession().getAttribute("loginCustomer");

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

	public void updateSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {

		try {
			// 세션 불러오기
			Seller nowSession = (Seller) req.getSession().getAttribute("loginSeller");

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

	public void withdrawCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {

			if (ss.getMapper(MemberMapper.class).withdrawCSM(c) == 1) {

				req.setAttribute("r", "탈퇴 성공");
				// req.getSession().setAttribute("loginCustomer", null);

			} else {
				req.setAttribute("r", "탈퇴 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴 실패");
		}

	}

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
