package com.sol.mall.category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryDAO {

	@Autowired
	private SqlSession ss;

	public void getAllCategory(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allCategory", ss.getMapper(CategoryMapper.class).getAllCategory());
	}
}
