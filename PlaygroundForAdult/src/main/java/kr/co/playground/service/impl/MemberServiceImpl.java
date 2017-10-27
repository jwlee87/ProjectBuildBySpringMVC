package kr.co.playground.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.playground.dao.MemberDao;
import kr.co.playground.domain.Search;
import kr.co.playground.domain.Member;
import kr.co.playground.service.MemberService;;


@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	
	///Field
	@Autowired
	@Qualifier("memberDaoImpl")
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	///Constructor
	public MemberServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public Member login(String id) throws Exception {
		return memberDao.login(id);
	}

	public List<Member> getMember() throws Exception {
		System.out.println("서비스 임플 디버깅 dao 진입 전");
		return memberDao.getMember();
	}

	public void updateMember(Member member) throws Exception {
		memberDao.updateMember(member);
	}
	
	public List<Member> duplCheck(String param, String value) throws Exception {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("param", param);
		m.put("value", value);
		return memberDao.duplCheck(m);
	}
	
	public void faceupdateMember(Member member) throws Exception {
		memberDao.faceupdateMember(member);		
	}

	public void addMember(Member member) throws Exception {
		memberDao.addMember(member);
	}

	public Member getMemberByUniqueID(int uniqueID) throws Exception {
		return memberDao.getMemberByUniqueID(uniqueID);
	}
	
	public Member getMemberByID(String id) throws Exception {
		return memberDao.getMemberByID(id);
	}
	
	public void deleteMember(Member member) throws Exception {
		memberDao.deleteMember(member);
	}
	
	public Member getMemberByEmail(String email) {
		return memberDao.getMemberByEmail(email); 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	public Member getMember(String email) throws Exception {
		Member member = new Member();
		member=memberDao.getMember(email);
		System.out.println(member);
	
		return member;
	}
	
	
	public Member getMember(int member_no) throws Exception {

		  Member member = memberDao.getMember(member_no);
		  System.out.println(member);
		  
		  return member;
		}

	public Map<String , Object > getMemberList(Search search) throws Exception {
		List<Member> list= memberDao.getMemberList(search);
		int totalCount = memberDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	public boolean checkDuplication(String email) throws Exception {
		boolean result=true;
		Member member=memberDao.getMember(email);
		if(member != null) {
			result=false;
		}
		return result;
	}

	
	
	
	
	
	
	
	
	
}