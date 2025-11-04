package com.onetouch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.onetouch.dao.ProductDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao productdao;
	
	@Autowired
	HttpSession sesstion;
	
	public String list() {
		
		return"";
		
	};
	
	


}//end : ProductController
