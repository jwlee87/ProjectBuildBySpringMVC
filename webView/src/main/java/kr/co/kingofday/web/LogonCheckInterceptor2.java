package kr.co.kingofday.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.kingofday.domain.Member;
import kr.co.kingofday.service.MemberService;


public class LogonCheckInterceptor2 extends HandlerInterceptorAdapter {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public LogonCheckInterceptor2(){
		logger.info("\n [web] :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			@ModelAttribute Member member) throws Exception {
		
		logger.debug("\n[ LogonCheckInterceptor start........]");
		
		try {
			if(request.getSession().getAttribute("admin") == null ) {
				logger.debug("[ LogonCheckInterceptor false end........]\n");
				response.sendRedirect("/web/ask/login");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("[ LogonCheckInterceptor true end........]\n");
		return true;
		
		/*if(member != null)  {
		  
			String uri = request.getRequestURI();
			logger.debug("checked user:"+uri);
			logger.debug("[ ... ]");
			logger.debug("[ LogonCheckInterceptor true end........]\n");
			return true;
			
		}else{ 
			String uri = request.getRequestURI();
			logger.debug("not checked user"+uri);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			logger.debug("[ ... ]");
			logger.debug("[ LogonCheckInterceptor false end........]\n");
			return false;
		}*/
	}
}//end of class