package com.onetouch.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onetouch.service.MemService;
import com.onetouch.vo.MemVo;

@Controller
public class LoginController {
	
	@Autowired
	MemService memService;
	
	//==========계정
	
	
	@RequestMapping("/user/login")
	public String login() {
		System.out.println("	[LoginController] user() ");
		
		System.out.println("	[LoginController] return : user/login.jsp ");
		return "user/login";
	}
	
	@RequestMapping("/user/find_password")
	public String findPassword() {
		System.out.println("	[LoginController] user()");
		
		System.out.println("	[LoginController] return : user/find_password.jsp ");
		return "user/find_password";
		
	}

	@RequestMapping("/user/reset_password")
	public String resetPassword() {
		System.out.println("	[LoginController] user() ");
		
		System.out.println("	[LoginController] return : user/reset_password.jsp ");
		return "user/reset_password";
		
	}
	
	/* 회원가입 컨트롤러 */
	@RequestMapping("/user/register")
	public String register() {
		System.out.println("	[LoginController] user() ");
		
		
		
		System.out.println("	[LoginController] return : user/register.jsp ");
		return "user/register";
		
	}
	
	/* 아이디 중복 체크 */
	@RequestMapping("/user/idCheck")
	@ResponseBody
	public Map<String,Object> idCheck(int id) {
		Map<String,Object> map = new HashMap<String, Object>();
		//MemVo memVo=memService.idCheck();
		map.put("idCheck", id==id );
		return map;
	}
		
	
	
}
