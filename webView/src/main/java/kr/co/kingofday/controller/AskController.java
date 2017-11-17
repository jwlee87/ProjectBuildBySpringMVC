package kr.co.kingofday.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kingofday.service.MemberService;

@Controller
@RequestMapping("/web/ask/*")
public class AskController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AskController() {
		logger.info(this.getClass());
	}
	///Method
	@RequestMapping(value="/admin")
	public String admin(Model model) throws Exception {
		logger.debug("/web/ask/admin == ");
		return "";
	}
	
	@RequestMapping(value="/login")
	public String login(Model model) throws Exception {
		logger.debug("/web/ask/login == ");
		return "";
	}
}
