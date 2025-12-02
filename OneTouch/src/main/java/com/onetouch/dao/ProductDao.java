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
    List<String> selectUpperDetailImages(int product_idx);
    List<String> selectLowerDetailImages(int product_idx);
    String selectMainImage(int product_idx);
    List<String> selectDetailImages(int product_idx);
    // 단일상품조회
    ProductVo selectOne(int product_idx);
    
    // 단일상품등록
    int insert(ProductVo vo);
    
    // 이미지등록
    int insertProductImage(ProductVo productVo);
    
    // 상품수정
    int update(ProductVo vo);
    
    // 상품 이미지 수정
    int updateProductImage(ProductVo productVo);
    
    // 상품 이미지 1레벨 (메인이미지) 조회
    ProductVo selectProductImageLevel1(int product_idx);
    
    // 상품 파일 삭제를 위한 product idx 기준으로 이름 조회
    List<ProductVo> selectProductImageListName(int product_idx);
    
    // 상품 서브이미지 삭제
    int deleteProductSubImages(int product_idx);
    
    // 상품 내용이미지 삭제
    int deleteProductContentImages(int product_idx);
    
    // 파일명으로 내용이미지 삭제처리
    int deleteContentImage(String image_url);
    
    // 단일상품삭제
    int deleteProductRemainOne(int product_idx);
    int delete(int product_idx);
    
    // 다중 삭제
    int deleteProductRemain(@Param("list") List<Integer> product_idx_list);
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
	List<ProductVo> selectProductImageProductIdxList(int product_idx);
	//sw : 결제 완료: 판매량 증가 + 재고 감소
	int updateStockAndSell(@Param("product_idx") int product_idx, @Param("count") int count);


}