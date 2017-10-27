package kr.co.playground.dao;

import java.util.List;
import java.util.Map;

import kr.co.playground.domain.Search;
import kr.co.playground.domain.Member;


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
	
	
	
	
	
	
	
	
	
	
	
	// SELECT ONE
	public Member getMember(String email) throws Exception ;
	// SELECT LIST
	public List<Member> getMemberList(Search search) throws Exception ;

	// SELECT ONE : member_no
	public Member getMember(int member_no) throws Exception ;
	
	// FACEBOOKUPDATE
		public void faceupdateMember(Member member) throws Exception ;
		
	//(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;

	
	
	
	
	
}