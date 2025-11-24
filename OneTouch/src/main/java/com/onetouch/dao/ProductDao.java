package com.onetouch.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.onetouch.vo.ProductVo;

@Mapper
public interface ProductDao {
	
    
    // 카테고리별 목록조회
    List<ProductVo> selectList(@Param("category_idx") int category_idx, @Param("keyword") String keyword);
    List<ProductVo> selectList(Map<String, Object> map);
    List<ProductVo> selectListAdmin(Map<String, Object> map);
    List<ProductVo> selectRemainListByProduct(int product_idx); //재고조회
    List<ProductVo> selectRemainList(Map<String, Object> map);// 전체재고 이력조회
    List<String> selectDetailImages(int product_idx);
    String selectMainImage(int product_idx);
    
    // 단일상품조회
    ProductVo selectOne(int product_idx);
    
    // 단일상품등록
    int insert(ProductVo vo);
    
    // 이미지등록
    int productImageInsert(ProductVo productVo);
    
    // 상품수정
    int update(ProductVo vo);
    
    // 상품 이미지 수정
    int updateProductImage(ProductVo productVo);
    
    // 단일상품삭제
    int delete(int product_idx);
    
    // 다중 삭제
    int deleteBatch(@Param("list") List<Integer> product_idx_list);
    
    // 전체 상품 수 조회
    int selectCount(Map<String, Object> map);
    
    public int selectCountAdmin(Map<String,Object>map);
    
    // 재고 등록
    int insertRemain(ProductVo vo);
    
    // 재고 이력 총 개수 조회
    int selectRemainCount(Map<String, Object> map);
    

    int uploadImages(ProductVo vo);
    int updateMainImage(int product_idx, String product_image_url); 
    int updateDetailImage(int product_image_idx, String product_image_url);
    int deleteImage(int product_image_idx);
    
    //sw : 여러 product_idx로 상품 조회(hashtag 연동용)
    public List<ProductVo> selectByIds(List<Integer> productIds);


}