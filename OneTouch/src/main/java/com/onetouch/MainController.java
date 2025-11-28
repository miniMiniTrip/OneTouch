package com.onetouch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onetouch.service.HashtagService;
import com.onetouch.vo.HashtagVo;

@Controller
public class MainController {
	@Autowired
	HashtagService hashtagService;
	
	@RequestMapping("/")
	public String oneTouchIndex() {
		System.out.println("	[oneTouchMain] oneTouchIndex()");
		
		System.out.println("	[oneTouchMain] return : index.html ");
		return "index";
	}
	
	@RequestMapping("main")
	public String oneTouchMain(Model model) {
		System.out.println("	[oneTouchMain] oneTouchMain()");
		
		List<HashtagVo> hashtagRank=hashtagService.updatePostProductHashtagTotalConut();
		
		model.addAttribute("hashtagRank", hashtagRank);
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
	
	@RequestMapping("/test/mypage")
	public String myPage()	{
		return "test/mypage_template";
	}

	@RequestMapping("/test/order_list")
	public String orderList()	{
		return "test/order_list_example";
	}
	
	
}
