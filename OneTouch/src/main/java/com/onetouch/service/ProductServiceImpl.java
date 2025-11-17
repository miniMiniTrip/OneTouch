package com.onetouch.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    ProductDao product_dao;
    
    @Override
    public int insert(ProductVo productVo) {
        System.out.printf("[ProductServiceImpl-insert] 초기 productVo: %s\n", productVo);
        
        int res = product_dao.insert(productVo);
        System.out.printf("[ProductServiceImpl-insert] product 등록 후 productVo의 product_idx: %d\n", productVo.getProduct_idx());
        
        res = product_dao.productImageInsert(productVo);
        System.out.printf("[ProductServiceImpl-insert] product_image 등록 완료\n");
        
        return res;
    }
    
    @Override
    @Transactional
    public int update(ProductVo productVo) {
        System.out.printf("[ProductServiceImpl-update] 받은 productVo: %s\n", productVo);
        
        // 1. product 테이블 업데이트
        int res = product_dao.update(productVo);
        System.out.printf("[ProductServiceImpl-update] product 테이블 업데이트 결과: %d\n", res);
        
        // 2. 이미지가 변경된 경우만 product_image 업데이트
        if (productVo.getProduct_image_url() != null && !productVo.getProduct_image_url().isEmpty()) {
            System.out.printf("[ProductServiceImpl-update] 새 이미지 URL: %s\n", productVo.getProduct_image_url());
            res = product_dao.updateProductImage(productVo);
            System.out.printf("[ProductServiceImpl-update] product_image 테이블 업데이트 결과: %d\n", res);
        } else {
            System.out.println("[ProductServiceImpl-update] 이미지 변경 없음");
        }
        
        return res;
    }
    
    @Override
    public int delete(int product_idx) {
        System.out.printf("[ProductServiceImpl-delete] 삭제할 product_idx: %d\n", product_idx);
        
        // CASCADE 설정으로 product_image도 자동 삭제됨
        int res = product_dao.delete(product_idx);
        System.out.printf("[ProductServiceImpl-delete] 삭제 결과: %d\n", res);
        
        return res;
    }
    
    @Override
    public int deleteBatch(List<Integer> product_idx_list) {
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제할 product_idx 목록: %s\n", product_idx_list);
        
        // CASCADE 설정으로 product_image도 자동 삭제됨
        int res = product_dao.deleteBatch(product_idx_list);
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제된 개수: %d\n", res);
        
        return res;
    }
}