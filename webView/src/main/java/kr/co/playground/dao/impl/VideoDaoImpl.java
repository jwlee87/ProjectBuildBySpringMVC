package kr.co.playground.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.playground.dao.VideoDao;
import kr.co.playground.domain.Member;
import kr.co.playground.domain.Search;
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
	public List<Video> getFreeVideo(int countryCode) throws Exception {
		return sqlSession.selectList("VideoMapper.getFreeVideo", countryCode);
	}

	@Override
	public Video getTotalCountNotPaidVideo(Member member) throws Exception {
		return sqlSession.selectOne("VideoMapper.getTotalCountNotPaidVideo", member);
	}

	@Override
	public List<Video> getVideoListNotPaid(Search search) throws Exception {
		return sqlSession.selectList("VideoMapper.getVideoListNotPaid", search);
	}

	@Override
	public Video getTotalCountPaidVideo(Member member) throws Exception {
		return sqlSession.selectOne("VideoMapper.getTotalCountPaidVideo", member);
	}

	@Override
	public List<Video> getVideoListPaid(Search search) throws Exception {
		return sqlSession.selectList("VideoMapper.getVideoListPaid", search);
	}

	@Override
	public Video getVideoDetail(int no) throws Exception {
		return sqlSession.selectOne("VideoMapper.getVideoDetail", no);
	}

	@Override
	public void insetMemberVideo(Video memberVideo) throws Exception {
		sqlSession.insert("VideoMapper.insertMemberVideo", memberVideo);
	}

}
