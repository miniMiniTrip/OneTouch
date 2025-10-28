package com.onetouch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String oneTouchMain() {
		System.out.println("	[oneTouchMain] ");
		
		System.out.println("	[oneTouchMain] return : index.jsp ");
		return "index";
	}
	
	@RequestMapping("/cart/cart.do")
	public String cart() {
		System.out.println("	[oneTouchMain] cart() ");
		
		System.out.println("	[oneTouchMain] return : cart.jsp ");
		return "cart/cart";
	}
	
	
	

}
