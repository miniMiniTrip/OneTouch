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
  public String list_admin( //관리자가 보는 리스트
	        @RequestParam(name="category_idx", defaultValue = "0") int category_idx,
	        //상품명 검색어를 받기 위해 추가
	        @RequestParam(name="search_keyword", defaultValue = "") String keyword, 
	        Model model
	    ) {

	        // 상품 목록 조회 (category_idx와 keyword를 모두 전달)
	        // 기존 코드: List<ProductVo> product_list = product_dao.selectList(category_idx);
	        List<ProductVo> product_list = product_dao.selectList(category_idx, keyword);
	        
	        // 검색 조건 유지: JSP의 검색 폼에 현재 필터 값을 유지하기 위해 모델에 추가
	        model.addAttribute("category_list", category_dao.selectList()); // 카테고리 목록
	        model.addAttribute("productList", product_list); // 상품 목록
	        
	        // JSP의 검색 폼에 현재 검색 조건을 그대로 유지하기 위해 추가
	        model.addAttribute("current_category", category_idx);
	        model.addAttribute("current_keyword", keyword);
	        
	        System.out.println("    [ProductController] product/product_list_admin.jsp - Category: " + category_idx + ", Keyword: " + keyword);
	        
	        return "product/product_list_admin";
	    }
    
    
    //상품보기
    @RequestMapping("/product/view.do")
	public String view(int product_idx,Model model) {
		
			List<CategoryVo> category_list	= category_dao.selectList();
			
			ProductVo vo = product_dao.selectOne(product_idx);
				
			// request binding
			model.addAttribute("vo", vo);
			model.addAttribute("category_list", category_list);
			System.out.println("	[ProductController] product/product_content.jsp ");	
		
		return "product/product_content";
	}
    
	//상품등록폼띄우기
	@RequestMapping("/product/insert_form.do")
	public String insert_form(Model model) {
		
		List<CategoryVo> category_list	= category_dao.selectList();
		
		model.addAttribute("category_list", category_list);
		
		return "product/product_insert_form";
	}
	
	
    
    
    
    
    
    
 }//end:Productcontroller


