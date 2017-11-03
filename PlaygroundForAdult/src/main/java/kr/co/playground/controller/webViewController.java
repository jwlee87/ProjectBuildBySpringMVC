package kr.co.playground.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.playground.common.EmailSender;
import kr.co.playground.domain.Email;
import kr.co.playground.domain.Member;
import kr.co.playground.domain.Video;
import kr.co.playground.service.MemberService;
import kr.co.playground.service.VideoService;

@Controller
@RequestMapping("/web/*")
public class webViewController {

	
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
	private EmailSender emailSender;
	
	//한페이지에 표시될 게시글 수
	@Value("#{commonProperties['countList']}")
	int countList;
	
	@Value("#{commonProperties['countPage']}")
	int countPage;
	
	//Constructor
	public webViewController() {
		System.out.println(this.getClass());
	}
	//////////////////
	//  videoList  ///
	//////////////////
	@RequestMapping(value="/videoList", method=RequestMethod.GET)
	public String videoList(HttpServletRequest request
			, @ModelAttribute Member member, @RequestParam String id
			, @ModelAttribute Video video, Model model)throws Exception{
		
		System.out.println("::START Controller:: /web/videoList init");
		System.out.println("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		String countryCode = String.valueOf(member.getCountryCode());
		String tempURI = emailSender.makingReturnWebViewURI(member.getCountryCode());
		String returnURI = tempURI+"videoList.jsp";
		
		Device device = DeviceUtils.getCurrentDevice(request);
		System.out.println("device dubug : "+device);
		if(device == null) {
			System.out.println("divice is null");
		}
		System.out.println("DEVICE GET DEVICEPLATFORM = "+device.getDevicePlatform().name());
		
		String deviceType="unknown";
		if(device.isNormal()) {
			deviceType = "normal";
		}else if(device.isMobile()) {
			deviceType = "mobile";
		}else if(device.isTablet()) {
			deviceType = "tablet";
		}
		
		//디바이스 분기처리 추후 데스크탑에서 접근은 막아야함
		if(deviceType.equals("mobile")||deviceType.equals("tablet")||deviceType.equals("normal")) {
			//en
			if (countryCode.trim().equals("0")) {
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//kr
			} else if (countryCode.trim().equals("1")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//ch
			} else if (countryCode.trim().equals("2")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//jp
			} else if (countryCode.trim().equals("3")){
				List<Video> list = videoService.getFreeVideoJver();
				model.addAttribute("list", list);
				return returnURI;
			//error
			} else {
				return "/webView/view/jp/notAccess.jsp";
			}
		} else {
			System.out.println("This page is not serviced at Desktop");
			return "/webView/view/jp/notAccess.jsp";
		}
	}
	
	////////////////////////
	//  terms of service  //
	////////////////////////
	@RequestMapping(value="/tos", method=RequestMethod.GET)
	public String tos(@ModelAttribute Member member, @RequestParam String id
			, Model model) throws Exception {
		
		member = memberService.getMemberByID(id);
		
		if(member != null) {
			int cc = member.getCountryCode();
			String returnWebViewURI = emailSender.makingReturnWebViewURI(cc);
			String returnURI = returnWebViewURI+"tos.jsp";
			System.out.println(" debugging return page == "+returnURI);
			//en
			if(cc==0) {
				return returnURI;
			}
			//kr
			else if(cc==1) {
				return returnURI;
			}
			//ch
			else if(cc==2) {
				return returnURI;
			}
			//jp
			else if(cc==3) {
				return returnURI;
			}
		}
		return "/webView/view/jp/notAccess.jsp";
	}
	
	/////////////
	//  find  //
	///////////
	@RequestMapping(value="/find", method=RequestMethod.GET)
	public String find(@RequestParam String cc,
			Model model) throws Exception {
		model.addAttribute("cc", cc);
		String returnWebViewURI = emailSender.makingReturnWebViewURI(Integer.parseInt(cc));
		String returnURI = returnWebViewURI+"findAccount.jsp"; 
		//en
		if(cc.equals("0")) {
			System.out.println("en version");
			return returnURI;
		}
		//kr
		else if(cc.equals("1")) {
			System.out.println("kr version");
			return returnURI;
		}
		//ch
		else if(cc.equals("2")) {
			System.out.println("ch version");
			return returnURI;
		}
		//jp
		else if(cc.equals("3")) {
			System.out.println("jp version");
			return returnURI;
		}
		return "/webView/view/jp/notAccess.jsp";
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
		System.out.println("authKey 디버깅= "+authKey);
		System.out.println(" /findIdByLink Access token: "+token);
		
		Member member = memberService.getMemberByToken(token);
		
		if(authKey.equals("")) {
			// exist account searched by token
			if( member != null ) {
				System.out.println("토큰으로 검색되는 계정이 있음");
				
				// find condition true
				if( member.isFindCondition() ) {
					System.out.println("검색된 계정의 findCondition ture");
					
					String id = member.getId();
					String nick = member.getNickName();
					String mailAddr = member.getEmail();
					String contentForID = emailSender.generateIdContent(nick, id);
					
					//아이디 알려주는 메일 발사
					email.setContent(contentForID);
					email.setReceiver(mailAddr);
					email.setSubject("[KingOfCasino] "+nick+"님의 아이디 찾기 결과입니다.");
					emailSender.sendEmail(email);
					
					String countryURI = emailSender.assignCountryCode(member.getCountryCode());
					
					//조건 초기화
					memberService.updateFindConditionFalse(member.getUniqueID());
					//인증키 초기화
					memberService.deleteAuthKey(member.getUniqueID());
					
					return "/webView/view/"+countryURI+"/giveResult.jsp?id="+id;
				}
				// 페이지 유효기간 초과
				// find condition false
				System.out.println(" 링크 페이지 유효기간 초과! ");
				return "/webView/view/kr/notAccess.jsp";
				
			// not exist account searched by token
			}
			
			System.out.println("토큰으로 검색되는 계정이 없음!!");
			return "/webView/view/kr/notAccess.jsp";
		
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
				
				String countryURI = emailSender.assignCountryCode(member.getCountryCode());
				
				//조건 초기화
				memberService.updateFindConditionFalse(member.getUniqueID());
				//인증키 초기화
				memberService.deleteAuthKey(member.getUniqueID());
				return "/webView/view/"+countryURI+"/giveResult.jsp?id="+id+"&check=ok";
			
			//페이지 유효기간 초과
			} else {
				System.out.println("링크 페이지 유효기간 초과!");
				return "/webView/view/kr/notAccess.jsp";
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
		
		
		System.out.println("debugging onlyEmail= "+onlyEmail+", inputId= "+inputId+", inputEmail= "+inputEmail);
		
		// find account by only email
		if(!onlyEmail.equals("")) {
			System.out.println("onlyEmail is not null");
			
			Member member = memberService.getMemberByEmail(onlyEmail);
			
			//입력된 이메일로 조회된 유저가 없을떄
			if(member == null) {
				resultMap.put("check", "notExistEmail");
				
			//입력된 이메일로 조회된 유저가 있을떄
			} else {
				int key = emailSender.generateAuthKey();
				int token = emailSender.generateTokenKey();
				
				member.setAuthKey(key);
				member.setToken(String.valueOf(token).trim());
				// update findCondition true > 메일 보냈다는 뜻
				memberService.updateFindConditionTrue(member.getUniqueID());
				// update token generated for directly get-method-access type
				memberService.updateAuthKey(member);
				memberService.updateToken(member);
				
				System.out.println(" /findId >> onlyEmail >> debug to Member= "+member);
				
				String id = member.getId();
				String nick = member.getNickName();
				String authKey = String.valueOf(key);
				String disposableURI = "http://localhost/web/findIdByLink?token="+token;
				String contentForAuthKey = emailSender.generateAuthKeyContent(nick, disposableURI, authKey, id); 
				
				System.out.println(id+" :: "+ nick +" :: "+ authKey+" :: "+inputEmail);
				
				email.setContent(contentForAuthKey);
				email.setReceiver(onlyEmail);
				email.setSubject("[KingOfCasino] "+nick+"님께서 요청하신 인증번호 입니다.");
				
				emailSender.sendEmail(email);
				
				resultMap.put("check", "true");
				resultMap.put("type", "email");
			}

		// find account by both id and email
		} else {
			
			System.out.println(" 디버깅 비번 변경 1 ");
			Member member = memberService.getMemberByID(inputId);
			
			//입력받은 아이디로 멤버가 조회되지 않을때
			if(member == null) {
				
				System.out.println(" 디버깅 비번 변경 2 ");
				resultMap.put("check", "notExistID");
			
			//입력받은 아이디로 멤버가 조회 될때
			} else if (member != null) {
				
				System.out.println(" 디버깅 비번 변경 3 ");
				Member memberByInputEmail = memberService.getMemberByEmail(inputEmail);
				String emailByInputId = member.getEmail();
				
				//입력받은 이메일로 멤버가 조회되지 될 때
				if(memberByInputEmail != null) {
					String emailByInputEmail = memberByInputEmail.getEmail();

					//입력받은 아이디로 조회된 멤버와 이메일로 조회된 멤버가 일치 할 때
					//비번변경을 위한 인증번호 쏴줘야 되는 경우
					if(emailByInputId.equals(emailByInputEmail)) {
						
						System.out.println(" 디버깅 비번 변경 5 ");
						int key = emailSender.generateAuthKey();
						int token = emailSender.generateTokenKey();
						
						member.setAuthKey(key);
						member.setToken(String.valueOf(token).trim());
						// update findCondition true > 메일 보냈다는 뜻
						memberService.updateFindConditionTrue(member.getUniqueID());
						// update token generated for directly get-method-access type
						memberService.updateToken(member);
						memberService.updateAuthKey(member);
						System.out.println(" /findId >> Both id and email >> debug to Member= "+member);
						
						String id = member.getId();
						String nick = member.getNickName();
						String authKey = String.valueOf(key);
						//직접 비번변경 가능한 URI
						String disposableURI = "http://localhost/web/findIdByLink?token="+token+"&authKey="+authKey;
						String contentForAuthKey = emailSender.generateAuthKeyContent(nick, disposableURI, authKey, id);
						
						email.setContent(contentForAuthKey);
						email.setReceiver(inputEmail);
						email.setSubject("[KingOfCasino] "+nick+"님께서 요청하신 인증번호 입니다.");
						emailSender.sendEmail(email);
						
						
						resultMap.put("check", "true");
						resultMap.put("type", "both");
						
					//입력받은 아이디로 조회한 멤버와 이메일로 조회한 멤버가 일치하지 않을 때
					//인증번호 쏘지 말아야 되는 경우
					}else {
						
						System.out.println(" 디버깅 비번 변경 6 ");
						resultMap.put("check", "notCrt");
					}
				} else {
					System.out.println(" 디버깅 비번 변경 7 ");
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
					System.out.println("ajax checking authKey processing :: 아이디찾기로 인입 :: 인증번호 일치 ::");
					
					resultMap.put("countryURI", emailSender.assignCountryCode(member.getCountryCode()));
					resultMap.put("token", member.getToken());
					resultMap.put("check", "correct");
					
				//인증번호 불일치
				} else {
					System.out.println("ajax checking authKey processing :: 아이디찾기로 인입 :: 인증번호 불일치 ::");
					resultMap.put("check", "notCorrect");
				}
			//메일로 보낸 URL 접근 한 경우
			} else {
				System.out.println("ajax checking authKey processing :: 아이디찾기로 인입 :: 이메일 방식으로 완료된 상태에서 잘못된 접근 ::");
				resultMap.put("check", "alreadyDone");
			}
			
		//비밀번호 찾기로 인입
		} else if(type.equals("both")) {
			
			String inputId = (String)paramMap.get("inputId");
			String inputEmail = (String)paramMap.get("inputEmail");
			Member member = memberService.getMemberByID(inputId);
			
			//메일로 보낸 URL 접근 안 한 경우 true
			if(member.isFindCondition()) {
				//인증번호 일치
				if(String.valueOf(member.getAuthKey()).equals(authKey)) {
					System.out.println("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 인증번호 일치 ::");
					
					resultMap.put("token", member.getToken());
					resultMap.put("authKey", member.getAuthKey());
					resultMap.put("check", "correct");
					
				//인증번호 불일치
				} else {
					System.out.println("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 인증번호 불일치 ::");
					resultMap.put("check", "notCorrect");
				}
			//메일로 보낸 URL 접근 한 경우 false
			} else {
				System.out.println("ajax checking authKey processing :: 비밀번호 찾기로 인입 :: 이메일 방식으로 완료된 상태에서 잘못된 접근 ::");
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
}
