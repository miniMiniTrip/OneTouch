package com.onetouch.dao;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.MemVo;

@Mapper
public interface MemDao {
	public MemVo selectMemOne(int mem_id);
	
}
