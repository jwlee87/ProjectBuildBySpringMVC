package kr.co.kingofday.domain;

public class Reward {

	private int uniqueID;
	private int userUniqueID;
	private int reward_key;
	
	public int getUniqueID() {
		return uniqueID;
	}
	public void setUniqueID(int uniqueID) {
		this.uniqueID = uniqueID;
	}
	public int getUserUniqueID() {
		return userUniqueID;
	}
	public void setUserUniqueID(int userUniqueID) {
		this.userUniqueID = userUniqueID;
	}
	public int getReward_key() {
		return reward_key;
	}
	public void setReward_key(int reward_key) {
		this.reward_key = reward_key;
	}
	@Override
	public String toString() {
		return "Reward [uniqueID=" + uniqueID + ", userUniqueID=" + userUniqueID + ", reward_key=" + reward_key + "]";
	}
	
}
