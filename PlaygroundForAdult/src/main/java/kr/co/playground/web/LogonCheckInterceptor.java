package kr.co.playground.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.playground.domain.Member;
import kr.co.playground.service.MemberService;


public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\n [web] :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
			HttpServletResponse response, Object handler,
			@ModelAttribute Member member) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		String id = request.getParameter("id");
		memberService.getMemberByID(id);
		
		if(member != null)  {
		  
			String uri = request.getRequestURI();
			System.out.println("checked user:"+uri);
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor true end........]\n");
			return true;
			
		}else{ 
			String uri = request.getRequestURI();
			System.out.println("not checked user"+uri);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor false end........]\n");
			return false;
		}
	}
}//end of class