package com.onetouch.dao;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.MemVo;

@Mapper
public interface SkinProfileDao {
	//마이페이지 조회시
	MemVo selectId(int mem_idx);
	//문진 완료시
	int insert(MemVo vo);
	//재문진시
	int update(MemVo vo);
	//삭제
	int delete(int mem_idx);
}
