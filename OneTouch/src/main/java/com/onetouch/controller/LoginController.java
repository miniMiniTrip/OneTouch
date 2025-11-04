package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
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
	@RequestMapping("/user/register")
	public String register() {
		System.out.println("	[LoginController] user() ");
		
		System.out.println("	[LoginController] return : user/register.jsp ");
		return "user/register";
		
	}
}
