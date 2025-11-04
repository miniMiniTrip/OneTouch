package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.ProductVo;

@Mapper
public interface ProductDao{
	
	//상품 목록 조회
    List<ProductVo> selectList(Map<String, Object> map);
    
    // 상품 상세 조회
    ProductVo selectOne(int product_idx);
    
    // 상품 등록
    int insert(ProductVo vo);
    
    // 상품 수정
    int update(ProductVo vo);
    
    // 상품 삭제
    int delete(int product_idx);
    
    // 조회수 증가
    int updateReadCount(int product_idx);
    
    // 좋아요 증가
    int updateLikeCount(int product_idx);
    
    // 카테고리 목록 조회
    List<ProductVo> selectCategoryList();
    
    // 상품 이미지 등록
    int insertImage(ProductVo vo);
    
    // 상품 이미지 목록 조회
    List<ProductVo> selectImageList(int product_idx);
    
    // 상품 이미지 삭제
    int deleteImages(int product_idx);
}