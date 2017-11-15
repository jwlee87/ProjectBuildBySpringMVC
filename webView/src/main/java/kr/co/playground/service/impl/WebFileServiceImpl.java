package kr.co.playground.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.playground.dao.WebFileDao;
import kr.co.playground.domain.WebFile;
import kr.co.playground.service.WebFileService;

@Service("webFileServiceImpl")
public class WebFileServiceImpl implements WebFileService {

	///Filed
	@Autowired
	@Qualifier("webFileDaoImpl")
	private WebFileDao webFileDao;
	public void serWebFileDao(WebFileDao webFileDao) {
		this.webFileDao = webFileDao;
	}
	
	///Constructor
	public WebFileServiceImpl() {
		
	}
	
	///Method
	@Override
	public void addPrFile(Map<String, Object> map) {
		WebFile webFile = (WebFile)map.get("webFile");
		webFileDao.addPrFile(webFile);
	}

	@Override
	public Map<String, Object> selectListByUniqueID(int uniqueID) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<WebFile> list =
				(ArrayList<WebFile>)webFileDao.selectListByUniqueID(uniqueID);
		map.put("listSize", list.size());
		map.put("oneListWebFile", list);
		return map;
	}

	// 이미지 업데이트
	@Override
	public void updatePrFile(Map<String, Object> map) {
		WebFile webFile = (WebFile)map.get("webFile");
		webFileDao.updatePrFile(webFile);
	}

}
