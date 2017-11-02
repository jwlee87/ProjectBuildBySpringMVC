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
	//  videoList  //
	////////////////
	@RequestMapping(value="/videoList", method=RequestMethod.GET)
	public String videoList(HttpSession session, HttpServletRequest request
			, @ModelAttribute Member member, @RequestParam String id
			, @ModelAttribute Video video, Model model)throws Exception{
		
		System.out.println("::START Controller:: /web/videoList init");
		System.out.println("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		session.setAttribute("wmember", member);
		String countryCode = String.valueOf(member.getCountryCode());
		
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
				return "/webView/view/en/videoList.jsp";
			//kr
			} else if (countryCode.trim().equals("1")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return "/webView/view/kr/videoList.jsp";
			//ch
			} else if (countryCode.trim().equals("2")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return "/webView/view/ch/videoList.jsp";
			//jp
			} else if (countryCode.trim().equals("3")){
				List<Video> list = videoService.getFreeVideoJver();
				model.addAttribute("list", list);
				return "/webView/view/jp/videoList.jsp";
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
	public String tos(HttpSession session, HttpServletRequest request
			, @ModelAttribute Member member, @RequestParam String id
			, @ModelAttribute Video video, Model model) throws Exception {
		
		member = memberService.getMemberByID(id);
		if(member == null) {
			return "/webView/view/jp/notAccess.jsp";
		}
		//en
		if(member.getCountryCode()==0) {
			return "/webView/view/kr/tos.jsp";
		}
		//kr
		else if(member.getCountryCode()==1) {
			return "/webView/view/kr/tos.jsp";
		}
		//ch
		else if(member.getCountryCode()==2) {
			return "/webView/view/kr/tos.jsp";
		}
		//jp
		else if(member.getCountryCode()==3) {
			return "/webView/view/jp/tos.jsp";
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
		//en
		if(cc.equals("0")) {
			System.out.println("en version");
			return "/webView/view/en/findAccount.jsp";
		}
		//kr
		else if(cc.equals("1")) {
			System.out.println("kr version");
			return "/webView/view/kr/findAccount.jsp";
		}
		//ch
		else if(cc.equals("2")) {
			System.out.println("ch version");
			return "/webView/view/ch/findAccount.jsp";
		}
		//jp
		else if(cc.equals("3")) {
			System.out.println("jp version");
			return "/webView/view/jp/findAccount.jsp";
		}
		return "/webView/view/jp/notAccess.jsp";
	}
	
	
	
	/////////////////////
	// find id by link //
	/////////////////////
	@RequestMapping(value="/findIdByLink", method=RequestMethod.GET)
	public String findIdByLink(HttpSession session, @RequestParam String token) throws Exception {
		
		System.out.println(" /findIdByLink Access token: "+token);
		
		Member member = memberService.getMemberByToken(token);
		
		// exist account searched by token
		if( member != null ) {
			System.out.println("토큰으로 검색되는 계정이 있음");
			
			// find condition true
			if( member.isFindCondition() ) {
				System.out.println("검색된 계정의 findCondition ture");
				memberService.updateFindConditionNeed(member.getUniqueID());
				
				String id = member.getId();
				String nick = member.getNickName();
				String mailAddr = member.getEmail();
				String contentForID = emailSender.generateIdContent(nick, id);
				
				//아이디 알려주는 메일 발사
				email.setContent(contentForID);
				email.setReceiver(mailAddr);
				email.setSubject("[KingOfCasino] "+nick+"님의 아이디 찾기 결과입니다.");
				emailSender.sendEmail(email);
				
				String countryURI = "kr";
				if(member.getCountryCode()==0) {
					countryURI = "en";
				} else if(member.getCountryCode()==1) {
					countryURI = "kr";
				} else if(member.getCountryCode()==2) {
					countryURI = "ch";
				} else if(member.getCountryCode()==3) {
					countryURI = "jp";
				}
				return "/webView/view/"+countryURI+"/giveId.jsp?id="+id;
			}
			// find condition false
			return "/webView/view/kr/notAccess.jsp";
			
		// not exist account searched by token
		}
		System.out.println("토큰으로 검색되는 계정이 없음!!");
		return "/webView/view/kr/notAccess.jsp";
	}
	
	///////////////////////////////
	//		ajax processing		//
	//////////////////////////////
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findAcnt(HttpSession session,
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
				
				member.setToken(String.valueOf(token).trim());
				// update findCondition true > 메일 보냈다는 뜻
				memberService.updateFindConditionComplete(member.getUniqueID());
				// update token generated for directly get-method-access type
				memberService.updateToken(member);
				
				System.out.println(" /findId >> onlyEmail >> debug to Member= "+member);
				
				String id = member.getId();
				String nick = member.getNickName();
				String authKey = String.valueOf(key);
				String disposableURI = "http://localhost/web/findIdByLink?token="+token;
				String contentForAuthKey = emailSender.generateAuthKeyContent(nick, disposableURI, authKey, id); 
				
				System.out.println(id+" :: "+ nick +" :: "+ authKey+" :: "+inputEmail);
				
				System.out.println("  **  보낼 메일 내용 디버깅= "+contentForAuthKey);
				
				email.setContent(contentForAuthKey);
				email.setReceiver(onlyEmail);
				email.setSubject("[KingOfCasino] "+nick+"님께서 요청하신 인증번호 입니다.");
				
				emailSender.sendEmail(email);
				
				session.setAttribute("authKey", authKey);
				resultMap.put("check", "true");
				resultMap.put("type", "email");
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
				String emailByInputEmail = memberByInputEmail.getEmail();
				String emailByInputId = member.getEmail();
				
				//입력받은 이메일로 멤버가 조회되지 않을때
				if(emailByInputEmail.equals("")) {
					resultMap.put("check", "notExistEmail");
					
				//입력받은 아이디, 이메일 모두 널이 아님
				} else {
					
					//입력받은 아이디로 조회된 멤버와 이메일로 조회된 멤버가 일치 할 때
					//인증번호 쏴줘야 되는 경우
					if(emailByInputId.equals(emailByInputEmail)) {
						int key = emailSender.generateAuthKey();
						int token = emailSender.generateTokenKey();
						member.setToken(String.valueOf(token).trim());
						// update findCondition true > 메일 보냈다는 뜻
						memberService.updateFindConditionComplete(member.getUniqueID());
						// update token generated for directly get-method-access type
						memberService.updateToken(member);
						System.out.println(" /findId >> Both id and email >> debug to Member= "+member);
						
						String id = member.getId();
						String nick = member.getNickName();
						String authKey = String.valueOf(key);
						String disposableURI = "http://localhost/web/findIdByLink?token="+token;
						String contentForAuthKey = emailSender.generateAuthKeyContent(nick, disposableURI, authKey, id);
						
						email.setContent(contentForAuthKey);
						email.setReceiver(inputEmail);
						email.setSubject("[KingOfCasino] "+nick+"님께서 요청하신 인증번호 입니다.");
						emailSender.sendEmail(email);
						
						session.setAttribute("authKey", authKey);
						resultMap.put("check", "true");
						resultMap.put("type", "both");
						
					//입력받은 아이디로 조회한 멤버와 이메일로 조회한 멤버가 일치하지 않을 때
					//인증번호 쏘지 말아야 되는 경우
					}else {
						resultMap.put("check", "notCrt");
					}
				}
			}
		}
		
		return resultMap;
	}
	
	
}
