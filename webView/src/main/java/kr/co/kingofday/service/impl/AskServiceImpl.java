package kr.co.kingofday.service.impl;

import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.kingofday.dao.AskDao;
import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.service.AskService;

@Service("askServiceImpl")
public class AskServiceImpl implements AskService {

	///Field
	@Autowired
	@Qualifier("askDaoImpl")
	private AskDao askDao;
	public void setAskDao(AskDao askDao) {
		this.askDao = askDao;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AskServiceImpl() {
		logger.info(this.getClass());
	}
	
	///Method
	public void addAsk(Ask ask) throws Exception {
		askDao.addAsk(ask);
	}
	public void updateAsk(Ask ask) throws Exception {
		askDao.updateAsk(ask);
	}
	public void deleteAsk(Ask ask) throws Exception {
		askDao.deleteAsk(ask);
	}
	
	public ArrayList<Ask> selectAskListForAnUser(Member member) throws Exception {
		return (ArrayList<Ask>)askDao.selectAskListForAnUser(member);
	}

}
