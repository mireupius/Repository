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

	public void showCartItems(HttpServletRequest req, HttpServletResponse res) {

		Customer nowSession = (Customer) req.getSession().getAttribute("loginCustomer");
		ShoppingBag sb = new ShoppingBag();

		sb.setSb_csmid(nowSession.getCsm_id());

		List<ShoppingBag> items = ss.getMapper(ShoppingBagMapper.class).showCartItems(sb);
		req.setAttribute("sbsize", items.size());
		System.out.println("카트 보여주기 성공");
		req.setAttribute("cartItems", items);
	}

	public void deleteCartItem(ShoppingBagItem sbItem, HttpServletRequest req, HttpServletResponse res) {
		if (ss.getMapper(ShoppingBagMapper.class).deleteCartItem(sbItem) == 1) {
			System.out.println("카트삭제");
		}

	}

	public void deleteAllCartItem(HttpServletRequest req, HttpServletResponse res) {
		Customer cc = (Customer) req.getSession().getAttribute("loginCustomer");

		if (ss.getMapper(ShoppingBagMapper.class).deleteAllCartItem(cc) == 1) {
			System.out.println("카트전체삭제");
		}

	}

}
