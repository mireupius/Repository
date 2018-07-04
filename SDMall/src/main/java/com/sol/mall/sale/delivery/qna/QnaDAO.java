package com.sol.mall.sale.delivery.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.mall.myPage.QuestionAnswer;

@Service
public class QnaDAO {

	@Autowired
	private SqlSession ss;

	public List<QuestionAnswer> getAllQnAById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {
		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");

		req.setAttribute("now", "sale.delivery.qna.go");
		return ss.getMapper(QnaMapper.class).getAllQnAById(q);
	}

	public List<QuestionAnswer> getUnAById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {
		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");
		req.setAttribute("now", "sale.delivery.una.go");
		return ss.getMapper(QnaMapper.class).geUnAById(q);
	}

	public List<QuestionAnswer> getAedById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {
		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");
		req.setAttribute("now", "sale.delivery.aed.go");
		return ss.getMapper(QnaMapper.class).getAedById(q);
	}

	public void getAllQnANumById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {

		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");
		req.setAttribute("AllNum", ss.getMapper(QnaMapper.class).getAllQnANumById(q));
	}

	public void getUnAnswerQnANumById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {

		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");
		req.setAttribute("unANum", ss.getMapper(QnaMapper.class).getUnAnswerQnANumById(q));
	}

	public void getAnsweredQnANumById(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {

		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		q.setQa_sl_id("seller00");
		req.setAttribute("AedNum", ss.getMapper(QnaMapper.class).getAnsweredQnANumById(q));
	}

	public QuestionAnswer getQnAByNum(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {

		// 로그인 된 판매자 아이디 세션에서 가져와 자바빈에 넣어 sql문에 파라메터로 넘김
		// req.getSession().getAttribute("loginID");
		return ss.getMapper(QnaMapper.class).getQnaByNum(q);
	}

	public void updateAnswer(HttpServletRequest req, HttpServletResponse res, QuestionAnswer q) {

		if (ss.getMapper(QnaMapper.class).answerQna(q) == 1) {
			req.setAttribute("r", "답변하였습니다.");
		} else {
			req.setAttribute("r", "답변하지 못했습니다.");
		}
	}

	public void paging(HttpServletRequest req, HttpServletResponse res, List<QuestionAnswer> ds) {

		if (ds.size() != 0) {

			int page = 1;
			if (req.getParameter("pno") != null) {
				page = Integer.parseInt(req.getParameter("pno"));
			}

			double cnt = 10;
			int itemSize = ds.size();
			int pageCount = (int) Math.ceil(itemSize / cnt);
			req.setAttribute("pageCount", pageCount);

			int start = itemSize - ((int) cnt * (page - 1));
			int end = (page == pageCount) ? -1 : start - ((int) cnt + 1);

			ArrayList<QuestionAnswer> items2 = new ArrayList<>();

			for (int i = start - 1; i > end; i--) {
				items2.add(ds.get(i));
			}

			req.setAttribute("pageCount", pageCount - 1);
			req.setAttribute("qna", items2);
		} else {
			req.setAttribute("pageCount", 0);
			req.setAttribute("qna", 0);
		}

	}

}
