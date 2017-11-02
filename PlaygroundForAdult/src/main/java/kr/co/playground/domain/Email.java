package kr.co.playground.domain;

public class Email {
	
	private String subject;
	private String content;
	private String receiver;
	private int authKey;
	private int token;
	
	public Email() {
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getAuthKey() {
		return authKey;
	}

	public void setAuthKey(int authKey) {
		this.authKey = authKey;
	}

	public int getToken() {
		return token;
	}

	public void setToken(int token) {
		this.token = token;
	}

	@Override
	public String toString() {
		return "Email [subject=" + subject + ", content=" + content + ", receiver=" + receiver + ", authKey=" + authKey
				+ ", token=" + token + "]";
	}
	

}
