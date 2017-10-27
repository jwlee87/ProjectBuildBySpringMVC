package kr.co.playground.common;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import kr.co.playground.domain.Email;

public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public void sendEmail(Email email) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			//msg.setText(email.getContent());
			msg.setText(email.getContent(), "utf-8", "html");
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		} catch(MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try {
			mailSender.send(msg);
		} catch(MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
		
	}
	
	//email auth key generate
	public int generateAuthKey() {
		Random random = new Random();
		int intValue = (int)((Math.random() * (999999 - 100000 + 1)) + 100000 );
		System.out.println(" random key debug= "+intValue);
		return intValue;
	}
}
