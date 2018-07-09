package com.sol.mall.sale.delivery.qna;

import java.util.List;

import com.sol.mall.myPage.QuestionAnswer;

public interface QnaMapper {

	public abstract List<QuestionAnswer> getAllQnAById(QuestionAnswer q);
	public abstract List<QuestionAnswer> geUnAById(QuestionAnswer q);
	public abstract List<QuestionAnswer> getAedById(QuestionAnswer q);
	public abstract QuestionAnswer getQnaByNum(QuestionAnswer q);
	public abstract int answerQna(QuestionAnswer q);
		
	public abstract int getAllQnANumById(QuestionAnswer q);
	public abstract int getUnAnswerQnANumById(QuestionAnswer q);
	public abstract int getAnsweredQnANumById(QuestionAnswer q);
}
