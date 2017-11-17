package kr.co.kingofday.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
		
		logger.debug("/n [LogonCheckInterceptor START] ");
		return true;
	}
}
