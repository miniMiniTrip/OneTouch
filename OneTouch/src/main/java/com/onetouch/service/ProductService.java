package com.onetouch.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.onetouch.vo.ProductVo;

@Service
public interface ProductService {
	
    int insert(ProductVo productVo) throws Exception;
    
    int update(ProductVo productVo);
    
    int delete(int product_idx);
    
    int deleteBatch(List<Integer> product_idx_list);
    
    
}