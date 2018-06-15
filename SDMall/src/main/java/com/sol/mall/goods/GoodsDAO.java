package com.sol.mall.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsDAO {

	@Autowired
	SqlSession ss;

	public void getAllGoods(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allGoods", ss.getMapper(GoodsMapper.class).getAllGoods());
	}

	public void getGoodsDtlByNo(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		goods.setGd_no(request.getParameter("gd_no"));
		request.setAttribute("GoodsDtl", ss.getMapper(GoodsMapper.class).getGoodsDtlByNo(goods));
	}

}
