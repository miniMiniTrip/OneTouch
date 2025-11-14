package com.onetouch.service;

import java.util.List;
import com.onetouch.vo.ProductVo;

public interface ProductService {
	
    int insert(ProductVo productVo);
    
    int update(ProductVo productVo);
    
    int delete(int product_idx);
    
    int deleteBatch(List<Integer> product_idx_list);
}