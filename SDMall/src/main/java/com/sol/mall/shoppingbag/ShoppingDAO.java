package com.sol.mall.shoppingbag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.member.Customer;

@Service
public class ShoppingDAO {

	@Autowired
	private SqlSession ss;

	private List<Shoppingbag> tt;

	public void getCart(Shoppingbag sb2, HttpServletRequest req, HttpServletResponse res) {

		try {
			Customer cc = (Customer) req.getSession().getAttribute("loginMember");

			System.out.println(cc.getCsm_id());
			sb2.setSb_csm_id(cc.getCsm_id());

			tt = ss.getMapper(ShoppingbagMapper.class).getcart(sb2);
			for (Shoppingbag shoppingbag : tt) {
				System.out.println(shoppingbag.getSb_csm_id());
			}
			req.setAttribute("shopBag", tt);
			req.setAttribute("shopBag2", tt);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void stockcheck(HttpServletRequest req, HttpServletResponse res) {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	};

	public void getoption(HttpServletRequest req, HttpServletResponse res) {

		try {
			List<GdOption> gol = ss.getMapper(ShoppingbagMapper.class).joinSBOS(); // 테이블조인시키고 옵션리스트에 담기

			// Customer c = (Customer) req.getSession().getAttribute("loginMember"); //
			// 현재세션에있는아이디
			// s.setSb_csm_id(c.getCsm_id()); // 아이디꺼내다가담아두고
			// List<Shoppingbag> sbl = ss.getMapper(ShoppingbagMapper.class).getcart(s); //
			// 아이디에대한모든장바구니

			req.setAttribute("option", gol);

			System.out.println(gol.size());

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void getprice(HttpServletResponse res, HttpServletRequest req) {
		try {
			Customer c = (Customer) req.getSession().getAttribute("loginMember");

			Summoney s = new Summoney();

			s.setCsm_id(c.getCsm_id());

			List<Summoney> sm = ss.getMapper(ShoppingbagMapper.class).getSprice(s);

			req.setAttribute("summoney", sm);
		} catch (Exception e) {
			req.setAttribute("r", "실패햇다");
			e.printStackTrace();
		}
	}

	public void getpriceALL(HttpServletResponse res, HttpServletRequest req) {
		try {

			Customer c = (Customer) req.getSession().getAttribute("loginMember");

			Summoney s = new Summoney();

			s.setCsm_id(c.getCsm_id());

			// 상품판매가격리스트
			List<Summoney> sm = ss.getMapper(ShoppingbagMapper.class).getprice(s);

			// 상품소비자가리스트
			List<Summoney> ssm = ss.getMapper(ShoppingbagMapper.class).getSprice(s);

			int priceSum = 0;
			int SpriceSum = 0;

			for (Summoney summoney : sm) {
				priceSum = priceSum + Integer.valueOf(summoney.getSummoney().intValue());
			}
			req.setAttribute("sumAllprice", priceSum);

			for (Summoney summoney : ssm) {
				SpriceSum = SpriceSum + Integer.valueOf(summoney.getSummoney().intValue());
			}
			req.setAttribute("sumAllSprice", SpriceSum);

		} catch (Exception e) {
			req.setAttribute("r", "실패햇다");
			e.printStackTrace();
		}
	}

	public void saleprice(HttpServletRequest req, HttpServletResponse res) {
		try {
			Customer c = (Customer) req.getSession().getAttribute("loginMember");

			Saleprice s = new Saleprice();

			s.setCsm_id(c.getCsm_id());

			List<Saleprice> sp = ss.getMapper(ShoppingbagMapper.class).getsaleprice(s);

			int price = 0;
			for (Saleprice saleprice : sp) {
				price = price + Integer.valueOf(saleprice.getSaleprice().intValue());
			}
			req.setAttribute("saleprice", price);
		} catch (Exception e) {
			req.setAttribute("r", "오류");
			e.printStackTrace();
		}
	}

	public void deletegd(Shoppingbag s, HttpServletRequest req, HttpServletResponse res) {
		try {
			Customer c = (Customer) req.getSession().getAttribute("loginMember");

			s.setSb_csm_id(c.getCsm_id());

			if (ss.getMapper(ShoppingbagMapper.class).deletegd(s) == 1) {
				System.out.println("삭제성공");

			} else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletegdAll(Shoppingbag s, HttpServletRequest req, HttpServletResponse res) {
		try {
			Customer c = (Customer) req.getSession().getAttribute("loginMember");

			s.setSb_csm_id(c.getCsm_id());
			System.out.println(s.getSb_csm_id());
			if (ss.getMapper(ShoppingbagMapper.class).deletegdAll(s) >= 1) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
