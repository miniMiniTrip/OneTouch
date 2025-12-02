package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PolicyController {
	
	// 개인정보처리방침 페이지
    @GetMapping("/privacy")
    public String privacy() {
    	System.out.println("privacy 컨트롤러");
        return "/common/privacy";  // privacy.jsp로 이동
    }
    
    // 이용약관 페이지  
    @GetMapping("/terms")
    public String terms() {
    	System.out.println(" terms 컨트롤러 호출"); 
        return "/common/terms";    // terms.jsp로 이동
    }
	

}//end: PolicyController
