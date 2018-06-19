package com.sol.mall.myPage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageDAO {
	
	@Autowired
	private SqlSession ss;

}
