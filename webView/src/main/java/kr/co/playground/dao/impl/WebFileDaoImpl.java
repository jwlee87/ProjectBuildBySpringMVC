package kr.co.playground.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.playground.dao.WebFileDao;
import kr.co.playground.domain.WebFile;


@Repository("webFileDaoImpl")
public class WebFileDaoImpl implements WebFileDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public WebFileDaoImpl() {
		
	}
	
	///Method
	@Override
	public void addPrFile(WebFile prFile) {
		sqlSession.insert("WebFileMapper.addPrFile", prFile);
	}

	@Override
	public List<WebFile> selectListByUniqueID(int uniqueID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("WebFileMapper.selectListByUniqueID", uniqueID);
	}

	@Override
	public void updatePrFile(WebFile webFile) {
		// TODO Auto-generated method stub
		sqlSession.update("WebFileMapper.updatePrFile", webFile);
	}

}
