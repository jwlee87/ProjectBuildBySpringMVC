package kr.co.kingofday.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.kingofday.dao.AdminDao;
import kr.co.kingofday.domain.Answer;
import kr.co.kingofday.domain.Ask;

@Repository("adminDaoImpl")
public class AdminDaoImpl implements AdminDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AdminDaoImpl() {
		logger.info(this.getClass());
	}
	@Override
	public void addAsk(Ask ask) throws Exception {
		sqlSession.insert("AdminMapper.addAsk", ask);
	}
	
	@Override
	public List<Ask> selectAskListForAnUser(int memberNo) throws Exception {
		return sqlSession.selectList("AdminMapper.selectAskListForAnUser", memberNo);
	}
	@Override
	public List<Ask> selectAskListForAllUsers() throws Exception {
		return sqlSession.selectList("AdminMapper.selectAskListForAllUsers");
	}
	@Override
	public Ask getAskByNo(int askNo) throws Exception {
		return sqlSession.selectOne("AdminMapper.getAskByNo", askNo);
	}
	@Override
	public void updateAskType(int askUniqueNo) throws Exception {
		sqlSession.update("AdminMapper.updateAskType", askUniqueNo);
	}
	@Override
	public void addAnswer(Answer answer) throws Exception {
		sqlSession.insert("AdminMapper.addAnswer", answer);
	}
	@Override
	public List<Ask> selectAskListForAllUsersAnswered() throws Exception {
		return sqlSession.selectList("AdminMapper.selectAskListForAllUsersAnswered");
	}
	@Override
	public List<Answer> getAnswerListForAnAsk(int askNo) throws Exception {
		return sqlSession.selectList("AdminMapper.getAnswerListForAnAsk", askNo);
	}
	@Override
	public void deleteAnswer(int askNo) throws Exception {
		sqlSession.delete("AdminMapper.deleteAnswer", askNo);
	}
	@Override
	public void deleteAsk(int askNo) throws Exception {
		sqlSession.delete("AdminMapper.deleteAsk", askNo);
	}

}
