package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.ProductVo;

@Mapper
public interface ProductDao{
	
	List<ProductVo> selectList();
	
	void insert(ProductVo productvo);
	
	ProductVo selectOne(int product_idx);//상세조회
}