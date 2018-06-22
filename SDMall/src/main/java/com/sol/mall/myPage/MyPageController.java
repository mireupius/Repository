package com.sol.mall.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageDAO MPDAO;
	
	@RequestMapping(value = "/customer.myHome.orderList", method = RequestMethod.GET)
	public String goOrderList(SearchOrder bb, HttpServletRequest req, HttpServletResponse res) {

		MPDAO.getOrderList(bb, req, res);
		
		return "customer/customerMyPage";
		

	}
	
	
	
	

}
