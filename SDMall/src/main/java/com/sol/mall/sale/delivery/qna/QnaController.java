package com.sol.mall.sale.delivery.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.mall.myPage.QuestionAnswer;

@Controller
public class QnaController {

	@Autowired
	private QnaDAO QDAO;

	@RequestMapping(value = "/sale.delivery.qna.go", method = RequestMethod.GET)
	public String getQnA(QuestionAnswer q, HttpServletRequest req, HttpServletResponse res) {

		QDAO.paging(req, res, QDAO.getAllQnAById(req, res, q));
		QDAO.getAllQnANumById(req, res, q);
		QDAO.getUnAnswerQnANumById(req, res, q);
		QDAO.getAnsweredQnANumById(req, res, q);

		req.setAttribute("contentPage", "qna/productQnA.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.delivery.una.go", method = RequestMethod.GET)
	public String getUnA(QuestionAnswer q, HttpServletRequest req, HttpServletResponse res) {

		QDAO.paging(req, res, QDAO.getUnAById(req, res, q));
		QDAO.getAllQnANumById(req, res, q);
		QDAO.getUnAnswerQnANumById(req, res, q);
		QDAO.getAnsweredQnANumById(req, res, q);

		req.setAttribute("contentPage", "qna/productQnA.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.delivery.aed.go", method = RequestMethod.GET)
	public String getAed(QuestionAnswer q, HttpServletRequest req, HttpServletResponse res) {

		QDAO.paging(req, res, QDAO.getAedById(req, res, q));
		QDAO.getAllQnANumById(req, res, q);
		QDAO.getUnAnswerQnANumById(req, res, q);
		QDAO.getAnsweredQnANumById(req, res, q);

		req.setAttribute("contentPage", "qna/productQnA.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.delivery.answer.do", method = RequestMethod.POST)
	public String updateAnswer(QuestionAnswer q, HttpServletRequest req, HttpServletResponse res) {

		QDAO.paging(req, res, QDAO.getAllQnAById(req, res, q));
		QDAO.updateAnswer(req, res, q);
		QDAO.getAllQnANumById(req, res, q);
		QDAO.getUnAnswerQnANumById(req, res, q);
		QDAO.getAnsweredQnANumById(req, res, q);

		req.setAttribute("contentPage", "qna/productQnA.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.delivery.qna.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody QuestionAnswer getQna(QuestionAnswer q, HttpServletRequest req, HttpServletResponse res) {

		return QDAO.getQnAByNum(req, res, q);

	}

}
