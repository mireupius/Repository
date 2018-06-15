package com.sol.mall.member;

import java.awt.List;
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

//	public void registerCSM(Customer c, HttpServletRequest req, HttpServletResponse res) {
//
//		try {
//			
//			// Spring에서 자바빈 변수명과 JSP input name의 요청파라메터명이 같으면 자동으로 생성해주는데
//				// 이 때 Date 타입은 스프링이 자동으로 해주지 못하므로
//				// 자동으로 못 들어가게 요청파라메터명을 다르게 바꿔줌 
//				// System.out.println(req.getParameter("csm_birthday"));
//			
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//			String csm_emailFront = req.getParameter("csm_emailFront");
//			String csm_autoCompleteEmail = req.getParameter("csm_autoCompleteEmail");
//			String csm_emailAddress = String.format("%s%s", csm_emailFront, csm_autoCompleteEmail);
//			
//			c.setCsm_birth(sdf.parse(req.getParameter("csm_birthday")));
//			c.setCsm_emailAddress(csm_emailAddress);
//			
//			// System.out.println(c.getCsm_id());System.out.println(c.getCsm_pw());
//			// System.out.println(c.getCsm_name());System.out.println(c.getCsm_birth());
//			// System.out.println(c.getCsm_phoneNo());	System.out.println(c.getCsm_emailAddress());
//			
//			if (ss.getMapper(MemberMapper.class).registerCSM(c) == 1) {
//				req.setAttribute("r", "가입 성공");
//				
//			} else {
//				req.setAttribute("r", "가입 실패");
//			}
//			
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			req.setAttribute("r", "가입 실패");
//
//		}
//
//	}
	
	public void registerSL(Seller s, HttpServletRequest req, HttpServletResponse res) {
		
		try {
			
			String sl_emailFront = req.getParameter("sl_emailFront");
			String sl_autoCompleteEmail = req.getParameter("sl_autoCompleteEmail");
			String sl_emailAddress = String.format("%s%s", sl_emailFront, sl_autoCompleteEmail);
			
			s.setSl_emailAddress(sl_emailAddress);
			
			 System.out.println(s.getSl_id());System.out.println(s.getSl_pw());
			 System.out.println(s.getSl_coName());System.out.println(s.getSl_coRegNo());
			 System.out.println(s.getSl_phoneNo());	System.out.println(s.getSl_emailAddress());
			
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
	
	public void regTP(Product p, HttpServletRequest req, HttpServletResponse res) {
		
		try {
			
//			Date d = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//			String today = sdf.format(d);
//			
//			String tp_no = String.format("%s%d", today, p.getTp_seq());
//			p.setTp_no(tp_no);
			
			
			if (ss.getMapper(MemberMapper.class).regTP(p) == 1) {
				
				req.setAttribute("r", "상품등록성공");
				
			} else {
				req.setAttribute("r", "상품등록실패");
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "상품등록실패");
		}
		
	}
	
	public void loginCustomer(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {
			Customer dbC = ss.getMapper(MemberMapper.class).getCustomerById(c);
			
			if (dbC != null) {

				if (c.getCsm_pw().equals(dbC.getCsm_pw())) {
					
					//req.setAttribute("r", "로그인 성공");
					req.getSession().setAttribute("loginMember", dbC);
					req.getSession().setMaxInactiveInterval(300);

				} else {
					req.setAttribute("r", "비밀번호 오류");
				}

			} else {
				req.setAttribute("r", "계정 없음");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "DB서버문제");
		}

	}
	
//	public void loginSeller(Seller s, HttpServletRequest req, HttpServletResponse res) {
//		
//		try {
//			Seller dbS = ss.getMapper(MemberMapper.class).getSellerById(s);
//			
//			if (dbS != null) {
//				
//				req.setAttribute("r", "로그인 성공");
//				
//			} else {
//				req.setAttribute("r", "비밀번호 오류");
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			req.setAttribute("r", "로그인 실패");
//		}
//		
//	}

//	public void getCart(Shoppingbag sb2, HttpServletRequest req, HttpServletResponse res) {
//		
//		Customer cc = (Customer) req.getSession().getAttribute("loginMember");
//		
//		
//		System.out.println("==" + sb2.getSb_csm_id());
//		
//		sb2.setSb_csm_id(cc.getCsm_id());
//		
//		java.util.List<Shoppingbag> tt = ss.getMapper(MemberMapper.class).getcart(sb2);
//		
//		for (Shoppingbag shoppingbag : tt) {
//			
//			System.out.println(shoppingbag.getSb_csm_id());
//		}
//		
//		System.out.println(tt.size());
//		
//		if (cc.getCsm_id().equals(sb2.getSb_csm_id())) {
//			
//			req.setAttribute("shopBag", tt);
//			
//		}
//		
//		
//		
//	}
	
}
