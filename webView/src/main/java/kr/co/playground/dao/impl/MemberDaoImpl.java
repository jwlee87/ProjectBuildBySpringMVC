package kr.co.playground.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.playground.dao.MemberDao;
import kr.co.playground.domain.Search;
import kr.co.playground.domain.Member;


@Repository("memberDaoImpl")
public class MemberDaoImpl implements MemberDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MemberDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public Member login(String id) throws Exception {
		return sqlSession.selectOne("MemberMapper.login", id);
	}
	public Member selectOneLoginMember(int uniqueID) throws Exception {
		return sqlSession.selectOne("MemberMapper.selectOneLoginMember", uniqueID);
	}
	public List<Member> getMember() throws Exception {
		System.out.println("dao 단 들어와서 매퍼에서 getMember 호출 전");
		return sqlSession.selectList("MemberMapper.getMember");
	}
	public void updateMember(Member member) throws Exception {
		sqlSession.update("MemberMapper.updateMember", member);
	}
	public List<Member> duplCheck(Map<String, Object> m) throws Exception {
		return sqlSession.selectList("MemberMapper.duplCheck", m);
	}
	public void addMember(Member member) throws Exception {
		
		System.out.println(" DAO Layer :: addMember :: domain Member member= "+member);
		
		sqlSession.insert("MemberMapper.addMember", member);
		
		String userId = member.getId();
		
		System.out.println(" dao 단 디버깅 userID= "+userId);
		Member m = sqlSession.selectOne("MemberMapper.getMemberByID", userId);
		System.out.println(" dao 단 디버깅 Member m= "+m);
		sqlSession.insert("MemberMapper.addMemberInfo", m);
		
	}
	
	public Member getMemberByUniqueID(int uniqueID) throws Exception {
		return sqlSession.selectOne("MemberMapper.getMemberByUniqNo", uniqueID);
	}
	
	public Member getMemberByID(String id) throws Exception {
		System.out.println("파라미터 아이디 디버깅 id= "+id);
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
	public Member getMemberByAuthKey(String authKey) throws Exception {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Member getMember(String email) throws Exception {
		return sqlSession.selectOne("MemberMapper.getMember3", email);
	}
	public Member getMember(int member_no) throws Exception {
		  return sqlSession.selectOne("MemberMapper.getMemberByNo", member_no);
		}
	public List<Member> getMemberList(Search search) throws Exception {
		return sqlSession.selectList("MemberMapper.getMemberList", search);
	}

	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("MemberMapper.getTotalCount", search);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}