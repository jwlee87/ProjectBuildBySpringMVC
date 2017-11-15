package kr.co.playground.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.playground.service.MemberService;

@Controller
@RequestMapping("/web/ask/*")
public class AskController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	///Constructor
	public AskController() {
		System.out.println(this.getClass());
	}
	///Method
	@RequestMapping(value="/admin")
	public String admin(Model model) throws Exception {
		System.out.println("/web/ask/admin == ");
		return "";
	}
	
	@RequestMapping(value="/login")
	public String login(Model model) throws Exception {
		System.out.println("/web/ask/login == ");
		return "";
	}
}
