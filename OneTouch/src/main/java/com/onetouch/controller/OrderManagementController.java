package com.onetouch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class OrderManagementController {

	@GetMapping("/order/management")
	public String ordermanagementString() {
		return "admin/order_management";
	}
	
}
