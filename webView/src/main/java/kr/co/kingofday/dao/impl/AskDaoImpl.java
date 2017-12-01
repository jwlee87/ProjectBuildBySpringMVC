package kr.co.kingofday.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.kingofday.dao.AskDao;
import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;

@Repository("askDaoImpl")
public class AskDaoImpl implements AskDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AskDaoImpl() {
		logger.info(this.getClass());
	}
	@Override
	public void addAsk(Ask ask) throws Exception {
		sqlSession.insert("AskMapper.addAsk", ask);
	}

	@Override
	public void updateAsk(Ask ask) throws Exception {
		sqlSession.update("AskMapper.updateAsk", ask);
	}

	@Override
	public void deleteAsk(Ask ask) throws Exception {
		sqlSession.update("AskMapper.deleteAsk", ask);
	}
	@Override
	public List<Ask> selectAskListForAnUser(Member member) throws Exception {
		return sqlSession.selectList("AskMapper.selectAskListForAnUser", member);
	}

}
