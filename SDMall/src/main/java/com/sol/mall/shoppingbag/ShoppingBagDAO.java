package com.sol.mall.shoppingbag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingBagDAO {
	@Autowired
	private SqlSession ss;

	public void addToCart(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {
		sb.setSb_no("1");
		System.out.println(sb.getSb_no());
		System.out.println(sb.getSb_csmid());
		try {
			if (ss.getMapper(ShoppingBagMapper.class).addToCart(sb) == 1) {
				System.out.println("카트 추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
