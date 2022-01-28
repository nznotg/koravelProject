package com.koravel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.koravel.domain.UsrVO;
import com.koravel.service.UsrService;

@SessionAttributes("usrNick")
@Controller
@RequestMapping("/usr")
public class UsrController {

	@Autowired
	UsrService usrService;

	@RequestMapping("{step}.do")
	public String step(@PathVariable String step) {
		return "/usr/" + step;
	}

//	UsrJoin
//	------------------------------------------------------------------
	@RequestMapping("usrInsert.do")
	public ModelAndView usrInsert(UsrVO vo) throws Exception {
		String message = "가입 실패하였습니다.";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/usr/usrJoin_ok");

		UsrVO checkID = usrService.idCheck(vo); // 중복 IDCheck
		if(checkID != null ) {
			mv.addObject("message",message);
			return mv;
		}
		UsrVO checkEmail = usrService.emailCheck(vo); // 중복 EmailCheck
		if(checkEmail != null ) {
			mv.addObject("message",message);
			return mv;
		}
		int result = usrService.usrInsert(vo);
		if(result ==1) message = "가입을 축하드립니다.";//result ==1 why 1query ok
		
		mv.addObject("message",message);
//		return "redirect:userJoin_ok.do";
		return mv;
	}

//	UsrLogin
//	----------------------------------------------------------------------
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(UsrVO vo, HttpServletRequest request, Model model) {
		UsrVO result = usrService.idCheck(vo);
		String message = "로그인 실패하였습니다.";
		
		if (result.getUsrPasswd().equals(vo.getUsrPasswd())) {
			HttpSession session = request.getSession();
			message = "로그인에 성공하였습니다.";
			model.addAttribute("usrNick", result);
			System.out.println(result);
		}
		
		System.out.println(vo.getUsrPasswd() + "----" + result.getUsrPasswd());
		ModelAndView mv = new ModelAndView();
		
		
		mv.addObject("message", message);
		
		if (message == "로그인 실패하였습니다.") {
			mv.setViewName("usr/usrLogin");
			return mv;
		}
		mv.setViewName("Main");
		
		
		return mv;
		// 마이페이지 진행을 위한 임시 코드
	}

//	IDCheck
//	--------------------------------------------------------------------

	@RequestMapping(value = "idCheck.do", produces = "application/text; charset=UTF-8")
	@ResponseBody // 비동기통신을 의
	public String idCheck(UsrVO vo) {
		UsrVO result = usrService.idCheck(vo);
		String message = "사용가능한 아이디 입니다";
		if (result != null)
			message = "존재하는 아이디입니다.";
		return message;
	}
	
//	emailCheck
//	--------------------------------------------------------------------
	@RequestMapping(value="emailCheck.do",produces="application/text; charset=UTF-8")
	@ResponseBody //비동기통신을 의미 
	public String emailCheck(UsrVO vo) {
		UsrVO result = usrService.emailCheck(vo);
		String message = "사용가능한 이메일 입니다";
		if(result != null ) message = "존재하는 이메일입니다.";
		if(vo.getUsrEmail()=="") message = "이메일을 입력해주세요.";
		return message;
	}
	
// logOut
// ================================================================================
	@RequestMapping(value="usrLogout.do", method = RequestMethod.GET)
	public String logOut(HttpSession session) throws Exception{
		System.out.println("로그아웃 실행");
		
		session.invalidate();
		
		return "Main";
	}
	

}
