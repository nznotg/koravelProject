package com.koravel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인이 필수적인 페이지들을 위한 로그인처리(마이페이지, 게시글 작성 등등)
// 로그인처리를 위한 인터셉터(만약 로그인하지않고 접속시 요청url이 아닌 로그인url 호출)
// HandlerInterceptorAdapter 추상 클래스 -> 인터페이스를 사용하기 쉽게 구현해 놓은 추상 클래스
public class interceptor extends HandlerInterceptorAdapter{

	protected Log log = LogFactory.getLog(interceptor.class);
	
	@Override
	// Controller로 요청이 들어가기 전에 수행!
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception{
		if(log.isDebugEnabled()) {
			log.debug("=============== start ==============");
			
		}
		HttpSession session = request.getSession(); // 세션 객체를 가져온다
		Object obj = session.getAttribute("usrID"); // login처리를 위한 사용자 정보를 담고 있는 객체
		try {
			if(obj == null) {
				response.sendRedirect(request.getContextPath() + "/userLogin.do");
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	// 컨트롤러의 메서드의 처리가 끝나 return되고 화면을 띄워주는 처리가 되기 직전에 이 메서드가 수행
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("======================= End ================");
		}
		super.postHandle(request, response, handler, modelAndView);
	}
}
