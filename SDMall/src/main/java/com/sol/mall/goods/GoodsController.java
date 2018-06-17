package com.sol.mall.goods;

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
	public String registrationDo(Goods gd, GoodsDtl gdtl, Option op, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 이미지 입력 만들기 전 까지 임시
		gd.setGd_imgl("gd_imgl");
		gd.setGd_imgm("gd_imgm");
		gd.setGd_imgs("gd_imgs");
		gd.setGd_imgss("gd_imgss");
		gdtl.setGt_stock(op.getOp_stock());

		// FK 설정으로 입력이나 삭제시 주의 상품상세테이블 먼저 입력이나 삭제하고 상품테이블 삭제
		// 방금입력한 상품번호 어떻게 가져오지?
		// 입력하고 저장 누르면 저장후 입력화면으로 이동 방금입력한 내용을 다시 입력화면에 표시불가
		// 수정화면 따로 만들어야 함
	
		// Transaction 적용
		gdsDAO.insertGdsInfo(gd, gdtl, op, request, response);
		
		gdsDAO.getAllcategory(request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "index";
	}

	@RequestMapping(value = "/category.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories categoryGet(Category cg, HttpServletRequest request, HttpServletResponse response) {

		return gdsDAO.getCategory(cg, request, response);

	}

}