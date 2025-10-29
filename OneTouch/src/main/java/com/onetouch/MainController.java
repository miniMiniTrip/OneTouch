package com.onetouch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String oneTouchIndex() {
		System.out.println("	[oneTouchMain] ");
		
		System.out.println("	[oneTouchMain] return : index.html ");
		return "index";
	}
	
	@RequestMapping("main")
	public String oneTouchMain() {
		System.out.println("	[oneTouchMain] ");
		
		System.out.println("	[oneTouchMain] return : main.jsp ");
		return "main";
	}
	
	@RequestMapping("/cart/cart")
	public String cart() {
		System.out.println("	[oneTouchMain] cart() ");
		
		System.out.println("	[oneTouchMain] return : cart.jsp ");
		return "cart/cart";
	}
	
	//==========결제	
	
	@RequestMapping("/order/checkout")
	public String checkout() {
		System.out.println("	[oneTouchMain] order() ");
		
		System.out.println("	[oneTouchMain] return : checkout.jsp ");
		return "order/checkout";
	}

	@RequestMapping("/order/order_fail")
	public String orderFail() {
		System.out.println("	[oneTouchMain] order() ");
		
		System.out.println("	[oneTouchMain] return : orderFail.jsp ");
		return "order/order_fail";
	}
	
	@RequestMapping("/order/order_success")
	public String orderSuccess() {
		System.out.println("	[oneTouchMain] order() ");
		
		System.out.println("	[oneTouchMain] return : orderSuccess.jsp ");
		return "order/order_success";
	}
	
	//==========상품
	
	@RequestMapping("/product/product_list")
	public String productList() {
		System.out.println("	[oneTouchMain] product() ");
		
		System.out.println("	[oneTouchMain] return : product_list.jsp ");
		return "product/product_list";
	}
	
	//==========계정
	
	
	@RequestMapping("/user/login")
	public String login() {
		System.out.println("	[oneTouchMain] user() ");
		
		System.out.println("	[oneTouchMain] return : login.jsp ");
		return "user/login";
	}
	
	@RequestMapping("/user/find_password")
	public String findPassword() {
		System.out.println("	[oneTouchMain] user()");
		
		System.out.println("	[oneTouchMain] return : find_password.jsp ");
		return "user/find_password";
		
	}

	@RequestMapping("/user/reset_password")
	public String resetPassword() {
		System.out.println("	[oneTouchMain] user() ");
		
		System.out.println("	[oneTouchMain] return : reset_password.jsp ");
		return "user/reset_password";
		
	}
	@RequestMapping("/user/register")
	public String register() {
		System.out.println("	[oneTouchMain] user() ");
		
		System.out.println("	[oneTouchMain] return : register.jsp ");
		return "user/register";
		
	}
	
	
}
