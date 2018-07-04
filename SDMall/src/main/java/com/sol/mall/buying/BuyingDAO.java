package com.sol.mall.buying;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.sale.delivery.Delivery;

@Service
public class BuyingDAO {

	@Autowired
	private SqlSession ss;

	public void containProduct(HttpServletRequest req, HttpServletResponse res, Cart cart) {
		ArrayList<Cart> products = new ArrayList<>();
		products.add(cart);

		req.setAttribute("products", products);
	}

	public void containProducts(HttpServletRequest req, HttpServletResponse res, Cart cart) {
		ArrayList<Cart> products = new ArrayList<>();

		String[] Im = req.getParameterValues("sd_imageFileName");
		String[] spn = req.getParameterValues("sd_product_name");
		String[] am = req.getParameterValues("sd_amount");
		String[] op = req.getParameterValues("sd_option_info");
		String[] opp = req.getParameterValues("sd_option_price");
		String[] pp = req.getParameterValues("sd_product_price");
		String[] ps = req.getParameterValues("sd_product_sellprice");
		String[] tp = req.getParameterValues("sd_total_price");
		String[] oa = req.getParameterValues("sd_out_area");
		String[] pn = req.getParameterValues("sd_product_no");
		String[] si = req.getParameterValues("sd_seller_id");

		for (int i = 0; i < si.length; i++) {
			cart.setSd_product_name(spn[i]);
			cart.setSd_imageFileName(Im[i]);
			System.out.println(Im[i]);
			cart.setSd_amount(new BigDecimal(am[i]));
			cart.setSd_option_info(op[i]);
			cart.setSd_option_price(new BigDecimal(opp[i]));
			cart.setSd_product_price(new BigDecimal(pp[i]));
			cart.setSd_product_sellprice(new BigDecimal(ps[i]));
			cart.setSd_total_price(new BigDecimal(tp[i]));
			cart.setSd_out_area(oa[i]);
			cart.setSd_product_no(pn[i]);
			cart.setSd_seller_id(si[i]);
			products.add(cart);
		}
		req.setAttribute("products", products);
	}

	public void doBuying(Delivery delivery, Order order, HttpServletRequest req, HttpServletResponse res) {

		String[] sd_seller_id = req.getParameterValues("sd_seller_id");

		String loginID = "aaa";

		// HashMap으로 판매자 아이디 중복제거 후 Iterator객체로 만들어 하나씩 Order 객체에 입력 String[] sellers
		HashSet<String> sellerSet = new HashSet<>();
		for (String string : sd_seller_id) {
			sellerSet.add(string);
			System.out.println();
		}
		Iterator<String> sellerIterator = sellerSet.iterator();
		order.setSo_customer_id(loginID);

		// 현재 로그인된 아이디 세션에서 받아와 Order 객체에 입력/차후 수정

		while (sellerIterator.hasNext()) {
			order.setSo_seller_id(sellerIterator.next() + "");
			ss.getMapper(BuyingMapper.class).insertOrder(order);
		}

		// 여러 상품 받아 Delivery 객체에 넣기

		String[] sd_delivery_cost = req.getParameterValues("sd_delivery_cost");
		String[] sd_product_name = req.getParameterValues("sd_product_name");
		String[] sd_option_info = req.getParameterValues("sd_option_info");
		String[] sd_amount = req.getParameterValues("sd_amount");
		String[] sd_option_price = req.getParameterValues("sd_option_price");
		String[] sd_product_price = req.getParameterValues("sd_product_price");
		String[] sd_product_sellprice = req.getParameterValues("sd_product_sellprice");
		String[] sd_total_price = req.getParameterValues("sd_total_price");
		String[] sd_out_area = req.getParameterValues("sd_out_area");
		String[] sd_product_no = req.getParameterValues("sd_product_no");

		// 현재 로그인된 아이디 세션에서 받아와 입력/차후 수정

		delivery.setSd_customer_id(loginID);
		for (int i = 0; i < sd_seller_id.length; i++) {

			delivery.setSd_seller_id(sd_seller_id[i]);
			delivery.setSd_delivery_cost(new BigDecimal(sd_delivery_cost[i]));
			delivery.setSd_product_name(sd_product_name[i]);
			delivery.setSd_option_info(sd_option_info[i]);
			delivery.setSd_amount(new BigDecimal(sd_amount[i]));
			delivery.setSd_option_price(new BigDecimal(sd_option_price[i]));
			delivery.setSd_product_price(new BigDecimal(sd_product_price[i]));
			delivery.setSd_product_sellprice(new BigDecimal(sd_product_sellprice[i]));
			delivery.setSd_total_price(new BigDecimal(sd_total_price[i]));
			delivery.setSd_out_area(sd_out_area[i]);
			delivery.setSd_product_no(sd_product_no[i]);

			System.out.println(delivery.getSd_seller_id() + "1");
			System.out.println(delivery.getSd_delivery_cost() + "2");
			System.out.println(delivery.getSd_product_name() + "3");
			System.out.println(delivery.getSd_option_info() + "4");
			System.out.println(delivery.getSd_amount() + "5");
			System.out.println(delivery.getSd_product_price() + "6");
			System.out.println(delivery.getSd_product_sellprice() + "7");
			System.out.println(delivery.getSd_out_area() + "8");
			System.out.println(delivery.getSd_product_no() + "9");

			ss.getMapper(BuyingMapper.class).insertDelivery(delivery);

		}
		ss.getMapper(BuyingMapper.class).changeIsOrderToYes(order);

	}
}
