package com.kwon.pt.main;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EModel {

	public static void test(HttpServletRequest request, HttpServletResponse response) {
		// 督虞五斗誤(input name="" 左壱)
		String zcx = request.getParameter("aa");
		int vasd = Integer.parseInt(request.getParameter("bb"));
		
		System.out.println(zcx);
		System.out.println(vasd);
		
		String zxcvnxcv = "ぞぞぞぞぞぞ";
		request.setAttribute("cc", zxcvnxcv);
		
		// parameter
		//		html or jsp拭辞 幻級嬢浬 葵
		//		String or String[]
		//		request拭 社紗, 歯稽錘 推短戚 析嬢蟹檎 葵 蒸嬢像
		
		// request.attribute
		//		java拭辞 幻級嬢浬 葵
		//		Object
		//		request拭 社紗, 歯稽錘 推短戚 析嬢蟹檎 葵 蒸嬢像
		
		// session.attribute
		//		java拭辞 幻球澗 葵
		//		Object
		//		session(辞獄-適虞戚情闘 尻衣)拭 社紗
		//		薦廃獣娃戚 走蟹暗蟹(奄沙 30歳) 尻衣戚 快嬢走檎 葵 蒸嬢像
		String asd = "亜蟹陥虞";
		
		HttpSession hs = request.getSession();
		hs.setAttribute("asd", asd);
		hs.setMaxInactiveInterval(50); // 5段 疑照 焼巷 拙穣聖 照馬檎 asd肢薦
									// 拙穣聖 馬檎 獣娃 飴重
		// hs.invalidate(); // 室芝快奄
		
		// cookie
		//		java拭辞 幻球澗 葵
		//		String
		//		適虞戚情闘 陳濃斗拭 督析稽 煽舌
		//		薦廃獣娃(奄沙: 崎虞酔煽 丸聖凶猿走) 
		//	   走蟹走 省紹生檎 羨紗聖 快嬢亀 葵 糎仙
		Cookie c = new Cookie("zec", "hello");
		c.setMaxAge(5000);
		// c.setMaxAge(0);
		response.addCookie(c);
		
		String txt = "照括";
		
		// Cookie拭 廃越 隔生形檎 URLEncoding
		try {
			txt = URLEncoder.encode(txt, "euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Cookie c2 = new Cookie("qwe", txt);
		c2.setMaxAge(30);
		response.addCookie(c2);
	}	
	
	
	public static void test2(HttpServletRequest request, HttpServletResponse response) {
		/*String aa = request.getParameter("aa");
		String bb = request.getParameter("bb");
		
		String cc = (String) request.getAttribute("cc");
		
		System.out.println(aa);
		System.out.println(bb);
		System.out.println(cc);*/
		
		HttpSession hs = request.getSession();
		String asd = (String) hs.getAttribute("asd");
		System.out.println(asd);
		
		
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("zec")) {
				System.out.println(cookie.getValue());
			}else if(cookie.getName().equals("qwe")) {
				String txt = cookie.getValue();
				try {
					txt = URLDecoder.decode(txt, "euc-kr");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(txt);
			}
		}
		
		
	}
	
}













