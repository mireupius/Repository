package com.sol.mall.goods;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GoodsController {

	@Autowired
	private GoodsDAO gdsDAO;

	// 상품등록화면 처음 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goods(HttpServletRequest request, HttpServletResponse response) {
		
		gdsDAO.getAllcategory(request, response);
		
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "index";
	}

	// 상품등록작업
	@RequestMapping(value = "/registration.do", method = RequestMethod.POST)
	public String registrationDo(Goods gd, GoodsDtl gdtl, HttpServletRequest request, HttpServletResponse response) {

		
		gd.setGd_imgl("gd_imgl");
		gd.setGd_imgm("gd_imgm");
		gd.setGd_imgs("gd_imgs");
		gd.setGd_imgss("gd_imgss");
		
		// FK 설정으로 입력이나 삭제시 주의 상품상세테이블 먼저 입력이나 삭제하고 상품테이블 삭제
		// 입력부(상품)
		gdsDAO.insertGd(gd, request, response);

		
		// 입력부(상품상세)
		//gdsDAO.insertGdtl(gdtl, request, response);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("goods", gd);
		map.put("goodsDtl", gdtl);
		
		// 입력부(상품상세)
		gdsDAO.insertGdtlTwo(map, request, response);
		
		// 표시부(수정필요)
		gdsDAO.getGd(request, response);
		gdsDAO.getGdtl(request, response);
		
		request.setAttribute("contentPage", "goods/test.jsp");
		return "index";
	}

	@RequestMapping(value = "/category.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories categoryGet(Category cg, HttpServletRequest request, HttpServletResponse response) {

			return gdsDAO.getCategory(cg, request, response);

	}
	
}