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

@Controller
public class ProductController {

  
  @Autowired
  ProductDao product_dao;
  
  @Autowired
  CategoryDao category_dao;

    //  등록 폼 + 목록
    @RequestMapping("/about")  
    public String list_admin(@RequestParam(name="category_idx",defaultValue = "0")int category_idx,Model model){

    		List<CategoryVo> category_list = category_dao.selectList();
    		List<ProductVo> product_list =	product_dao.selectList(category_idx);
    		
    		model.addAttribute("category_list",category_list);
    		model.addAttribute("product_list",product_list);
    		
    	return "product/product_list_admin";
    }
 }//end:Productcontroller


