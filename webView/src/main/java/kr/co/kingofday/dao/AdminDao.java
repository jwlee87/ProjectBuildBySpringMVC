package kr.co.kingofday.dao;

import java.util.List;

import kr.co.kingofday.domain.Answer;
import kr.co.kingofday.domain.Ask;

public interface AdminDao {
	
	// 유저 질문 등록
	public void addAsk(Ask ask) throws Exception;
	public List<Ask> selectAskListForAnUser(int memberNo) throws Exception;
	public List<Ask> selectAskListForAllUsers() throws Exception;
	public Ask getAskByNo(int askNo) throws Exception;
	public void updateAskType(int askUniqueNo) throws Exception;
	public void addAnswer(Answer answer) throws Exception;
	public List<Ask> selectAskListForAllUsersAnswered() throws Exception;
	public List<Answer> getAnswerListForAnAsk(int askNo) throws Exception;
	public void deleteAnswer(int askNo) throws Exception;
	// 유저 질문 삭제
	public void deleteAsk(int askNo) throws Exception;
}