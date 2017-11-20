package kr.co.kingofday.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.kingofday.domain.Member;
import kr.co.kingofday.service.MemberService;

public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public LogonCheckInterceptor() {
		logger.info(this.getClass());
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		logger.debug(" [LogonCheckInterceptor START] ");
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("admin");
		
		logger.debug(" == session="+session+" member="+member+" == ");
		
		//세션 널
		if(member == null) {
			logger.debug(" == Interceptor false ==");
			logger.debug(" [LogonCheckInterceptor END] ");
			response.sendRedirect("/admin/login/login");
			return false;
		} else if (member.getAdmin() != 0) {
			logger.debug(" == Interceptor true ==");
			logger.debug(" [LogonCheckInterceptor END] ");
			return true;
		} else {
			logger.debug(" == Interceptor false ==");
			logger.debug(" [LogonCheckInterceptor END] ");
			response.sendRedirect("/admin/login/login");
			return false;
		}
		
	}
}
