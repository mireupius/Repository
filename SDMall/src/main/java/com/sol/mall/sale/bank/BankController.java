package com.sol.mall.sale.bank;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;

@Controller
public class BankController {

	@Autowired
	private MemberDAO MDAO;
	@Autowired
	private BankDAO BDAO;

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/saleBank.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res, Account a) {

		if (MDAO.slLoginCheck(req, res)) {
			BDAO.getAccount(req, res, a);
			BDAO.getNotCalMoney(req, res, a);
			req.setAttribute("contentPage", "bank/bank.jsp");
			return "sale/saleIndex";
		} else {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}
	}

	@RequestMapping(value = "/saleBank.reg.do", method = RequestMethod.POST)
	public String regAccount(HttpServletRequest req, HttpServletResponse res, Account a) {

		if (MDAO.slLoginCheck(req, res)) {

			BDAO.regAccount(req, res, a);
			BDAO.getAccount(req, res, a);
			BDAO.getNotCalMoney(req, res, a);
			req.setAttribute("contentPage", "bank/bank.jsp");
			return "sale/saleIndex";
		} else {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}
	}

	@RequestMapping(value = "/saleBank.takemoney.do", method = RequestMethod.GET)
	public String takeMoney(HttpServletRequest req, HttpServletResponse res, Account a) {

		if (MDAO.slLoginCheck(req, res)) {

			BDAO.doCaculate(req, res, a);
			BDAO.getAccount(req, res, a);
			BDAO.getNotCalMoney(req, res, a);
			req.setAttribute("contentPage", "bank/bank.jsp");
			return "sale/saleIndex";
		} else {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}
	}

}
