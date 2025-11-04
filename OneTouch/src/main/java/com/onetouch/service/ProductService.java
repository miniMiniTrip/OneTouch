package com.onetouch.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ProductService {
    
    // 상품 목록 조회
    Map<String, Object> getProductList(Map<String, Object> map);
    
    // 상품 상세 조회
    Map<String, Object> getProductDetail(int product_idx);
    
    // 상품 등록
    Map<String, Object> insertProduct(Map<String, Object> map, List<MultipartFile> fileList);
    
    // 상품 수정
    Map<String, Object> updateProduct(Map<String, Object> map, List<MultipartFile> fileList);
    
    // 상품 삭제
    boolean deleteProduct(int product_idx);
    
}