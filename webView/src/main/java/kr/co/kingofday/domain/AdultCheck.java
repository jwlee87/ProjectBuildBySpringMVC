package kr.co.kingofday.domain;

import java.sql.Timestamp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class AdultCheck {
	
	///Field
	private int uniqueId;
	private String phone;
	private Timestamp generateDate;
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AdultCheck() {
		//logger.info(this.getClass());
	}
	public AdultCheck(String phone) {
		this.phone = phone;
	}

	///Method
	public int getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(int uniqueId) {
		this.uniqueId = uniqueId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getGenerateDate() {
		return generateDate;
	}

	public void setGenerateDate(Timestamp generateDate) {
		this.generateDate = generateDate;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	@Override
	public String toString() {
		return "AdultCheck [uniqueId=" + uniqueId + ", phone=" + phone + ", generateDate=" + generateDate + ", logger="
				+ logger + "]";
	}
	
}
