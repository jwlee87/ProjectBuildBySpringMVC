package kr.co.kingofday.domain;

import java.sql.Timestamp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Answer {

	///Field
	private int rowNum;
	private int uniqueNo;
	private int askUniqueNo;
	private int memberUniqueNo;
	private String answer;
	private String respondent;
	private Timestamp answerDate;
	private String answerDateToStr;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public Answer() {
		//logger.info(this.getClass());
	}
	
	///Method
	public int getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

	public int getAskUniqueNo() {
		return askUniqueNo;
	}

	public void setAskUniqueNo(int askUniqueNo) {
		this.askUniqueNo = askUniqueNo;
	}

	public int getMemberUniqueNo() {
		return memberUniqueNo;
	}

	public void setMemberUniqueNo(int memberUniqueNo) {
		this.memberUniqueNo = memberUniqueNo;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getRespondent() {
		return respondent;
	}

	public void setRespondent(String respondent) {
		this.respondent = respondent;
	}

	public Timestamp getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerDateToStr() {
		return answerDateToStr;
	}

	public void setAnswerDateToStr(String answerDateToStr) {
		this.answerDateToStr = answerDateToStr;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	@Override
	public String toString() {
		return "Answer [rowNum=" + rowNum + ", uniqueNo=" + uniqueNo + ", askUniqueNo=" + askUniqueNo
				+ ", memberUniqueNo=" + memberUniqueNo + ", answer=" + answer + ", respondent=" + respondent
				+ ", answerDate=" + answerDate + ", answerDateToStr=" + answerDateToStr + "]";
	}
	
}
