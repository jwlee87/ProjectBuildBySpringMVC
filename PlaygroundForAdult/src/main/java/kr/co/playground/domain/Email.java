package kr.co.playground.domain;

public class Email {
	
	private String subject;
	private String content;
	private String receiver;
	private int authKey;
	
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

	@Override
	public String toString() {
		return "Email [subject=" + subject + ", content=" + content + ", receiver=" + receiver + ", authKey=" + authKey
				+ "]";
	}

}
