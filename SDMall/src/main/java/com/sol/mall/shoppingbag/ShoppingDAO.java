package com.sol.mall.shoppingbag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.sol.mall.member.Customer;

public class ShoppingDAO {
	
	@Autowired
	private SqlSession ss;
	
public void getCart(Shoppingbag sb2, HttpServletRequest req, HttpServletResponse res) {
		
		Customer cc = (Customer) req.getSession().getAttribute("loginMember");
				
		sb2.setSb_csm_id(cc.getCsm_id());
		
		List<Shoppingbag> tt = ss.getMapper(ShoppingbagMapper.class).getcart(sb2);
		
		for (Shoppingbag shoppingbag : tt) {
			
			System.out.println(shoppingbag.getSb_csm_id());
		}
		
		System.out.println(tt.size());
		
		if (cc.getCsm_id().equals(sb2.getSb_csm_id())) {
			
			req.setAttribute("shopBag", tt);
			
		}
		
		
	}
	
	

}
