package com.onetouch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.ProductService;
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
    
    @Autowired
    ProductService productService;
    
    

    // 상품 리스트 페이지
    @RequestMapping("/product/list")
    public String productList(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "category", required = false) String category,
            @RequestParam(name = "sort", required = false, defaultValue = "popular") String sort,
            @RequestParam(name = "page", defaultValue = "1") int currentPage,
            Model model) {
        
        System.out.println("=== [ProductController] productList() 시작 ===");
        System.out.printf("keyword: %s, category: %s, sort: %s, page: %d\n", 
                         keyword, category, sort, currentPage);
        
        Map<String, Object> map = new HashMap<>();
        
        int pageSize = MyConstant.Product.BLOCK_LIST;
        int startRow = (currentPage - 1) * pageSize;
        map.put("startRow", startRow);
        map.put("pageSize", pageSize);
        
        // 검색 조건 추가
        if (keyword != null && !keyword.trim().isEmpty()) {
            map.put("keyword", keyword.trim());
        }
        
        // 카테고리 필터 추가
        if (category != null && !category.trim().isEmpty()) {
            map.put("category_idx", category.trim());
        }
        
        // 정렬 조건 추가
        switch (sort) {
            case "newest":
                map.put("orderBy", "product_time DESC");
                break;
            case "price-low":
                map.put("orderBy", "product_price ASC");
                break;
            case "price-high":
                map.put("orderBy", "product_price DESC");
                break;
            case "rating":
                map.put("orderBy", "product_idx DESC");
                break;
            default: // popular
                map.put("orderBy", "product_cnt DESC, product_idx DESC");
                break;
        }
        
        // 데이터 조회
        int totalCount = product_dao.selectCount(map);
        List<ProductVo> list = product_dao.selectList(map);
        
        // 페이징 정보 계산
        int totalPage = (int) Math.ceil((double) totalCount / MyConstant.Product.BLOCK_LIST);
        int pageBlock = MyConstant.Product.BLOCK_PAGE;
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int endPage = Math.min(startPage + pageBlock - 1, totalPage);
        
        System.out.printf("조회된 상품 수: %d, 총 페이지: %d\n", list.size(), totalPage);
        
        // 모델에 데이터 추가
        model.addAttribute("list", list);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
        model.addAttribute("sort", sort);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        System.out.println("=== [ProductController] return product/product_list ===");
        return "product/product_list";  
    }
    
    // 상품 상세 페이지
    @GetMapping("/product/detail")
    public String productDetail(@RequestParam("id") int product_idx, Model model) {
        System.out.printf("=== [ProductController] 상품 상세 조회: %d ===\n", product_idx);

        ProductVo product = product_dao.selectOne(product_idx);
        //이미지 강제로 조회
        
        String imageUrl = product_dao.selectMainImage(product_idx);
        product.setProduct_image_url(imageUrl);
        
        System.out.println("강제 설정한 이미지: " + imageUrl);
        System.out.println("조회된 상품: " + product.getProduct_name());
        System.out.println("이미지 URL: " + product.getProduct_image_url());
        
        List<String> lowerdetailImages = product_dao.selectLowerDetailImages(product_idx);
        List<String> upperdetailImages = product_dao.selectUpperDetailImages(product_idx);
        System.out.println("디테일 이미지 개수: " + lowerdetailImages.size());
	
        for(String detail : lowerdetailImages) {
        	System.out.println("[" + detail +"]");
        }
	
        System.out.printf("상세페이지 이미지 => %s\n",lowerdetailImages);
        System.out.printf("상세페이지 이미지 => %s\n",upperdetailImages);
        System.out.printf("상세페이지 product => %s\n",product);
        model.addAttribute("product", product);
        model.addAttribute("upperdetailImages", upperdetailImages); 
        model.addAttribute("lowerdetailImages", lowerdetailImages); 
        return "product/product_detail";
   }
    
   

    
    
    
    
}//end
