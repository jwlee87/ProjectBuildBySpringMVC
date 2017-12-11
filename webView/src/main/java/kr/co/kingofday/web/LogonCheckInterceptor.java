package kr.co.kingofday.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

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
		
		Member admin = (Member)WebUtils.getSessionAttribute(request, "admin");
		Member user = (Member)WebUtils.getSessionAttribute(request, "member");
		
		logger.debug(" == sessionId="+WebUtils.getSessionId(request)+" IP= "+request.getRemoteAddr());		
		//세션 널
		if(admin == null) {
			if(user != null) {
				logger.debug(" == user access ==");
				logger.debug(" == Interceptor true ==");
				logger.debug(" [LogonCheckInterceptor END] ");
				return true;
			} else {
				logger.debug(" == Interceptor false ==");
				logger.debug(" [LogonCheckInterceptor END] ");
				response.sendRedirect("/admin/login/login");
				return false;
			}
		} else if (admin.getAdmin() != 0) {
			if(user != null) {
				logger.debug(" == user access ==");
				logger.debug(" == Interceptor true ==");
				logger.debug(" [LogonCheckInterceptor END] ");
				return true;
			} else {
				logger.debug(" == admin access ==");
				logger.debug(" == Interceptor true ==");
				logger.debug(" [LogonCheckInterceptor END] ");
				return true;
			}
		} else {
			if(user != null) {
				logger.debug(" == user access ==");
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
}
