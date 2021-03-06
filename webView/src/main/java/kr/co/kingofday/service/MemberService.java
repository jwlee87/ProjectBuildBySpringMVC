package kr.co.kingofday.service;

import java.util.List;

import kr.co.kingofday.domain.AdultCheck;
import kr.co.kingofday.domain.Member;


public interface MemberService {
	
	public List<Member> getMember() throws Exception;
	
	public Member login(String id) throws Exception;
	
	public void updateMember(Member member) throws Exception;
	
	public List<Member> duplCheck(String param, String value) throws Exception;
	
	public void addMember(Member member) throws Exception;
	
	public Member getMemberByUniqueID(int uniqueID)throws Exception;
	
	public Member getMemberByID(String id) throws Exception;
	
	public void deleteMember(Member member) throws Exception;
	
	public Member getMemberByEmail(String value);
	
	//webView 계정찾기 token
	public void updateToken(Member member) throws Exception;
	
	//webView 계정찾기 update email condition Need
	public void updateFindConditionTrue(int uniqueID) throws Exception;
	
	//webView 계정찾기 update email condition Complete
	public void updateFindConditionFalse(int uniqueID) throws Exception;
	
	//webView token으로 계정찾기
	public Member getMemberByToken(String token) throws Exception;
	
	//webView update authKey
	public void updateAuthKey(Member member) throws Exception;

	//webView getMemberByAuthKey
	public Member getMemberByAuthKey(int authKey) throws Exception;

	//webView deleteAuthKey
	public void deleteAuthKey(int uniqueID) throws Exception;

	//webView deleteToken
	public void deleteToken(int uniqueID) throws Exception;
	
	// buy video
	public void updateMemberMoney(Member member) throws Exception;
	
	// Adult Check
	public void addAdultCheck(AdultCheck adultCheck) throws Exception;

	public void updateReward(Member member) throws Exception;
	
	
	
	
	

	
	
	

}