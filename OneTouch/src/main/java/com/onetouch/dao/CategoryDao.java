package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.CategoryVo;

@Mapper
public interface CategoryDao{

		List<CategoryVo>selectList();
}
