package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCotroller {
	
	//관리자페이지 열기
	@RequestMapping("/adminpage")
	public String adminPage() {
		return "/admin/admin_page";
	}
}
