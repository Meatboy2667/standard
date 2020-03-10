package com.example.game.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.game.model.user.dto.UserDTO;
import com.example.game.service.user.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@RequestMapping("login.do") //로그인 페이지 이동
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("signUp.do")
	public String signup() {
		return "user/signUp";
	}
	
	@RequestMapping("loginChk.do")
	public ModelAndView loginChk(UserDTO dto, HttpSession session) throws Exception {
		boolean result = userService.loginChk(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.setViewName("index");
		}else {
			mav.setViewName("user/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		userService.logout(session);
		mav.setViewName("user/login");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("create.do")
	public String create(UserDTO dto) throws Exception {
		userService.create(dto);
		return "redirect:/user/login.do";
	}
}
