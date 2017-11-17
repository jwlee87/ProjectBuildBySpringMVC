package kr.co.kingofday.dao;

import java.util.List;
import java.util.Map;

import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.Search;


public interface MemberDao {
	
	/*로그인*/
	public Member login(String id) throws Exception;
	
	/*멤버수*/
	public List<Member> getMember() throws Exception ;
	/*내정보 수정*/
	public void updateMember(Member member) throws Exception ;
	//중복 체크
	public List<Member> duplCheck(Map<String, Object> m) throws Exception;
	//회원 가입
	public void addMember(Member member) throws Exception ;
	
	public Member getMemberByUniqueID(int uniqueID) throws Exception;
	
	public Member getMemberByID(String id) throws Exception;
	
	public void deleteMember(Member member) throws Exception;
	
	public Member getMemberByEmail(String email);
	
	//webView 계정찾기 token
	public void updateToken(Member member) throws Exception;
	
	//webView 계정찾기 update email condition Need
	public void updateFindConditionTrue(int uniqueID) throws Exception;
	
	//webView 계정찾기 update email condition Complete
	public void updateFindConditionFalse(int uniqueID) throws Exception;
	
	//webView getMemberByToken
	public Member getMemberByToken(String token) throws Exception;
	
	//webView updateAuthKey
	public void updateAuthKey(Member member) throws Exception;
	
	//webView getMemberByAuthKey
	public Member getMemberByAuthKey(String authKey) throws Exception;
	
	//webView deleteAuthKey
	public void deleteAuthKey(int uniqueID) throws Exception ;
	
	//webView deleteToken
	public void deleteToken(int uniqueID) throws Exception ;

	public void updateMemberMoney(Member member) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}