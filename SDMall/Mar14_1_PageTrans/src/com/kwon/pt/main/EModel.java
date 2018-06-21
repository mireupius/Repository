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
		// �Ķ���͸�(input name="" ����)
		String zcx = request.getParameter("aa");
		int vasd = Integer.parseInt(request.getParameter("bb"));
		
		System.out.println(zcx);
		System.out.println(vasd);
		
		String zxcvnxcv = "������������";
		request.setAttribute("cc", zxcvnxcv);
		
		// parameter
		//		html or jsp���� ���� ��
		//		String or String[]
		//		request�� �Ҽ�, ���ο� ��û�� �Ͼ�� �� ������
		
		// request.attribute
		//		java���� ���� ��
		//		Object
		//		request�� �Ҽ�, ���ο� ��û�� �Ͼ�� �� ������
		
		// session.attribute
		//		java���� ����� ��
		//		Object
		//		session(����-Ŭ���̾�Ʈ ����)�� �Ҽ�
		//		���ѽð��� �����ų�(�⺻ 30��) ������ �������� �� ������
		String asd = "�����ٶ�";
		
		HttpSession hs = request.getSession();
		hs.setAttribute("asd", asd);
		hs.setMaxInactiveInterval(50); // 5�� ���� �ƹ� �۾��� ���ϸ� asd����
									// �۾��� �ϸ� �ð� ����
		// hs.invalidate(); // ���ǲ���
		
		// cookie
		//		java���� ����� ��
		//		String
		//		Ŭ���̾�Ʈ ��ǻ�Ϳ� ���Ϸ� ����
		//		���ѽð�(�⺻: ������ ����������) 
		//	   ������ �ʾ����� ������ ��� �� ����
		Cookie c = new Cookie("zec", "hello");
		c.setMaxAge(5000);
		// c.setMaxAge(0);
		response.addCookie(c);
		
		String txt = "�ȳ�";
		
		// Cookie�� �ѱ� �������� URLEncoding
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













