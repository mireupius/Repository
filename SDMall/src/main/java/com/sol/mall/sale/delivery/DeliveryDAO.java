package com.sol.mall.sale.delivery;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryDAO {

	@Autowired
	private SqlSession ss;

	public void getAllOrder(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("orders", ss.getMapper(DeliveryMapper.class).getAllDelivery());
	}

}
