package kr.co.playground.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.playground.dao.VideoDao;
import kr.co.playground.domain.Video;

@Repository("videoDaoImpl")
public class VideoDaoImpl implements VideoDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public VideoDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public List<Video> getVideo() throws Exception {
		return sqlSession.selectList("VideoMapper.getVideo");
	}

	@Override
	public List<Video> getFreeVideoJver() throws Exception {
		return sqlSession.selectList("VideoMapper.getFreeVideoJver");
	}

	@Override
	public List<Video> getFreeVideoKver() throws Exception {
		return sqlSession.selectList("VideoMapper.getFreeVideoKver");
	}

}
