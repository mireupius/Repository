package com.sol.mall.sale.delivery;

import java.util.Date;
import java.util.List;

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
		List<Delivery> ds = ss.getMapper(DeliveryMapper.class).getAllDelivery();
		req.setAttribute("delivery", ds);
	}

	public void deliveryCheck(HttpServletRequest req, HttpServletResponse res) {
		String str = req.getParameter("array");
		String[] array = str.split(",");
		Delivery d = new Delivery();
		d.setSd_state_detail("발주확인");
		d.setSd_check_date(new Date());

		for (String string : array) {
			d.setSd_delivery_pno(string);
			if (ss.getMapper(DeliveryMapper.class).deliveryCheck(d) == 1) {
				System.out.println("수정성공");
			} else {
				System.out.println("수정실패");
			}
		}
	}

}
