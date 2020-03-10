package com.example.game.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	//controller호출전 실행되는 메소드. 매개변수 obj는 dispatcher의  handlerMapping이 찾아준 controller의 메소드를 참조할수 있는 HandlerMethod객체.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")==null) {
			response.sendRedirect(request.getContextPath()+"/user/login.do?message=no_Login");
			return false;
		}else {
			return true;
		}
	}
	
	//controller 실행 후 실행. preHandle이 false였을 경우에는 실행되지않음
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
