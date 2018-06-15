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
}
