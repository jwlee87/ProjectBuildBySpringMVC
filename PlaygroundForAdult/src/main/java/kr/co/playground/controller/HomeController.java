package kr.co.playground.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.playground.domain.Member;
import kr.co.playground.service.MemberService;

@Controller
public class HomeController {
	
	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	public HomeController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="/", method=RequestMethod.GET )
	public String goMain(HttpServletRequest request, HttpServletResponse response,
				HttpSession session, @ModelAttribute("member") Member member) throws Exception {
		
		System.out.println("\n  :: HomeController :: / : GET goMain 1111");
		//Business Logic
		List<Member> memberList = memberService.getMember();
		
		System.out.println("홈 컨트롤러 디버깅 memberList= "+memberList);
		
		session.setAttribute("memberSize", String.valueOf(memberList.size()));
		
		return "forward:/index.jsp";
	}
	
}