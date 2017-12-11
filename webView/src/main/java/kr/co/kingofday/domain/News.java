package kr.co.kingofday.domain;

import java.sql.Timestamp;

public class News {

	///Field
	private int uniqueID;
	private String title;
	private Timestamp genDate;
	private String content;
	private int viewedCount;
	private int totalCount;
	
	private String filePath;
	
	///Constructor
	public News() {
	}

	///Method
	public int getUniqueID() {
		return uniqueID;
	}

	public void setUniqueID(int uniqueID) {
		this.uniqueID = uniqueID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getGenDate() {
		return genDate;
	}

	public void setGenDate(Timestamp genDate) {
		this.genDate = genDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewedCount() {
		return viewedCount;
	}

	public void setViewedCount(int viewedCount) {
		this.viewedCount = viewedCount;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "News [uniqueID=" + uniqueID + ", title=" + title + ", genDate=" + genDate + ", content=" + content
				+ ", viewedCount=" + viewedCount + ", totalCount=" + totalCount + ", filePath=" + filePath + "]";
	}
	
}
