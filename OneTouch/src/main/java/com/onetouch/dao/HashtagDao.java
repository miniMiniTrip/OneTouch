package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.HashtagVo;

@Mapper
public interface HashtagDao {
	//전체조회
	public List<HashtagVo> selectList();
	
	//1건 조회
	public List<HashtagVo> selectOne(int hashtag_idx);
	
	//추가
	public int insert(HashtagVo vo);
	
	//수정
	public int update(HashtagVo vo);
	
	//삭제
	public int delete(int hashtag_idx);
	
}
