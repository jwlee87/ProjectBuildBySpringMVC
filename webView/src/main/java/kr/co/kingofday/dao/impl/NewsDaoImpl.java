package kr.co.kingofday.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.kingofday.dao.NewsDao;
import kr.co.kingofday.domain.News;
import kr.co.kingofday.domain.SearchNDB;

@Repository("newsDaoImpl")
public class NewsDaoImpl implements NewsDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<News> getNewsList(SearchNDB search) throws Exception {
		return sqlSession.selectList("NewsMapper.getNewsList", search);
	}

	@Override
	public void addNews(News news) throws Exception {
		sqlSession.insert("NewsMapper.addNews", news);
	}

	@Override
	public News getNews(int uniqueID) throws Exception {
		return sqlSession.selectOne("NewsMapper.getNews", uniqueID);
	}

	@Override
	public News getTotalCount() throws Exception {
		return sqlSession.selectOne("NewsMapper.getTotalCount");
	}

	@Override
	public void updateNews(News news) throws Exception {
		sqlSession.update("NewsMapper.updateNews", news);
	}

	@Override
	public void deleteNews(News news) throws Exception {
		sqlSession.delete("NewsMapper.deleteNews", news);
	}

}
