package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.onetouch.vo.ProductVo;

@Mapper
public interface ProductDao{
	
	//카테고리별 목록조회
	List<ProductVo> selectList(
			@Param("category_idx") int category_idx,
			@Param("keyword") String keyword
			);
	
	ProductVo 		selectOne(int product_idx);
	
	int				insert(ProductVo vo);
	int 			update(ProductVo vo);
	int				delete(int product_idx);
	
}