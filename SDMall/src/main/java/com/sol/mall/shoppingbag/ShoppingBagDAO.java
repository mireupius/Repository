package com.sol.mall.shoppingbag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Customer;

@Service
public class ShoppingBagDAO {
	@Autowired
	private SqlSession ss;

	public void addToCart(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {
		try {
			Customer c = (Customer) req.getSession().getAttribute("loginCustomer");
			sb.setSb_csmid(c.getCsm_id());

			if (ss.getMapper(ShoppingBagMapper.class).addToCart(sb) == 1) {
				System.out.println("카트 추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void showCartItems(ShoppingBag sb, HttpServletRequest req, HttpServletResponse res) {

		// System.out.println("dsfsdf");

		Customer nowSession = (Customer) req.getSession().getAttribute("loginCustomer");
		// System.out.println(nowSession.getCsm_id());

		sb.setSb_csmid(nowSession.getCsm_id());
		System.out.println(sb.getSb_csmid());

		List<ShoppingBag> items = ss.getMapper(ShoppingBagMapper.class).showCartItems(sb);
		System.out.println("카트 보여주기 성공");
		req.setAttribute("cartItems", items);

	}
}
