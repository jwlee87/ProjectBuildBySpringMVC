package kr.co.playground.service;

import java.util.Map;

import kr.co.playground.domain.Search;
import kr.co.playground.domain.Style;


public interface StyleService {
	
	public Map<String , Object> getStyleList(Search search) throws Exception;

	public void addStyle(Style style)throws Exception;

	public Style getStyle(int styleNo)throws Exception;

	public void updateStyle(Style style)throws Exception;
	
	public void deleteStyle(int styleNo)throws Exception;

	 
}