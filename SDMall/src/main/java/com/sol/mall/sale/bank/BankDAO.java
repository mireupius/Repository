package com.sol.mall.sale.bank;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Seller;

@Service
public class BankDAO {

	@Autowired
	private SqlSession ss;

	public void getAccount(HttpServletRequest req, HttpServletResponse res, Account a) {
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		a.setSa_id(s.getSl_id());
		Account aa = ss.getMapper(BankMapper.class).getAccount(a);
		req.setAttribute("bankName", aa.getSa_account_bank());
		req.setAttribute("bankNum", aa.getSa_account_num());
	}

	public void getNotCalMoney(HttpServletRequest req, HttpServletResponse res, Account a) {
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		a.setSa_id(s.getSl_id());
		try {
			req.setAttribute("money", ss.getMapper(BankMapper.class).getNotCalMoney(a));
		} catch (Exception e) {
			req.setAttribute("money", 0);
		}
	}

	public void regAccount(HttpServletRequest req, HttpServletResponse res, Account a) {
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		a.setSa_id(s.getSl_id());
		ss.getMapper(BankMapper.class).regAccount(a);
	}

	public void doCaculate(HttpServletRequest req, HttpServletResponse res, Account a) {
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		a.setSa_id(s.getSl_id());
		ss.getMapper(BankMapper.class).doCaculate(a);
	}

	public void modifyAccount(HttpServletRequest req, HttpServletResponse res, Account a) {
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		a.setSa_id(s.getSl_id());
		ss.getMapper(BankMapper.class).modifyAccount(a);
	}

}
