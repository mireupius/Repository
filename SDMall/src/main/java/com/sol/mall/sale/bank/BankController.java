package com.sol.mall.sale.bank;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.sale.delivery.Delivery;

@Controller
public class BankController {


	@Autowired
	private MemberDAO MDAO;

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/saleBank.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res, Delivery d) {

		if (MDAO.slLoginCheck(req, res)) {
			req.setAttribute("contentPage", "bank/bank.jsp");
			return "sale/saleIndex";
		} else {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}
	}
}
