package kr.co.kingofday.service;

import java.util.ArrayList;

import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;

public interface AskService {
	
	public void addAsk(Ask ask) throws Exception;
	
	public void updateAsk(Ask ask) throws Exception;
	
	public void deleteAsk(Ask ask) throws Exception;

	public ArrayList<Ask> selectAskListForAnUser(Member member) throws Exception;
	
}
