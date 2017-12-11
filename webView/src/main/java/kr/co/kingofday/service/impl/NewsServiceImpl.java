package kr.co.kingofday.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.kingofday.dao.NewsDao;
import kr.co.kingofday.domain.News;
import kr.co.kingofday.domain.SearchNDB;
import kr.co.kingofday.service.NewsService;

@Service("newsServiceImpl")
public class NewsServiceImpl implements NewsService {

	///Field
	@Autowired
	@Qualifier("newsDaoImpl")
	private NewsDao newsDao;
	
	@Override
	public ArrayList<News> getNewsList(SearchNDB search) throws Exception {
		return (ArrayList<News>)newsDao.getNewsList(search);
	}
	@Override
	public void addNews(News news) throws Exception {
		newsDao.addNews(news);
	}
	@Override
	public News getNews(int uniqueID) throws Exception {
		return newsDao.getNews(uniqueID);
	}
	@Override
	public News getTotalCount() throws Exception {
		return newsDao.getTotalCount();
	}
	@Override
	public void updateNews(News news) throws Exception {
		newsDao.updateNews(news);
	}
	@Override
	public void deleteNews(News news) throws Exception {
		newsDao.deleteNews(news);
	}

}
