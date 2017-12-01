package kr.co.kingofday.service;

import java.util.ArrayList;

import kr.co.kingofday.domain.Answer;
import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;

public interface AdminService {
	
	public void addAsk(Ask ask) throws Exception;
	
	public ArrayList<Ask> selectAskListForAllUsers() throws Exception;

	public Ask getAskByNo(int askNo) throws Exception;

	public void updateAskType(int askUniqueNo) throws Exception;

	public void addAnswer(Answer answer) throws Exception;

	public ArrayList<Ask> selectAskListForAllUsersAnswered() throws Exception;

	public ArrayList<Answer> getAnswerListForAnAsk(int askNo) throws Exception;

	public ArrayList<Ask> selectAskListForAnUser(int memberNo) throws Exception;

	public void deleteAnswer(int askNo) throws Exception;
	
	public void deleteAsk(int askNo) throws Exception;
	
}
