package com.sol.mall.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Customer;

@Service
public class MyPageDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getOrderList(Month m, Shoppingbag sb, HttpServletRequest req, HttpServletResponse res) {

		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		//System.out.println(cc.getCsm_id());
		//System.out.println("==" + sb.getSb_csm_id());
		sb.setSb_csm_id(cc.getCsm_id());
		//System.out.println(sb.getSb_csm_id());
		
//		m.setSearchMonth(searchMonth);
//		System.out.println(m.getSearchMonth());
		
		List<Shoppingbag> orders = ss.getMapper(MyPageMapper.class).orderList(sb);

		for (Shoppingbag shoppingbag : orders) {

			System.out.println(shoppingbag.getSb_csm_id());
		}

		System.out.println(orders.size());

		if (cc.getCsm_id().equals(sb.getSb_csm_id())) {

			req.setAttribute("orderList", orders);

		}

	}
	
	

}
