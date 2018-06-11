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

	public void registerCSM(Customer c, HttpServletRequest req, HttpServletResponse res) {

		try {
			
			// Spring에서 자바빈 변수명과 JSP input name의 요청파라메터명이 같으면 자동으로 생성해주는데
				// 이 때 Date 타입은 스프링이 자동으로 해주지 못하므로
				// 자동으로 못 들어가게 요청파라메터명을 다르게 바꿔줌 
				// System.out.println(req.getParameter("csm_birthday"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String csm_emailFront = req.getParameter("csm_emailFront");
			String csm_autoCompleteEmail = req.getParameter("csm_autoCompleteEmail");
			String csm_emailAddress = String.format("%s%s", csm_emailFront, csm_autoCompleteEmail);
			
			c.setCsm_birth(sdf.parse(req.getParameter("csm_birthday")));
			c.setCsm_emailAddress(csm_emailAddress);
			
			// System.out.println(c.getCsm_id());System.out.println(c.getCsm_pw());
			// System.out.println(c.getCsm_name());System.out.println(c.getCsm_birth());
			// System.out.println(c.getCsm_phoneNo());	System.out.println(c.getCsm_emailAddress());
			
			if (ss.getMapper(MemberMapper.class).registerCSM(c) == 1) {
				req.setAttribute("r", "가입 성공");
				
			} else {
				req.setAttribute("r", "가입 실패");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");

		}

	}
	

	
}
