package kr.co.kingofday.dao;

import java.util.List;

import kr.co.kingofday.domain.WebFile;

public interface WebFileDao {
	
	public void addPrFile(WebFile prFile);
	public List<WebFile> selectListByUniqueID(int uniqueID);
	public void updatePrFile(WebFile webFile);
	
}
