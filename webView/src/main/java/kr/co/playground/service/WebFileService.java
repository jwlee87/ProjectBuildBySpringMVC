package kr.co.playground.service;

import java.util.Map;

public interface WebFileService {
	
	public void addPrFile(Map<String, Object> map);
	
	public Map<String, Object> selectListByUniqueID(int uniqueID);
	
	public void updatePrFile (Map<String, Object> map);

}
