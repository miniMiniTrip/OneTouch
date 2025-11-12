package com.onetouch.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.dao.TestProductDao;
import com.onetouch.dao.CategoryDao;
import com.onetouch.vo.ProductVo;
import com.onetouch.vo.CategoryVo;

@Controller
@RequestMapping("/product")
public class TestProductController {
    
    @Autowired
    TestProductDao test_product_dao;
    
    @Autowired
    CategoryDao category_dao;
    
    // 기본 이미지 경로 상수
    private static final String DEFAULT_IMAGE = "/assets/images/products/default.png";
    private static final String IMAGE_PATH = "/assets/images/products/";
    
    /**
     * 테스트용 상품 목록
     */
    @RequestMapping("/test_list.do")
    public String list(
        @RequestParam(name="category_idx", defaultValue="0") int category_idx,
        Model model
    ) {
        List<ProductVo> product_list = test_product_dao.selectListWithImage(category_idx, "");
        List<CategoryVo> category_list = category_dao.selectList();
        
        // 이미지 URL 처리
        for (ProductVo vo : product_list) {
            setProductImageUrl(vo);
        }
        
        model.addAttribute("productList", product_list);
        model.addAttribute("category_list", category_list);
        
        return "product/test_list";
    }
    
    /**
     * 테스트용 상품 상세
     */
    @RequestMapping("/test_view.do")
    public String view(
        @RequestParam(name="product_idx", defaultValue="0") int product_idx, // defaultValue 추가
        Model model
    ) {
        // product_idx가 0이면 에러 페이지
        if (product_idx == 0) {
            model.addAttribute("error", "상품 번호가 없습니다.");
            return "error"; // 또는 리다이렉트
        }
        
        ProductVo vo = test_product_dao.selectOneWithImage(product_idx);
        
        // vo가 null이면 (상품이 없으면)
        if (vo == null) {
            model.addAttribute("error", "존재하지 않는 상품입니다.");
            return "error";
        }
        
        // 이미지 URL 처리
        setProductImageUrl(vo);
        
        model.addAttribute("vo", vo);
        
        return "product/test_view";
    }
    
    /**
     * 상품 이미지 URL 설정 (공통 로직)
     */
    private void setProductImageUrl(ProductVo vo) {
        if (vo.getProduct_image_url() == null || vo.getProduct_image_url().trim().isEmpty()) {
            // null이거나 빈 문자열이면 기본 이미지
            vo.setProduct_image_url(DEFAULT_IMAGE);
        } else if (!vo.getProduct_image_url().startsWith("/")) {
            // DB에 파일명만 있는 경우 전체 경로로 변환
            vo.setProduct_image_url(IMAGE_PATH + vo.getProduct_image_url());
        }
        // 이미 전체 경로인 경우는 그대로 사용
    }
}
