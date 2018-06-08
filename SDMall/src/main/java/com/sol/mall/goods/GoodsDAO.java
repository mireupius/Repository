package com.sol.mall.goods;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getAllcategory(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Category> cts = new ArrayList<>();
		 cts = (ArrayList<Category>) ss.getMapper(GoodsMapper.class).getAllcategory();
		
		for (Category category : cts) {
			System.out.println(category.getCt_clfname());
		}
		request.setAttribute("category", cts);
	}
}
