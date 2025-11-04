package com.onetouch.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.service.ProductService;
import com.onetouch.vo.ProductVo;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    //  등록 폼 + 목록
    @GetMapping("/product/insert_form")
    
    public String product_insert_form(Model model) {
    	
    	System.out.println("==product_insert_form==");
    	
        model.addAttribute("list", productService.selectList());
        
        return "product/product_insert_form";
    }

  //  등록 처리
    @PostMapping("/product/insert")
    public String product_insert(
            @ModelAttribute ProductVo productvo,
            @RequestParam(value = "product_image", required = false) MultipartFile file,
            Model model) throws IOException {
        		
        
        System.out.println("test");
        System.out.println("DEBUG: category_idx is -> " + productvo.getCategory_idx());
        
        
        if (file != null && !file.isEmpty()) {
            System.out.println("==product_insert_file_upload==");
            
            String uploadDir = new File("src/main/resources/static/image/").getAbsolutePath();
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File dest = new File(uploadDir, filename);
            
            file.transferTo(dest);

            // ProductVo에 이미지 URL 설정 (INSERT 전에 완료!)
            productvo.setProduct_image_url("/image/" + filename);
        }

  
        productService.insert(productvo);
        
        //등록된 ID 가져오기
        int newProductId = productvo.getProduct_idx(); 
        
        
        // model.addAttribute("list", productService.selectList()); 
        
        
        return "redirect:/product/detail/" + newProductId;
    }
 

    // 상세 조회 
    @GetMapping("/product/detail/{id}")

    public String product_detail(@PathVariable("id") int id, Model model) {
    	
        ProductVo product = productService.selectOne(id);
        
        model.addAttribute("product", product);
        
        return "product/product_detail";
    }
}

