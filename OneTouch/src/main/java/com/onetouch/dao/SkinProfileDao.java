package com.onetouch.dao;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.MemVo;
import com.onetouch.vo.SkinProfileVo;

@Mapper
public interface SkinProfileDao {
	//마이페이지 조회시
	SkinProfileVo selectOne(int mem_idx);
	//문진 완료시
	int insert(SkinProfileVo vo);
	//재문진시
	int update(SkinProfileVo vo);
	//삭제
	int delete(int mem_idx);
}
