package com.onetouch.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.MemVo;

@Mapper
public interface MemDao {
	public MemVo selectMemIdOne(String mem_id);
	public int insert(MemVo memVo);
	public MemVo selectMemEmailOne(String mem_email);
	public MemVo selectMemIdxOne(int mem_idx);
	
	//아이디 찾기
	String findUserId(Map<String,Object>map);
}
