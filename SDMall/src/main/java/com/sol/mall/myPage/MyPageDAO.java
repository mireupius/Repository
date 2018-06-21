package com.sol.mall.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Customer;
import com.sol.mall.member.Membership;

@Service
public class MyPageDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getOrderList(Buy bb, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		bb.setSb_csm_id(cc.getCsm_id());
	
		List<Shoppingbag> orders = ss.getMapper(MyPageMapper.class).orderList(bb);

		if (cc.getCsm_id().equals(bb.getSb_csm_id())) {

			req.setAttribute("orderList", orders);

		}

	}
	
	public void getMembership(Membership m, HttpServletRequest req, HttpServletResponse res) {
		
		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");
		m.setMs_csm_id(cc.getCsm_id());
		
		//ss.getMapper(MyPageMapper.class).membershipStatus(c);
		
		try {
			System.out.println("==" + m.getMs_csm_id());
			
			System.out.println("멤버쉽 초기");
			
			Membership mms = ss.getMapper(MyPageMapper.class).membershipStatus(m);
			
			req.setAttribute("memberStatus", mms);
			System.out.println("멤버쉽 가져오기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버쉽 가져오기 실패");
		}
		
		
		
		
	}
	
	

}
