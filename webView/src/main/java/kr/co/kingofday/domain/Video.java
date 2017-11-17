package kr.co.kingofday.domain;

public class Video {

	///Field
	private int videoNo;
	private String no;
	private String title;
	private String runningTime;
	private String code;
	private boolean type;
	private int price;
	private int point;
	private int coin;
	private String explain;
	private int countryCode;
	
	private int totalCount;
	
	private int userUniqueNo;
	
	///Constructor
	public Video() {
	}

	///Method
	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getUserUniqueNo() {
		return userUniqueNo;
	}

	public void setUserUniqueNo(int userUniqueNo) {
		this.userUniqueNo = userUniqueNo;
	}

	@Override
	public String toString() {
		return "Video [videoNo=" + videoNo + ", no=" + no + ", title=" + title + ", runningTime=" + runningTime
				+ ", code=" + code + ", type=" + type + ", price=" + price + ", point=" + point + ", coin=" + coin
				+ ", explain=" + explain + ", countryCode=" + countryCode + ", totalCount=" + totalCount
				+ ", userUniqueNo=" + userUniqueNo + "]";
	}
	
	
}
