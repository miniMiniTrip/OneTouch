package com.onetouch.service;

import java.util.List;

import com.onetouch.vo.ProductVo;

public interface ProductService {
	
    List<ProductVo> selectList();
    
    void insert(ProductVo productvo);
    
    ProductVo selectOne(int product_idx);  // 상세 조회 하기
}