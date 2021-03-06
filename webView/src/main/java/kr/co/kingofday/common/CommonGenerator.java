package kr.co.kingofday.common;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import kr.co.kingofday.domain.Email;

public class CommonGenerator {
	
	///Field
	@Autowired
	protected JavaMailSender mailSender;
	
	private Logger logger = LogManager.getLogger();
	
	///Method
	public void sendEmail(Email email) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			//msg.setText(email.getContent());
			msg.setText(email.getContent(), "utf-8", "html");
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		} catch(MessagingException e) {
			logger.debug("MessagingException");
			e.printStackTrace();
		}
		try {
			mailSender.send(msg);
		} catch(MailException e) {
			logger.debug("MailException발생");
			e.printStackTrace();
		}
		
	}
	//일시정지
	//make email content for AuthKey
	public String generateAuthKeyContent(String nick, String uri,String authKey, String id) {
		return	"<meta charset='utf-8'>"
				+"<table class='wrapper' width='340px' height='640px' style='border-spacing: 0; padding: 100px 0 0; border:0; max-width: 760px; background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;)'>"
				+"<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+"<table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: #51352E; padding: 0; border: 2px solid black;'>"
				+"<thead><tr>"
				+"<td align='center' style='vertical-align: top; height: 26px; color: black; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #442C25; padding: 20px;'>"
				+"<img width='200px' height='80px' alt='smile' src='http://110.10.189.24:9090/webView/img/common/logo_icon.png'/>"
				+"<h2 style='font-weight: 300px; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'></h2>"
				+"</td></tr></thead><tbody><tr><td style='vertical-align: top; padding: 40px; background: #71524A;'>"
				+"<h5 style='font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>"
				+nick+"님께서 요청하신 내용입니다.</h5>"
				+"<br/><span style='font-size: 18px;'>인증번호는 </span><span style='font-size: 26px; font-weight: bold;'>"
				+authKey+"</span><span style='font-size: 18px;'>입니다.</span>"
				+"<div style='text-align: center; margin-bottom: 80px;'></div>"
				+"<hr style='border: 0;'/><h6 style='font-weight: 300px; font-size: 12px; ling-height: 20px; word-spacing: -0.5px; color: #808080; text-align: center; margin: 0 0 20px'>"
				+"인증번호 방식이 동작하지 않나요?<br/>아래의 링크를 복사하여 웹브라우저에 붙여 넣으세요."
				+"<br/>"
				+uri
				+"</h6></td></tr><tr>"
				+"<td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500px; padding: 20px 0 40px; background: #442C25; max-width: 560px;'>"
				+"<h4 style='color: black; font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>이용해주셔서 감사합니다.</h4>"
				+"<h5 style='color: black; text-align: center; margin: 0;'>kingofday inc</h5>"
				+"</td></tr></tbody></table></td></tr>"
				+"<tr style='margin-top: 15px;'>"
				+ "<td style='color: white; text-align: center;'>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</td></tr>"
				+"<tr><td style='color: white; text-align: center; font-size: 8px;'> kingofdayinc / <a style='text-decorataion: none; color: white;'"
				+"href='http://localhost/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a>"
				+"<div style='margin-bottom: 50px;'></div></td></tr>"
				+"</tbody></table>"
				+"</meta>";
	}
	
	//임시비밀번호
	//make email content for Password
	public String generateTempPwContent(String nick, int tempPw, String id) {
		return	"<meta charset='utf-8'>"
				+"<table class='wrapper' width='340px' height='640px' style='border-spacing: 0; padding: 100px 0 0; border:0; max-width: 760px; background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;)'>"
				+"<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+"<table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: #51352E; padding: 0; border: 2px solid black;'>"
				+"<thead><tr>"
				+"<td align='center' style='vertical-align: top; height: 26px; color: black; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #442C25; padding: 20px;'>"
				+"<img width='200px' height='80px' alt='smile' src='http://110.10.189.24:9090/webView/img/common/logo_icon.png'/>"
				+"<h2 style='font-weight: 300px; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'></h2>"
				+"</td></tr></thead><tbody><tr><td style='vertical-align: top; padding: 40px; background: #71524A;'>"
				+"<h5 style='font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>"
				+nick+"님께서 요청하신 내용입니다.</h5>"
				+"<br/><span style='font-size: 18px;'>임시비밀번호는 </span><span style='font-size: 26px; font-weight: bold;'>"
				+tempPw+"</span><span style='font-size: 18px;'>입니다.</span>"
				+"<div style='text-align: center; margin-bottom: 80px;'></div>"
				+"<hr style='border: 0;'/><h4 style='font-weight: 300px; font-size: 12px; ling-height: 20px; word-spacing: -0.5px; color: white; text-align: center; margin: 0 0 20px'>"
				+"임시비밀번호로 로그인 하신뒤에<br/>비밀번호를 꼭 변경해주세요!"
				+"<br/>"
				+"</h4></td></tr><tr>"
				+"<td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500px; padding: 20px 0 40px; background: #442C25; max-width: 560px;'>"
				+"<h4 style='color: black; font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>이용해주셔서 감사합니다.</h4>"
				+"<h5 style='color: black; text-align: center; margin: 0;'>kingofday inc</h5>"
				+"</td></tr></tbody></table></td></tr>"
				+"<tr style='margin-top: 15px;'>"
				+ "<td style='color: white; text-align: center;'>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</td></tr>"
				+"<tr><td style='color: white; text-align: center; font-size: 8px;'> kingofdayinc / <a style='text-decorataion: none; color: white;'"
				+"href='http://localhost/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a>"
				+"<div style='margin-bottom: 50px;'></div></td></tr>"
				+"</tbody></table>"
				+"</meta>";
	}
	
	//아이디 메일방식
	//make email content for ID
	public String generateIdContent(String nick, String id) {
		return	"<meta charset='utf-8'>"
				+"<table class='wrapper' width='100%' height='640px' style='min-width: 350px; border-spacing: 0; padding: 100px 0 0; border:0; max-width: 760px; background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;)'>"
				+"<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+"<table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: #51352E; padding: 0; border: 2px solid black;'>"
				+"<thead><tr>"
				+"<td align='center' style='vertical-align: top; height: 26px; color: black; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #442C25; padding: 20px;'>"
				+"<img width='200px' height='80px' alt='smile' src='http://110.10.189.24:9090/webView/img/common/logo_icon.png'/>"
				+"<h2 style='font-weight: 300px; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'></h2>"
				+"</td></tr></thead><tbody><tr><td style='vertical-align: top; padding: 40px; background: #71524A;'>"
				+"<h5 style='font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>"
				+nick+"님께서 요청하신 내용입니다.</h5>"
				+"<br/><span style='font-size: 18px;'>회원님의 아이디는</span><br/><span style='font-size: 26px; font-weight: bold;'>"
				+id+"</span><span style='font-size: 18px;'>입니다.</span>"
				+"<div style='text-align: center; margin-bottom: 80px;'></div>"
				+"</td></tr><tr>"
				+"<td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500px; padding: 20px 0 40px; background: #442C25; max-width: 560px;'>"
				+"<h4 style='color: black; font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>이용해주셔서 감사합니다.</h4>"
				+"<h5 style='color: black; text-align: center; margin: 0;'>kingofday inc</h5>"
				+"</td></tr></tbody></table></td></tr>"
				+"<tr style='margin-top: 15px;'>"
				+"<td style='color: white; text-align: center;'>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</td></tr>"
				+"<tr><td style='color: white; text-align: center; font-size: 8px;'> kingofdayinc / <a style='text-decorataion: none; color: white;'"
				+"href='http://localhost/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a>"
				+"<div style='margin-bottom: 50px;'></div></td></tr>"
				+"</tbody></table>"
				+"</meta>";
	}
	
	//아이디찾기 사용중인 버전
	//make email content for ID
	public String generateContentForFindId(String nick, String uri,String authKey, String id) {
		return	"<meta charset='utf-8'>"
				+"<table class='wrapper' width='100%' height='800px' style='min-width: 350px; border-spacing: 0; padding: 100px 0 0; border:0; max-width: 760px; background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;) repeat'>"
				+"<tbody style='background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;) repeat;'><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+"<table class='main welcome' width='320px' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: #51352E; padding: 0; border: 2px solid black;'>"
				+"<thead><tr>"
				+"<td align='center' style='vertical-align: top; height: 26px; color: black; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #442C25; padding: 20px;'>"
				+"<img width='200px' height='80px' alt='logo' src='http://110.10.189.24:9090/webView/img/common/logo_icon.png'/>"
				+"<h2 style='font-weight: 300px; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'></h2>"
				+"</td></tr></thead><tbody><tr><td style='vertical-align: top; padding: 40px; background: #71524A; text-align: center;'>"
				+"<h5 style='font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>"
				+nick+"님께서 요청하신 내용입니다.</h5>"
				+"<br/><span style='text-align: center; font-size: 18px;'>"+nick+"님의 아이디는</span><br><span style='font-size: 20px; font-weight: bold;'>"
				+id+"</span><br/><span style='font-size: 18px;'>입니다.</span>"
				+"<div style='text-align: center; margin-bottom: 20px;'></div>"
				+"<hr style='border: 0;'/><h6 style='font-weight: 300px; font-size: 12px; ling-height: 20px; word-spacing: -0.5px; color: #808080; text-align: center; margin: 0 0 20px'>"
				+"비밀번호가 기억나지 않으세요?<br/>아래의 링크를 복사하여 웹브라우저에 붙여 넣으세요."
				+"<br/>"
				+uri
				+"</h6></td></tr><tr>"
				+"<td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500px; padding: 20px 0 40px; background: #442C25; max-width: 560px;'>"
				+"<h4 style='color: black; font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>이용해주셔서 감사합니다.</h4>"
				+"<h5 style='color: black; text-align: center; margin: 0;'>kingofday inc</h5>"
				+"</td></tr></tbody></table></td></tr>"
				+"<tr style='margin-top: 15px;'>"
				+ "<td style='color: white; text-align: center;'>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</td></tr>"
				+"<tr><td style='color: white; text-align: center; font-size: 8px;'> kingofdayinc / <a style='text-decorataion: none; color: white;'"
				+"href='http://localhost/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a>"
				+"<div style='margin-bottom: 60px;'></div></td></tr>"
				+"</tbody></table>"
				+"</meta>";
	}
	
	//비밀번호 사용버전
	//make email content for Pass
	public String generateContentForFindPw(String nick, String uri,String authKey, String id) {
		return	"<meta charset='utf-8'>"
				+"<table class='wrapper' width='100%' height='800px' style='min-width: 350px; border-spacing: 0; padding: 100px 0 0; border:0; max-width: 760px; background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;) repeat'>"
				+"<tbody style='background: url(&quot;http://110.10.189.24:9090/webView/img/common/mail_bg.png&quot;) repeat;'><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+"<table class='main welcome' width='320px' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: #51352E; padding: 0; border: 2px solid black;'>"
				+"<thead><tr>"
				+"<td align='center' style='vertical-align: top; height: 26px; color: black; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #442C25; padding: 20px;'>"
				+"<img width='200px' height='80px' alt='logo' src='http://110.10.189.24:9090/webView/img/common/logo_icon.png'/>"
				+"<h2 style='font-weight: 300px; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'></h2>"
				+"</td></tr></thead><tbody><tr><td style='vertical-align: top; padding: 40px; background: #71524A; text-align: center;'>"
				+"<h5 style='font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>"
				+nick+"님께서 요청하신 내용입니다.</h5>"
				+"<br/><span style='font-size: 16px;'>"+nick+"님 비밀번호 변경을 위해 아래 링크로 접속 해 주세요.</span><br/>"
				+"<a href='"+uri+"'><span style='font-size: 20px; font-weight: bold;'><br/>"
				+"비밀번호 변경하러 가기!</span></a>"
				+"<div style='text-align: center; margin-bottom: 30px;'></div>"
				+"<br/>"
				+"</td></tr><tr>"
				+"<td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500px; padding: 20px 0 40px; background: #442C25; max-width: 560px;'>"
				+"<h4 style='color: black; font-weight: 400px; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>이용해주셔서 감사합니다.</h4>"
				+"<h5 style='color: black; text-align: center; margin: 0;'>kingofday inc</h5>"
				+"</td></tr></tbody></table></td></tr>"
				+"<tr style='margin-top: 15px;'>"
				+ "<td style='color: white; text-align: center;'>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</td></tr>"
				+"<tr><td style='color: white; text-align: center; font-size: 8px;'> kingofdayinc / <a style='text-decorataion: none; color: white;'"
				+"href='http://110.10.189.24/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a>"
				+"<div style='margin-bottom: 60px;'></div></td></tr>"
				+"</tbody></table>"
				+"</meta>";
	}
	
	//////////////////////////////////////////
	// Never Die Baccarat (NDB) find ID 메일 ///
	//////////////////////////////////////////
	public String findIDForNDB(String id, String uri) {
		return "<meta charset='utf-8'><div style='width=100%'>"
				+"<h2>안녕하세요!</h2><br><p>회원님께서 요청하신 내용입니다.</p><br>"
				+"<p>회원님의 아이디는 <span style='color: black; background-color:gray; font-weight: bold; font-size: 14px;'>"+id+"</span>입니다.</p>"
				+"<p>비밀번호가 기억나지 않으세요?</p>" 
				+"<p>아래의 링크를 복사하여 웹브라우저에 붙여 넣으세요.</p><br>"
				+"===================================<br>"
				+"<a href='"+uri+"'>비밀번호 변경 페이지로 이동합니다.</a><br>"
				+"===================================<br>"
				+"<p>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</p><br>"
				+"<p style='font-size: 8px;'>kingofdayinc / <a style='text-decoration: none; color: black;' href='http://110.10.189.24/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a></p>"
				+"</div></meta>";
	}
	
	//////////////////////////////////////////
	// Never Die Baccarat (NDB) find PW 메일 //
	//////////////////////////////////////////
	public String findPWForNDB(String id, String uri) {
		return "<meta charset='utf-8'><div style='width=100%'>"
				+"<h2>안녕하세요!</h2><br><p>회원님께서 요청하신 내용입니다.</p><br>"
				+"<p>비밀번호가 기억나지 않으세요?</p>" 
				+"===================================<br>"
				+"<a href='"+uri+"'>비밀번호 변경 페이지로 이동합니다.</a><br>"
				+"===================================<br>"
				+"<p>도움이 필요하시면 <a href='mailto:kingofdayinc@gmail.com'>kingofdayinc@gmail.com</a>으로 연락해 주세요.</p><br>"
				+"<p style='font-size: 8px;'>kingofdayinc / <a style='text-decoration: none; color: black;' href='http://110.10.189.24/web/tos?id="+id+"'>서비스이용방침 / 개인정보처리방침</a></p>"
				+"</div></meta>";
	}
	
	//email auth key generate
	public int generateAuthKey() {
		int intValue = (int)((Math.random() * (999999 - 100000 + 1)) + 100000 );
		logger.debug(" random key debug= "+intValue);
		return intValue;
	}
	
	//token auth key generate
	public int generateTokenKey() {
		int intValue = (int)((Math.random() * (99999 - 10000 + 1)) + 10000 );
		logger.debug(" token key debug= "+intValue);
		return intValue;
	}
	
	//country code assignment
	public String assignCountryCode(int countryCode) {
		String countryCodeURI = "";
		if(countryCode==0) {
			countryCodeURI="en";
		}else if(countryCode==1) {
			countryCodeURI="kr";
		}else if(countryCode==2) {
			countryCodeURI="ch";
		}else if(countryCode==3) {
			countryCodeURI="jp";
		}
		return countryCodeURI;
	}
	
	//making return view URI
	public String makingReturnWebViewURI(int countryCode) {
		String returnWebViewURI = "";
		if(countryCode==0) {
			returnWebViewURI="webView/view/en/";
		}else if(countryCode==1) {
			returnWebViewURI="webView/view/kr/";
		}else if(countryCode==2) {
			returnWebViewURI="webView/view/ch/";
		}else if(countryCode==3) {
			returnWebViewURI="webView/view/jp/";
		}
		logger.debug(" [[CommonGenerator]] returnWebViewURI debug= "+returnWebViewURI);
		return returnWebViewURI;
	}
	
	//HMACMD5 copy
	public static String sStringToHMACMD5(String s, String keyString)
    {
        String sEncodedString = null;
        try
        {
            SecretKeySpec key = new SecretKeySpec((keyString).getBytes("UTF-8"), "HmacMD5");
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(key);

            byte[] bytes = mac.doFinal(s.getBytes("ASCII"));

            StringBuffer hash = new StringBuffer();

            for (int i=0; i<bytes.length; i++) {
                String hex = Integer.toHexString(0xFF &  bytes[i]);
                if (hex.length() == 1) {
                    hash.append('0');
                }
                hash.append(hex);
            }
            sEncodedString = hash.toString();
        }
        catch (UnsupportedEncodingException e) {
        	e.printStackTrace();
        }
        catch(InvalidKeyException e){
        	e.printStackTrace();
        }
        catch (NoSuchAlgorithmException e) {
        	e.printStackTrace();
        }
        return sEncodedString ;
    }
	
}
