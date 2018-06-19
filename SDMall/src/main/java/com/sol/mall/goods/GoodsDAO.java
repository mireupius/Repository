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

	public void getGoodsByNo(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("goodsDtl1", ss.getMapper(GoodsMapper.class).getGoodsByNo(goods));
		request.setAttribute("goodsDtl2", ss.getMapper(GoodsMapper.class).getGoodsDtlByNo(goods));
		request.setAttribute("option", ss.getMapper(OptionMapper.class).getOptionByGdno(goods));
		System.out.println(goods.getGd_no());

		// ss.getMapper(GoodsMapper.class).getGoodsByNo(goods).getGd_clfl();

	}

}
