package com.onetouch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    ProductDao product_dao;
    
    @Autowired
    HashtagDao hashtag_dao;
    
    @Override
    @Transactional
    public int insert(ProductVo productVo) {
        System.out.printf("[ProductServiceImpl-insert] 초기 productVo: %s\n", productVo);
        
        // 1. product 테이블에 상품 등록
        int res = product_dao.insert(productVo);
        System.out.printf("[ProductServiceImpl-insert] product 등록 후 productVo의 product_idx: %d\n", productVo.getProduct_idx());
        
        // 2. product_image 테이블에 이미지 등록
        res = product_dao.productImageInsert(productVo);
        System.out.printf("[ProductServiceImpl-insert] product_image 등록 완료\n");
        
        // 3. 해시태그 처리
        if (productVo.getHashtag_list() != null && !productVo.getHashtag_list().isEmpty()) {
            System.out.printf("[ProductServiceImpl-insert] 해시태그 처리 시작: %d개\n", productVo.getHashtag_list().size());
            
            // 3-1. 해시태그 연결 등록
            Map<String, Object> params = new HashMap<>();
            params.put("product_idx", productVo.getProduct_idx());
            params.put("hashtag_list", productVo.getHashtag_list());
            
            int hashtagRes = hashtag_dao.insertProductHashtag(params);
            System.out.printf("[ProductServiceImpl-insert] 해시태그 연결 완료: %d개\n", hashtagRes);
        } else {
            System.out.println("[ProductServiceImpl-insert] 등록할 해시태그 없음");
        }
        
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
        
        // 3. 해시태그 처리 (기존 연결 삭제 후 새로 등록)
        if (productVo.getHashtag_list() != null) {
            System.out.printf("[ProductServiceImpl-update] 해시태그 업데이트 시작: %d개\n", productVo.getHashtag_list().size());
            
            // 3-1. 기존 해시태그 연결 삭제
            hashtag_dao.deleteProductHashtagByProduct(productVo.getProduct_idx());
            System.out.println("[ProductServiceImpl-update] 기존 해시태그 연결 삭제 완료");
            
            // 3-2. 새 해시태그가 있으면 연결
            if (!productVo.getHashtag_list().isEmpty()) {
                Map<String, Object> params = new HashMap<>();
                params.put("product_idx", productVo.getProduct_idx());
                params.put("hashtag_list", productVo.getHashtag_list());
                
                int hashtagRes = hashtag_dao.insertProductHashtag(params);
                System.out.printf("[ProductServiceImpl-update] 새 해시태그 연결 완료: %d개\n", hashtagRes);
            } else {
                System.out.println("[ProductServiceImpl-update] 연결할 새 해시태그 없음");
            }
        }
        
        return res;
    }
    
    @Override
    @Transactional
    public int delete(int product_idx) {
        System.out.printf("[ProductServiceImpl-delete] 삭제할 product_idx: %d\n", product_idx);
        
        // 1. 해시태그 연결 먼저 삭제 (CASCADE가 없는 경우 대비)
        hashtag_dao.deleteProductHashtagByProduct(product_idx);
        System.out.println("[ProductServiceImpl-delete] 해시태그 연결 삭제 완료");
        
        // 2. 상품 삭제 (CASCADE 설정으로 product_image도 자동 삭제됨)
        int res = product_dao.delete(product_idx);
        System.out.printf("[ProductServiceImpl-delete] 삭제 결과: %d\n", res);
        
        return res;
    }
    
    @Override
    @Transactional
    public int deleteBatch(List<Integer> product_idx_list) {
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제할 product_idx 목록: %s\n", product_idx_list);
        
        // 1. 각 상품의 해시태그 연결 삭제
        for (Integer product_idx : product_idx_list) {
            hashtag_dao.deleteProductHashtagByProduct(product_idx);
        }
        System.out.println("[ProductServiceImpl-deleteBatch] 모든 해시태그 연결 삭제 완료");
        
        // 2. 상품 일괄 삭제 (CASCADE 설정으로 product_image도 자동 삭제됨)
        int res = product_dao.deleteBatch(product_idx_list);
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제된 개수: %d\n", res);
        
        return res;
    }
}
