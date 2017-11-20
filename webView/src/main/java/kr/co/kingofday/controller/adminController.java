package kr.co.kingofday.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import kr.co.kingofday.common.CommonGenerator;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.service.MemberService;

@Controller
public class adminController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	private CommonGenerator commonGenerator;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public adminController() {
		logger.info(this.getClass());
	}
	///Method
	@RequestMapping(value="/admin")
	public String admin(Model model) throws Exception {
		logger.debug("== index == ");
		return "redirect:/admin/index.jsp";
	}
	
	@RequestMapping(value="/admin/login")
	public String adminLogin(HttpSession session, HttpServletRequest request, @ModelAttribute Member member) throws Exception {
		logger.debug(" [/admin/login] == login checking == ");
		logger.debug(" [/admin/login] member=? "+member);
		if(member.getId() != null) {
			Member loginMember = memberService.getMemberByID(member.getId());
			if(loginMember.getUniqueID() != 0) {
				if(loginMember.getAdmin() != 0) {
					WebUtils.setSessionAttribute(request, "admin", loginMember);
					logger.info(" [login] - [sessionId:"+session.getId()+"], [ip:"+request.getRemoteAddr()+"]");
				}
			}
		}
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/admin/login/login")
	public void login(Model model) throws Exception {
		logger.debug(" [/admin/login/login] == login Page == ");
	}
	
	@RequestMapping(value="/admin/logout")
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		logger.info(" [logout] - [sessionId:"+session.getId()+"], [ip:"+request.getRemoteAddr()+"]");
		session.invalidate();
		logger.debug(" [/admin/logout] == logout == ");
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/web/ask")
	public String ask1on1(HttpSession session, @RequestParam("uu") String uniqueId) throws Exception {
		String userNo = uniqueId.substring(0, 2);
		int uu = Integer.parseInt(userNo);
		Member member = memberService.getMemberByUniqueID(uu);
		String uri = commonGenerator.makingReturnWebViewURI(member.getCountryCode());
		uri += "1on1";
		logger.debug(" [ask1on1] returnURI= "+uri);
		return uri;
	}
}
