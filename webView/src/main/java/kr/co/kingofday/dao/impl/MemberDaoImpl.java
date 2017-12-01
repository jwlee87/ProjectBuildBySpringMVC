package kr.co.kingofday.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.kingofday.dao.MemberDao;
import kr.co.kingofday.domain.AdultCheck;
import kr.co.kingofday.domain.Member;

@Repository("memberDaoImpl")
public class MemberDaoImpl implements MemberDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public MemberDaoImpl() {
		logger.info(this.getClass());
	}

	///Method
	public Member login(String id) throws Exception {
		return sqlSession.selectOne("MemberMapper.login", id);
	}
	public Member selectOneLoginMember(int uniqueID) throws Exception {
		return sqlSession.selectOne("MemberMapper.selectOneLoginMember", uniqueID);
	}
	public List<Member> getMember() throws Exception {
		return sqlSession.selectList("MemberMapper.getMember");
	}
	public void updateMember(Member member) throws Exception {
		sqlSession.update("MemberMapper.updateMember", member);
	}
	public List<Member> duplCheck(Map<String, Object> m) throws Exception {
		return sqlSession.selectList("MemberMapper.duplCheck", m);
	}
	public void addMember(Member member) throws Exception {
		
		sqlSession.insert("MemberMapper.addMember", member);
		String userId = member.getId();
		Member m = sqlSession.selectOne("MemberMapper.getMemberByID", userId);
		sqlSession.insert("MemberMapper.addMemberInfo", m);
		
	}
	
	public Member getMemberByUniqueID(int uniqueID) throws Exception {
		return sqlSession.selectOne("MemberMapper.getMemberByUniqNo", uniqueID);
	}
	
	public Member getMemberByID(String id) throws Exception {
		return sqlSession.selectOne("MemberMapper.getMemberByID", id);
	}
	
	public void deleteMember(Member member) throws Exception {
		sqlSession.update("MemberMapper.deleteMember", member);
	}
	
	public Member getMemberByEmail(String email) {
		return sqlSession.selectOne("MemberMapper.getMemberByEmail", email);
	}
	
	//webView
	public void updateToken(Member member) throws Exception {
		sqlSession.update("MemberMapper.updateToken", member);
	}
	//webView
	public void updateFindConditionTrue(int uniqueID) throws Exception {
		sqlSession.update("MemberMapper.updateFindConditionTrue", uniqueID);
	}
	//webView
	public void updateFindConditionFalse(int uniqueID) throws Exception {
		sqlSession.update("MemberMapper.updateFindConditionFalse", uniqueID);
	}
	//webView
	public Member getMemberByToken(String token) {
		return sqlSession.selectOne("MemberMapper.getMemberByToken", token);
	}
	
	//webView updateAuthKey
	public void updateAuthKey(Member member) throws Exception {
		sqlSession.update("MemberMapper.updateAuthKey", member);
	}
	
	//webView getMemberByAuthKey
	public Member getMemberByAuthKey(int authKey) throws Exception {
		return sqlSession.selectOne("MemberMapper.getMemberByAuthKey", authKey);
	}
	
	//webView deleteAuthKey
	public void deleteAuthKey(int uniqueID) throws Exception {
		sqlSession.update("MemberMapper.deleteAuthKey", uniqueID);
	}
	
	//webView deleteToken
	public void deleteToken(int uniqueID) throws Exception {
		sqlSession.update("MemberMapper.deleteToken", uniqueID);
	}
	
	public void updateMemberMoney(Member member) throws Exception {
		sqlSession.update("MemberMapper.updateMemberMoney", member);
	}
	
	public void addAdultCheck(AdultCheck adultCheck) throws Exception {
		sqlSession.insert("addAdultCheck", adultCheck);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}