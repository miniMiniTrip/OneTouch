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
    
    
}