package kr.co.kingofday.dao;

import java.util.List;

import kr.co.kingofday.domain.Reward;

public interface RewardDao {
	public List<Reward> getRewardList(Reward reward) throws Exception;

	public void addReward(Reward reward) throws Exception;
}
