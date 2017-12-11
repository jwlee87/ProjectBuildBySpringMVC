package kr.co.kingofday.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.kingofday.common.CommonGenerator;
import kr.co.kingofday.domain.Answer;
import kr.co.kingofday.domain.Ask;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.News;
import kr.co.kingofday.domain.SearchNDB;
import kr.co.kingofday.service.AdminService;
import kr.co.kingofday.service.MemberService;
import kr.co.kingofday.service.NewsService;

@Controller
public class AdminController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	@Autowired
	@Qualifier("newsServiceImpl")
	private NewsService newsService;
	
	@Autowired
	private CommonGenerator commonGenerator;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public AdminController() {
		logger.info(this.getClass());
	}
	///Method
	@RequestMapping(value="/admin")
	public String admin(HttpServletRequest request) throws Exception {
		Member member = (Member)WebUtils.getSessionAttribute(request, "admin");
		logger.debug("== index == ");
		logger.debug(" [/admin/login/login] == member= "+member);
		if(member == null) {
			return "redirect:/admin/login/login.jsp";
		} else if(member.getAdmin() != 0) {
			return "redirect:/admin/index.jsp";
		}else {
			return "redirect:/admin/login/login.jsp";
		}
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
	public void login(HttpServletRequest request) throws Exception {
		logger.debug(" [/admin/login/login] == login Page == ");
	}
	
	@RequestMapping(value="/admin/logout")
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		logger.info(" [logout] - [sessionId:"+session.getId()+"], [ip:"+request.getRemoteAddr()+"]");
		session.invalidate();
		logger.debug(" [/admin/logout] == logout == ");
		return "redirect:/admin";
	}
	
	// 어플에서 접속
	@RequestMapping(value="/web/ask/{uu}")
	public String ask1on1(HttpSession session, HttpServletRequest request
			, @PathVariable String uu) throws Exception {
		
		Device device = DeviceUtils.getCurrentDevice(request);
		String userNo = uu.substring(0, 2);
		int un = Integer.parseInt(userNo);
		Member member = memberService.getMemberByUniqueID(un);
		request.getSession(false).setAttribute("member", member);
		String uri = commonGenerator.makingReturnWebViewURI(member.getCountryCode());
		uri += "1on1";
		
		if(device.isMobile()) {
			
			logger.debug(" [ask1on1] returnURI= "+uri);
			logger.debug(" [ask1on1] sessionId= "+session.getId()+", session['member']= "+session.getAttribute("member"));
			return uri;
		} else {
			return uri;
		}
	}
	
	@RequestMapping(value="/ask/write")
	public String askWrite(@ModelAttribute Ask ask, Model model) throws Exception {
		
		Member member = memberService.getMemberByID(ask.getWriter());
		ask.setMemberUniqueNo(member.getUniqueID());
		ask.setCountryCode(member.getCountryCode());
		
		logger.debug(" == input Ask debug="+ask);
		adminService.addAsk(ask);
		
		return null;
	}
	
	@RequestMapping(value="/admin/pages/askList")
	public void askList(HttpServletRequest request, @ModelAttribute Member member, Model model) throws Exception {
		member = (Member)WebUtils.getSessionAttribute(request, "admin");
		ArrayList<Ask> list = adminService.selectAskListForAllUsers();
		model.addAttribute("list", list);
		logger.debug(" [/admin/pages/askList] debug member= "+member);
	}
	
	@RequestMapping(value="/admin/pages/answer")
	public void answer(HttpServletRequest request, @ModelAttribute Member member, Model model
				,@ModelAttribute Ask ask, @RequestParam("an") int an) throws Exception {
		logger.debug(" askUniqueNo= "+an);
		member = (Member)WebUtils.getSessionAttribute(request, "admin");

		ask = adminService.getAskByNo(an);
		Member user = memberService.getMemberByUniqueID(ask.getMemberUniqueNo());
		
		model.addAttribute("user", user);
		model.addAttribute("ask", ask);
	}
	
	@RequestMapping(value="/ask/answer/write", method=RequestMethod.POST)
	public String addAnswer(HttpServletRequest request, @ModelAttribute Answer answer) throws Exception {
		
		logger.debug(" Answer answer= "+answer);
		
		adminService.updateAskType(answer.getAskUniqueNo());
		adminService.addAnswer(answer);
		
		return "redirect:/admin/pages/askList";
	}
	
	@RequestMapping(value="/admin/pages/answerList")
	public void answerList(HttpServletRequest request, @ModelAttribute Member member, Model model) throws Exception {
		member = (Member)WebUtils.getSessionAttribute(request, "admin");
		ArrayList<Ask> list = adminService.selectAskListForAllUsersAnswered();
		model.addAttribute("list", list);
		logger.debug(" [/admin/pages/askList] debug member= "+member);
	}
	
	@RequestMapping(value="/admin/answer/{uniqueNo}", method=RequestMethod.GET)
	public String answerDetail(HttpSession session, @PathVariable int uniqueNo, Model model) throws Exception {
		
		Ask ask = adminService.getAskByNo(uniqueNo);
		Member user = memberService.getMemberByUniqueID(ask.getMemberUniqueNo());
		ArrayList<Answer> list = adminService.getAnswerListForAnAsk(ask.getUniqueNo());
		
		model.addAttribute("ask", ask);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		
		logger.debug("list디버깅= "+list);
		logger.debug("ask디버깅= "+ask);
		logger.debug("user디버깅= "+user);
		
		return "admin/pages/answered";
	}
	
	@RequestMapping(value="/admin/{memberNo}/askList", method=RequestMethod.GET)
	public String memberAskList(HttpSession session, Model model
			, @PathVariable int memberNo) throws Exception {
		
		logger.debug(" debug= "+memberNo);
		Member member = memberService.getMemberByUniqueID(memberNo);
		ArrayList<Ask> list = adminService.selectAskListForAnUser(memberNo);
		
		model.addAttribute("user", member);
		model.addAttribute("list", list);
		
		return "webView/view/kr/myAskList";
	}
	
	@RequestMapping(value="/admin/pages/myAskDetail/{askNo}", method=RequestMethod.GET)
	public String myAskDetail(@PathVariable int askNo, Model model) throws Exception {
		
		Ask ask = adminService.getAskByNo(askNo);
		Member user = memberService.getMemberByUniqueID(ask.getMemberUniqueNo());
		ArrayList<Answer> list = adminService.getAnswerListForAnAsk(ask.getUniqueNo());
		
		model.addAttribute("ask", ask);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		
		return "admin/pages/myAskDetail";
	}
	
	@RequestMapping(value="/admin/delete/{askNo}", method=RequestMethod.GET)
	public String deleteAsk(@PathVariable int askNo) throws Exception {
		
		Ask ask = adminService.getAskByNo(askNo);
		int userNo = ask.getMemberUniqueNo();
		
		adminService.deleteAnswer(askNo);
		adminService.deleteAsk(askNo);
		
		return "forward:/admin/"+userNo+"/askList";
	}
	
	@RequestMapping(value="/admin/news/list/{page}")
	public String newsList(Model model, @PathVariable int page) throws Exception {
		News n1 = newsService.getTotalCount();
		int totalCount = n1.getTotalCount();
		SearchNDB search = new SearchNDB(page, totalCount, 5, 10);
		search.setTotalCount(totalCount);
		ArrayList<News> list = newsService.getNewsList(search);
		
		model.addAttribute("pageResult", search);
		model.addAttribute("list", list);
		
		return "admin/pages/newsList";
	}
	
	@RequestMapping(value="admin/news/detail/{page}/{no}")
	public String newsDetail(Model model, @PathVariable int page, @PathVariable int no) throws Exception {
		News news = newsService.getNews(no);

		logger.debug("news.content= "+news.getContent());
		//String cleanContent = XssPreventer.escape(news.getContent());
		//logger.debug("news.cleanContent= "+cleanContent);
		//String a = "<p>내용을 입력하세요.</p>";
		//news.setContent(cleanContent);
		
		model.addAttribute("news", news);
		model.addAttribute("page", page);
		return "admin/pages/newsDetail";
	}
	
	//Create
	@RequestMapping(value="/admin/news/write")
	public String newsWrite(@ModelAttribute News news) throws Exception {
		newsService.addNews(news);
		return "forward:/admin/news/list/1";
	}
	//Update
	@RequestMapping(value="/admin/news/update")
	public String newsUpdate(@ModelAttribute News news) throws Exception {
		
		logger.debug("제목= "+news.getTitle()+", 내용= "+news.getContent());

		newsService.updateNews(news);
		return "forward:/admin/news/list/1";
	}
	//Delete
	@RequestMapping(value="/admin/news/delete/{uniqueID}")
	public String newsDelete(@PathVariable int uniqueID, @ModelAttribute News news) throws Exception {
		news = newsService.getNews(uniqueID);
		newsService.deleteNews(news);
		return "forward:/admin/news/list/1";
	}
	
	@RequestMapping(value="/admin/news/update/{page}/{uniqueID}")
	public String updateNews(@PathVariable int uniqueID, Model model,
			@PathVariable int page) throws Exception {
		News news = newsService.getNews(uniqueID);
		model.addAttribute("news", news);
		model.addAttribute("page", page);
		logger.debug("content= "+news.getContent());
		return "admin/pages/updateNews";
	}
	
}
