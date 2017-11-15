package kr.co.playground.domain;

public class VerifyInfo {
	
	///Field
	private String tr_cert;
	private String cpId;
	private String urlCode;
	private String certNum;
	private String date;
	private String certMet;
	private String name;
	private String phoneNo;
	private String phoneCorp;
	private String birthDay;
	private String gender;
	private String nation;
	private String plusInfo;
	private String extendVar;
	
	///Constructor
	public VerifyInfo(String cpId, String urlCode, String certNum, String date
			, String certMet, String birthDay, String gender, String name, String phoneNo
			, String phoneCorp, String nation, String plusInfo, String extendVar) {
		this.tr_cert = cpId+"/"+urlCode+"/"+certNum+"/"+date+"/"+certMet+"/"+birthDay+"/"+gender+"/"+name+"/"+
				name+"/"+phoneNo+"/"+phoneCorp+"/"+nation+"/"+plusInfo+"/"+extendVar;
		this.cpId = cpId;
		this.urlCode = urlCode;
		this.certNum = certNum;
		this.date = date;
		this.certMet = certMet;
		this.name = name;
		this.phoneNo = phoneNo;
		this.phoneCorp = phoneCorp;
		this.birthDay = birthDay;
		this.gender = gender;
		this.nation = nation;
		this.plusInfo = plusInfo;
		this.extendVar = extendVar;
	}
	///Method
	public String getTr_cert() {
		return tr_cert;
	}
	public void setTr_cert(String tr_cert) {
		this.tr_cert = tr_cert;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getUrlCode() {
		return urlCode;
	}
	public void setUrlCode(String urlCode) {
		this.urlCode = urlCode;
	}
	public String getCertNum() {
		return certNum;
	}
	public void setCertNum(String certNum) {
		this.certNum = certNum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCertMet() {
		return certMet;
	}
	public void setCertMet(String certMet) {
		this.certMet = certMet;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getPhoneCorp() {
		return phoneCorp;
	}
	public void setPhoneCorp(String phoneCorp) {
		this.phoneCorp = phoneCorp;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPlusInfo() {
		return plusInfo;
	}
	public void setPlusInfo(String plusInfo) {
		this.plusInfo = plusInfo;
	}
	public String getExtendVar() {
		return extendVar;
	}
	public void setExtendVar(String extendVar) {
		this.extendVar = extendVar;
	}
	
	@Override
	public String toString() {
		return "VerifyInfo [tr_cert=" + tr_cert + ", cpId=" + cpId + ", urlCode=" + urlCode + ", certNum=" + certNum
				+ ", date=" + date + ", certMet=" + certMet + ", name=" + name + ", phoneNo=" + phoneNo + ", phoneCorp="
				+ phoneCorp + ", birthDay=" + birthDay + ", gender=" + gender + ", nation=" + nation + ", plusInfo="
				+ plusInfo + ", extendVar=" + extendVar + "]";
	}
	
}
