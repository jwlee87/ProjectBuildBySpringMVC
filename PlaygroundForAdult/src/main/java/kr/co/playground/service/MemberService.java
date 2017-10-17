package kr.co.playground.service;

import java.util.List;
import java.util.Map;

import kr.co.playground.domain.Search;
import kr.co.playground.domain.Member;


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
	
	
	
	
	
	
	

	
	
	

}