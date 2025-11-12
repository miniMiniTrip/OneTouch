package com.onetouch.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.onetouch.vo.ProductVo;

@Mapper
public interface TestProductDao {
    
    /**
     * 테스트용 상품 목록 (이미지 포함)
     */
    List<ProductVo> selectListWithImage(
        @Param("category_idx") int category_idx,
        @Param("keyword") String keyword
    );
    
    /**
     * 테스트용 상품 상세 (이미지 포함)
     */
    ProductVo selectOneWithImage(int product_idx);
}
