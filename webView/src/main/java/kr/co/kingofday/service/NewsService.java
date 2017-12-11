package kr.co.kingofday.service;

import java.util.ArrayList;

import kr.co.kingofday.domain.News;
import kr.co.kingofday.domain.SearchNDB;

public interface NewsService {

	public ArrayList<News> getNewsList(SearchNDB search) throws Exception;
	public void addNews(News news) throws Exception;
	public News getNews(int uniqueID) throws Exception;
	public News getTotalCount() throws Exception;
	public void updateNews(News news) throws Exception;
	public void deleteNews(News news) throws Exception;
	
}
