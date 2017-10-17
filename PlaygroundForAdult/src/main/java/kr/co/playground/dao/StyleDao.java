package kr.co.playground.dao;

import java.util.List;

import kr.co.playground.domain.Search;
import kr.co.playground.domain.Style;


public interface StyleDao {
	

	public List<Style> getStyleList(Search search) throws Exception ;

	public int getTotalCount(Search search) throws Exception ;

	public void addStyle(Style style)throws Exception ;

	public Style getStyle(int styleNo)throws Exception ;

	public void updateStyle(Style style)throws Exception ;
	
	public void deleteStyle(int styleNo)throws Exception ;

	
}