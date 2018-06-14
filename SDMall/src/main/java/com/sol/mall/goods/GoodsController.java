package com.sol.mall.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GoodsController {

	@Autowired
	private GoodsDAO gdsDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goods(HttpServletRequest request, HttpServletResponse response) {

		gdsDAO.getAllcategory(request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "index";
	}

	@RequestMapping(value = "/editor.do", method = RequestMethod.POST)
	public String editor(GoodsDtl g, HttpServletRequest request, HttpServletResponse response) {
//		gdsDAO.insertCT(tct, request, response);
//		gdsDAO.view( request, response);
		
		gdsDAO.insertGdtl(g, request, response);
		gdsDAO.getGdtl(request, response);
		
		request.setAttribute("contentPage", "goods/test.jsp");
		return "index";
	}

	@RequestMapping(value = "/category.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories categoryGet(Category cg, HttpServletRequest request, HttpServletResponse response) {
//		try {
//			String cb = request.getParameter("callback");
//			Categories cgs =  gdsDAO.getCategory(cg, request, response);

		/*	for (Category c : cgs.getCategory()) {
				System.out.println(c.getCt_clfname());
			}
			*/
			// java객체를 json으로 바꿔줄 객체
//			ObjectMapper om = new ObjectMapper();
//			
//			String resBody = cb + "(" 
//					+ new String(om.writeValueAsString(cgs)) 
//					+ ")";
			return gdsDAO.getCategory(cg, request, response);
//		}catch (Exception e) {
//			// TODO: handle exception
//			return null;
//		}		
	}
	
	// JSONP(JSON with Padding)
		//		서버쪽에서 설정
		//		응답내용 : JSON -> 응답내용 : JavaScript함수
		//		파라메터 하나 지정(callback)
		// ㅁㅁㅁㅁ(????)
	
	@RequestMapping(value = "/category2.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories category2Get(Category cg, HttpServletRequest request, HttpServletResponse response) {
		return gdsDAO.getCategory(cg, request, response);
	}
}