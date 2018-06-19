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
		// 파라메터명(input name="" 보고)
		String zcx = request.getParameter("aa");
		int vasd = Integer.parseInt(request.getParameter("bb"));
		
		System.out.println(zcx);
		System.out.println(vasd);
		
		String zxcvnxcv = "ㅎㅎㅎㅎㅎㅎ";
		request.setAttribute("cc", zxcvnxcv);
		
		// parameter
		//		html or jsp에서 만들어낸 값
		//		String or String[]
		//		request에 소속, 새로운 요청이 일어나면 값 없어짐
		
		// request.attribute
		//		java에서 만들어낸 값
		//		Object
		//		request에 소속, 새로운 요청이 일어나면 값 없어짐
		
		// session.attribute
		//		java에서 만드는 값
		//		Object
		//		session(서버-클라이언트 연결)에 소속
		//		제한시간이 지나거나(기본 30분) 연결이 끊어지면 값 없어짐
		String asd = "가나다라";
		
		HttpSession hs = request.getSession();
		hs.setAttribute("asd", asd);
		hs.setMaxInactiveInterval(50); // 5초 동안 아무 작업을 안하면 asd삭제
									// 작업을 하면 시간 갱신
		// hs.invalidate(); // 세션끊기
		
		// cookie
		//		java에서 만드는 값
		//		String
		//		클라이언트 컴퓨터에 파일로 저장
		//		제한시간(기본: 브라우저 닫을때까지) 
		//	   지나지 않았으면 접속을 끊어도 값 존재
		Cookie c = new Cookie("zec", "hello");
		c.setMaxAge(5000);
		// c.setMaxAge(0);
		response.addCookie(c);
		
		String txt = "안녕";
		
		// Cookie에 한글 넣으려면 URLEncoding
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













