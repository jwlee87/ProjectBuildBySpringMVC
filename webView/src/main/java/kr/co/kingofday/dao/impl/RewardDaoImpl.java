package kr.co.kingofday.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.kingofday.domain.Reward;

@Repository("rewardDaoImpl")
public class RewardDaoImpl implements kr.co.kingofday.dao.RewardDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public List<Reward> getRewardList(Reward reward) throws Exception {
		return sqlSession.selectList("RewardMapper.getRewardList", reward);
	}

	@Override
	public void addReward(Reward reward) throws Exception {
		sqlSession.insert("RewardMapper.addReward", reward);
	}

	@Override
	public Reward getReward(int reward_key) throws Exception {
		return sqlSession.selectOne("RewardMapper.getReward", reward_key);
	}
}
