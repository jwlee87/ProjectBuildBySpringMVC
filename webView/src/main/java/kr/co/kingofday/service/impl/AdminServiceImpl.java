package kr.co.kingofday.service.impl;

import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.kingofday.dao.AdminDao;
import kr.co.kingofday.domain.Answer;
import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.service.AdminService;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {

	///Field
	@Autowired
	@Qualifier("adminDaoImpl")
	private AdminDao adminDao;
	public void setAskDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AdminServiceImpl() {
		logger.info(this.getClass());
	}
	
	///Method
	public void addAsk(Ask ask) throws Exception {
		adminDao.addAsk(ask);
	}
	public ArrayList<Ask> selectAskListForAnUser(int memberNo) throws Exception {
		return (ArrayList<Ask>)adminDao.selectAskListForAnUser(memberNo);
	}

	@Override
	public ArrayList<Ask> selectAskListForAllUsers() throws Exception {
		return (ArrayList<Ask>)adminDao.selectAskListForAllUsers();
	}

	@Override
	public Ask getAskByNo(int askNo) throws Exception {
		return adminDao.getAskByNo(askNo);
	}

	@Override
	public void updateAskType(int askUniqueNo) throws Exception {
		adminDao.updateAskType(askUniqueNo);
	}

	@Override
	public void addAnswer(Answer answer) throws Exception {
		adminDao.addAnswer(answer);
	}

	@Override
	public ArrayList<Ask> selectAskListForAllUsersAnswered() throws Exception {
		return (ArrayList<Ask>)adminDao.selectAskListForAllUsersAnswered();
	}

	@Override
	public ArrayList<Answer> getAnswerListForAnAsk(int askNo) throws Exception {
		return (ArrayList<Answer>)adminDao.getAnswerListForAnAsk(askNo);
	}

	@Override
	public void deleteAnswer(int askNo) throws Exception {
		adminDao.deleteAnswer(askNo);
	}
	public void deleteAsk(int askNo) throws Exception {
		adminDao.deleteAsk(askNo);
	}

}
