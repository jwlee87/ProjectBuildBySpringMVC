package kr.co.kingofday.dao;

import java.util.List;

import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;

public interface AskDao {
	
	// 유저 질문 등록
	public void addAsk(Ask ask) throws Exception;
	// 운영자 답변 등록/수정
	public void updateAsk(Ask ask) throws Exception;
	// 유저 질문 삭제
	public void deleteAsk(Ask ask) throws Exception;
	
	public List<Ask> selectAskListForAnUser(Member member) throws Exception;
	
}