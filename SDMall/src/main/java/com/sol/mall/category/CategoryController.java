package com.sol.mall.category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {

	@Autowired
	private CategoryDAO cDAO;

	@RequestMapping(value = "/sdds", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		return "main";
	}
	
	@RequestMapping(value = "/티셔츠", method = RequestMethod.GET)
	public String pa(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		return "shop";
	}
}
