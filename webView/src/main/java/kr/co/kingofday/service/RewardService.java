package kr.co.kingofday.service;

import java.util.ArrayList;

import kr.co.kingofday.domain.Reward;

public interface RewardService {

	public ArrayList<Reward> getRewardList(Reward reward) throws Exception;

	public void addReward(Reward reward) throws Exception;

	public Reward getReward(int reward_key) throws Exception;

	
}
