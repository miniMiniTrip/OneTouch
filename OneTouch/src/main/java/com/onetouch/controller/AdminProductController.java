package com.onetouch.controller;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.ProductService;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    ProductDao product_dao;

    @Autowired
    CategoryDao category_dao;

    @Autowired
    ServletContext application;
    
    @Autowired
    ProductService productService;

 // 관리자 상품관리페이지 - 리스트 조회
    @RequestMapping("/products")
    public String adminProductList(@RequestParam(name = "keyword", required = false) String keyword,
            Model model) {

        System.out.printf("[AdminProductController-adminProductList()] keyword: %s\n", keyword);
        
        // 키워드 인코딩 확인
        if (keyword != null) {
            System.out.println("Keyword bytes: " + Arrays.toString(keyword.getBytes()));
            System.out.println("Keyword encoding: " + keyword);
        }

        Map<String, Object> map = new HashMap<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            map.put("keyword", keyword.trim());
        }

        List<ProductVo> list = product_dao.selectList(map);
        
        // 결과 확인
        System.out.printf("[AdminProductController-adminProductList()] 조회된 상품 수: %d\n", list.size());

        model.addAttribute("list", list);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category_list", category_dao.selectList());

        return "admin/product/product_list_form";
    }
    
    // Ajax - 단일 상품 정보 조회
    @GetMapping("/product/get")
    @ResponseBody
    public ProductVo getProduct(@RequestParam int product_idx) {
        System.out.printf("[AdminProductController-getProduct()] product_idx: %d\n", product_idx);
        
        ProductVo vo = product_dao.selectOne(product_idx);
        System.out.printf("[AdminProductController-getProduct()] 조회된 상품: %s\n", vo);
        
        return vo;
    }

    // 상품등록
    @PostMapping("/product/insert")
    public String insert(ProductVo productVo, 
                        @RequestParam(name = "photo") MultipartFile photo, 
                        RedirectAttributes ra) throws Exception {
        
        System.out.printf("[AdminProductController-insert()] 받은 productVo: %s\n", productVo);
        
        String saveDir = application.getRealPath("/images/");
        String product_image_url = "no_file";

        if (photo != null && !photo.isEmpty()) {
            String filename = photo.getOriginalFilename();
            System.out.printf("[AdminProductController-insert()] 원본 파일명: %s\n", filename);
            
            File f = new File(saveDir, filename);
            
            if (f.exists()) {
                long tm = System.currentTimeMillis();
                filename = String.format("%d_%s", tm, filename);
                f = new File(saveDir, filename);
            }
            
            photo.transferTo(f);
            product_image_url = filename;
        }

        productVo.setProduct_image_url(product_image_url);

        if (productVo.getProduct_comment() != null) {
            String product_comment = productVo.getProduct_comment().replaceAll("\n", "<br>");
            productVo.setProduct_comment(product_comment);
        }

        System.out.printf("[AdminProductController-insert()] 최종 productVo: %s\n", productVo);
        
        int res = productService.insert(productVo);
        System.out.printf("[AdminProductController-insert()] insert 결과: %d\n", res);

        return "redirect:/admin/products"; 
    }

    // 상품 수정
    @PostMapping("/product/update")
    public String update(ProductVo vo, 
                        @RequestParam("photo") MultipartFile photo, 
                        HttpServletRequest request) throws Exception {
        
        System.out.printf("[AdminProductController-update()] 받은 vo: %s\n", vo);
        
        if (photo != null && !photo.isEmpty()) {
            String uploadPath = application.getRealPath("/images/");
            String fileName = System.currentTimeMillis() + "_" + photo.getOriginalFilename();
            
            System.out.printf("[AdminProductController-update()] 새 파일명: %s\n", fileName);
            
            File file = new File(uploadPath, fileName);
            photo.transferTo(file);
            vo.setProduct_image_url(fileName);
        }
        
        if (vo.getProduct_comment() != null) {
            String product_comment = vo.getProduct_comment().replaceAll("\n", "<br>");
            vo.setProduct_comment(product_comment);
        }
        
        System.out.printf("[AdminProductController-update()] 최종 vo: %s\n", vo);
        
        int res = productService.update(vo);
        System.out.printf("[AdminProductController-update()] update 결과: %d\n", res);
        
        return "redirect:/admin/products";
    }

    // 단일 삭제
    @GetMapping("/product/delete")
    public String delete(@RequestParam int product_idx) {
        System.out.printf("[AdminProductController-delete()] 삭제할 product_idx: %d\n", product_idx);
        
        int res = productService.delete(product_idx);
        System.out.printf("[AdminProductController-delete()] 삭제 결과: %d\n", res);
        
        return "redirect:/admin/products";
    }

    // 다중 삭제
    @PostMapping("/product/delete_batch")
    public String deleteBatch(@RequestParam List<Integer> product_idx_list) {
        System.out.printf("[AdminProductController-deleteBatch()] 삭제할 목록: %s\n", product_idx_list);
        
        int res = productService.deleteBatch(product_idx_list);
        System.out.printf("[AdminProductController-deleteBatch()] 삭제 결과: %d\n", res);
        
        return "redirect:/admin/products";
    }
}