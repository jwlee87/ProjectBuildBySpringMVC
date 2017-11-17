package kr.co.kingofday.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.kingofday.dao.MemberDao;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.Search;
import kr.co.kingofday.service.MemberService;;


@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	
	///Field
	@Autowired
	@Qualifier("memberDaoImpl")
	private MemberDao memberDao;
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public MemberServiceImpl() {
		logger.info(this.getClass());
	}

	///Method
	public Member login(String id) throws Exception {
		return memberDao.login(id);
	}

	public List<Member> getMember() throws Exception {
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
	
	//webView
	public void updateToken(Member member) throws Exception {
		memberDao.updateToken(member);
	}

	//webView
	public void updateFindConditionTrue(int uniqueID) throws Exception {
		memberDao.updateFindConditionTrue(uniqueID);
	}

	//webView
	public void updateFindConditionFalse(int uniqueID) throws Exception {
		memberDao.updateFindConditionFalse(uniqueID);
	}
	
	//webView
	public Member getMemberByToken(String token) throws Exception {
		return memberDao.getMemberByToken(token);
	}
	
	//webView
	public void updateAuthKey(Member member) throws Exception {
		memberDao.updateAuthKey(member);
	}
	
	//webView
	public Member getMemberByAuthKey(String authKey) throws Exception {
		return memberDao.getMemberByAuthKey(authKey);
	}
	
	//webView
	public void deleteAuthKey(int uniqueID) throws Exception {
		memberDao.deleteAuthKey(uniqueID);
	}
	
	//webView
	public void deleteToken(int uniqueID) throws Exception {
		memberDao.deleteToken(uniqueID);
	}

	// buy video
	public void updateMemberMoney(Member member) throws Exception {
		memberDao.updateMemberMoney(member);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}