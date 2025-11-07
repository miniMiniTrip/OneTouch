package com.onetouch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.CategoryVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;

@Controller
public class ProductController {

  
  @Autowired
  ProductDao product_dao;
  
  @Autowired
  CategoryDao category_dao;
  
  @Autowired
  ServletContext application;

    // 회원등록리스트
    @RequestMapping("/about")  
    public String list_admin(@RequestParam(name="category_idx",defaultValue = "0")int category_idx,Model model){

    		List<CategoryVo> category_list = category_dao.selectList();
    		List<ProductVo> product_list =	product_dao.selectList(category_idx);
    		
    		model.addAttribute("category_list",category_list);
    		model.addAttribute("product_list",product_list);
    		System.out.println("	[ProductController] product/product_list_admin.jsp ");
    	return "product/product_list_admin";
    }
    
    
    ///view.do?product_idx=1  -> 현재 소개에서 상품등록 클릭시
    
    
    
    
    
    
    
    
 }//end:Productcontroller


