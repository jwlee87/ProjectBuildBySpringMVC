package kr.co.kingofday.domain;

import java.sql.Date;

public class Member {
	
	///Field
	private int uniqueID;
	private int levelClass;
	private String id;
	private String nickName;
	private String pass;
	private Boolean condition;
	private Boolean state;
	private String phone;
	private String email;
	private Date createDate;
	private Date lastDate;
	
	//국가코드 0=en 1=kr 2=ch 3=jp
	private int countryCode;
	
	private String memberSize;
	
	/*인게임 머니*/
	private long nowMoney;
	private long cashMoney;
	private long pointMoney;
	private long safeMoney;
	private long waitMoney;
	private float point;
	private String bankName;


	/*인증키*/
	private int authKey;
	/*계정찾기 인증 체크*/
	private boolean findCondition;
	/*계정찾기 토큰*/
	private String token;
	
	private int fileNo;
	private int boardNo;
	private String oriNaem;
	private String systemName;
	private String filePath;
	private long fileSize;
	
	///Constructor
	public Member(){
	}

	///Method
	public int getUniqueID() {
		return uniqueID;
	}

	public void setUniqueID(int uniqueID) {
		this.uniqueID = uniqueID;
	}

	public int getLevelClass() {
		return levelClass;
	}

	public void setLevelClass(int levelClass) {
		this.levelClass = levelClass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Boolean getCondition() {
		return condition;
	}

	public void setCondition(Boolean condition) {
		this.condition = condition;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public String getMemberSize() {
		return memberSize;
	}

	public void setMemberSize(String memberSize) {
		this.memberSize = memberSize;
	}

	public long getNowMoney() {
		return nowMoney;
	}

	public void setNowMoney(long nowMoney) {
		this.nowMoney = nowMoney;
	}

	public long getCashMoney() {
		return cashMoney;
	}

	public void setCashMoney(long cashMoney) {
		this.cashMoney = cashMoney;
	}

	public long getPointMoney() {
		return pointMoney;
	}

	public void setPointMoney(long pointMoney) {
		this.pointMoney = pointMoney;
	}

	public long getSafeMoney() {
		return safeMoney;
	}

	public void setSafeMoney(long safeMoney) {
		this.safeMoney = safeMoney;
	}

	public long getWaitMoney() {
		return waitMoney;
	}

	public void setWaitMoney(long waitMoney) {
		this.waitMoney = waitMoney;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public int getAuthKey() {
		return authKey;
	}

	public void setAuthKey(int authKey) {
		this.authKey = authKey;
	}

	public boolean isFindCondition() {
		return findCondition;
	}

	public void setFindCondition(boolean findCondition) {
		this.findCondition = findCondition;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriNaem() {
		return oriNaem;
	}

	public void setOriNaem(String oriNaem) {
		this.oriNaem = oriNaem;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "Member [uniqueID=" + uniqueID + ", levelClass=" + levelClass + ", id=" + id + ", nickName=" + nickName
				+ ", pass=" + pass + ", condition=" + condition + ", state=" + state + ", phone=" + phone + ", email="
				+ email + ", createDate=" + createDate + ", lastDate=" + lastDate + ", countryCode=" + countryCode
				+ ", memberSize=" + memberSize + ", nowMoney=" + nowMoney + ", cashMoney=" + cashMoney + ", pointMoney="
				+ pointMoney + ", safeMoney=" + safeMoney + ", waitMoney=" + waitMoney + ", point=" + point
				+ ", bankName=" + bankName + ", authKey=" + authKey + ", findCondition=" + findCondition + ", token="
				+ token + ", fileNo=" + fileNo + ", boardNo=" + boardNo + ", oriNaem=" + oriNaem + ", systemName="
				+ systemName + ", filePath=" + filePath + ", fileSize=" + fileSize + "]";
	}
	

}