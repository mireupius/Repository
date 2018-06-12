package com.sol.mall.goods;

import java.util.ArrayList;
import java.util.List;

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
		
/*		for (Category category : cts) {
			System.out.println(category.getCt_clfname());
		}*/
		request.setAttribute("category", cts);
	}
	
	
	public void insertCT(TestContent tct, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println(tct.getDaumcontent());
		
		if(ss.getMapper(GoodsMapper.class).insertCT(tct) == 1) {
			
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
	}
	
	
	public void view(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<TestContent> tttt =  (ArrayList<TestContent>) ss.getMapper(GoodsMapper.class).getAll();
		int i = 0;
		for (TestContent testContent : tttt) {
			
			System.out.println(i +"==="+ testContent.getDaumcontent());
			i++;
		}
		
		request.setAttribute("tent", tttt);
	}
}
