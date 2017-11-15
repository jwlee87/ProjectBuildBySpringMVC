package kr.co.playground.dao;

import java.util.List;

import kr.co.playground.domain.WebFile;

public interface WebFileDao {
	
	public void addPrFile(WebFile prFile);
	
	public List<WebFile> selectListByUniqueID(int uniqueID);

	public void updatePrFile(WebFile webFile);
	
}
