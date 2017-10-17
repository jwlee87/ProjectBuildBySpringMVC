package kr.co.playground.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.playground.domain.Member;


/*
 * FileName : LogonCheckInterceptor.java
 *    
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\n [Common] :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
														HttpServletResponse response, 
														Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		HttpSession session = request.getSession(true);
		
		Member member = (Member)session.getAttribute("member");
		Member member1 = (Member)session.getAttribute("faceMember");
		
		if(   member != null ||member1 !=null   )  {
		  
			String uri = request.getRequestURI();
			System.out.println("유저값이 널이아닐때:"+uri);
			/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if(		uri.indexOf("addMemberView") != -1 	|| 	uri.indexOf("addMember") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
			
			if(		uri.indexOf("addMember") != -1 ||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ||uri.indexOf("main") != -1 ){
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				System.out.println("[ .... ]");
				System.out.println("[ LogonCheckInterceptor  false end........]\n");
				return false;
			}
			
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor true end........]\n");
			return true;
		}else{ 
			String uri = request.getRequestURI();
			System.out.println("member값이 널일때:"+uri);
			/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if(		uri.indexOf("addMemberView") != -1 	|| 	uri.indexOf("addMember") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
			if(uri.indexOf("emailok") != -1 ||uri.indexOf("findPwd") != -1 || uri.indexOf("emailKey") != -1 ||uri.indexOf("emailCheck") != -1 ||uri.indexOf("botPage") != -1 ||	uri.indexOf("getJsonBot") != -1 ||	uri.indexOf("addMember") != -1 ||	uri.indexOf("login") != -1  ||	uri.indexOf("checkDuplication") != -1 || uri.indexOf("facebook") != -1 || uri.indexOf("updateMember") != -1){
				
				System.out.println("[... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return false;
		}
	}
}//end of class