package kr.co.playground.domain;

public class WebFile{

	private int fileNo;
	private int boardNo;
	private String oriName;
	private String systemName;
	private String filePath;
	private long fileSize;
	
	private int uniqueID;
	
	public WebFile() {
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

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
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

	public int getUniqueID() {
		return uniqueID;
	}

	public void setUniqueID(int uniqueID) {
		this.uniqueID = uniqueID;
	}

	@Override
	public String toString() {
		return "WebFile [fileNo=" + fileNo + ", boardNo=" + boardNo + ", oriName=" + oriName + ", systemName="
				+ systemName + ", filePath=" + filePath + ", fileSize=" + fileSize + ", uniqueID=" + uniqueID + "]";
	}
	
}
