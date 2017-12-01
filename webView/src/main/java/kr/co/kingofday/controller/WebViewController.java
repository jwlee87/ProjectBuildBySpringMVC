package kr.co.kingofday.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icert.comm.secu.IcertSecuManager;

import kr.co.kingofday.common.CommonGenerator;
import kr.co.kingofday.common.FormatUtil;
import kr.co.kingofday.domain.AdultCheck;
import kr.co.kingofday.domain.Email;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.VerifyInfo;
import kr.co.kingofday.service.MemberService;
import kr.co.kingofday.service.VideoService;

@Controller
@RequestMapping("/web/*")
public class WebViewController {

	
	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("videoServiceImpl")
	private VideoService videoService;
	
	@Autowired
	private Email email;
	
	@Autowired
	private CommonGenerator commonGenerator;
	
	private Logger logger = LogManager.getLogger();
	
	@Value("#{commonProperties['realServerURI']}")
	String realServerURI;
	
	@Value("#{commonProperties['testServerURI']}")
	String testServerURI;
	
	@Value("#{commonProperties['cpId']}")
	String cpId;
	
	@Value("#{commonProperties['urlCode']}")
	String urlCode;
	
	@Value("#{commonProperties['certMet']}")
	String certMet;
	
	@Value("#{commonProperties['extendVar']}")
	String extendVar;
	
	@Value("#{commonProperties['tr_url']}")
	String tr_url;
	
	@Value("#{commonProperties['adultYear']}")
	int adultYear;
	//Constructor
	public WebViewController() {
		logger.info(this.getClass());
	}
	
	////////////////////////
	//  terms of service  //
	////////////////////////
	@RequestMapping(value="/tos", method=RequestMethod.GET)
	public String tos(@ModelAttribute Member member, @RequestParam String cc
			, Model model) throws Exception {
		
		String returnWebViewURI = commonGenerator.makingReturnWebViewURI(Integer.parseInt(cc));
		String returnURI = returnWebViewURI+"tos";
		String returnNotAccess = returnWebViewURI+"notAccess";
		logger.debug(" debugging return page == "+returnURI);
			
		//en
		if(cc.equals("0")) {
			return returnURI;
		}
		//kr
		else if(cc.equals("1")) {
			return returnURI;
		}
		//ch
		else if(cc.equals("2")) {
			return returnURI;
		}
		//jp
		else if(cc.equals("3")) {
			return returnURI;
		} else {
			return returnNotAccess;
		}
	}
	
	/////////////
	//  find  //
	///////////
	@RequestMapping(value="/find", method=RequestMethod.GET)
	public String find(@RequestParam String cc,
			Model model) throws Exception {
		model.addAttribute("cc", cc);
		String returnWebViewURI = commonGenerator.makingReturnWebViewURI(Integer.parseInt(cc));
		String returnURI = returnWebViewURI+"findAccount"; 
		//en
		if(cc.equals("0")) {
			logger.debug("en version");
			return returnURI;
		}
		//kr
		else if(cc.equals("1")) {
			logger.debug("kr version");
			return returnURI;
		}
		//ch
		else if(cc.equals("2")) {
			logger.debug("ch version");
			return returnURI;
		}
		//jp
		else if(cc.equals("3")) {
			logger.debug("jp version");
			return returnURI;
		}
		return "forward:/webView/view/jp/notAccess.jsp";
	}
	
	
	
	//////////////////////////
	// Access link directly //
	//////////////////////////
	@RequestMapping(value="/findIdByLink", method=RequestMethod.GET)
	public String findIdByLink(HttpServletRequest request, 
			@RequestParam String token) throws Exception {
		
		String authKey = request.getParameter("authKey");
		if(authKey == null) {
			authKey = "";
		}
		logger.debug(" /findIdByLink Access authKey= "+authKey+", token: "+token);
		
		Member member = memberService.getMemberByToken(token);
		
		if(authKey.equals("")) {
			// exist account searched by token
			if( member != null ) {
				logger.debug("토큰으로 검색되는 계정이 있음");
				
				// find condition true
				if( member.isFindCondition() ) {
					logger.debug("검색된 계정의 findCondition ture");
					
					String id = member.getId();
					String nick = member.getNickName();
					String mailAddr = member.getEmail();
					String contentForID = commonGenerator.generateIdContent(nick, id);
					
					//아이디 알려주는 메일 발사
					email.setContent(contentForID);
					email.setReceiver(mailAddr);
					email.setSubject("[KingOfCasino] "+nick+"님의 아이디 찾기 결과입니다.");
					commonGenerator.sendEmail(email);
					
					String countryURI = commonGenerator.assignCountryCode(member.getCountryCode());
					
					//조건 초기화
					memberService.updateFindConditionFalse(member.getUniqueID());
					//인증키 초기화
					memberService.deleteAuthKey(member.getUniqueID());
					
					return "forward:/webView/view/"+countryURI+"/giveResult.jsp?id="+id;
				}
				// 페이지 유효기간 초과
				// find condition false
				logger.debug(" 링크 페이지 유효기간 초과! ");
				return "forward:/webView/view/kr/notAccess.jsp";
				
			// not exist account searched by token
			}
			
			logger.debug("토큰으로 검색되는 계정이 없음!!");
			return "forward:/webView/view/kr/notAccess.jsp";
		
		// access email-link directly for change password
		// authKey and token parameter 
		// need to return page for change password
		} else {
			// find condition true
			if( member.isFindCondition() ) {
				String id = member.getId();

				//임시 비밀번호 기능 일시 보류
				//String nick = member.getNickName();
				//String mailAddr = member.getEmail();
				//int tempPw = emailSender.generateAuthKey();
				//String contentForPw = emailSender.generateTempPwContent(nick, tempPw, id);
				//임시 비밀번호 알려주는 메일 발사
				//email.setContent(contentForPw);
				//email.setReceiver(mailAddr);
				//email.setSubject("[KingOfCasino] "+nick+"님의 비밀번호 찾기 결과입니다.");
				//emailSender.sendEmail(email);
				
				String countryURI = commonGenerator.assignCountryCode(member.getCountryCode());
				
				//조건 초기화
				memberService.updateFindConditionFalse(member.getUniqueID());
				//인증키 초기화
				memberService.deleteAuthKey(member.getUniqueID());
				return "forward:/webView/view/"+countryURI+"/giveResult.jsp?id="+id+"&check=ok";
			
			//페이지 유효기간 초과
			} else {
				logger.debug("링크 페이지 유효기간 초과!");
				return "forward:/webView/view/kr/notAccess.jsp";
			}
		}
	}
	
	//////////////////////////////////////////////
	//		ajax find account processing		//
	////////////////////////////////////////////// used by findAccount.jsp
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findAcnt(
			@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>(); 
		
		String onlyEmail = (String)paramMap.get("onlyEmail");
		
		String inputId = (String)paramMap.get("inputId");
		String inputEmail = (String)paramMap.get("inputEmail");
		
		
		logger.debug("debugging onlyEmail= "+onlyEmail+", inputId= "+inputId+", inputEmail= "+inputEmail);
		
		// find account by only email
		if(!onlyEmail.equals("")) {
			logger.debug("onlyEmail is not null");
			
			Member member = memberService.getMemberByEmail(onlyEmail);
			
			//입력된 이메일로 조회된 유저가 없을떄
			if(member == null) {
				
				logger.debug(" 멤버 널 ");
				resultMap.put("check", "notExistEmail");
				
			//입력된 이메일로 조회된 유저가 있을떄
			} else {
				
				logger.debug(" 멤버 널 ");
				
				int key = commonGenerator.generateAuthKey();
				int token = commonGenerator.generateTokenKey();
				
				member.setAuthKey(key);
				member.setToken(String.valueOf(token).trim());
				// update findCondition true > 메일 보냈다는 뜻
				memberService.updateFindConditionTrue(member.getUniqueID());
				// update token generated for directly get-method-access type
				memberService.updateAuthKey(member);
				memberService.updateToken(member);
				
				logger.debug(" /findId >> onlyEmail >> debug to Member= "+member);
				
				String id = member.getId();
				String nick = member.getNickName();
				String authKey = String.valueOf(key);
				
				//리얼용 real
				String disposableURI = realServerURI+"/findIdByLink?token="+token+"&authKey="+authKey;
				
				//로컬용 local
				//String disposableURI = testServerURI+"/findIdByLink?token="+token+"&authKey="+authKey;
				
				logger.debug("URI debugging= "+disposableURI);
				
				String contentForFindId = commonGenerator.generateContentForFindId(nick, disposableURI, authKey, id); 
				
				logger.debug(id+" :: "+ nick +" :: "+ authKey+" :: "+onlyEmail);
				
				email.setContent(contentForFindId);
				email.setReceiver(onlyEmail);
				email.setSubject("[KingOfCasino] "+nick+"님 아이디 찾기 결과 입니다.");
				commonGenerator.sendEmail(email);
				resultMap.put("check", "true");
				resultMap.put("type", "email");
				
				return resultMap;
			}
		// find account by both id and email
		} else {
			
			Member member = memberService.getMemberByID(inputId);
			
			//입력받은 아이디로 멤버가 조회되지 않을때
			if(member == null) {
				
				resultMap.put("check", "notExistID");
			
			//입력받은 아이디로 멤버가 조회 될때
			} else if (member != null) {
				
				Member memberByInputEmail = memberService.getMemberByEmail(inputEmail);
				String emailByInputId = member.getEmail();
				
				//입력받은 이메일로 멤버가 조회되지 될 때
				if(memberByInputEmail != null) {
					String emailByInputEmail = memberByInputEmail.getEmail();

					//입력받은 아이디로 조회된 멤버와 이메일로 조회된 멤버가 일치 할 때
					//비번변경을 위한 인증번호 쏴줘야 되는 경우
					if(emailByInputId.equals(emailByInputEmail)) {
						
						int key = commonGenerator.generateAuthKey();
						int token = commonGenerator.generateTokenKey();
						
						member.setAuthKey(key);
						member.setToken(String.valueOf(token).trim());
						// update findCondition true > 메일 보냈다는 뜻
						memberService.updateFindConditionTrue(member.getUniqueID());
						// update token generated for directly get-method-access type
						memberService.updateToken(member);
						memberService.updateAuthKey(member);
						logger.debug(" /findId >> Both id and email >> debug to Member= "+member);
						
						String id = member.getId();
						String nick = member.getNickName();
						String authKey = String.valueOf(key);
						
						//직접 비번변경 가능한 URI
						//리얼용 real
						String disposableURI = realServerURI+"/findIdByLink?token="+token+"&authKey="+authKey;
						
						//로컬용 local
						//String disposableURI = testServerURI+"/findIdByLink?token="+token+"&authKey="+authKey;
						
						logger.debug("uri= "+disposableURI);
						
						String contentForFindPw = commonGenerator.generateContentForFindPw(nick, disposableURI, authKey, id);
						
						email.setContent(contentForFindPw);
						email.setReceiver(inputEmail);
						email.setSubject("[KingOfCasino] "+nick+"님의 요청 결과입니다.");
						commonGenerator.sendEmail(email);
						
						logger.debug(id+" :: "+ nick +" :: "+ authKey+" :: "+inputEmail);
						
						resultMap.put("check", "true");
						resultMap.put("type", "both");
						
					//입력받은 아이디로 조회한 멤버와 이메일로 조회한 멤버가 일치하지 않을 때
					//인증번호 쏘지 말아야 되는 경우
					}else {
						
						resultMap.put("check", "notCrt");
					}
				} else {
					resultMap.put("check", "notExistEmail");
				}
			}
		}
		
		return resultMap;
	}
	
	//////////////////////////////////////////////
	//		ajax checking authKey processing	//
	////////////////////////////////////////////// used by findAccount.jsp
	@RequestMapping(value="/checkKey", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkKey(@RequestParam Map<String, Object> paramMap) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String type = (String)paramMap.get("type");
		String authKey = (String)paramMap.get("authKey");
		
		//화면단에도 type 정보 알려줌
		resultMap.put("type", type);
		
		//아이디찾기로 인입
		if(type.equals("email")) {
			
			String onlyEmail = (String)paramMap.get("onlyEmail");
			Member member = memberService.getMemberByEmail(onlyEmail);
			
			//메일로 보낸 URL 접근 안 한 경우
			if(member.isFindCondition()) {
				//인증번호 일치
				if(String.valueOf(member.getAuthKey()).equals(authKey)) {
					logger.debug("ajax checking authKey processing :: 아이디찾기로 인입 :: 인증번호 일치 ::");
					
					resultMap.put("countryURI", commonGenerator.assignCountryCode(member.getCountryCode()));
					resultMap.put("token", member.getToken());
					resultMap.put("check", "correct");
					
				//인증번호 불일치
				} else {
					logger.debug("ajax checking authKey processing :: 아이디찾기로 인입 :: 인증번호 불일치 ::");
					resultMap.put("check", "notCorrect");
				}
			//메일로 보낸 URL 접근 한 경우
			} else {
				logger.debug("ajax checking authKey processing :: 아이디찾기로 인입 :: 이메일 방식으로 완료된 상태에서 잘못된 접근 ::");
				resultMap.put("check", "alreadyDone");
			}
			
		//비밀번호 찾기로 인입
		} else if(type.equals("both")) {
			
			String inputId = (String)paramMap.get("inputId");
			//String inputEmail = (String)paramMap.get("inputEmail");
			Member member = memberService.getMemberByID(inputId);
			
			//메일로 보낸 URL 접근 안 한 경우 true
			if(member.isFindCondition()) {
				//인증번호 일치
				if(String.valueOf(member.getAuthKey()).equals(authKey)) {
					logger.debug("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 인증번호 일치 ::");
					
					resultMap.put("token", member.getToken());
					resultMap.put("authKey", member.getAuthKey());
					resultMap.put("check", "correct");
					
				//인증번호 불일치
				} else {
					logger.debug("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 인증번호 불일치 ::");
					resultMap.put("check", "notCorrect");
				}
			//메일로 보낸 URL 접근 한 경우 false
			} else {
				logger.debug("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 이메일 방식으로 완료된 상태에서 잘못된 접근 ::");
				resultMap.put("check", "alreadyDone");
			}
		}
		
		return resultMap;
	}
	
	
	//////////////////////////
	// ajax password change //
	////////////////////////// used by giveResult.jsp
	@RequestMapping(value="/changePw", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePw(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String id = (String)paramMap.get("id");
		String pass = (String)paramMap.get("pass");
		
		Member member = memberService.getMemberByID(id);
		memberService.updateFindConditionFalse(member.getUniqueID());
		memberService.deleteAuthKey(member.getUniqueID());
		member.setPass(pass);
		memberService.updateMember(member);

		resultMap.put("check", "true");
		return resultMap;
	}
	
	
	
	///////////////////////
	///// 본인인증 init /////
	//////////////////////
	@RequestMapping(value="/verify", method=RequestMethod.GET)
	public String verifyStep01(Model model) throws Exception {
		
		Calendar today = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String day = sdf.format(today.getTime());
		
		Random ran = new Random();
		int numLength = 6;
		String randomStr = "";
		
		for (int i = 0; i < numLength; i++) {
			randomStr += ran.nextInt(10);
		}
		String reqNum = day + randomStr;
		String tr_add = "N";
		
		VerifyInfo vi = new VerifyInfo(cpId, urlCode, reqNum, day, certMet, "", "", "", "", ""
				, "", "", extendVar);
		
		String tr_cert = FormatUtil.enc_tr_cert(vi.getTr_cert(), extendVar);
		
		model.addAttribute("tr_cert", tr_cert);
		model.addAttribute("tr_url", tr_url);
		model.addAttribute("tr_add", tr_add);
		
		logger.debug("tr_cert= "+tr_cert);
		logger.debug("tr_url= "+tr_url);
		logger.debug("tr_add= "+tr_add);
		
		return "forward:/webView/view/kr/verify/requestCrt.jsp";
	}
	
	///////////////////////////////
	///// 본인인증 데이터 수신 URL ///// 
	///////////////////////////////
	@RequestMapping(value="/responseVerify")
	public String responseVerify(Model model
			, @RequestParam String rec_cert, @RequestParam String certNum) throws Exception {
		
		logger.debug("rec_cert= "+rec_cert+", certNum= "+certNum);
		model.addAttribute("rec_cert", rec_cert.trim());
		model.addAttribute("certNum", certNum.trim());
		
		
		if( rec_cert.trim().length() == 0 || certNum.length() == 0 ) {
			logger.error("결과값 비정상");
			return "";
		} else {
			return "forward:/webView/view/kr/verify/resultCrt.jsp";
		}
	}
	
	@RequestMapping(value="/resultCrt")
	public String resultCrt(Model model, HttpServletRequest request
			, @RequestParam String rec_cert, @RequestParam String certNum) throws Exception {
		
		String encPara = "";
		String encMsg1 = "";
		String encMsg2 = "";
		String msgChk = "";
		
		IcertSecuManager seed = new IcertSecuManager();
		
		String rec_certTrim = rec_cert.trim();
		String k_certNum = certNum.trim();
		
		logger.debug("복호화전 rec_cert= "+rec_cert);
		
		String result = seed.getDec(rec_certTrim, k_certNum);
		
		int inf1 = result.indexOf("/", 0);
		int inf2 = result.indexOf("/", inf1+1);
		
		encPara = result.substring(0, inf1);
		encMsg1 = result.substring(inf1+1, inf2);
		
		encMsg2 = seed.getMsg(encPara);
		
		if(encMsg2.equals(encMsg1)) {
			msgChk="Y";
		}
		if(msgChk.equals("N")) {
			logger.error("비정상적인 접근!! "+msgChk);
			return "";
		}
		
		logger.info("결과 성공");
		
		result = seed.getDec(encPara, k_certNum);
		int info1 = result.indexOf("/", 0);
		int info2 = result.indexOf("/", info1+1);
		int info3 = result.indexOf("/", info2+1);
		int info4 = result.indexOf("/", info3+1);
		int info5 = result.indexOf("/", info4+1);
		int info6 = result.indexOf("/", info5+1);
		int info7 = result.indexOf("/", info6+1);
		int info8 = result.indexOf("/", info7+1);
		int info9 = result.indexOf("/", info8+1);
		int info10 = result.indexOf("/", info9+1);
		int info11 = result.indexOf("/", info10+1);
		int info12 = result.indexOf("/", info11+1);
		int info13 = result.indexOf("/", info12+1);
		int info14 = result.indexOf("/", info13+1);
		int info15 = result.indexOf("/", info14+1);
		int info16 = result.indexOf("/", info15+1);
		int info17 = result.indexOf("/", info16+1);
		int info18 = result.indexOf("/", info17+1);
		
		certNum = result.substring(0, info1);
		String date = result.substring(info1+1, info2);
		String CI = result.substring(info2+1, info3);
		String phoneNo = result.substring(info3+1, info4);
		String phoneCorp = result.substring(info4+1, info5);
		String birthDay = result.substring(info5+1, info6);
		String gender = result.substring(info6+1, info7);
		String nation = result.substring(info7+1, info8);
		String name = result.substring(info8+1, info9);
		String resultValue = result.substring(info9+1, info10);
		String certMet = result.substring(info10+1, info11);
		String ip = result.substring(info11+1, info12);
		String M_name = result.substring(info12+1, info13);
		String M_birthDay = result.substring(info13+1, info14);
		String M_gender = result.substring(info14+1, info15);
		String M_nation = result.substring(info15+1, info16);
		String plusInfo = result.substring(info16+1, info17);
		String DI = result.substring(info17+1, info18);
		
		String regex = "";
		
		if( certNum.length() == 0 || certNum.length() > 40) {
			logger.error("요청번호 비정상");
			return "";
		}
		
		regex = "[0-9]*";
		if( date.length() != 14 || !FormatUtil.paramChk(regex, date) ) {
			logger.error("요청일시 비정상");
			return "";
		}
		
		regex = "[A-Z]*";
		if( certMet.length() != 1 || !FormatUtil.paramChk(regex, certMet) ) {
			logger.error("본인인증방법 비정상 "+ certMet);
			return "";
		}
		
		regex = "[0-9]*";
		if( (phoneNo.length() != 10 && phoneNo.length() != 11) || !FormatUtil.paramChk(regex, phoneNo) ) {
			logger.error("휴대폰번호 비정상");
			return "";
		}
		
		regex = "[A-Z]*";
		if( phoneCorp.length() != 3 || !FormatUtil.paramChk(regex, phoneCorp) ) {
			logger.error("이동통신사 비정상");
			return "";
		}
		
		regex = "[0-9]*";
		if( birthDay.length() != 8 || !FormatUtil.paramChk(regex, birthDay) ) {
			logger.error("생년월일 비정상");
			return "";
		}
		
		regex = "[0-9]*";
		if( gender.length() != 1 || !FormatUtil.paramChk(regex, gender) ) {
			logger.error("성별 비정상");
			return "";
		}
		
		regex = "[0-9]*";
		if( nation.length() != 1 || !FormatUtil.paramChk(regex, nation) ){
			logger.error("내/외국인 비정상");
			return "";
		}
		
		regex = "[\\sA-Za-z가-힣.,-]*";
		if( name.length() > 60 || !FormatUtil.paramChk(regex, name) ){
			logger.error("성명 비정상");
			return "";
		}
		
		regex = "[A-Z]*";
		if( resultValue.length() != 1 || !FormatUtil.paramChk(regex, resultValue) ){
			logger.error("결과값 비정상");
			return "";
		}
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREAN);
		String strCurrentTime = formatter.format(new Date());
		
		Date toDate = formatter.parse(strCurrentTime);
		Date fromDate = formatter.parse(date);
		long timediff = toDate.getTime()-fromDate.getTime();
		
		if( timediff < -30*60*1000 || 30*60*100 < timediff ) {
			logger.error("비정상적인 접근입니다. (요청시간경과)");
			return "";
		}
		
		String client_ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if( client_ip != null ) {
			if( client_ip.indexOf(",") != -1 )
				client_ip = client_ip.substring(0, client_ip.indexOf(","));
		}
		if( client_ip == null || client_ip.length() == 0 ) {
			client_ip = request.getRemoteAddr();
		}
		if( !client_ip.equals(ip) ) {
			logger.error("비정상적인 접근입니다. (IP불일치)");
			return "";
		}
		
		logger.info("위,변조여부1= "+encMsg1+"\n위,변조여부2="+encMsg2+"\n요청번호="+certNum+"\n요청일시"+date+"\n연계정보"+CI
				+"\n중복가입확인정보(DI)"+DI+"\n휴대폰번호"+phoneNo+"\n이동통신사"+phoneCorp+"\n생년월일"+birthDay+"\n내국인"+nation
				+"\n성별"+gender+"\n성명"+name+"\n결과값"+resultValue+"\n인증밥법"+certMet+"\n ip주소"+ip+"\n미성년자 성명"+M_name
				+"\n미성년자 생년월일"+M_birthDay+"\n미성년자 성별"+M_gender+"\n미성년자 내외국인"+M_nation+"\n추가DATA정보"+plusInfo);
		
		String birthYear = birthDay.substring(0,4);
		int birthYearInt = Integer.parseInt(birthYear);
		String generateDate = strCurrentTime.substring(0,8);
		
		logger.debug(" [결과값 디버깅] birthYearInt= "+birthYearInt+", generateDate= "+generateDate);
		if( birthYearInt <= adultYear) {
			logger.info("성인");
			AdultCheck adultCheck = new AdultCheck(phoneNo);
			memberService.addAdultCheck(adultCheck);
			model.addAttribute("adult", "true");
		} else {
			model.addAttribute("adult", "false");
			logger.info("미성년자");
		}
		return "forward:/webView/view/kr/verify/success.jsp";
	}
}
