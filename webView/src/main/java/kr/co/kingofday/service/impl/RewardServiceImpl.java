package kr.co.kingofday.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.kingofday.dao.RewardDao;
import kr.co.kingofday.domain.Reward;
import kr.co.kingofday.service.RewardService;

@Service("rewardServiceImpl")
public class RewardServiceImpl implements RewardService {

	///Field
	@Autowired
	@Qualifier("rewardDaoImpl")
	private RewardDao rewardDao;

	@Override
	public ArrayList<Reward> getRewardList(Reward reward) throws Exception {
		return (ArrayList<Reward>)rewardDao.getRewardList(reward);
	}

	@Override
	public void addReward(Reward reward) throws Exception {
		rewardDao.addReward(reward);
	}
}
