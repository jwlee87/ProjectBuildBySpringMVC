package kr.co.playground.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.playground.domain.Member;
import kr.co.playground.domain.WebFile;
import kr.co.playground.service.MemberService;
import kr.co.playground.service.WebFileService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("webFileServiceImpl")
	private WebFileService webFileService;
	
	@Value("#{commonProperties['uploadPath']}")
	 String uploadPath;
	
	///Constructor
	public LoginController() {
		System.out.println(this.getClass());
	}
	
	
	///Method
	
	@RequestMapping( value="/register", method=RequestMethod.POST )
	public String addMember(HttpSession session,
			@ModelAttribute Member member ) throws Exception {
		
		System.out.println(" 컨트롤러 단 add 전 Member: "+member);
		
		memberService.addMember(member);
		
		System.out.println(" 컨트롤러 단 add 후 Member: "+member);
		String id = member.getId();
		member = memberService.getMemberByID(id);
		member = memberService.getMemberByUniqueID(member.getUniqueID());
		System.out.println(" 등록 후 디버깅 로그인 member= "+member);
		session.setAttribute("login", member);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping( value="/logout", method=RequestMethod.GET )
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "forward:/";
	}
	
	@RequestMapping( value="/login", method=RequestMethod.POST )
	public String login(HttpServletRequest request,
			HttpSession session, @ModelAttribute Member member) throws Exception {
		
		String id = member.getId().toLowerCase();
		String pass = member.getPass();
		
		System.out.println(" /login/login 로그인 디버깅 :: id= "+id+", pass= "+pass);
		
		Member login = memberService.login(id);
		

		if (login != null) {
			String orgId = login.getId().toLowerCase();
			String orgPwd = login.getPass();
			
			/*로그인 성공*/
			if (id.equals(orgId) && pass.equals(orgPwd)) {
				System.out.println("로그인 성공");
				request.setAttribute("msg", login.getNickName()
						+"님 환영합니다.");
				session.setAttribute("login", login);
				
				return "forward:/index.jsp";
			}
			/*비밀번호 다름*/
			else if (id.equals(orgId) && !(pass.equals(orgPwd)) ) {
				System.out.println("비밀번호 다름");
				request.setAttribute("msg", "비밀번호가 올바르지 않습니다.");
				return "forward:/account/loginForm.jsp";
			}
			/*안정성*/
			else {
				System.out.println("올 가능성은 없지만 안정성을 위해");
				request.setAttribute("msg", "입력하신 정보가 올바르지 않습니다.");
				return "forward:/account/loginForm.jsp";
			}
		}
		else if ( login == null ) {
			System.out.println("입력한 아이디로 검색된 결과가 없으므로 아이디 존재 X");
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			System.out.println("존재하는 아이디가 없음");
			return "forward:/account/loginForm.jsp";
		}
		return "forward:/common/error.jsp";
	}
	
	
	@RequestMapping( value="/updateMyInfo", method=RequestMethod.POST)
	public String updateMyInfo(HttpServletRequest request, HttpSession session,
			@ModelAttribute Member member, @RequestParam("file") MultipartFile file) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		Member login = (Member)session.getAttribute("login");
		System.out.println(" 업데이트 내정보에서 세션 Member 객체 login 디버깅 = "+login);
		
		
		String oriName = file.getOriginalFilename();
		System.out.println(" 파일네임 디버깅 :"+oriName);
		
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath("/fileUpload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		//String savePath = path + datePath;
		String savePath = uploadPath + datePath;
		
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		// 프로필 이미지 존재
		if( login.getOriNaem() != null ) {
			//이미 이미지가 있음 
			//기존 이름에 새로 지정된이미지로 덮어쓰기
			file.transferTo(new File(uploadPath + login.getFilePath() + "\\" + login.getSystemName()));
			
			WebFile webFile = new WebFile();
			webFile.setFileNo(login.getFileNo());
			webFile.setOriName(login.getOriNaem());
			webFile.setSystemName(login.getSystemName());
			webFile.setFilePath(login.getFilePath());
			
			if( file.getSize() != 0 ) {
			webFile.setFileSize(file.getSize());
			} else {
				webFile.setFileSize(login.getFileSize());
			}
			
			webFile.setUniqueID(login.getUniqueID());
			System.out.println(" 프로필 있는 경우(이미지 변경) ");
			
			map.put("webFile", webFile);
			webFileService.updatePrFile(map);
			
		}
		// 프로필 이미지 없음
		else {
			if (oriName != null && !oriName.equals("")) {
				String body = oriName.split("\\.")[0];
				String ext = "."+oriName.split("\\.")[1];
				long fileSize = file.getSize();
				System.out.println(" 프로필파일 사이즈 디버깅: "+fileSize);
				
				// 고유한 파일명 만들기
				String systemName = "pfa-" + UUID.randomUUID().toString()+ext;
				System.out.println(" 저장할 파일명: "+systemName);
				
				// 임시 저장된 파일을 원하는 경로에 저장
				file.transferTo(new File(savePath + "\\" + systemName));
				
				WebFile webFile = new WebFile();
				webFile.setUniqueID(login.getUniqueID());
				webFile.setOriName(oriName);
				webFile.setSystemName(systemName);
				webFile.setFilePath(datePath);
				webFile.setFileSize(fileSize);
				
				System.out.println(" webFile 디버깅: "+webFile);
				
				map.put("webFile", webFile);
				webFileService.addPrFile(map);
			}
		}
		
		memberService.updateMember(member);
		System.out.println(" 디버깅 :: 변경된 정보의 유저 아이디 "+member.getId());
		member = memberService.login(member.getId());
		
		session.setAttribute("login", member);
		
		return "forward:/account/myInfo.jsp";
	}
	
	@RequestMapping( value="/deleteMember" )
	public String deleteMember(HttpSession session, @ModelAttribute Member member) throws Exception {
		
		member = (Member)session.getAttribute("login");
		memberService.deleteMember(member);
		session.invalidate();
		
		return "forward:/index.jsp";
	}
	
	
	//닉네임 중복체크
	@RequestMapping( value="/duplCheck", method=RequestMethod.POST)
	@ResponseBody
	public String duplCheck(HttpServletRequest request, HttpServletResponse response
			, HttpSession session, @RequestParam(value="param") String param, @RequestParam(value="value") String value) throws Exception {
		
		Member member = (Member)session.getAttribute("login");
		String orgNick = member != null ? member.getNickName() : "";
		System.out.println(" orgNick Debug :"+orgNick);
	
		List<Member> list = memberService.duplCheck(param, value);
		
		if( list.size() == 0) {
			System.out.println("중복 없음 - 사용가능");
			return "success";
		} else {
			if( "nickname".equals(param)) {
				if( value.equals(orgNick) ) {
					System.out.println("기존 값과 동일 - 사용가능");
					return "success";
				} else {
					System.out.println("중복 - 사용불가");
					return "false";
				}
			}
			
			System.out.println(" 리턴 펄스 ");
			return "false";
		}
	}
	
	
	
}
