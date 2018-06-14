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

		request.setAttribute("category", cts);
	}
	
	public Categories getCategory(Category cg, HttpServletRequest request, HttpServletResponse response) {

		return new Categories(ss.getMapper(GoodsMapper.class).getCategory(cg));
	}

	public void insertGdtl(GoodsDtl g, HttpServletRequest request, HttpServletResponse response) {
		
		if (ss.getMapper(GoodsMapper.class).insertGdsDtl(g) == 1) {
			
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}

	public void getGdtl(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<GoodsDtl> tttt = (ArrayList<GoodsDtl>) ss.getMapper(GoodsMapper.class).getGoodsDtl();
		int i = 0;
		for (GoodsDtl goodsDtl : tttt) {
			
			System.out.println(i + "===" + goodsDtl.getGt_detail());
			i++;
		}
		
		request.setAttribute("tent", tttt);
	}
	
	// 테스트용
	public void insertCT(TestContent tct, HttpServletRequest request, HttpServletResponse response) {

		System.out.println(tct.getDaumcontent());

		if (ss.getMapper(GoodsMapper.class).insertCT(tct) == 1) {

			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}

	// 테스트용
	public void view(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<TestContent> tttt = (ArrayList<TestContent>) ss.getMapper(GoodsMapper.class).getAll();
		int i = 0;
		for (TestContent testContent : tttt) {

			System.out.println(i + "===" + testContent.getDaumcontent());
			i++;
		}

		request.setAttribute("tent", tttt);
	}
}
