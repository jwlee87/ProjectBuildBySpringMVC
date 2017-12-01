package kr.co.kingofday.domain;

import java.sql.Timestamp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Ask {

	///Field
	private int uniqueNo;
	private int rowNum;
	private int memberUniqueNo;
	private String writer;
	private String title;
	private String askDateToStr;
	private Timestamp askDate;
	private String askContent;
	private Boolean answerCheck;
	private int countryCode;
	private Boolean deleteCheck;
	private String askType;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public Ask() {
		//logger.info(this.getClass());
	}

	///Method
	public int getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getMemberUniqueNo() {
		return memberUniqueNo;
	}

	public void setMemberUniqueNo(int memberUniqueNo) {
		this.memberUniqueNo = memberUniqueNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAskDateToStr() {
		return askDateToStr;
	}

	public void setAskDateToStr(String askDateToStr) {
		this.askDateToStr = askDateToStr;
	}

	public Timestamp getAskDate() {
		return askDate;
	}

	public void setAskDate(Timestamp askDate) {
		this.askDate = askDate;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public Boolean getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(Boolean answerCheck) {
		this.answerCheck = answerCheck;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public Boolean getDeleteCheck() {
		return deleteCheck;
	}

	public void setDeleteCheck(Boolean deleteCheck) {
		this.deleteCheck = deleteCheck;
	}

	public String getAskType() {
		return askType;
	}

	public void setAskType(String askType) {
		this.askType = askType;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	@Override
	public String toString() {
		return "Ask [uniqueNo=" + uniqueNo + ", rowNum=" + rowNum + ", memberUniqueNo=" + memberUniqueNo + ", writer="
				+ writer + ", title=" + title + ", askDateToStr=" + askDateToStr + ", askDate=" + askDate
				+ ", askContent=" + askContent + ", answerCheck=" + answerCheck + ", countryCode=" + countryCode
				+ ", deleteCheck=" + deleteCheck + ", askType=" + askType + ", logger=" + logger + ", getUniqueNo()="
				+ getUniqueNo() + ", getRowNum()=" + getRowNum() + ", getMemberUniqueNo()=" + getMemberUniqueNo()
				+ ", getWriter()=" + getWriter() + ", getTitle()=" + getTitle() + ", getAskDateToStr()="
				+ getAskDateToStr() + ", getAskDate()=" + getAskDate() + ", getAskContent()=" + getAskContent()
				+ ", getAnswerCheck()=" + getAnswerCheck() + ", getCountryCode()=" + getCountryCode()
				+ ", getDeleteCheck()=" + getDeleteCheck() + ", getAskType()=" + getAskType() + ", getLogger()="
				+ getLogger() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
		
}
